package org.zerock.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.zerock.domain.AuthVO;
import org.zerock.domain.CartItemVO;
import org.zerock.domain.CartVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.OrderDetailsVO;
import org.zerock.domain.OrderListVO;
import org.zerock.domain.OrderVO;
import org.zerock.domain.ReviewVO;
import org.zerock.mapper.MemberMapper;

import lombok.AllArgsConstructor;



@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired 
	private MemberMapper mapper;
	
	
	
	@Override
	public void SignUp(MemberVO member) {
		// TODO Auto-generated method stub
		
		System.out.println("get sign up!");
		System.out.println("비번 : "+ member.getUserpw());
		mapper.SignUp(member);
	}
	
	@Override
	public void insertAuth(AuthVO auth) {
		// TODO Auto-generated method stub
		System.out.println("회원 권한 부여 : " + auth);
		mapper.insertAuth(auth);
	}
	
	@Override
	public MemberVO read(String userid) {
		// TODO Auto-generated method stub
		
		return mapper.read(userid);
	}

	@Override
	public void LogOut() {
		// TODO Auto-generated method stub
		
	}


	@Override
	public MemberVO getMyPage(String userId) {
		// TODO Auto-generated method stub
		return mapper.MyPage(userId);
	}

	// id 중복 체크 
	@Override
	public int idCheck(String userid) {
		return mapper.idCheck(userid);
		
	}
	
	//리뷰 쓰기
	@Override
	public void review(ReviewVO reviews) {
		// TODO Auto-generated method stub
		mapper.review(reviews);
		
	}
	//리뷰삭제 
		@Override
		public void reviewDelete(ReviewVO reviews) {
			// TODO Auto-generated method stub
			mapper.reviewDelete(reviews);
			
		}
		//리뷰 수정/삭제 사용자 권한 체크 
		@Override
		public String reviewUserCheck(int reviewNum) {
			// TODO Auto-generated method stub
			return mapper.reviewUserCheck(reviewNum);
		}
	
	//장바구니 넣기 
	public void addCart(CartVO cart) {
		mapper.addCart(cart);
	}
	//장바구니 삭제 
	public void deleteCart(CartVO cart) {
		mapper.deleteCart(cart);
	}
	//장바구니 목록 (사용자별)
	public List<CartItemVO> cartList(String userId){
		return mapper.cartList(userId);
	}
	//주문 정보 
	@Override
	public void order(OrderVO order) {
		// TODO Auto-generated method stub
		mapper.order(order);
	}
	//주문상세정보 
	@Override
	public void orderDetails(OrderDetailsVO orderDetails) {
		// TODO Auto-generated method stub
		mapper.orderDetails(orderDetails);
	}
	//주문 후 장바구니 비우기 
	@Override
	public void cartAllDelete(String userId) {
		// TODO Auto-generated method stub
		mapper.cartAllDelete(userId);
	}
	//주문 물품 리스트 
	@Override
	public List<OrderVO> orderedList(OrderVO order) {
		// TODO Auto-generated method stub
		return mapper.orderedList(order);
	}
	// 특정 주문 물품 조회 
	@Override
	public List<OrderListVO> orderedView(OrderVO order) {
		// TODO Auto-generated method stub
		return mapper.orderedView(order);
	}
	
	

	







	



}
