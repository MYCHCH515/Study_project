package com.ch.s1.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {

	public List<ProductVO> getList() throws Exception;
}
