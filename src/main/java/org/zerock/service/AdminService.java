package org.zerock.service;

import java.util.List;

import org.zerock.domain.CategoryVO;
import org.zerock.domain.GoodsVO;
import org.zerock.domain.OrderListVO;
import org.zerock.domain.OrderVO;
import org.zerock.domain.ReviewVO;

public interface AdminService {
	//상품 등록 창에서 카테고리 제이슨 처리 
	public List<CategoryVO> category();
	//상품 등록
	public void goodsRegister(GoodsVO goods);
	//상품 수정하기 
	public void goodsModify(GoodsVO goods);
	//상품 삭제 
	public void goodsDelete(int gdsNum);
	//상품 게시글 연관 댓글 삭제 
	public void deleteReply(ReviewVO review);
	//주문 물품 리스트 
	public List<OrderVO> orderedList();		
	//특정 주문 물품 조회 
	public List<OrderListVO> orderedView(OrderVO order);
	//배송 상태 
	public void deliveryStatus (OrderVO order);
	//배송 시 상품 재고 감소
	public void changeStock(GoodsVO goods);
	//회원 관리 
}
