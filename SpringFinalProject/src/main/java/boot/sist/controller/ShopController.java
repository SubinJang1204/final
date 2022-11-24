package boot.sist.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import boot.sist.dto.ShopDto;
import boot.sist.dto.ShopStyleReviewDto;
import boot.sist.entity.ShopStyleReviewEntity;
import boot.sist.entity.ShopStyleReviewListEntity;
import boot.sist.service.FileUploadService;
import boot.sist.service.ShopService;

@Controller
@RequestMapping("/shop")
public class ShopController {
	@Autowired
	ShopService shopService;
	
	@Autowired
	FileUploadService fileUploadService;
	
	@GetMapping("")
	public String shopListPage() {
		return "/shop/list";
	}
	
	@GetMapping("/{shopId}")
	public String shopDetailPage(@PathVariable("shopId") String shopId, ModelMap model) {
		ShopStyleReviewListEntity styleReviewListEntity = new ShopStyleReviewListEntity(shopId, 0, 8);
		
		ShopDto shop = shopService.getShop(shopId);
		List<ShopStyleReviewDto> styleReviewList = shopService.getStyleReviewList(styleReviewListEntity);
		int styleReviewListCount = shopService.getStyleReviewListCount(shopId);
		
		model.put("shop", shop);
		model.put("styleReviewList", styleReviewList);
		model.put("styleReviewListPage", styleReviewListEntity.getOffset());
		model.put("styleReviewListPageLength", styleReviewListEntity.getLength());
		model.put("styleReviewListCount", styleReviewListCount);
		
		return "/shop/product";
	}
	
	@GetMapping("/{shopId}/style")
	public ResponseEntity<Map<String, Object>> shopGetStyleReviewList(
				@PathVariable("shopId") String shopId,
				@RequestParam(name="page", defaultValue="0") int page,
				@RequestParam(name="length", defaultValue="8") int length
			) {
		System.out.println(shopId);
		System.out.println(page);
		System.out.println(length);
		
		Map<String, Object> map = new HashMap<>();

		ShopStyleReviewListEntity styleReviewListEntity = new ShopStyleReviewListEntity(shopId, page * length, length);

		List<ShopStyleReviewDto> styleReviewList = shopService.getStyleReviewList(styleReviewListEntity);
		int styleReviewListCount = shopService.getStyleReviewListCount(shopId);
		
		map.put("list", styleReviewList);
		map.put("page", styleReviewListEntity.getOffset() / length);
		map.put("length", styleReviewListEntity.getLength());
		map.put("count", styleReviewListCount);
		
		return ResponseEntity
				.ok()
				.body(map);
	}
	
	@PostMapping("/{shopId}/style")
	public ResponseEntity<Map<String, Object>> shopAddStyleReview(
				@PathVariable("shopId") String shopId,
				@RequestParam("image") MultipartFile image,
				@RequestParam("content") String content,
				HttpSession session
			) {
		
		Map<String, Object> map = new HashMap<>();
		
		String memberId = (String) session.getAttribute("myid");
		if ("".equals(memberId) || memberId == null) {
			map.put("message", "로그인 후 이용해주세요.");
			return ResponseEntity
					.badRequest()
					.body(map);
		}
		
		String uploadedImageName = fileUploadService.upload(image);
		if ("".equals(uploadedImageName) || uploadedImageName == null) {
			map.put("message", "사진 업로드 중 문제가 발생했습니다.");
			return ResponseEntity
					.badRequest()
					.body(map);
		}
		
		String memberPhoto = (String) session.getAttribute("loginphoto");
		
		ShopStyleReviewEntity styleReviewEntity = new ShopStyleReviewEntity(shopId, memberId, content, memberPhoto, uploadedImageName);
		
		Boolean result = shopService.addStyleReview(styleReviewEntity);
		
		if (!result) {
			map.put("message", "리뷰 등록 중 문제가 발생했습니다.");
			return ResponseEntity
					.badRequest()
					.body(map);
		}
		
		map.put("message", "등록되었습니다.");

		return ResponseEntity
				.ok()
				.body(map);
	}
}
