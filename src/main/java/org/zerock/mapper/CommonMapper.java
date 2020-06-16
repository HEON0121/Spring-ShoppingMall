package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.CategoryVO;
import org.zerock.domain.GoodsVO;
import org.zerock.domain.ReviewVO;

public interface CommonMapper {
	
	//상품 목록
	public List<GoodsVO> goodsList();
	//카테고리 목록 
	public List<GoodsVO> categoryList(String cateCode);
	
	//상품 조회
	public GoodsVO view(int gdsNum);
	//상품 리뷰 리스트 
	public List<ReviewVO> reviewList(int gdsNum);
}
