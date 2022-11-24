package boot.sist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.sist.dto.QNAboardDto;
import boot.sist.service.MemberService;
import boot.sist.service.QNAboardService;

@Controller
public class QNAboardController {

	@Autowired
	QNAboardService service;

	@Autowired
	MemberService mservice;

	@GetMapping("/qna/list")
	public ModelAndView qnaList(@RequestParam(defaultValue = "1") int currentPage) {

		ModelAndView mav = new ModelAndView();

		int totalCnt = service.getTotalCnt();
		
		//페이징에 필요한 변수
		int totalPage; //총페이지수
		int startPage; //각블럭의 시작페이지
		int endPage; //각블럭의 끝페이지
		int start; //각페이지의 시작번호
		int perPage = 10; //한페이지에 보여질 글의 갯수
		int perBlock = 5; //한블럭당 보여지는 페이지개수


		//총페이지개수 구하기
		totalPage = totalCnt / perPage + (totalCnt % perPage == 0 ? 0 : 1);

		//각블럭의 시작페이지(현재페이지 3: 시작:1 끝:5)
		//각블럭의 시작페이지(현재페이지 6: 시작:6 끝:10)
		startPage = (currentPage - 1) / perBlock * perBlock + 1;
		endPage = startPage + perBlock - 1;

		//총페이지수가 8 ..2번재 블럭은 startpage6 endpage 10...endpage 8로수정
		if(endPage > totalPage){

			endPage = totalPage;
		}

		//각페이지에서 불러올 시작번호
		//현재페이지가 1일경우 strt 1, 2일경우 6
		start = (currentPage - 1)*perPage;

		//각페이지에서 필요한 게시글불러오기
		List<QNAboardDto> list = service.getAllDatas(start, perPage);

		//각글앞에 붙힐 시작번호
		//총글이 만약에 20..1페이지는 20부터 2페이지는 15부터
		//출력해서 1씩 감소하면서 출력
		int no = totalCnt - (currentPage - 1) * perPage;

		// 출력에 필요한 변수를 mav에 저장
		mav.addObject("list", list);
		mav.addObject("totalPage", totalPage);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("no", no);
		mav.addObject("currentPage", currentPage);
		mav.addObject("totalCnt", totalCnt);

		mav.setViewName("/qna/qnaList");

		return mav;
	}


	@GetMapping("/qna/qnaform")
	public ModelAndView qnaform(@RequestParam int currentPage) {

		ModelAndView mav = new ModelAndView();

		mav.addObject("currentPage", currentPage);

		mav.setViewName("/qna/qnaform");

		return mav;
	}


	@PostMapping("/qna/insert")
	public ModelAndView insertQNA(@RequestParam int currentPage,
			@ModelAttribute QNAboardDto dto) {

		ModelAndView mav = new ModelAndView();

		String m_num = mservice.getDataById(dto.getId()).getNum();

		dto.setM_num(m_num);
		dto.setAnswer("noAnswer");

		if(dto.getSecret() == null) {

			dto.setSecret("0"); // 안비밀 0

		} else {

			dto.setSecret("1"); // 비밀 1
		}

		// System.out.println(dto.getSecret());

		mav.addObject("currentPage", currentPage);

		service.qnaInsert(dto);

		mav.setViewName("redirect:list");

		return mav;
	}
	
	
	@GetMapping("/qna/detail")
	public ModelAndView goDetail(@RequestParam String num, @RequestParam int currentPage) {
		
		service.updateReadcount(num);
		
		ModelAndView mav = new ModelAndView();
		
		QNAboardDto dto = service.getData(num);
		
		String photo = mservice.getDataByNum(dto.getM_num()).getPhoto();
		
		mav.addObject("currentPage", currentPage);
		mav.addObject("dto", dto);
		mav.addObject("photo", photo);
		
		mav.setViewName("/qna/detail");
		
		return mav;
	}
	
	
	@GetMapping("/qna/delete")
	public ModelAndView deleteQNA(@RequestParam String num, @RequestParam int currentPage) {
		
		ModelAndView mav = new ModelAndView();
		
		service.deleteQNA(num);
		
		mav.addObject("currentPage", currentPage);
		
		mav.setViewName("redirect:list");
		
		return mav;
	}
	
	
	@PostMapping("/qna/insertanswer")
	public ModelAndView inseranswer(@ModelAttribute QNAboardDto dto, @RequestParam int currentPage) {
		
		ModelAndView mav = new ModelAndView();
		
		service.insertAnswer(dto);
		
		mav.addObject("num", dto.getNum());
		mav.addObject("currentPage", currentPage);
		
		mav.setViewName("redirect:detail");
		
		return mav;
	}
}
