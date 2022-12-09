package boot.sist.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import boot.sist.dto.ShopDto;
import boot.sist.service.MainscService;

@Controller
public class MainscController {
	
	@Autowired
	MainscService service;
		
	@PostMapping("/mainsc/list")
	public ModelAndView list(@RequestParam(defaultValue = "1")int currentPage,
			@RequestParam(value="searchword",required = false) String sw) {
		
				ModelAndView mview=new ModelAndView();
				
				int totalCount=service.getTotalCount(sw);
			
				int totalPage;
				int startPage; 
				int endPage; 
				int start; 
				int perPage = 4; 
				int perBlock = 5; 
				
				totalCount = service.getTotalCount(sw);

				totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

				startPage = (currentPage - 1) / perBlock * perBlock + 1;
				endPage = startPage + perBlock - 1;

				if (endPage > totalPage)
					endPage = totalPage;

				start = (currentPage - 1) * perPage;

				List<ShopDto> list = service.getList(sw, start, perPage);
				
				int no = totalCount - (currentPage - 1) * perPage;
				
				mview.addObject("list", list);
				mview.addObject("totalPage", totalPage);
				mview.addObject("startPage", startPage);
				mview.addObject("endPage", endPage);
				mview.addObject("currentPage", currentPage);
				mview.addObject("no", no);
				mview.addObject("totalCount", totalCount);
		
				mview.setViewName("/mainsc/list");
				
				return mview;
}


		  @GetMapping("/mainsc/content") public ModelAndView content(@RequestParam int
		  shopnum
		  ) {
		  
		  ModelAndView mview=new ModelAndView();
		  
		  ShopDto dto=service.getNum(shopnum);
		  
		  mview.addObject("dto", dto);
		  
		  mview.setViewName("/shop/product");
		  
		  return mview; 
		  }
 
			
		@GetMapping("/mainsc/likes")
		@ResponseBody
		public Map<String, Integer> likes(int shopnum){
			
			service.likesUpdate(shopnum);
			
			int likes=service.getNum(shopnum).getLikes();
			
			Map<String, Integer> map=new HashMap<>();
			map.put("likes", likes);
			
			return map;
		}
		
}