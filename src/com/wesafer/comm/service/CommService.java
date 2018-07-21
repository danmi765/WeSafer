package com.wesafer.comm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.wesafer.bean.CommentBean;
import com.wesafer.bean.InfoBean;
import com.wesafer.comm.mapper.CommMapper;


@Component
public class CommService {

		@Autowired
		private CommMapper commMapper;
		
		// idx 검색
		public InfoBean searchIdx(String part1, String part2, int idx){
			return this.commMapper.searchIdx(part1, part2, idx);
		}

	
		// readCnt 업데이트
		public void updateReadCnt(String part1, String part2, int idx){
			this.commMapper.updateReadCnt(part1, part2, idx);
		}
		
	
/*		// part 별 검색
		public List<InfoBean> searchAll(String part1, String part2, Integer page, Integer rowsPerPage){
			return this.commMapper.searchAll(part1, part2, page, rowsPerPage);
		}*/
		public List<InfoBean> searchAll(String part1, String part2, Integer blockStartNum, Integer blockEndNum){
			return this.commMapper.searchAll(part1, part2, blockStartNum, blockEndNum);
		}
		
		
		// 키워드 검색
		public List<InfoBean> searchKeyword(String part1, String part2, String searchCate, String keyword){
			return this.commMapper.searchKeyword(part1, part2, searchCate, keyword);
		}
		
		// 키워드 검색 토탈 카운트
		public Integer searchKeywordTotal(String part1, String part2, String keyword, Integer page, Integer list){
			return this.commMapper.searchKeywordTotal(part1, part2, keyword, page, list);
		}
		
		// 글 수정
		public void update(InfoBean infoBean){
			this.commMapper.update(infoBean);
		}
		
		// 글 작성
		public void insert(InfoBean infoBean){
			this.commMapper.insert(infoBean);
		}
		
		// 글 삭제
		public void delete(String part1, String part2, int idx){
			this.commMapper.delete(part1, part2, idx);
		}
		
		// num 업데이트
		public void updateNum(String part1, String part2, int idx){
			this.commMapper.updateNum(part1, part2, idx);
		}
		
		// total count
		public int getTotalCnt(String part1, String part2){
			return this.commMapper.getTotalCnt(part1, part2);		
		}
		
		// front page �슜
		public InfoBean getOne(String part2){
			return this.commMapper.getOne(part2);
		}
		
		// insertComment
		public void insertComment(String userid, String cont, int idx){
			commMapper.insertComment(userid, cont, idx);
		}
		
		// deleteComment
		public void deleteComment(int idx, int c_no){
			commMapper.deleteComment(idx, c_no);
		}
		
		// getComment
		public ArrayList<CommentBean> getComment(int idx){
			return this.commMapper.getComment(idx);
		}
		
}
