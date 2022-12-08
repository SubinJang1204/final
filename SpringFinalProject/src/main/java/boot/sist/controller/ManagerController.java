package boot.sist.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.sist.dto.MemberDto;
import boot.sist.dto.OrderDto;
import boot.sist.dto.ShopDto;
import boot.sist.service.MemberService;
import boot.sist.service.ShopService;

@Controller
public class ManagerController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ShopService shopService;

	@GetMapping("/manager")
	public String main() {
		
		return "redirect:/manager/main";
	}

	
	@GetMapping("/manager/main")
	public ModelAndView managerPage() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/manager/managerpage");
		
		return mav;
	}
	
	@GetMapping("/manager/shopform")
	public ModelAndView insertSangpum() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/manager/shopaddform");
		
		return mav;
	}
	
	
	@GetMapping("/manager/memberList")
	public ModelAndView memberList() {
		
		ModelAndView mav = new ModelAndView();
		
		List<MemberDto> list = memberService.getAllMembers();
		
		mav.addObject("list", list);
		mav.addObject("cnt", list.size());
		
		mav.setViewName("/manager/memberList");
		
		return mav;
	}
	
	
	@GetMapping("/manager/event")
	public String eventPage() {
		
		return "redirect:/event/eventPage";
	}
	
	
	@PostMapping("/manager/shopinsert")
	public ModelAndView insertShop(@ModelAttribute ShopDto dto, @RequestParam ArrayList<MultipartFile> detail_upload,
			@RequestParam MultipartFile upload, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String photo = "";
		String d_photo = "";
		
		String path = session.getServletContext().getRealPath("/shopphoto");
		
		photo = "shop_" + sdf.format(new Date()) + upload.getOriginalFilename();
		
		if(detail_upload.get(0).getOriginalFilename().equals("")) {
			
			d_photo = "no";
			
		} else {
			
			for(MultipartFile file : detail_upload) {
				
				String fName = "shop_" + sdf.format(new Date()) + file.getOriginalFilename();
				d_photo += fName + ",";
				
				try {
					
					file.transferTo(new File(path + "/" + fName));
					
				} catch (IllegalStateException e) {

					e.printStackTrace();
					
				} catch (IOException e) {

					e.printStackTrace();
					
				}
			}
			
			d_photo = d_photo.substring(0, d_photo.length() - 1);
		}
		
		try {
			
			upload.transferTo(new File(path + "/" + photo));
			
		} catch (IllegalStateException e) {

			e.printStackTrace();
			
		} catch (IOException e) {

			e.printStackTrace();
		}
		
		dto.setPhoto(photo);
		dto.setDetail_photo(d_photo);
		
		shopService.insertShop(dto);
		
		mav.setViewName("redirect:../shop");
		
		return mav;
	}
	
	
	@GetMapping("/manager/sdel")
	public ModelAndView shopDel(@RequestParam String num, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		String path = session.getServletContext().getRealPath("/shopphoto");
		
		String image = shopService.getProduct(num).getPhoto();
		
		File file = new File(path + "/" + image);
		file.delete();
		
		shopService.deleteShop(num);
		
		mav.setViewName("redirect:../shop");
		
		return mav;
	}
	
	@GetMapping("/manager/jumun")
	public ModelAndView jumunpage(@RequestParam(value="currentPage",defaultValue = "1") int currentPage,
			@RequestParam(value = "searchcolumn", required = false)String sc,
			@RequestParam(value = "searchword", required = false)String sw) {
		ModelAndView mview = new ModelAndView();
		
		int totalCount=memberService.getTotalCount();
		
		//페이징에 필요한 변수
		int totalPage; //총 페이지 수
		int startPage; //각 블럭의 시작페이지
		int endPage; //각블럭의 끝 페이지
		int start; //각페이지의 싲가번호
		int perPage=5; //한페이지에 보여질 글의 갯수
		int perBlock=5; //한 블럭당 보여지는 페이지 갯수

		
		//총페이지갯수 구하기
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

		//각 블럭의 시작페이지 (현재페이지 3: 시작 1 끝 5)
		//각 블럭의 시작페이지 (현재페이지 6: 시작 6 끝 10)
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;

		//총페이지수가 8 ... 2번째 블럭은 startpage=6 endpage=10 ... endpage 8로 수정
		if(endPage>totalPage) {
		   endPage=totalPage;
		}
		//각페이지에서 블러올 시작번호
		//현재페이지가 1일경우 start 1,2 일경우 6
		start=(currentPage-1)*perPage;

		//각페이지에서 필요한 게시글 불러오기
		List<OrderDto> list=memberService.getList(sc, sw, start, perPage);
		
		//각 글 앞에 붙일 시작번호
		//총글이 만약에 20... 1페이지는 20부터 2페이지는 15부터
		//출력해서 1씩 감소하면서 출력
		int no=totalCount-(currentPage-1)*perPage;
		
		//출력에 필요한 변수들을 request에 저장
		mview.addObject("list",list); //댓글이 포함된 후 전달
		mview.addObject("totalPage",totalPage);
		mview.addObject("startPage",startPage);
		mview.addObject("endPage",endPage);
		mview.addObject("no",no);
		mview.addObject("currentPage",currentPage);		
		mview.addObject("totalCount",totalCount);

		mview.setViewName("/manager/orderList");
		
		return mview;
	}
	
	@GetMapping("/manager/jumundelete")
	@ResponseBody
	public void deleteJumun(String o_num) {
		memberService.deletejumunlist2(o_num);
		memberService.deletejumunlist(o_num);
		
	}
}