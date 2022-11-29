package boot.sist.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.sist.dto.ChatDto;
import boot.sist.dto.MemberDto;
import boot.sist.dto.ResellDto;
import boot.sist.mapper.ChatMapperInter;
import boot.sist.service.MemberService;
import boot.sist.service.ResellService;
import boot.sist.socket.Room;
import lombok.Getter;

@Controller
public class ResellController {
	
	@Autowired
	ResellService service;
	
	@Autowired
	MemberService mservice;
	
	@Autowired
	ChatMapperInter chat_mapper;
	
	List<Room>roomList=new ArrayList<Room>();
	static int count = 0; 
	
	@GetMapping("/resell/list")
	public ModelAndView main(HttpSession session) {
		ModelAndView model=new ModelAndView();
		
		if(count==0) {
			List<ChatDto>chatlist=chat_mapper.getEveryChatList();
			
			for(ChatDto c:chatlist) {
					Room room = new Room();
					room.setRoomNumber(c.getNum());
					room.setRoomName(c.getR_subject());
					roomList.add(room);	
			}
			System.out.println(roomList);
			count++;
			model.addObject("roomList", roomList);
		}
		
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
	
	// 채팅 관련 로직
	@PostMapping("/resell/insertchat")
	@ResponseBody
	public HashMap<String, Object> insertchat(@RequestParam int num,
			@RequestParam String buyer,
			@RequestParam String seller) {
		
		ChatDto dto=new ChatDto();
		dto.setR_num(num);
		
		ResellDto rdto=service.getOneResell(num);
		dto.setR_photo(rdto.getPhoto());
		dto.setR_price(rdto.getPrice());
		dto.setR_subject(rdto.getSubject());
		
		dto.setBuyer(buyer);
		dto.setSeller(seller);
		
		chat_mapper.insertChat(dto);
		
		HashMap<String, Object>map=new HashMap<>();
		
		int maxnum=chat_mapper.getMaxNum();
		map.put("roomNumber", maxnum);
		map.put("roomName", rdto.getSubject());
		return map;
	}
	
	@GetMapping("/resell/deletechat")
	@ResponseBody
	public void deletechat(@RequestParam int num) {
		chat_mapper.deleteChat(num);
	}
	
	@GetMapping("/resell/getchat")
	@ResponseBody
	public List<ChatDto> insertchat(@RequestParam String myid) {
		List<ChatDto> list= chat_mapper.getAllChat(myid);
		return list;
	}
	
	@GetMapping("/resell/gochat")
	public ModelAndView chattint(@RequestParam int roomNumber, HttpSession session) {
		ModelAndView model = new ModelAndView();
		model.addObject("roomNumber", roomNumber);
		model.addObject("myid", (String)session.getAttribute("myid"));
		model.setViewName("/sns/chat?roomNumber="+roomNumber);
		return model;
	}
	
	// 처음 시작할 때 채팅 방 새로 생성하기
	
	/**
	 * 방 페이지
	 * @return
	 */
	@RequestMapping("/room")
	public ModelAndView room() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/sns/resell");
		return mv;
	}
	
	/**
	 * 방 생성하기
	 * @param params
	 * @return
	 */
	@RequestMapping("/createRoom")
	public @ResponseBody List<Room> createRoom(@RequestParam HashMap<Object, Object> params){
		String roomName = (String) params.get("roomName");
		int roomNumber = Integer.parseInt((String) params.get("roomNumber"));
		if(roomName != null && !roomName.trim().equals("")) {
			Room room = new Room();
			/** room.setRoomNumber(++roomNumber); */
			room.setRoomNumber(roomNumber);
			room.setRoomName(roomName);
			roomList.add(room);
		}
		return roomList;
	}

	@RequestMapping("/makingRoom")
	public @ResponseBody List<Room> makingRoom(@RequestParam HashMap<Object, Object> params){
		List<ChatDto>chatlist=chat_mapper.getEveryChatList();
		
		for(ChatDto c:chatlist) {
				Room room = new Room();
				room.setRoomNumber(c.getNum());
				room.setRoomName(c.getR_subject());
				roomList.add(room);	
		}
		System.out.println(roomList);
		return roomList;
	}
	
	/**
	 * 방 정보가져오기
	 * @param params
	 * @return
	 */
	@RequestMapping("/getRoom")
	public @ResponseBody List<Room> getRoom(@RequestParam HashMap<Object, Object> params){
		return roomList;
	}
	
	/**
	 * 채팅방
	 * @return
	 */
	@RequestMapping("/moveChating")
	public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
		ModelAndView mv = new ModelAndView();
		int roomNumber = Integer.parseInt((String) params.get("roomNumber"));
		
		List<Room> new_list = roomList.stream().filter(o->o.getRoomNumber()==roomNumber).collect(Collectors.toList());
		if(new_list != null && new_list.size() > 0) {
			mv.addObject("roomName", params.get("roomName"));
			mv.addObject("roomNumber", params.get("roomNumber"));
			
			ChatDto dto = chat_mapper.getOneChat(roomNumber);
			mv.addObject("dto", dto);
			mv.setViewName("/sns/chat");
		}else {
			mv.setViewName("/sns/resell");
		}
		return mv;
	}

}
