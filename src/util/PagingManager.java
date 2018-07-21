package util;

import org.springframework.beans.factory.annotation.Autowired;

import com.wesafer.comm.mapper.CommMapper;

public class PagingManager {
	
	@Autowired
	CommMapper commMapper;
	
	// total page block
	public int getTotalBlock(int total_cnt, int rowsPerPage){
		if((total_cnt % rowsPerPage) == 0 ){
			return (total_cnt / rowsPerPage);
		}else{
			return ((total_cnt / rowsPerPage) +1);
		}
	}
		
	// block start num
	public Integer getStartNum(Integer blockEndNum, Integer rowsPerPage){
		if((blockEndNum - rowsPerPage) < 1){
			return 1;
		}else{
			return ((blockEndNum - rowsPerPage)+1);
		}
	}
	
	// block end num
	public Integer getEndNum(Integer page, Integer totalCnt, Integer rowsPerPage){
		for(int i=1; i<page; i++){
			totalCnt-=rowsPerPage;
		}
		return totalCnt;
	}
}
