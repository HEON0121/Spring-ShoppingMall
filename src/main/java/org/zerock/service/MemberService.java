package org.zerock.service;

import java.util.List;

import org.zerock.domain.AuthVO;
import org.zerock.domain.CartItemVO;
import org.zerock.domain.CartVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.OrderDetailsVO;
import org.zerock.domain.OrderListVO;
import org.zerock.domain.OrderVO;
import org.zerock.domain.ReviewVO;

public interface MemberService {
	//회원 가입
	public void SignUp(MemberVO member);
	//가입시 권한 부여
	public void insertAuth(AuthVO auth);
	// 아이디중복 체크 
	public int idCheck(String userid);
	//로그인
	public MemberVO read(String userid);
	//로그아웃
	public void LogOut();
	//상세보기 
	public MemberVO getMyPage(String userId);
	//리뷰 
	public void review(ReviewVO reviews);
	//리뷰 수정
	//리뷰 삭제
	public void reviewDelete(ReviewVO reviews);
	//리뷰 수정 삭제 사용자권한 확인
	public String reviewUserCheck(int reviewNum);
	//장바구니 담기 
	public void addCart(CartVO cart);
	//장바구니 삭제 
	public void deleteCart(CartVO cart);
	//장바구니 담은 목록 (사용자별)
	public List<CartItemVO>cartList(String userId);
	
	
	//주문 정보 
	public void order(OrderVO order);
	//주문 상세정보 
	public void orderDetails(OrderDetailsVO orderDetails);
	
	//주문 후 장바구니 비우기 
	public void cartAllDelete(String userId);
	
	//유저 주문 물품 리스트 
	public List<OrderVO> orderedList(OrderVO order);
	
	//특정 주문 물품 조회 
	public List<OrderListVO> orderedView(OrderVO order);
}
