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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.sist.dto.MemberDto;
import boot.sist.dto.ResellDto;
import boot.sist.service.MemberService;
import boot.sist.service.ResellService;

@Controller
public class ResellController {
	
	@Autowired
	ResellService service;
	
	@Autowired
	MemberService mservice;
	
	@GetMapping("/resell/list")
	public ModelAndView main(HttpSession session) {
		ModelAndView model=new ModelAndView();
		
		model.addObject("myid", (String)session.getAttribute("myid"));
		model.setViewName("/sns/resell");
		
		return model;
	}
	
	@GetMapping("/resell/getlist")
	@ResponseBody
	public List<ResellDto> getList(@RequestParam(defaultValue = "1") int currentPage) {
		int start; //각 페이지의 시작번호 
		int perPage=6; //한 페이지에 보여질 글의 갯수 
		
		//각 페이지에서 불러올 시작번호 
		// 현재페이지가 1일경우 start, 2일경우 6
		start = (currentPage-1)*perPage;
		
		//각 페이지에서 필요한 게시글 불러오기
		List<ResellDto>list = service.getAllResell(start, perPage);
		return list;
	}
	
	@PostMapping("/resell/insert")
	@ResponseBody
	public void insert(@RequestParam String subject,
			@RequestParam int price, 
			@RequestParam String content, 
			@RequestParam MultipartFile photo, 
			HttpSession session) 
	{
		ResellDto dto = new ResellDto();
		dto.setSubject(subject);
		dto.setPrice(price);
		dto.setContent(content);
		dto.setState("selling");
		
		//경로
		String path = session.getServletContext().getRealPath("/resellphoto");
		//파일명
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String filename="s_"+sdf.format(new Date())+photo.getOriginalFilename();
		dto.setPhoto(filename);
		
		//실제 업로드
		try {
			photo.transferTo(new File(path+"//"+filename));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String myid=(String)session.getAttribute("myid");
		MemberDto mdto= mservice.getDataById(myid);
		dto.setM_id(myid);
		dto.setM_num(Integer.parseInt(mdto.getNum()));
		// dto.setM_photo(mdto.getPhoto());
		service.insertResell(dto);
	}
	

}
