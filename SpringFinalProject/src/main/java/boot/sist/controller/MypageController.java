package boot.sist.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
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
import boot.sist.dto.MypageorderDto;
import boot.sist.dto.MypageshopDto;
import boot.sist.mapper.MypageMapperInter;
import boot.sist.service.MemberService;

@Controller
public class MypageController {
	
	@Autowired
	MemberService service;
	
	@Autowired
	MypageMapperInter mapper;
	
	@GetMapping("/mypage/myinfo")
	public ModelAndView mypage(HttpSession session) {
		ModelAndView model=new ModelAndView();
		
		String myid=(String)session.getAttribute("myid");
		MemberDto dto = service.getDataById(myid);
		
		model.addObject("dto", dto);
		model.setViewName("/member/mypage");
		
		return model;
	}
	
	@GetMapping("/mypage/updateform")
	public ModelAndView updateform(HttpSession session) {
		ModelAndView model=new ModelAndView();
		
		String myid=(String)session.getAttribute("myid");
		MemberDto dto = service.getDataById(myid);
		
		model.addObject("dto", dto);
		model.setViewName("/member/updateform");
		
		return model;
	}
	
	@GetMapping("/mypage/getshoplist")
	@ResponseBody
	public List<MypageshopDto> getshopinterest(String num) {
		List<MypageshopDto> list = mapper.getShopListbyMemberNum(num);
		return list;
	}
	
	@GetMapping("/mypage/getorderlist")
	@ResponseBody
	public List<MypageorderDto> getorderList(String num) {
		List<MypageorderDto> list = mapper.getOrderListbyMemberNum(num);
		return list;
	}
	
	@PostMapping("/mypage/update")
	public String update(@ModelAttribute MemberDto dto,
			@RequestParam MultipartFile myphoto,
			HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/photo");
		System.out.println(path);
		
		String oldnum=dto.getNum();
		String oldphoto=service.getDataByNum(oldnum).getPhoto();

		if(myphoto.getOriginalFilename().equals(""))
			dto.setPhoto(oldphoto);
		else {
			
			// 옛날 파일 지우기
			File file = new File(path + "/" + oldphoto);
			if(file.exists()) {
				file.delete();				
			}
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String photo="f_"+sdf.format(new Date())+myphoto.getOriginalFilename();

			dto.setPhoto(photo);

			try {
				myphoto.transferTo(new File(path+"/"+photo));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		mapper.updateInfo(dto);
		
		return "redirect:/mypage/myinfo";
	}
	
	@GetMapping("/mypage/deletemyinfo")
	@ResponseBody
	public void deletemyinfo(String num, HttpSession session) {
		
		String path=session.getServletContext().getRealPath("/photo");
		System.out.println(path);
		
		MemberDto dto = service.getDataByNum(num);
		String oldphoto=dto.getPhoto();
		
		File file = new File(path + "/" + oldphoto);
		if(file.exists()) {
			file.delete();				
		}
		
		mapper.deletemyinfo(num);
		session.removeAttribute("loginok");
	}

}
