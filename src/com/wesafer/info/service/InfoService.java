package com.wesafer.info.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wesafer.bean.InfoBean;
import com.wesafer.info.mapper.InfoMapper;


@Component
public class InfoService {
	@Autowired
	private InfoMapper infoMapper;
	
	// total page
	public int getTotalBlock(int total_cnt, int rowsPerPage){
		if((total_cnt % rowsPerPage) == 0 ){
			return (total_cnt / rowsPerPage);
		}else{
			return ((total_cnt / rowsPerPage) +1);
		}
	}

	// total count
	public int getTotalCnt(String part1, String part2){
		return this.infoMapper.getTotalCnt(part1, part2);		
	}

		
	// block start num
	public int getStartNum(Integer blockEndNum, Integer rowsPerPage){
		if((blockEndNum - rowsPerPage) < 1){
			return 1;
		}else{
			return ((blockEndNum - rowsPerPage)+1);
		}
	}
	
	// block end number
	public Integer getEndNum(Integer page, Integer totalCnt, Integer rowsPerPage){
		for(int i=1; i<page; i++){
			totalCnt-=rowsPerPage;
		}
		return totalCnt;
	}
	
	
	// idx 검색
	public InfoBean searchIdx(String part1, String part2, Integer idx){
		return this.infoMapper.searchIdx(part1, part2, idx);
	}


	// readCnt 업데이트
	public void updateReadCnt(String part1, String part2, Integer idx){
		this.infoMapper.updateReadCnt(part1, part2, idx);
	}
	
	
	// part 검색
	public List<InfoBean> searchAll(String part1, String part2, Integer blockStartNum, Integer blockEndNum){
		return this.infoMapper.searchAll(part1, part2, blockStartNum, blockEndNum);
	}
	
	// 키워드 검색
	public List<InfoBean> searchKeyword(String part1, String part2, String keyword){
		return this.infoMapper.searchKeyword(part1, part2, keyword);
	}
	
	// 수정
	public void update(InfoBean infoBean){
		this.infoMapper.update(infoBean);
	}
	
	// 글쓰기
	public void insert(InfoBean infoBean){
		this.infoMapper.insert(infoBean);
	}
	
	// 삭제
	public void delete(String part1, String part2, Integer idx){
		this.infoMapper.delete(part1, part2, idx);
	}
	
	// num 값 정렬
	public void updateNum(String part1, String part2, Integer idx){
		this.infoMapper.updateNum(part1, part2, idx);
	}
	
	// front page 용
	public InfoBean getOne(String part2, Integer idx){
		return this.infoMapper.getOne(part2, idx);
	}
}
