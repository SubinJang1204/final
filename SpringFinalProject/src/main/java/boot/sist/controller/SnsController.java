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
import boot.sist.dto.SnsAnswerDto;
import boot.sist.dto.SnsDto;
import boot.sist.mapper.SnsAnswerMapperInter;
import boot.sist.service.MemberService;
import boot.sist.service.SnsService;

@Controller
public class SnsController {
	
	@Autowired
	SnsService service;
	
	@Autowired
	MemberService mservice;
	
	@Autowired
	SnsAnswerMapperInter mapper;
	
	@GetMapping("/sns/list")
	public ModelAndView main(@RequestParam(defaultValue = "1") int currentPage, HttpSession session) {
		ModelAndView model=new ModelAndView();
		
		int start; //각 페이지의 시작번호 
		int perPage=6; //한 페이지에 보여질 글의 갯수 
		
		//각 페이지에서 불러올 시작번호 
		// 현재페이지가 1일경우 start, 2일경우 6
		start = (currentPage-1)*perPage;
		
		//각 페이지에서 필요한 게시글 불러오기
		List<SnsDto>list = service.getAllSns(start, perPage);
		
		model.addObject("list", list);
		model.addObject("currentPage", currentPage);
		model.addObject("myid", (String)session.getAttribute("myid"));
		model.setViewName("/sns/list");
		
		return model;
	}
	
	@GetMapping("/trend/list")
	public ModelAndView trend() {
		ModelAndView model=new ModelAndView();
		model.setViewName("/sns/youtube");
		return model;
	}
	
	@GetMapping("/sns/getlist")
	@ResponseBody
	public List<SnsDto> getList(@RequestParam(defaultValue = "1") int currentPage) {
		int start; //각 페이지의 시작번호 
		int perPage=6; //한 페이지에 보여질 글의 갯수 
		
		//각 페이지에서 불러올 시작번호 
		// 현재페이지가 1일경우 start, 2일경우 6
		start = (currentPage-1)*perPage;
		
		//각 페이지에서 필요한 게시글 불러오기
		List<SnsDto>list = service.getAllSns(start, perPage);
		
		//list의 각 글에 대한 댓글 개수 추가
		 for(SnsDto s:list) {
			 s.setAnswer(mapper.getAllSnsAnswer(s.getNum()).size());
		 }
		
		return list;
	}
	
	@GetMapping("/sns/getdetail")
	@ResponseBody
	public SnsDto getdetail(@RequestParam int num) {
		SnsDto dto = service.getOneSns(num);
		return dto;
	}
	
	@PostMapping("/sns/insert")
	@ResponseBody
	public void insert(@RequestParam String subject, 
			@RequestParam String content, 
			@RequestParam MultipartFile photo, 
			HttpSession session) 
	{
		SnsDto dto = new SnsDto();
		dto.setSubject(subject);
		dto.setContent(content);
		
		//경로
		String path = session.getServletContext().getRealPath("/snsphoto");
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
		dto.setM_name(mdto.getName());
		dto.setM_num(Integer.parseInt(mdto.getNum()));
		dto.setM_photo(mdto.getPhoto());
		// dto.setM_photo("no");
		service.insertSns(dto);
	}
	
	@GetMapping("/sns/snsdelete")
	@ResponseBody
	public void snsdelete(@RequestParam int num, HttpSession session) {
		SnsDto dto= service.getOneSns(num);
		
		String path = session.getServletContext().getRealPath("/snsphoto");
		String filename=dto.getPhoto();
		deleteFile(path, filename);
		
		service.deleteSns(num);
	}
	
	@GetMapping("/sns/snsupdateform")
	@ResponseBody
	public SnsDto snsupdateform(@RequestParam int num) {
		SnsDto dto = service.getOneSns(num);
		return dto;
	}
	
	@PostMapping("/sns/snsupdate")
	@ResponseBody
	public void snsupdate(@RequestParam int num,
			@RequestParam String subject, 
			@RequestParam String content, 
			@RequestParam(required = false) MultipartFile photo, 
			HttpSession session) {
		
		//경로
		String path = session.getServletContext().getRealPath("/snsphoto");
		String oldfilename=service.getOneSns(num).getPhoto();
		String filename="";
		
		if(photo == null) {
			filename="no";
		} else {
			// 기존 파일 삭제하기
			deleteFile(path, oldfilename);
			
			//파일명
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			String newfilename="s_"+sdf.format(new Date())+photo.getOriginalFilename();
			filename=newfilename;
			
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
			
		}
		
		SnsDto dto = new SnsDto();
		dto.setNum(num);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setPhoto(filename);
		
		String myid=(String)session.getAttribute("myid");
		
		MemberDto mdto= mservice.getDataById(myid);
		
		dto.setM_id(myid);
		dto.setM_name(mdto.getName());
		dto.setM_num(Integer.parseInt(mdto.getNum()));
		// dto.setM_photo(mdto.getPhoto());
		dto.setM_photo("no");
		
		service.updateSns(dto);
		
	}
	
	
	public void deleteFile(String path, String filename) {
		File file=new File(path+"//"+filename);
		file.delete();
	}
	
	
	@PostMapping("/sns/answerinsert")
	@ResponseBody
	public void answerinsert(@RequestParam String content, @RequestParam int num, HttpSession session) 
	{
		SnsAnswerDto adto = new SnsAnswerDto();
		adto.setS_num(num);
		adto.setContent(content);
		
		String myid=(String)session.getAttribute("myid");
		MemberDto mdto= mservice.getDataById(myid);
		
		adto.setM_id(myid);
		adto.setM_name(mdto.getName());
		adto.setM_num(Integer.parseInt(mdto.getNum()));
		adto.setM_idphoto(mdto.getPhoto());
		// adto.setM_idphoto("no");
		
		mapper.insertSnsAnswer(adto);
	}
	
	@GetMapping("/sns/answerlist")
	@ResponseBody
	public List<SnsAnswerDto> answerList(@RequestParam int num) 
	{
		List<SnsAnswerDto> list= mapper.getAllSnsAnswer(num);
		return list;
	}
	
	@PostMapping("/sns/ansdelete")
	@ResponseBody
	public void ansdelete(@RequestParam int num) 
	{
		mapper.deleteSnsAnswer(num);
	}

}
