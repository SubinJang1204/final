package boot.sist.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.sist.domain.PaginationDomain;
import boot.sist.domain.ShopListDomain;
import boot.sist.dto.ShopDto;
import boot.sist.dto.ShopListDto;
import boot.sist.dto.ShopListSearchDto;
import boot.sist.dto.ShopStyleReviewCommentDto;
import boot.sist.dto.ShopStyleReviewDto;
import boot.sist.entity.ShopEntity;
import boot.sist.entity.ShopLikeEntity;
import boot.sist.entity.ShopListEntity;
import boot.sist.entity.ShopStyleReviewCommentDeleteEntity;
import boot.sist.entity.ShopStyleReviewCommentEntity;
import boot.sist.entity.ShopStyleReviewEntity;
import boot.sist.entity.ShopStyleReviewInsertEntity;
import boot.sist.entity.ShopStyleReviewListEntity;
import boot.sist.service.CartService;
import boot.sist.service.FileUploadService;
import boot.sist.service.ShopService;

@Controller
@RequestMapping("/shop")
public class ShopController {
	@Autowired
	ShopService shopService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	FileUploadService fileUploadService;
	
	@GetMapping("")
	public String shopListPage(
				@RequestParam(name="brand", defaultValue="") String brand,
				@RequestParam(name="category", defaultValue="") String category,
				@RequestParam(name="gender", defaultValue="") String gender,
				@RequestParam(name="price", defaultValue="") String price,
				@RequestParam(name="searchWord", defaultValue="") String searchWord,
				@RequestParam(name="sort", defaultValue="1") int sort,
				@RequestParam(name="offset", defaultValue="1") int page,
				@RequestParam(name="length", defaultValue="6") int length,
				ModelMap model
			) {

		List<String> brandList = Arrays.asList(brand.split(",")).stream().filter(t -> !"".equals(t)).collect(Collectors.toList());
		List<String> categoryList = Arrays.asList(category.split(",")).stream().filter(t -> !"".equals(t)).collect(Collectors.toList());
		List<String> genderList = Arrays.asList(gender.split(",")).stream().filter(t -> !"".equals(t)).collect(Collectors.toList());
		List<String> priceList = Arrays.asList(price.split(",")).stream().filter(t -> !"".equals(t)).collect(Collectors.toList());
		ShopListEntity shopListEntity = new ShopListEntity(brandList, categoryList, genderList, priceList, searchWord, sort, (page - 1) * length, length);
		
		List<ShopListDto> shopList = shopService.getShopList(shopListEntity);
		int shopListCount = shopService.getShopListCount(shopListEntity);
		
		model.put("brandList", brandList);
		model.put("categoryList", categoryList);
		model.put("genderList", genderList);
		model.put("priceList", priceList);
		
		model.put("searchWord", searchWord);
		model.put("sort", sort);
		model.put("shopList", shopList);
		model.put("shopListTotalPage", (int) Math.ceil((double) shopListCount / length));
		
		return "/shop/list";
	}
	
	@PostMapping("")
	public ResponseEntity<ShopListDomain> shopListApi(
				@RequestParam(name="brand", defaultValue="") String brand,
				@RequestParam(name="category", defaultValue="") String category,
				@RequestParam(name="gender", defaultValue="") String gender,
				@RequestParam(name="price", defaultValue="") String price,
				@RequestParam(name="searchWord", defaultValue="") String searchWord,
				@RequestParam(name="sort", defaultValue="1") int sort,
				@RequestParam(name="page", defaultValue="1") int page,
				@RequestParam(name="length", defaultValue="6") int length,
				ModelMap model
			) {

		List<String> brandList = Arrays.asList(brand.split(",")).stream().filter(t -> !"".equals(t)).collect(Collectors.toList());
		List<String> categoryList = Arrays.asList(category.split(",")).stream().filter(t -> !"".equals(t)).collect(Collectors.toList());
		List<String> genderList = Arrays.asList(gender.split(",")).stream().filter(t -> !"".equals(t)).collect(Collectors.toList());
		List<String> priceList = Arrays.asList(price.split(",")).stream().filter(t -> !"".equals(t)).collect(Collectors.toList());
		ShopListEntity shopListEntity = new ShopListEntity(brandList, categoryList, genderList, priceList, searchWord, sort, (page - 1) * length, length);
		
		List<ShopListDto> shopList = shopService.getShopList(shopListEntity);
		int shopListCount = shopService.getShopListCount(shopListEntity);
		
		ShopListDomain shopListDomain = new ShopListDomain(shopList, new PaginationDomain(page, length, (int) Math.ceil((double) shopListCount / length)));
		
		return ResponseEntity.ok().body(shopListDomain);
	}
	
	@PostMapping("search")
	public ResponseEntity<List<ShopListSearchDto>> shopListSearchApi(
				@RequestParam(name="searchWord", defaultValue="") String searchWord,
				ModelMap model
			) {
		List<ShopListSearchDto> shopListSearch = null;
		if (!"".equals(searchWord)) {
			shopListSearch = shopService.getShopListSearch(searchWord);
		}
		
		return ResponseEntity.ok().body(shopListSearch);
	}
	
	@GetMapping("/{shopId}")
	public String shopDetailPage(@PathVariable("shopId") String shopId, HttpSession session, ModelMap model) {
		String memberId = (String) session.getAttribute("loginid");
		ShopEntity shopEntity = new ShopEntity(memberId, shopId);
		
		String myid=(String)session.getAttribute("myid");
		int m_num=cartService.getMnum(myid);
		
		ShopStyleReviewListEntity styleReviewListEntity = new ShopStyleReviewListEntity(shopId, 0, 8);
		
		ShopDto shop = shopService.getShop(shopEntity);
		List<ShopStyleReviewDto> styleReviewList = shopService.getStyleReviewList(styleReviewListEntity);
		int styleReviewListCount = shopService.getStyleReviewListCount(shopId);
		
		model.put("m_num", m_num);
		model.put("shop", shop);
		model.put("styleReviewList", styleReviewList);
		model.put("styleReviewListPage", styleReviewListEntity.getOffset());
		model.put("styleReviewListPageLength", styleReviewListEntity.getLength());
		model.put("styleReviewListCount", styleReviewListCount);
		
		return "/shop/product";
	}
	
	@PostMapping("/{shopId}/like")
	public ResponseEntity<Map<String, Object>> shopLikeApi(@PathVariable("shopId") String shopId, HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		
		String memberId = (String) session.getAttribute("loginid");
		if ("".equals(memberId) || memberId == null) {
			map.put("message", "로그인 후 이용해주세요.");
			return ResponseEntity
					.badRequest()
					.body(map);
		}
		
		ShopLikeEntity shopLikeEntity = new ShopLikeEntity(memberId, shopId);
		int hasLike = shopService.getShopLike(shopLikeEntity);
		if (hasLike > 0) {
			map.put("status", "unlike");
			shopService.unsetShopLike(shopLikeEntity);
		} else {
			map.put("status", "like");
			shopService.setShopLike(shopLikeEntity);
		}
		map.put("like", shopService.getShopLikeCount(shopId));
		
		return ResponseEntity.ok().body(map);
	}
	
	@GetMapping("/{shopId}/style")
	public ResponseEntity<Map<String, Object>> shopGetStyleReviewList(
				@PathVariable("shopId") String shopId,
				@RequestParam(name="page", defaultValue="1") int page,
				@RequestParam(name="length", defaultValue="8") int length
			) {
		Map<String, Object> map = new HashMap<>();

		ShopStyleReviewListEntity styleReviewListEntity = new ShopStyleReviewListEntity(shopId, (page - 1) * length, length);

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
		
		String uploadedImageName = fileUploadService.upload(image, session.getServletContext().getRealPath("/upload/"));
		if ("".equals(uploadedImageName) || uploadedImageName == null) {
			map.put("message", "사진 업로드 중 문제가 발생했습니다.");
			return ResponseEntity
					.badRequest()
					.body(map);
		}
		
		String memberPhoto = (String) session.getAttribute("loginphoto");
		
		ShopStyleReviewInsertEntity styleReviewInsertEntity = new ShopStyleReviewInsertEntity(shopId, memberId, content, memberPhoto, "/upload/" + uploadedImageName);
		
		Boolean result = shopService.addStyleReview(styleReviewInsertEntity);
		
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
	
	@GetMapping("/{shopId}/style/{styleId}")
	public ResponseEntity<Map<String, Object>> shopAddStyleReview(
				@PathVariable("shopId") String shopId,
				@PathVariable("styleId") String styleId,
				HttpSession session
			) {
		
		Map<String, Object> map = new HashMap<>();
		
		String memberId = (String) session.getAttribute("loginid");
		
		ShopStyleReviewEntity styleReviewEntity = new ShopStyleReviewEntity(memberId, styleId);
		
		ShopStyleReviewDto styleReview = shopService.getStyleReview(styleReviewEntity);
		List<ShopStyleReviewCommentDto> styleReviewComment = shopService.getStyleReviewComment(styleReviewEntity);
		
		String userId = (String) session.getAttribute("myid");

		for (ShopStyleReviewCommentDto comment : styleReviewComment) {
			if (!userId.equals(comment.getUser_id())) {
				comment.setNum(null);
			}
		}
		
		map.put("review", styleReview);
		map.put("comments", styleReviewComment);
		
		return ResponseEntity
				.ok()
				.body(map);
	}
	
	@PostMapping("/{shopId}/style/{styleId}/like")
	public ResponseEntity<Map<String, Object>> styleReviewLikeApi(
				@PathVariable("styleId") String styleId,
				HttpSession session
			) {
		Map<String, Object> map = new HashMap<>();
		
		String memberId = (String) session.getAttribute("loginid");
		if ("".equals(memberId) || memberId == null) {
			map.put("message", "로그인 후 이용해주세요.");
			return ResponseEntity
					.badRequest()
					.body(map);
		}
		
		ShopStyleReviewEntity styleReviewEntity = new ShopStyleReviewEntity(memberId, styleId);
		int hasLike = shopService.getStyleReviewLike(styleReviewEntity);
		if (hasLike > 0) {
			map.put("status", "unlike");
			shopService.unsetStyleReviewLike(styleReviewEntity);
		} else {
			map.put("status", "like");
			shopService.setStyleReviewLike(styleReviewEntity);
		}
		map.put("like", shopService.getStyleReviewLikeCount(styleId));
		
		return ResponseEntity.ok().body(map);
	}
	
	@PostMapping("/{shopId}/style/{styleId}/comment")
	public ResponseEntity<Map<String, Object>> styleReviewCommentApi(
				@PathVariable("styleId") String styleId,
				@RequestParam("comment") String comment,
				HttpSession session
			) {
		Map<String, Object> map = new HashMap<>();
		
		String memberId = (String) session.getAttribute("loginid");
		if ("".equals(memberId) || memberId == null) {
			map.put("message", "로그인 후 이용해주세요.");
			return ResponseEntity
					.badRequest()
					.body(map);
		}
		
		String userName = (String) session.getAttribute("myid");
		String userPhoto = (String) session.getAttribute("loginphoto");
		
		ShopStyleReviewCommentEntity styleReviewCommentEntity = new ShopStyleReviewCommentEntity(userName, userPhoto, comment, styleId);
		
		Boolean result = shopService.addStyleReviewComment(styleReviewCommentEntity);
		
		if (!result) {
			map.put("message", "댓글 등록 중 문제가 발생했습니다.");
			return ResponseEntity
					.badRequest()
					.body(map);
		}
		
		map.put("message", "등록되었습니다.");

		return ResponseEntity
				.ok()
				.body(map);
	}
	
	@DeleteMapping("/{shopId}/style/{styleId}/comment/{commentId}")
	public ResponseEntity<Map<String, Object>> styleReviewCommentApi(
				@PathVariable("commentId") String commentId,
				HttpSession session
			) {
		Map<String, Object> map = new HashMap<>();
		
		String memberId = (String) session.getAttribute("loginid");
		if ("".equals(memberId) || memberId == null) {
			map.put("message", "로그인 후 이용해주세요.");
			return ResponseEntity
					.badRequest()
					.body(map);
		}
		
		String userName = (String) session.getAttribute("myid");
		
		ShopStyleReviewCommentDeleteEntity styleReviewCommentDeleteEntity = new ShopStyleReviewCommentDeleteEntity(commentId, userName);
		
		Boolean result = shopService.removeStyleReviewComment(styleReviewCommentDeleteEntity);
		
		if (!result) {
			map.put("message", "댓글 삭제 중 문제가 발생했습니다.");
			return ResponseEntity
					.badRequest()
					.body(map);
		}
		
		map.put("message", "삭제되었습니다.");

		return ResponseEntity
				.ok()
				.body(map);
	}
}