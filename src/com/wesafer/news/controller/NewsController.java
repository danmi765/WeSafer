package com.wesafer.news.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.wesafer.bean.NewsBean;
import com.wesafer.news.service.NewsService;

import util.PageNumberingManager;

@Controller 
public class NewsController {
	
	@Autowired
	NewsService newsService;

	
	// forward newsform
	@RequestMapping(value="/news.do", method=RequestMethod.GET)
	public String news(){
		
		return "sub/news/news";
	}
	
	//newsResearch result print !!!lol
	@RequestMapping(value="/newsList.do", method=RequestMethod.GET)
	public String newsList(
			@RequestParam(value = "scVal", required = false) String scVal,
			@RequestParam(value = "prKey", required = false) Integer pr,
			@RequestParam(value = "ckKey", required = false) String cate, 
			@RequestParam(value = "page", required=false, defaultValue="1") String page, Model model){
		int rowsPerPage = 10;
		int total_cnt = new Integer(newsService.getTotal_cnt_news(scVal, pr, cate));
		
		//total_pages
		int total_pages = PageNumberingManager.getInstance().getTotalPage(total_cnt, rowsPerPage);		
			String cateQuery="";
			if(cate != null && !cate.equals("")){
			 cateQuery = cate.replaceAll(",", "&ckKey=");
			}
		
		model.addAttribute("t_pages",total_pages);
		model.addAttribute("newsList", newsService.getList(scVal, pr, cate, page));
		model.addAttribute("page", page);
		model.addAttribute("c_page", page);
		model.addAttribute("totalCnt", total_cnt);
		model.addAttribute("c_page", Integer.parseInt((String)page));		
		model.addAttribute("scVal", scVal);
		model.addAttribute("pr", pr);
		model.addAttribute("cate", cate);
		model.addAttribute("cateQuery", cateQuery);
		return "sub/news/news";
	}
	
	//forward news_write_form! ho lololololol
	@RequestMapping(value="/newsWrite.do", method=RequestMethod.GET)
	public String newsWriteForm(){
//		model.addAttribute("newsWrite", new NewsBean());
		return "sub/news/news_board_write";
	}
	
	//forward news_write! 
	@RequestMapping(value="/newsWrite.do", method=RequestMethod.POST)
	public String newsWrite(HttpServletRequest request) throws IOException{

		NewsBean newsWrite = new NewsBean();

		/*this is your file system directory path of upload!!!!!!! about news! ho!*/
//		String path="C:/Users/hkb/workspace_spring/WeSafer/WebContent/upload/news";
		
		/* this is mine!!! hee!*/
		String path="F:/Java_SmartWeb/mywork_spring/WeSaferWeb/WebContent/upload/news";
		String encType="UTF-8";
		int sizeLimit = 8*1024*1024;
		MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, encType, new DefaultFileRenamePolicy());
		
		String opictureurl = multi.getFilesystemName("opictureurl");
		String ourl = multi.getParameter("ourl");
		String title = multi.getParameter("title");
		String cont = multi.getParameter("cont");

		Date utilDate = new Date();
		java.sql.Date odate = new java.sql.Date(utilDate.getTime());
		
		newsWrite.setOpictureurl(opictureurl);
		newsWrite.setOdate(odate);
		newsWrite.setCate(Integer.parseInt(multi.getParameter("ckKey")));
		newsWrite.setTitle(title);
		newsWrite.setCont(cont);
		newsWrite.setOurl(ourl);
		newsService.newsWrite(newsWrite);
		
		return "redirect:news.do";
		
	}

	//forward delete form!
	@RequestMapping(value="/newsDelete.do", method=RequestMethod.GET)
	public String newsDelete(@RequestParam("idx") int ono){
		newsService.newsDelete(ono);
		//return "sub/news/news_board_delete";
		return "redirect:news.do";
	}

	
}
