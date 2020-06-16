package org.zerock.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.CategoryVO;
import org.zerock.domain.GoodsVO;
import org.zerock.domain.OrderListVO;
import org.zerock.domain.OrderVO;
import org.zerock.domain.ReviewListVO;
import org.zerock.domain.ReviewVO;
import org.zerock.helper.FileHelper;
import org.zerock.service.AdminServiceImpl;
import org.zerock.service.CommonServiceImpl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.log4j.Log4j;
@Log4j
@Controller
public class AdminController {
	@Autowired
	private AdminServiceImpl service;
	@Autowired
	private CommonServiceImpl commonService;
	
	//파일 설정 경로 리소스
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//create
	//read
	//update
	//delete
	//관리자 화면 
	@RequestMapping(value="/admin/index",method=RequestMethod.GET) 
	public void getIndex() {};
	
	// 상품 등록 창
	@RequestMapping(value="/admin/goods/register", method=RequestMethod.GET)
	public void register(Model model) {
		log.info("get goods register");
		
		List<CategoryVO> category = service.category();
		
		model.addAttribute("category", category);
		
	}
	//상품 등록 하기
	@RequestMapping(value="/admin/goods/register", method=RequestMethod.POST)
	public String register(@ModelAttribute GoodsVO goods, MultipartFile file) throws IOException, Exception {
		log.info("register : " + goods);
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = FileHelper.calcPath(imgUploadPath);
		String fileName = null;
		
		if(file!=null) {
			fileName = FileHelper.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			
		}else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		goods.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		goods.setGdsThumbnail(File.pathSeparator + "imgUpload" + ymdPath + File.separator + "s" + File.pathSeparator + "s_" + fileName);
		//goods.setGdsImg(fileUrl);
		service.goodsRegister(goods);
		System.out.println("goods: "+goods);
		return "redirect:/";
	}
	
	//상품 수정창 
	@RequestMapping(value="/admin/goods/modify", method=RequestMethod.GET)
	public void modify(@RequestParam("gdsNum") int gdsNum, Model model) {
		log.info("get shopItem update");
		GoodsVO goods = commonService.shopItemView(gdsNum);
		model.addAttribute("goods", goods);
		List<CategoryVO> category = service.category();
		model.addAttribute("category", category);
		
		//System.out.println("goods : " + goods);
		//System.out.println("category : " + category);		
		
	}
	//상품 수정 
	@RequestMapping(value="/admin/goods/modify", method=RequestMethod.POST)
	public String modify(GoodsVO goods, MultipartFile file, HttpServletRequest request) throws IOException, Exception {
		log.info("Update shopItem ");
		//파일이 바뀌는지 먼저 검사 
		//파일이 바뀌면 
		if(file.getOriginalFilename()!=null&&file.getOriginalFilename()!="") {
			//기존 파일 삭제
			new File(uploadPath + request.getParameter("gdsImg")).delete();
			new File(uploadPath + request.getParameter("gdsThumbnail")).delete();
			//새로 파일 등록
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = FileHelper.calcPath(imgUploadPath);
			String fileName = FileHelper.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		
			goods.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			goods.setGdsThumbnail(File.pathSeparator + "imgUpload" + ymdPath + File.separator + "s" + File.pathSeparator + "s_" + fileName);
			//goods.setGdsImg(fileUrl);	
		}else {
			goods.setGdsImg(request.getParameter("gdsImg"));
			goods.setGdsThumbnail(request.getParameter("gdsThumbnail"));
		}
		service.goodsModify(goods);
		return "redirect:/";
	}
	//상품 삭제 
	@RequestMapping(value="/admin/goods/delete", method=RequestMethod.GET)
	public String delete(@RequestParam("gdsNum") int gdsNum, ReviewVO review) {
		log.info("shop Item delete");
		review.setGdsNum(gdsNum);
		//댓글 삭제 + 게시글 삭제 
		service.deleteReply(review);
		service.goodsDelete(gdsNum);
		return "redirect:/";
	}
	//주문 목록 
	@RequestMapping(value="/admin/shop/OrderedList", method=RequestMethod.GET)
	public void getOrderedList(Model model) {
		List<OrderVO> orderedList = service.orderedList();
		model.addAttribute("orderedList", orderedList);
	}
	// 주문 상세 목록  
	@RequestMapping(value="/admin/shop/OrderedView", method=RequestMethod.GET)
	public void getOrderedView(@RequestParam("orderId") String orderId, OrderVO order, Model model) {
		order.setOrderId(orderId);
		List<OrderListVO>orderedView = service.orderedView(order); 
		model.addAttribute("orderedView", orderedView);
	}
	
	//주문 상세목록 + 재고 조절 + 배송 상태 업데이트
	@RequestMapping(value="/admin/shop/OrderedView", method=RequestMethod.POST)
	public String setDeliveryStatus(@RequestParam("orderId") String orderId, OrderVO order) {
		orderId = order.getOrderId();
		service.deliveryStatus(order);
		List<OrderListVO> orderView = service.orderedView(order);
		GoodsVO goods = new GoodsVO();
		//재고 수 조절 
		for(OrderListVO i : orderView) {
			goods.setGdsNum(i.getGdsNum());
			goods.setGdsStock(i.getCartStock());
			service.changeStock(goods);
		}
		return "redirect:/admin/shop/OrderedView?orderId="+orderId;
	}
	
	// 모든 댓글 
	@RequestMapping(value= "/admin/shop/allReview", method=RequestMethod.GET)
	public void allReview (Model model) {
		List<ReviewListVO> allReview =
		service.allReview();
		model.addAttribute("allReview", allReview);
	}
	// 현재 수정중 
	//관리자 권한 댓글 삭제 
	@RequestMapping(value="/admin/deleteReview", method=RequestMethod.POST)
	public String deleteReview(Principal principal, ReviewVO review) {
		String auth = null; 
		System.out.println("리뷰 번호 : " + review.getReviewNum());
		auth = principal.getName();
		if (auth=="admin") {
		service.deleteReview(review.getReviewNum());			
		}else {
			System.out.println("로그인 정보를 확인하세요.");
		}
		return auth;
	} 
	


}
