package boot.sist.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.sist.dto.EventDto;
import boot.sist.dto.NoticeDto;
import boot.sist.service.NoticeService;


@Controller
public class NoticeController {

	@Autowired
	NoticeService service;
	
	//sc는 searchcolumn, required false는 값이 없을 때 null값 반환하는거임
	@GetMapping("/notice/list")
	public ModelAndView list(@RequestParam(defaultValue = "1")int currentPage,
			@RequestParam(value="searchcolumn",required = false) String sc,
			@RequestParam(value="searchword",required = false) String sw) {
		
		    ModelAndView mview=new ModelAndView();
		
		
				//페이징에 필요한 변수, 이렇게 6개가 넘어가야함!
		        int totalCount=service.getTotalCount(sc, sw);
				int totalPage; //총 페이지 수
				int startPage; //각 블럭의 시작페이지
				int endPage; //각 블럭의 끝 페이지
				int start; //각 페이지의 시작번호
				int perPage = 3; //한 페이지에 보여질 글의 갯수
				int perBlock = 5; //한 블럭당 보여지는 페이지 갯수
		
				totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

				//각 블럭의 시작페이지 ex(현재페이지 3이면 시작:1 끝:5)
				//ex(현재페이지 6이면 시작:6 끝:10) 보여지는 건 5개까지로 했으니까!!!
				startPage = (currentPage - 1) / perBlock * perBlock + 1;
				endPage = startPage + perBlock - 1;

				//총 페이지 수가 8이면, 두 번째 블럭은 startPage가 6이 되고 endPage는 10이 됨. 이 경우엔 endPage를 8로
				//수정해야함!!
				if (endPage > totalPage)
					endPage = totalPage;

				//각  페이지에서 불러올 시작번호
				//현재 페이지가 1일 경우 start는 1임, 현재 페이지가 2면 start는 6
				start = (currentPage - 1) * perPage;

				//각 페이지에서 필요한 게시글 불러오기
				List<NoticeDto> list = service.getList(sc, sw, start, perPage);
				
				/*
				 * //list의 각 글에 대한 댓글 갯수 추가하기 for(BoardDto d:list) {
				 * d.setAcount(service.getAnswerList(d.getNum()).size()); }
				 */

				//각 글 앞에 붙일 시작번호
				//총 글이 만약 20개면 1페이지는 20부터, 2페이지는 15부터
				//출력해서 1씩 감소하며 출력
				int no = totalCount - (currentPage - 1) * perPage;
				
				//출력에 필요한 변수들을 request에 저장
				mview.addObject("list", list);
				mview.addObject("totalPage", totalPage);
				mview.addObject("startPage", startPage);
				mview.addObject("endPage", endPage);
				mview.addObject("currentPage", currentPage);
				mview.addObject("no", no);
				mview.addObject("totalCount", totalCount);
		
		
		mview.setViewName("/notice/list");
		
		return mview;
	}
	
	@GetMapping("/notice/form")
	public String form(
			@RequestParam(defaultValue = "0") int num,
			@RequestParam(defaultValue = "0") int regroup,
			@RequestParam(defaultValue = "0") int restep,
			@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(defaultValue = "0") int relevel,
			Model model) {
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("num", num);
		model.addAttribute("regroup", regroup);
		model.addAttribute("restep", restep);
		model.addAttribute("relevel", relevel);
	
		return "/notice/form";
	}
	
	@PostMapping("/notice/insert")
	public String insert(NoticeDto dto,
			List<MultipartFile> upload,
			int currentPage,
			HttpSession session) {
		
		//업로드할 실제 경로
		String path=session.getServletContext().getRealPath("/photo");
		System.out.println(upload.size());
		
		if(upload.get(0).getOriginalFilename().equals(""))
			dto.setPhoto("no");
		else {
			String photo="";
			
			//파일명에 사용할 날짜
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			
			//f에 upload값을 대입
			for(MultipartFile multi:upload) {
				String newName = "f_"+sdf.format(new Date())+multi.getOriginalFilename();
				
				photo+=newName+",";
				try {
					//업로드
					multi.transferTo(new File(path+"/"+newName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			//마지막 컴마 제거
			photo=photo.substring(0, photo.length()-1);
			
			//dto의 photo에 넣어주기
			dto.setPhoto(photo);
		}
		
		//insert
		service.insertNotice(dto);
		
		//목록이 아닌 content로 이동하려면 maxnum을 알아야 한다
		int num=service.getMaxNum();
			
		return "redirect:detail?num="+num+"&currentPage="+currentPage;
	}
	
	
	  @GetMapping("/notice/updateform")
		public String updateform(int num, Model model, int currentPage) {
			
			NoticeDto dto=service.getData(num);
			
			model.addAttribute("dto", dto);
			model.addAttribute("currentPage", currentPage);
			return "/notice/updateform";
		}
	
	@PostMapping("/notice/update")
	public String update(NoticeDto dto,
			List<MultipartFile> upload,
			@RequestParam int currentPage,
			@RequestParam int num,
			HttpSession session) {
		
		//업로드할 실제 경로
		String path=session.getServletContext().getRealPath("/photo");
		System.out.println(upload.size());
		
		if(upload.get(0).getOriginalFilename().equals(""))
			dto.setPhoto("no");
		else {
			String photo="";
			
			//파일명에 사용할 날짜
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			
			//f에 upload값을 대입
			for(MultipartFile multi:upload) {
				String newName = "f_"+sdf.format(new Date())+multi.getOriginalFilename();
				
				photo+=newName+",";
				try {
					//업로드
					multi.transferTo(new File(path+"/"+newName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			//마지막 컴마 제거
			photo=photo.substring(0, photo.length()-1);
			
			//dto의 photo에 넣어주기
			dto.setPhoto(photo);
		}
		
		//insert
		service.updateNotice(dto);
		
		//목록이 아닌 content로 이동하려면 maxnum을 알아야 한다
			
		return "redirect:detail?num="+num+"&currentPage="+currentPage;
	}
	@GetMapping("/notice/detail")
	public ModelAndView detail(@RequestParam int num,
			@RequestParam int currentPage){
		
				ModelAndView mview=new ModelAndView();
				
				//조회수 증가
				service.updateReadcount(num);
				
				NoticeDto dto=service.getData(num);
				
				mview.addObject("dto", dto);
				mview.addObject("currentPage", currentPage);
				mview.setViewName("/notice/detail");
				
				return mview;
	}
	 @GetMapping("/notice/delete")
		public String delete(int num,
				HttpSession session,
				int currentPage) {
			
			String path=session.getServletContext().getRealPath("/photo");
			String photo=service.getData(num).getPhoto();
			
			File file=new File(path+"\\"+photo);
			
			file.delete();
			
			
			service.deleteNotice(num, currentPage);
			
			return "redirect:list?currentPage="+currentPage;
		}
	 
	//추천수 증가
	@GetMapping("/notice/likes")
	@ResponseBody
	public Map<String, Integer> likes(int num){
		
		service.likesUpdate(num);
		int likes=service.getData(num).getLikes();
		
		Map<String, Integer> map=new HashMap<>();
		map.put("likes", likes);
		
		return map;
	}
}
