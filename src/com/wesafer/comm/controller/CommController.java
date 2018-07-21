package com.wesafer.comm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wesafer.bean.InfoBean;
import com.wesafer.comm.service.CommService;

import util.PagingManager;



@Controller
public class CommController {


		@Autowired
		CommService commService;
		
		@Autowired
		PagingManager pagingManager;
		

		
		// part별 검색 GET
		@RequestMapping(value="/comm_list.do", method=RequestMethod.GET)
		public String listAll( 
								@RequestParam(value="part1", required=false) String part1, 
								@RequestParam(value="part2", required=false) String part2, 
								@RequestParam(value="page", required=false) Integer page, 
								Model model,HttpServletRequest request){
			HttpSession session = request.getSession() ;
			
			Integer rowsPerPage = 10;
			Integer totalCnt = 0;
			Integer totalBlock =0;
			Integer blockStartNum = 0;
			Integer blockEndNum = 0;
			
			if(page == null){
				page=1;
			}
			
			if(part1 == null){
				part1="comm";
			}
			if(part2 == null){
				part2="notice";
			}
			
			
			if(session.getAttribute("admin") != null || session.getAttribute("loginUser") != null){
				
			}
			totalCnt = commService.getTotalCnt(part1, part2);
			totalBlock = pagingManager.getTotalBlock(totalCnt, rowsPerPage);
			blockEndNum = pagingManager.getEndNum(page, totalCnt, rowsPerPage);
			blockStartNum = pagingManager.getStartNum(blockEndNum, rowsPerPage);
			

			System.out.println("====================");
			System.out.println("cnt :"+totalCnt);
			System.out.println("block :"+totalBlock);
			System.out.println("end : "+blockEndNum);
			System.out.println("start :"+blockStartNum);
			System.out.println("part2 :"+part2);
			
			model.addAttribute("rs", commService.searchAll(part1, part2, blockStartNum, blockEndNum));
			model.addAttribute("page", page);
			model.addAttribute("total_page", totalBlock);
			model.addAttribute("total_cnt", totalCnt);
			
			return "sub/comm/" +part2+ "_list";
		}
		
		// keyword 검색 POST
		@RequestMapping(value="/comm_list.do", method=RequestMethod.POST)
		public String searchKeyword(
										@RequestParam(value="part1", required=false) String part1, 
										@RequestParam(value="part2", required=false) String part2, 
										@RequestParam(value="searchCate", required=false) String searchCate, 
										@RequestParam(value="keyword", required=false) String keyword, 
										Model model){
			if(part1 == null){
				part1="comm";
			}
			if(part2 == null){
				part2="notice";
			}
			
			if(searchCate.equals("0")){
				searchCate="cont";
			}
			
			System.out.println("part1+"+part1);
			System.out.println("part2+"+part2);
			System.out.println(searchCate+" / "+keyword);
			model.addAttribute("rs", commService.searchKeyword(part1, part2, searchCate, keyword));
			
			return "sub/comm/" +part2+ "_list";
		}
		
		// idx 검색 폼 GET
		@RequestMapping(value="/comm_view.do", method=RequestMethod.GET)
		public String view(	
							@RequestParam(value="part1", required=false) String part1, 
							@RequestParam(value="part2", required=false) String part2, 
							@RequestParam(value="idx", required=false) int idx1,
							@RequestParam(value="page", required=false) Integer page,
							Model model){
		
			commService.updateReadCnt(part1, part2, idx1);
			model.addAttribute("page", page);
			model.addAttribute("rs", commService.searchIdx(part1, part2, idx1));
			model.addAttribute("cmt", commService.getComment(idx1));
			
			return "sub/comm/" +part2+ "_view";
		}
		
		
		// 글 수정 폼 GET
		@RequestMapping(value="/comm_update.do", method=RequestMethod.GET)
		public String update(	
								@RequestParam(value="part1", required=false) String part1,
								@RequestParam(value="part2", required=false) String part2,
								@RequestParam(value="idx", required=false) int idx1, 
								@RequestParam(value="page", required=false) Integer page,
								Model model){
			
			model.addAttribute("page", page);
			model.addAttribute("rs", commService.searchIdx(part1, part2, idx1));

			return "sub/comm/" +part2+ "_update";
		}
		
		// 글 수정 POST
		@RequestMapping(value="/comm_update.do", method=RequestMethod.POST)
		public String update(
								InfoBean infoBeanObjToWrite, 
								Model model){
			
			String part1=infoBeanObjToWrite.getPart1();
			String part2=infoBeanObjToWrite.getPart2();
			commService.update(infoBeanObjToWrite);
			
			return "redirect:" +part1+ "_list.do?part2=" +part2;
		}

		
		// 글 작성 폼 GET
		@RequestMapping(value="/comm_insert.do", method = RequestMethod.GET)
		public String show_write_form(	
										@RequestParam(value="part1", required=false) String part1, 
										@RequestParam(value="part2", required=false) String part2,
										@RequestParam(value="page", required=false) Integer page,
										Model model){
			
			model.addAttribute("page", page);
			return "sub/comm/" +part2+ "_write";
		}
		// 글 작성 POST
		@RequestMapping(value="/comm_insert.do", method=RequestMethod.POST)
			public String insert(	
									InfoBean infoBeanObjToWrite, 
									@RequestParam(value="page", required=false) Integer page,
									Model model){
				
			String userid=infoBeanObjToWrite.getUserid();
				String part1=infoBeanObjToWrite.getPart1();
				String part2=infoBeanObjToWrite.getPart2();
				System.out.println("comm post :" +part1+ " / " +part2+ "/ userid : "+userid);
				
				infoBeanObjToWrite.setNum(commService.getTotalCnt(part1, part2)+1);
				System.out.println("comm post :" +part1+ " / " +part2+ "/ userid : "+userid);
				commService.insert(infoBeanObjToWrite);
				
				return "redirect:comm_list.do?part1=" +part1+ "&part2=" +part2;
		}
		
		
		//글 삭제 GET
		@RequestMapping(value="/comm_delete.do", method=RequestMethod.GET)
		public String update(	
								@RequestParam(value="part1", required=false) String part1,
								@RequestParam(value="part2", required=false) String part2,
								@RequestParam(value="page", required=false) Integer page,
								@RequestParam(value="idx", required=false) int idx1){
			
			commService.delete(part1, part2, idx1);
			commService.updateNum(part1, part2, idx1);

			return "redirect:comm_list.do?part2=" +part2+ "&page=" +page;
		}

		
		// 코멘드 삭제
		@RequestMapping(value="/comment.do", method=RequestMethod.GET)
		public String deleteComment(@RequestParam("idx") int idx,
				@RequestParam("c_no") String c_no,
				@RequestParam("part2") String part2,
				@RequestParam("part1") String part1,
				HttpServletRequest request){
			
			/*int idx1 = Integer.parseInt(idx);*/
			int c_no1 = Integer.parseInt(c_no);
			
			commService.deleteComment(idx, c_no1);
			return "redirect:comm_view.do?part1="+part1+"&part2="+part2+"&idx="+idx;
		}
		
		// 코멘트달기
		@RequestMapping(value="/comment.do", method=RequestMethod.POST)
		public String insertComment(@RequestParam("part2") String part2,
				@RequestParam("part1") String part1,
				@RequestParam("cont") String cont,
				@RequestParam("userid") String userid,
				@RequestParam("idx") int idx){
			/*int idx1 = Integer.parseInt(idx);*/

			System.out.println("코멘트달기b : "+part1+","+part2+","+idx);
			commService.insertComment(userid, cont, idx);
			return "redirect:comm_view.do?part1="+part1+"&part2="+part2+"&idx="+idx;
		}

}
