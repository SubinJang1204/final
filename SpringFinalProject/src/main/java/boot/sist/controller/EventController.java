package boot.sist.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import boot.sist.dto.EventDto;
import boot.sist.service.EventService;
import boot.sist.service.MemberService;

@Controller
public class EventController {
	
	@Autowired
	EventService service;
	
	@Autowired
	MemberService mservice;
	
	@GetMapping("/event/list")
	public ModelAndView list(@RequestParam(defaultValue = "1")int currentPage,
			@RequestParam(value="searchcolumn",required = false) String sc,
			@RequestParam(value="searchword",required = false) String sw) {
		
				ModelAndView mview=new ModelAndView();
				
				int totalCount=service.getTotalCount(sc, sw);
			
				int totalPage;
				int startPage; 
				int endPage; 
				int start; 
				int perPage = 4; 
				int perBlock = 5; 
				
				totalCount = service.getTotalCount(sc, sw);

				totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

				startPage = (currentPage - 1) / perBlock * perBlock + 1;
				endPage = startPage + perBlock - 1;

				if (endPage > totalPage)
					endPage = totalPage;

				start = (currentPage - 1) * perPage;

				List<EventDto> list = service.getEventList(sc, sw, start, perPage);
				
				int no = totalCount - (currentPage - 1) * perPage;
				
				mview.addObject("list", list);
				mview.addObject("totalPage", totalPage);
				mview.addObject("startPage", startPage);
				mview.addObject("endPage", endPage);
				mview.addObject("currentPage", currentPage);
				mview.addObject("no", no);
				mview.addObject("totalCount", totalCount);
		
				mview.setViewName("/event/list");
				
				return mview;
}
	
				@GetMapping("/event/insertform")
				public String form() {
					
					return "/event/insertform";
				}
	
				@PostMapping("/event/insert")
				public String insert(@ModelAttribute EventDto dto,
						HttpSession session) {
					
				
				String path=session.getServletContext().getRealPath("/save");
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
				
				if(dto.getUpload().getOriginalFilename().equals(""))
				dto.setMainphoto("no");//db에 no로 저장
				
				else {
		
						String mainphoto="f_"+sdf.format(new Date())+dto.getUpload().getOriginalFilename();
						
						dto.setMainphoto(mainphoto);
				
			try {
				dto.getUpload().transferTo(new File(path+"\\"+mainphoto));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
		String myid=(String)session.getAttribute("myid");
		
		dto.setMyid(myid);
		
		String name=mservice.getName(myid);
		dto.setName(name);
		
		service.insertEvent(dto);
		
		return "redirect:list";
	}
		@GetMapping("/event/updateform")
		public String updateform(int num, Model model, String currentPage) {
			
			EventDto dto=service.getEvent(num);
			
			model.addAttribute("dto", dto);
			
			return "/event/updateform";
		}
		@PostMapping("/event/update")
		public String update(@ModelAttribute EventDto dto,
				HttpSession session,
				@RequestParam int num,
				@RequestParam String currentPage) {
			
			
			String path=session.getServletContext().getRealPath("/save");
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			
			if(dto.getUpload().getOriginalFilename().equals(""))
			dto.setMainphoto("no");
			
			else {
			
				String mainphoto="f_"+sdf.format(new Date())+dto.getUpload().getOriginalFilename();
				
				dto.setMainphoto(mainphoto);
				
				//실제업로드
				try {
					dto.getUpload().transferTo(new File(path+"\\"+mainphoto));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			String myid=(String)session.getAttribute("myid");
			
			dto.setMyid(myid);
			
			String name=mservice.getName(myid);
			dto.setName(name);
			
			service.updateEvent(dto);
			
			return "redirect:content?num="+num+"&currentPage="+currentPage;
		}
	
			@GetMapping("/event/content")
			public ModelAndView content(@RequestParam int num,
					@RequestParam String currentPage) {
				
				ModelAndView mview=new ModelAndView();
				
				service.updateReadCount(num);
				
				EventDto dto=service.getEvent(num);
				
				mview.addObject("dto", dto);
				
				mview.setViewName("/event/content");
				
				return mview;
			}
			
		@GetMapping("/event/likes")
		@ResponseBody
		public Map<String, Integer> likes(int num){
			
			service.likesUpdate(num);
			
			int likes=service.getEvent(num).getLikes();
			
			Map<String, Integer> map=new HashMap<>();
			map.put("likes", likes);
			
			return map;
		}
		@GetMapping("/event/delete")
		public String delete(int num,
				HttpSession session,
				String currentPage) {
			
			String path=session.getServletContext().getRealPath("/save");
			String mainphoto=service.getEvent(num).getMainphoto();
			
			File file=new File(path+"\\"+mainphoto);
			
			file.delete();
			
			
			service.deleteEvent(num, currentPage);
			
			return "redirect:list?currentPage="+currentPage;
		}
}