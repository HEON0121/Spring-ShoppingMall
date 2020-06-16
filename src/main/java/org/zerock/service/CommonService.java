package org.zerock.service;

import java.util.List;

import org.zerock.domain.GoodsVO;
import org.zerock.domain.ReviewVO;

public interface CommonService {
	//상품 리스트 조회 
	public List<GoodsVO>goodsList();
	//운동 category 리스트 조회 
	public List<GoodsVO>categoryList(String cateCode);
	//상품 조회 
	public GoodsVO shopItemView(int gdsNum);
	//리뷰 리스트 
	public List<ReviewVO>reviewList(int gdsNum);
}
