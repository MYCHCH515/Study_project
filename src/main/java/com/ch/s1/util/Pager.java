package com.ch.s1.util;

import lombok.Data;

@Data
public class Pager {
	
	private String search;
	private String kind;
	
	private long curPage;
	private long perPage;
	
	private long startRow;
	
	private long startNum;
	private long lastNum;
	
	private boolean isBefore;
	private boolean isAfter;
	
	private long totalCount;
	
	public Pager() {
		this.perPage=5;
	}
	
	public void makeRow() {
		this.startRow=(this.getCurPage()-1)*perPage;
	}
	
	public void makePage(long totalCount) {
		
		long totalPage = totalCount/perPage;
		if(this.getTotalCount()%perPage !=0) {
			totalPage++;
		}
		
		long perBlock = 5;
		long totalBlock = totalPage/perBlock;
		if(totalPage%perBlock !=0) {
			totalBlock++;
		}
		
		long curBlock = this.getCurPage()/perBlock;
		if(this.getCurPage()%perBlock !=0) {
			curBlock++;
		}
		
		this.startNum = (curBlock-1)*perBlock+1;
		this.lastNum = curBlock*perBlock;
		
		if(curBlock == totalBlock) {
			this.lastNum = totalPage;
		}
		
		if(curBlock>1) {
			this.isBefore = true;
		}
		
		if(curBlock<totalBlock) {
			this.isAfter=true;
		}	
	}
		
	public void setCurPage(long curPage) {
		if(curPage==0) {
			this.curPage=1;
		}else {
			this.curPage=curPage;
		}
	}
	
	public long getCurPage() {
		if(this.curPage==0) {
			this.curPage=1;
		}
		return this.curPage;
	}
	
	public String getSearch() {
		if(this.search == null) {
			this.search="";
		}
		return search;
	}
}
