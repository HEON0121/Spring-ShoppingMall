package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.GoodsVO;
import org.zerock.domain.ReviewVO;
import org.zerock.service.CommonServiceImpl;

import lombok.extern.log4j.Log4j;
@Log4j
@Controller
public class CommonController {
	@Autowired
	private CommonServiceImpl service;
	
	// 대문 페이지  = 쇼핑 전체 페이지 
		@RequestMapping(value="/", method=RequestMethod.GET)
		public String main(Model model) {
			List<GoodsVO> goods = service.goodsList();
			model.addAttribute("goods", goods);
			log.info("home page");
			return "board/list";
		}
	// 상품 카테고리별 목록 
		 
		@RequestMapping(value="/board/categoryList", method=RequestMethod.GET)
		public void sportMeal(@RequestParam("cateCode") String cateCode, Model model) {
			
			List<GoodsVO> goods = service.categoryList(cateCode);
			model.addAttribute("goods", goods);
			
		}
		
		
	//	상품뷰 
		@RequestMapping(value="/board/shopItem", method=RequestMethod.GET)
		public void goodsView(@RequestParam("goodsNum") int gdsNum, Model model) {
			
			GoodsVO goods = service.shopItemView(gdsNum);
			
			model.addAttribute("goods", goods);
			
		
			//System.out.println("상품 번호 : "+ gdsNum); 
			log.info("상품 조회");
			
			
		}
		//상품리뷰 리스트 
		@ResponseBody
		@RequestMapping(value="/board/shopItem/reviewList", method=RequestMethod.GET)
		public List<ReviewVO> reviewList(@RequestParam("goodsNum") int gdsNum){
			log.info("상품 리뷰 리스트");
			
			List<ReviewVO> reviews = service.reviewList(gdsNum);
			//System.out.println("리뷰 : "+reviews);
			return reviews;
		}
		
	
}
