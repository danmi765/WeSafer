package com.wesafer.info.controller;

import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wesafer.bean.InfoBean;
import com.wesafer.info.service.InfoService;

import util.PagingManager;

@Controller
public class InfoController {

		@Autowired
		InfoService infoService;
		
		@Autowired
		PagingManager pagingManager;
	
		// part별 검색 GET
		@RequestMapping(value="/info_list.do", method=RequestMethod.GET)
		public String listAll( 
								@RequestParam(value="part1", required=false) String part1, 
								@RequestParam(value="part2", required=false) String part2,
								@RequestParam("page") Integer page,
								Model model, HttpServletRequest request){
		            
			Integer rowsPerPage = 10;
			Integer totalCnt = 0;
			Integer totalBlock =0;
			Integer blockStartNum = 0;
			Integer blockEndNum = 0;
			
			if(part1.equals("info")){	//'범죄분류' 진입
				if(part2==null){
					request.setAttribute("a", "rape");
					System.out.println("part2 == null : "+page);
					part2="where part2='rape'";
				}else{
					request.setAttribute("a", part2);
					System.out.println("part2 != null : "+page+"request.setAttribute('a','"+part2+"')");
					part2="where part2='" +part2+ "'";
				}
			}else{		// '범죄분류' 이외 진입
				totalCnt = infoService.getTotalCnt(part1, "");
				part2="where num >= #{blockStartNum} ";
			}
			
			totalBlock = pagingManager.getTotalBlock(totalCnt, rowsPerPage);
			blockEndNum = pagingManager.getEndNum(page, totalCnt, rowsPerPage);
			blockStartNum = pagingManager.getStartNum(blockEndNum, rowsPerPage);
			
			model.addAttribute("rs", infoService.searchAll(part1, part2, blockStartNum, rowsPerPage));
			model.addAttribute("page", page);
			model.addAttribute("total_page", totalBlock);
			model.addAttribute("total_cnt", totalCnt);
			
			return "sub/info/" +part1+ "/" +part1;
		}
		
		// keyword 검색 POST
		@RequestMapping(value="/info_list.do", method=RequestMethod.POST)
		public String searchKeyword(
										@RequestParam(value="part1", required=false) String part1, 
										@RequestParam(value="part2", required=false) String part2,
										@RequestParam(value="keyword", required=false) String keyword,
										Model model, HttpServletRequest request){
			if(part1 == null){
				part1="info";
			}

            
			String partTemp=null;
			
			if(part2.equals("0")){
				part2="";
			}else{
				partTemp = "where part2='" +part2+ "'";
			}

			System.out.println("====================");
			System.out.println("part1 :"+part1);
			System.out.println("part2 :"+part2);
			System.out.println("keyword : "+keyword);
			
			model.addAttribute("rs", infoService.searchKeyword(part1, partTemp, keyword));

			return "sub/info/" +part1+ "/" +part1;		
		}
		
		// idx 검색 폼 GET
		@RequestMapping(value="/info_view.do", method=RequestMethod.GET)
		public String view(	
							@RequestParam(value="idx", required=false) Integer idx1, 
							@RequestParam(value="part1", required=false) String part1, 
							@RequestParam(value="part2", required=false) String part2,
							@RequestParam(value="page", required=false) Integer page,
							Model model){
			
			
			model.addAttribute("page", page);
			infoService.updateReadCnt(part1, part2, idx1);
			model.addAttribute("rs", infoService.searchIdx(part1, part2, idx1));

			return "sub/info/view";
		}
		
		
		// 글 수정 폼 GET
		@RequestMapping(value="/info_update.do", method=RequestMethod.GET)
		public String update(	
								@RequestParam(value="part1", required=false) String part1,
								@RequestParam(value="part2", required=false) String part2,
								@RequestParam(value="idx", required=false) Integer idx1, 
								@RequestParam(value="page", required=false) Integer page,
								Model model){
			
			model.addAttribute("page", page);
			model.addAttribute("rs", infoService.searchIdx(part1, part2, idx1));

			return "sub/info/update";
		}
		// 글 수정 POST
		@RequestMapping(value="/info_update.do", method=RequestMethod.POST)
		public String update(
								InfoBean infoBeanObjToWrite,
								@RequestParam(value="page", required=false) Integer page,
								Model model){
			
// 셀렉트 옵션값 중복저장 문제 임시 조치 시작점
			StringTokenizer st1 = new StringTokenizer(infoBeanObjToWrite.getPart1(),","); 
			StringTokenizer st2 = new StringTokenizer(infoBeanObjToWrite.getPart2(),","); 

			String part1 = null;
			String part2 = null;
            // hasMoreTokens() 읽어올 문자열이 남아 있으면 true를 결과로 반환한다. 
            while(st1.hasMoreTokens()) { 
                  part1=st1.nextToken();       
            }
            while(st2.hasMoreTokens()) { 
                part2=st2.nextToken();       
            }
            
            infoBeanObjToWrite.setPart1(part1);
            infoBeanObjToWrite.setPart2(part2);
// 셀렉트 옵션값 중복저장 문제 임시 조치 죵료점
			
            model.addAttribute("page", page);
            infoService.update(infoBeanObjToWrite);
			return "redirect:info_list.do?part1=" +part1+ "&part2=" +part2+ "&page=" +page;
		}

		
		// 글 작성 폼 GET
		@RequestMapping(value="/info_insert.do", method = RequestMethod.GET)
		public String show_write_form(
										@RequestParam(value="page", required=false) Integer page,
										Model model){
			
			model.addAttribute("page", page);
			return "sub/info/write";
		}
		// 글 작성 POST
		@RequestMapping(value="/info_insert.do", method=RequestMethod.POST)
			public String insert(	InfoBean infoBeanObjToWrite,
									@RequestParam(value="page", required=false) Integer page,
									Model model){
				
				String part1=infoBeanObjToWrite.getPart1();
				String part2=infoBeanObjToWrite.getPart2();
				System.out.println("post1 : "+part1+" / "+part2);
				
				if(part1.equals("info")){
					if(part2==null){
						part2=" where part2='rape'";
					}else{
						part2=" where part2='"+part2+"'";
					}
				}else{
					part2="";
				}
				
				part2=infoBeanObjToWrite.getPart2();
				model.addAttribute("page", page);
				
				infoBeanObjToWrite.setNum(infoService.getTotalCnt(part1, part2)+1);
				infoService.insert(infoBeanObjToWrite);
				
				return "redirect:info_list.do?part1=" +part1+ "&part2=" +part2+ "&page=1";
		}
		
		
		//글 삭제 GET
		@RequestMapping(value="/info_delete.do", method=RequestMethod.GET)
		public String delete(	
								@RequestParam(value="part1", required=false) String part1,
								@RequestParam(value="part2", required=false) String part2,
								@RequestParam(value="idx", required=false) Integer idx1,
								@RequestParam(value="page", required=false) Integer page,
								Model model){
			
			infoService.delete(part1, part2, idx1);
			infoService.updateNum(part1, part2, idx1);
			model.addAttribute("page", page);
			
			return "redirect:info_list.do?part1=" +part1+ "&part2=" +part2+ "&page=1";
		}
		
		// 관련사이트로 이동
		@RequestMapping(value="/gosite.do", method=RequestMethod.GET)
		public String goSite(){
			
			return"sub/info/site/site";
		}

}
