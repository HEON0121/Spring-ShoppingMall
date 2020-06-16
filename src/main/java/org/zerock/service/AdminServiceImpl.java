package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.CategoryVO;
import org.zerock.domain.GoodsVO;
import org.zerock.domain.OrderListVO;
import org.zerock.domain.OrderVO;
import org.zerock.domain.ReviewListVO;
import org.zerock.domain.ReviewVO;
import org.zerock.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminMapper mapper;
	//상품 등록 처리 
	@Override
	public void goodsRegister(GoodsVO goods) {
		// TODO Auto-generated method stub
		mapper.register(goods);
	}
	//카테고리  (상품 등록이랑 연계 ) 
	@Override
	public List<CategoryVO> category() {
		// TODO Auto-generated method stub
		return mapper.category();
	}
	
	//상품 수정 하기 
	@Override
	public void goodsModify(GoodsVO goods) {
		// TODO Auto-generated method stub
		mapper.modify(goods);
	}
	//상품 삭제 하기 
	@Override
	public void goodsDelete(int gdsNum) {
		// TODO Auto-generated method stub
		mapper.deleteShopItem(gdsNum);
	}
	//게시글 연관 댓글 삭제하기 
	@Override
	public void deleteReply(ReviewVO review) {
		// TODO Auto-generated method stub
		mapper.deleteReply(review);
	}
	
	//주문 물품 리스트 
	public List<OrderVO> orderedList(){
		return mapper.orderedList();
	}
		
	//특정 주문 물품 조회 
	public List<OrderListVO> orderedView(OrderVO order){
		return mapper.orderedView(order);
	}
	//배송 상태 
	public void deliveryStatus (OrderVO order) {
		mapper.deliveryStatus(order);
	}
	//배송 시 상품 재고 감소
	public void changeStock(GoodsVO goods) {
		mapper.changeStock(goods);
	}
	// 유저 상품 소감 가져오기 (전체)
	public List<ReviewListVO> allReview(){
		return mapper.allReview();
	}
	// 유저 상품 소감 삭제 하기 
	public void deleteReview(int reviewNum) {
		mapper.deleteReview(reviewNum);
	}

}
