package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.AuthVO;
import org.zerock.domain.CartItemVO;
import org.zerock.domain.CartVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.OrderDetailsVO;
import org.zerock.domain.OrderListVO;
import org.zerock.domain.OrderVO;
import org.zerock.domain.ReviewVO;

public interface MemberMapper {
//	@Insert("insert into shop_member (\n" + 
//			"	userid, userpw, username, userphone, postcode, useraddr, useraddr1, usergender, userbirth, useremail\n" + 
//			"	)\n" + 
//			"	values(\n" + 
//			"	#{userid}, #{userpw},#{username},#{userphone},#{postcode},#{useraddr},#{useraddr1},#{usergender},#{userbirth},#{useremail}\n" + 
//			"	)")
	//회원 가입 
	public void SignUp(MemberVO member);
	//회원 가입시 일반 권한  부여
	public void insertAuth(AuthVO auth);
	//로그인 
	public MemberVO read(String userid);
	//로그아웃
	//아이디 중복체크 
	public int idCheck(String userid);
	
	//마이 페이지
	public MemberVO MyPage(String userid);
	
	//리뷰 쓰기 
	public void review(ReviewVO reviews);
	
	//리뷰 수정
	public void reviewUpdate(ReviewVO reviews);
	//리뷰 삭제 
	public void reviewDelete(ReviewVO reviews);
	
	//리뷰 수정 삭제 사용자 권한 체크
	public String reviewUserCheck(int reviewNum);
	
	//장바구니 담기 
	public void addCart(CartVO cart);
	//장바구니 삭제 
	public void deleteCart(CartVO cart);
	//장바구니 목록 
	public List<CartItemVO>cartList(String userId);
	
	
	
	//주문 정보 
	public void order(OrderVO order);
	//주문 상세정보 
	public void orderDetails(OrderDetailsVO orderDetails);
	
	//주문 후 장바구니 비우기 
	public void cartAllDelete(String userId);
	
	//주문 물품 리스트 
	public List<OrderVO> orderedList(OrderVO order);
	
	//특정 주문 물품 조회 
	public List<OrderListVO> orderedView(OrderVO order);
}
	