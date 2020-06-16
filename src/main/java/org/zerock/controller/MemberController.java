package org.zerock.controller;

import java.security.Principal;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.domain.AuthVO;
import org.zerock.domain.CartItemVO;
import org.zerock.domain.CartVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.OrderDetailsVO;
import org.zerock.domain.OrderListVO;
import org.zerock.domain.OrderVO;
import org.zerock.domain.ReviewVO;
import org.zerock.service.MemberServiceImpl;

import lombok.extern.log4j.Log4j;
@Log4j
@Controller
public class MemberController {
	@Autowired
	private MemberServiceImpl service;
	@Autowired
	BCryptPasswordEncoder pwEncode;
	
	@RequestMapping(value = "/idCheck", method=RequestMethod.GET)
	@ResponseBody
	public String idCheck(@RequestParam String userid){
		System.out.println("userid :"+userid);
		int count = 0;
		
		count = service.idCheck(userid);
		System.out.println(count);
		
		return String.valueOf(count);
	}
	
	@GetMapping("/customLogin")
	public void login(String error, String logout, Model model) {
		if(error != null) {
			System.out.println(error);
			model.addAttribute("error", "로그인 실패.");
		}
		if(logout != null) {
			model.addAttribute("logout", "로그아웃");
		}
		
	}
	
	@GetMapping("/customLogout")
	public void logoutForm() {
		log.info("logout");
	}
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);
		System.out.println("access Denied : "+ auth);
		model.addAttribute("msg","접근 권한이 없습니다.");
	}
	@RequestMapping(value="/customJoin", method=RequestMethod.GET)
	public void memberJoin() {
		
	}
	
	@RequestMapping(value="/customJoin", method=RequestMethod.POST)
	public String memberJoin(MemberVO member, AuthVO auth) {
		//ModelAndView mv = new ModelAndView();
		String pwInput = member.getUserpw();
		String pw = pwEncode.encode(pwInput);
		member.setUserpw(pw);
		service.SignUp(member);
		
		
		service.insertAuth(auth);
		
		return "redirect:/";
	}
	
	// 상품 리뷰 등록 하기 
	@ResponseBody
	@RequestMapping(value="/board/shopItem/registerReview", method=RequestMethod.POST)
	public void registerReview(ReviewVO reviews, Principal principal) {
		log.info("register review");
		reviews.setUserId(principal.getName());
		//System.out.println("a");
		//System.out.println(reviews.getUserId());
		service.review(reviews);
		//System.out.println("작성한 리뷰 : "+ reviews);
		//return "redirect:/board/shopItem?goodsNum=" +reviews.getGdsNum();
		
	}
	
	//상품 리뷰 수정하기 
	//상품 리뷰 삭제하기 
	@ResponseBody
	@RequestMapping(value="/board/shopItem/deleteReview", method=RequestMethod.POST)
	public String deleteReview(ReviewVO reviews, Principal principal) {
		log.info("delete reivew");
		String result = null;
		String member = principal.getName();
		System.out.println("member : " + member);
		String userId = service.reviewUserCheck(reviews.getReviewNum());
		System.out.println("userId : " + userId);
		if(member.equals(userId)) {
		reviews.setUserId(member);		
		service.reviewDelete(reviews);
		result = "Delete";
		}else {
		System.out.println("아이디가 다름.");
		}
		System.out.println("result : "+result);
		
		return result;
		
	}
	
	
	
	// 상품 장바구니에 담기
	@ResponseBody
	@RequestMapping(value="/board/shopItem/addCart", method=RequestMethod.POST)
	public int addCart(CartVO cart, Principal principal) {
		int result = 0;

		String member = principal.getName();
		
		if(member!=null) {
			cart.setUserId(member);
			System.out.println("이름 : " + member);
			service.addCart(cart);
			System.out.println("장바구니 : "+cart);
			result = 1;
			
		}else{
			System.out.println("뭐가 이상한데 ??? ");
		}
		System.out.println("result : "+result);
		return result;
		
	}
	//장바구니 삭제 
	@ResponseBody
	@RequestMapping(value="/Member/deleteCart", method=RequestMethod.POST)
	public String deleteCart(Principal principal, 
				@RequestParam(value="chbox[]") List<String>chArr, 
				CartVO cart ) {
		
		log.info("get rid of item from shopCart");
		
		String member = principal.getName();
	
		String result = null;
		int cartNum = 0;
		
		if(member!=null) {
			cart.setUserId(member);
			for(String i : chArr) {
				cartNum = Integer.parseInt(i);
				//System.out.println("cartNum : " + cartNum);
				cart.setCartNum(cartNum);
				service.deleteCart(cart);
				//System.out.println("cart : " + cart);
				
			}			
			result = "delete";
			//System.out.println("chArr : "+ chArr);
		}
		return result;
		
	}
	//장바구니 리스트 
	@RequestMapping(value="/Member/CartItem", method=RequestMethod.GET)
	public void cartItem(Principal principal, Model model) {
		String userId = principal.getName();
		List<CartItemVO>cartItem = service.cartList(userId);
		model.addAttribute("cartItem", cartItem);
	}
	
	//상품 주문 
	@RequestMapping(value="/Member/CartItem", method=RequestMethod.POST)
	public String orderItem(Principal principal, OrderVO order, OrderDetailsVO orderDetails) {
		//현재 접속 유저   
		String userId = principal.getName();
		//주문 번호 생성 
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		
		for(int i=1; i<=6; i++) {
			subNum += (int)(Math.random()*10);
		}
		String orderId = ymd + "_" + subNum;
		//orderVO에 유저 + 상품주문 아이디 인풋 
		order.setOrderId(orderId);
		order.setUserId(userId);
		//상품 주문 정보 (수령인 주소, 번호..)
		service.order(order);
		//orderDetailsVO에 상품 주문 번호  인풋 
		orderDetails.setOrderId(orderId);
		//상품 주문 상세정보 ( 상품주문 수량, 상품 번호,,,)
		service.orderDetails(orderDetails);
		//상품 주문 후 장바구니 비우기 
		service.cartAllDelete(userId);
		return "redirect:/Member/OrderedList";
	}
	//주문 물품 목록 
	@RequestMapping(value="/Member/OrderedList", method=RequestMethod.GET)
	public void getOrderedList(Principal principal, OrderVO order, Model model) {
		String userId = principal.getName();
		order.setUserId(userId);
		
		List<OrderVO> orderedList = service.orderedList(order);
		model.addAttribute("orderedList", orderedList);
	}
	//주문 물품 조회 
	@RequestMapping(value="/Member/OrderedView", method=RequestMethod.GET)
	public void getOrderedView(@RequestParam("orderId") String orderId, Principal principal, OrderVO order, Model model) {
		String userId = principal.getName();
		order.setUserId(userId);
		order.setOrderId(orderId);
		List<OrderListVO> orderedView = service.orderedView(order);
		model.addAttribute("orderedView", orderedView);
	}
	
	
}
