package com.wesafer.index.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wesafer.comm.service.CommService;

@Controller
public class IndexController {

		@Autowired
		private CommService commService;
	
		@RequestMapping(value="/index.do" , method = RequestMethod.GET)
		public String goIndex(HttpServletRequest request, Model model,
				@RequestParam(value="fbuser", required=false) String fbuser){
			
			if(fbuser != null){
				request.setAttribute("fbuser", "fbuser");
			}
			
			
			String part1 = "comm";	
			String part2 = "notice";	
			model.addAttribute("rs", commService.getOne(part2));
			System.out.println(commService.getOne(part2).getTit()) ;
			
			return "index";
		}
}
