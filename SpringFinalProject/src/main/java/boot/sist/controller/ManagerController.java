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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.sist.dto.MemberDto;
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
}