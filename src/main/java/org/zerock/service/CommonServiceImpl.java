package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.GoodsVO;
import org.zerock.domain.ReviewVO;
import org.zerock.mapper.CommonMapper;
@Service
public class CommonServiceImpl implements CommonService{
	@Autowired
	private CommonMapper mapper;
	//상품 리스트 
	@Override
	public List<GoodsVO> goodsList() {
		// TODO Auto-generated method stub
		return mapper.goodsList();
		 
	}
	//상품 뷰 
	@Override
	public GoodsVO shopItemView(int gdsNum) {
		// TODO Auto-generated method stub
		return mapper.view(gdsNum);
	}
	//상품 리뷰 리스트 
	@Override
	public List<ReviewVO> reviewList(int gdsNum) {
		// TODO Auto-generated method stub
		return mapper.reviewList(gdsNum);
	}
	//각 category 리스트 
	@Override
	public List<GoodsVO> categoryList(String cateCode) {
		// TODO Auto-generated method stub
		return mapper.categoryList(cateCode);
	}
	
}
