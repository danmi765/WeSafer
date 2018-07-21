package com.wesafer.member.controller;



import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wesafer.bean.MemberBean;
import com.wesafer.member.service.MemberService;

import util.PageNumberingManager;




@Controller
public class MemberController {

		@Autowired
		MemberService memberService;

		// 비밀번호 찾기폼으로 이동
		@RequestMapping(value="/findpw.do", method=RequestMethod.GET)
		public String findPassword1(Model model){
			
			return "member/find_pw_1";
		}
		
		// 비밀번호 찾을 아이디 입력 후 인증단계로이동
		@RequestMapping(value="/findpw.do", method=RequestMethod.POST)
		public String findpassword2(@RequestParam("userid") String userid, Model model,
				HttpSession session, HttpServletRequest request ){
			session = request.getSession();
			String active = memberService.noneActiveMember(userid);
			System.out.println(userid+active);
			
			
			if(memberService.idCheck(userid) == null){
				request.setAttribute("noneActiveMember", "no");
				return "member/find_pw_1";
			}
			
			if(active.equals("y")){
				model.addAttribute("useremail", memberService.selectByEmail(userid));
				model.addAttribute("userphone", memberService.selectByPhone(userid));
				request.setAttribute("userid", userid);
				return "member/find_pw_2";
			}else if(active.equals("n")){
				request.setAttribute("noneActiveMember", "no");
				return "member/find_pw_1";
			}else{
				return "redirect:index.do";
			}

		}
		
		// 비밀번호 찾기 메일인증
		@RequestMapping(value="/sendValidateMailPw.do" , method=RequestMethod.GET)
		public String vailEmailPw(HttpSession session, HttpServletRequest request,
					@RequestParam("name") String name, 
					@RequestParam("email") String email,
					@RequestParam("userid") String userid,
					Model model) throws AddressException, MessagingException{
			
			String useridCheck = memberService.emailCheck(name, email);
			int vali = memberService.RandomNum();

			session.setAttribute("vali", vali);
			session.setAttribute("username", name);
			session.setAttribute("useremail", email);
			
			String text = name+"\uB2D8, \uBE44\uBC00\uBC88\uD638 \uCC3E\uAE30 \uC778\uC99D\uBC88\uD638\uB294 "+vali+" \uC785\uB2C8\uB2E4." ;
			
			if(useridCheck != null){
				MailingSender.getInstance().initPost("www.WeSafer.com", email , "<WeSafer.com> \uBE44\uBC00\uBC88\uD638 \uCC3E\uAE30 \uC778\uC99D \uBA54\uC77C", text).send();
				System.out.println(useridCheck);
				
				return "member/find_pw_vail";
			}else{
				request.setAttribute("findPasswordEmailvail", "fail");
				model.addAttribute("useremail", memberService.selectByEmail(userid));
				model.addAttribute("userphone", memberService.selectByPhone(userid));
				model.addAttribute("userid", userid);
				return "member/find_pw_2" ;
			}
			
		}
		
		// 비밀번호 찾기 인증완료 메일발송
		@RequestMapping(value="/sendValidateMailPw.do",method=RequestMethod.POST)
		public String valiEmailPw2(@RequestParam("validate_check") String validate_check,
							@RequestParam("validate") String validate,
							@RequestParam("name") String name,
							@RequestParam("email") String email,
							HttpServletRequest request) throws AddressException, MessagingException{
			if(validate.equals(validate_check)){
				String password = memberService.passwordCheck(name, email);
				String text = "";
				text = name+"\uB2D8\uC758 \uBE44\uBC00\uBC88\uD638\uB294 "+password+ "\uC785\uB2C8\uB2E4.";
				
				MailingSender.getInstance().initPost("www.WeSafer.com", email, "<WeSafer.com> \uBE44\uBC00\uBC88\uD638 \uCC3E\uAE30 \uC778\uC99D\uC644\uB8CC", text).send();
				request.setAttribute("EmailValidate", "success");
			}else{
				request.setAttribute("EmailValidate", "fail");
			}
			return "member/login";
		}
		
		
		// 아이디 찾기폼으로 이동
		@RequestMapping(value="/findid.do", method=RequestMethod.GET)
		public String findID(Model model){
			
			return "member/find_id";
		}
		
		// 아아디 찾기 메일인증
		@RequestMapping(value="/sendValidateMail.do", method=RequestMethod.GET)
		public String finIdEmail(@RequestParam("name") String name,
				@RequestParam("email") String email,
				HttpSession session, HttpServletRequest request) throws AddressException, MessagingException{
			
			//String active = memberService.noneActiveMemberByEmail(email);
			String useridCheck = memberService.emailCheck(name, email);
			int vali = memberService.RandomNum();

			session.setAttribute("vali", vali);
			session.setAttribute("username", name);
			session.setAttribute("useremail", email);
			
			String text = name+"\uB2D8, \uC774\uBA54\uC77C \uC778\uC99D\uC785\uB2C8\uB2E4. \uC778\uC99D\uBC88\uD638\uB294 "+vali+" \uC785\uB2C8\uB2E4." ;
			
			if(useridCheck != null){
				MailingSender.getInstance().initPost("www.WeSafer.com",email , "<WeSafer.com> \uC544\uC774\uB514 \uCC3E\uAE30 \uC774\uBA54\uC77C \uC778\uC99D", text).send();
				return "member/find_id_vail";
			}else{
				request.setAttribute("findPasswordEmailvail", "fail");
				return "member/find_id";
			}
			
		}
		
		// 아이디찾기 인증완료 메일발송
		@RequestMapping(value="/sendValidateMail.do", method=RequestMethod.POST)
		public String finIdEmail2(@RequestParam("validate_check") String validate_check,
				@RequestParam("validate") String validate,
				@RequestParam("name") String name,
				@RequestParam("email") String email,
				HttpServletRequest request) throws AddressException, MessagingException{
			
			if(validate.equals(validate_check)){
				String userid = memberService.emailCheck(name, email);
				String text = name+"\uB2D8\uC758 \uC544\uC774\uB514\uB294 "+userid+ "\uC785\uB2C8\uB2E4.";
				
				MailingSender.getInstance().initPost("www.WeSafer.com", email, "<WeSafer.com> \uC544\uC774\uB514 \uCC3E\uAE30 \uC778\uC99D\uC644\uB8CC", text).send();
				request.setAttribute("EmailValidate", "success");
			}else{
				request.setAttribute("EmailValidate", "fail");
			}
			return "member/login";
		}
		
		
		
		
		// 로그인화면으로 이동
		@RequestMapping(value="/login.do", method=RequestMethod.GET)
		public String goLogin(){
			return "member/login";
		}
		
		// 로그인 유저 체크
		@RequestMapping(value="/login.do", method=RequestMethod.POST)
		public String userCheck(@RequestParam("userid") String userid, @RequestParam("psw") String psw,
				Model model, HttpSession session, HttpServletRequest request){
			session = request.getSession();
			String pswCheck = memberService.loginUserCheck(userid);
			String active = memberService.noneActiveMember(userid);
			
			if(pswCheck != null){
				if(active.equals("y")){
					if(psw.equals(pswCheck)){
						
						if(userid.equals("admin")){
							session.setAttribute("admin", memberService.selectById(userid));
							return "redirect:index.do";
						}else{
							session.setAttribute("loginUser", memberService.selectById(userid));
							model.addAttribute("message", "LoginUser");
							return "redirect:index.do";
						}
						
					}else{
						model.addAttribute("userid",userid);
						model.addAttribute("message", "\uBE44\uBC00\uBC88\uD638\uB97C \uD655\uC778\uD558\uC138\uC694");
						return "member/login";
					}
				}else{
					model.addAttribute("message", "\uC774\uBBF8 \uD0C8\uD1F4\uD55C \uD68C\uC6D0\uC785\uB2C8\uB2E4.");
					return "member/login";
				}
				
			}else{
				model.addAttribute("userid",userid);
				model.addAttribute("message", "\uAC00\uC785\uB41C \uC544\uC774\uB514\uAC00 \uC5C6\uC2B5\uB2C8\uB2E4.");
				return "member/login";
			}
			
		}
		
		//로그아웃
		@RequestMapping(value="/logout.do", method=RequestMethod.GET)
		public String logout(HttpSession session, HttpServletRequest request, Model model){
			session = request.getSession();
			session.invalidate();
			model.addAttribute("message", "logout");
			return "redirect:index.do";
			
		}
		
		
		
		// 비밀번호 변경 폼으로 이동
		@RequestMapping(value="/changepw.do", method=RequestMethod.GET)
		public String changeForm(){
			return "member/change_pw";
		}
		
		// 비밀번호 변경
		@RequestMapping(value="/changepw.do", method=RequestMethod.POST)
		public String chengePassword(@RequestParam("userid") String userid,
							@RequestParam("psw") String psw, Model model){
			
			if(psw.equals(memberService.loginUserCheck(userid))){
				return "member/change_pw2";
			}else{
				model.addAttribute("message", "\uBE44\uBC00\uBC88\uD638\uAC00 \uD2C0\uB9BD\uB2C8\uB2E4.");
				return "member/change_pw";
			}
		}
		
		@RequestMapping(value="/changepw2.do",method=RequestMethod.POST)
		public String changePassword2(@RequestParam("userid") String userid, 
							@RequestParam("psw") String psw,
							HttpSession session, HttpServletRequest request,
							Model model){
			memberService.changePassword(userid, psw);
			
				session = request.getSession();
				session.invalidate();
				request.setAttribute("changePassword", "success");
				return "member/login";
		}
		
		// 사이트맵으로 이동
		@RequestMapping(value="/sitemap.do", method=RequestMethod.GET)
		public String goSiteMap(){
			return "sub/sitemap" ;
		}
		
		
		// 마이페이지로 이동
		@RequestMapping(value="/mypage.do", method=RequestMethod.GET)
		public String goMyPage(){
			return "sub/mypage/mypage";
		}
		
		// 회원정보 수정폼으로 이동
		@RequestMapping(value="/modi.do", method=RequestMethod.GET)
		public String goModiMemberForm(){
			return "member/modiMember" ;
		}
		
		// 회원정보 수정
		@Transactional
		@RequestMapping(value="/modi.do", method=RequestMethod.POST)
		public String ModiMember(@RequestParam("userid") String userid,
								@RequestParam("name") String name,
								@RequestParam("psw") String psw,
								@RequestParam("phone") String phone,
								@RequestParam("email") String email,
								@RequestParam("loc") String loc,
								@RequestParam("birth") String birth,
								@RequestParam("nick") String nick,
								@RequestParam("loc2") String loc2,
								HttpSession session, HttpServletRequest request,
								Model model){
			if(psw.equals(memberService.loginUserCheck(userid))){
				memberService.modiMember(userid, name, phone, email, loc, birth, nick, loc2);
				session = request.getSession();
				session.setAttribute("loginUser", memberService.selectById(userid));
				return "sub/mypage/mypage" ;
			}else{
				request.setAttribute("fail", "fail");
				return "member/modiMember";
			}
		}
		
		
		// 관리자 회원관리 페이지 이동1
		@RequestMapping(value="/adminmp.do", method=RequestMethod.GET)
		public String goAdminMypage(Model model,
				@RequestParam("page") String page){
			String list = "10";
			
			int rowsPerPage = 10;
			int total_cnt = new Integer(memberService.getTotalCnt());
			
			//전체페이지
			int total_pages = PageNumberingManager.getInstance().getTotalPage(total_cnt, rowsPerPage);
			model.addAttribute("t_pages",total_pages);
			
			model.addAttribute("members", memberService.getAllMember(page, list));
			model.addAttribute("page", page);
			model.addAttribute("c_page", Integer.parseInt((String) page));
			model.addAttribute("totalCnt", new Integer(memberService.getTotalCnt()) );
			return "sub/mypage/mypage_admin";
		}
		
		// 관리자 회원관리 페이지 이동2 : 자세히보기
				@RequestMapping(value="/adminmp2.do", method=RequestMethod.GET)
				public String goAdminMypage2(Model model,
						@RequestParam("userid") String userid,
						@RequestParam("page") String page){
					
					model.addAttribute("page", page);
					model.addAttribute("members", memberService.selectById(userid));
					model.addAttribute("delMember", memberService.delMember(userid));
					return "sub/mypage/mypage_admin2";
				}
		
		// 관리자 회원관리 페이지 회원 삭제
		@RequestMapping(value="/admindel.do", method=RequestMethod.GET)
		public String deleteMemberForm(@RequestParam("userid") String userid, Model model){
			model.addAttribute("userid", userid);
			return "sub/mypage/admin_del";
		}
		
		@RequestMapping(value="/admindel.do" , method=RequestMethod.POST)
		public String deleteMember(@RequestParam("userid") String userid, Model model){
			memberService.deleteMember(userid);
			return "redirect:adminmp.do?page=1";
		}
		
		
		// 회원탈퇴
		@RequestMapping(value="/delmember.do", method=RequestMethod.POST)
		public String talMember(@RequestParam("userid") String userid, 
				@RequestParam("psw") String psw,
				@RequestParam("reason") String reason,
				HttpSession session, HttpServletRequest request){
			
			if(psw.equals(memberService.loginUserCheck(userid))){
				session = request.getSession();
				memberService.del_pri(userid, reason);
				memberService.modiActive(userid);
				session.invalidate();
				return "redirect:index.do" ;
			}else{
				request.setAttribute("fail", "fail");
				return "sub/mypage/mypage";
			}
			
		}
		
		
		// 회원가입폼 이동
		@RequestMapping(value="/join.do", method=RequestMethod.GET)
		public String joinForm(){
			return "member/join";
		}
		
		// 회원가입 처리
		@RequestMapping(value="/join.do" , method=RequestMethod.POST)
		public String joinMember(@RequestParam("userid") String userid,
					@RequestParam("name") String name,
					@RequestParam("psw") String psw,
					@RequestParam("phone") String phone,
					@RequestParam("email") String email,
					@RequestParam("loc") String loc,
					@RequestParam("birth") String birth,
					@RequestParam("nick") String nick,
					@RequestParam("loc2") String loc2,
					HttpSession session, HttpServletRequest request,
					Model model){
			memberService.joinMember(userid, name, psw, phone, email, loc, birth, nick, loc2);
			model.addAttribute("message", "\uB85C\uADF8\uC778\uD574 \uC8FC\uC138\uC694.");
			return "member/login";
		}
		
		
		// 중복확인
		@RequestMapping(value="/idCheck.do", method=RequestMethod.GET)
		public String idCheck(@RequestParam("userid") String userid,
				HttpServletRequest request){
			String id = memberService.idCheck(userid);
			int res = -1 ;
			
			if(id != null){
				res=1;
			}else{
				res=-1;
			}
			request.setAttribute("userid", userid);
			request.setAttribute("res", res);
			return "member/idcheck";
		}
		
		
		// 페이스북 로그인 폼 이동
		@RequestMapping(value="/fblogin.do", method=RequestMethod.GET)
		public String fbLoginForm(){
			return "member/FBinfoget";
		}
		
		// 페이스북 공개정보 받아 이동
		@RequestMapping(value="/fbinfo.do",method=RequestMethod.GET)
		public String fbInfo(@RequestParam("userid") String userid,
				@RequestParam("email") String email,
				@RequestParam("name") String name,
				@RequestParam("birth") String birth,
				HttpServletRequest request){
			
			request.setAttribute("userid", userid);
			request.setAttribute("email", email);
			request.setAttribute("name", name);
			request.setAttribute("birth", birth);
			return "member/FBinfoget";
		}
		
		// 페이스북 로그인 처리 
		@RequestMapping(value="/fblogin.do", method=RequestMethod.POST)
		public String fbLogin(@RequestParam("userid") String userid,
						@RequestParam("email") String email,
						@RequestParam("name") String name,
						@RequestParam("birth") String birth,
						Model model, HttpSession session,
						HttpServletRequest request){
			session = request.getSession();
			
			String psw ="00000000";
			String phone = "faceBook";
			String loc = "faceBook";
			String nick = "faceBook User";
			String user = memberService.idCheck(userid);
			String loc2 = "";
			
			if(user == null){
				memberService.joinMember(userid, name, psw, phone, email, loc, birth, nick, loc2);
				request.setAttribute("userid", userid);
				request.setAttribute("message", "faceBook Login Success");
				return "member/FBlogin";
			}else{
				request.setAttribute("userid", userid);
				return "member/FBuserlogin";
			}
		}
		
		@RequestMapping(value="fbpw.do", method=RequestMethod.GET)
		public String fbPassword(){
			return "member/FBlogin";
		}
		
		@RequestMapping(value="fbpw.do", method=RequestMethod.POST)
		public String fbPassword2(@RequestParam("userid") String userid,
						@RequestParam("psw") String psw,
						HttpSession session, HttpServletRequest request){
			session = request.getSession();
			memberService.changePassword(userid, psw);
			String user = memberService.selectById(userid).getUserid();
			
			if(user != null){
				session.setAttribute("loginUser", memberService.selectById(userid));
				return "redirect:index.do?fbuser=fbuser";
			}else{
				request.setAttribute("message", "FaceBooKLoginUserFail");
				request.setAttribute("userid", userid);
				return "member/FBlogin";
			}
			
			
		}
		
		@RequestMapping(value="/facebookpage.do",method=RequestMethod.GET)
		public String goFaceBookPage(){
			return "sub/comm/faceBookPage";
		}
		
		
		
		// 활동현황으로 이동
		@RequestMapping(value="myboard.do", method=RequestMethod.GET)
		public String MyActive(HttpServletRequest request, HttpSession session,Model model,
				@RequestParam("userid") String userid,
				@RequestParam("page") String page){
			
			int rowsPerPage = 10;
			int total_cnt = new Integer(memberService.mypageCount(userid));
			
			//전체페이지
			int total_pages = PageNumberingManager.getInstance().getTotalPage(total_cnt, rowsPerPage);
			model.addAttribute("t_pages",total_pages);
			
			model.addAttribute("page", page);
			model.addAttribute("c_page", Integer.parseInt((String) page));
			model.addAttribute("totalCnt", total_cnt );
			model.addAttribute("rs", memberService.myActive(userid, page));
			model.addAttribute("userid", userid);
			
			return"sub/mypage/myboard";
		}
		
		// 관리자모드 회원 활동현황으로 이동
				@RequestMapping(value="myboardAdmin.do", method=RequestMethod.GET)
				public String MyActiveAdmin(HttpServletRequest request, HttpSession session,Model model,
						@RequestParam("userid") String userid,
						@RequestParam("page") String page){
					
					int rowsPerPage = 10;
					int total_cnt = new Integer(memberService.mypageCount(userid));
					
					//전체페이지
					int total_pages = PageNumberingManager.getInstance().getTotalPage(total_cnt, rowsPerPage);
					model.addAttribute("t_pages",total_pages);
					
					model.addAttribute("page", page);
					model.addAttribute("c_page", Integer.parseInt((String) page));
					model.addAttribute("totalCnt", total_cnt );
					model.addAttribute("rs", memberService.myActive(userid, page));
					model.addAttribute("userid", userid);
					
					return"sub/mypage/admin_myboard";
				}
		
		
		// 스크랩하기
		@RequestMapping(value="/myclipInsert.do",method=RequestMethod.GET)
		public String insertMyClip(@RequestParam("idx") String idx,
				@RequestParam("userid") String userid,
				HttpServletRequest request){
			
			if(memberService.clipCheck(userid, idx) != null){
				request.setAttribute("distinct", "distinct");
				return "sub/news/news";
			}
			
			int idx1 = Integer.parseInt(idx);
			memberService.insertMyClip(userid, idx1);
			return "redirect:MyclipList.do?userid="+userid+"&page=1" ;
		}
		
		// 스크랩게시판으로 이동
		@RequestMapping(value="/MyclipList.do", method=RequestMethod.GET)
		public String goClipPage(@RequestParam("userid") String userid,
				Model model,
				@RequestParam("page") String page){
			int rowsPerPage = 10;
			int total_cnt = new Integer(memberService.myclipCount(userid));
			
			//전체페이지
			int total_pages = PageNumberingManager.getInstance().getTotalPage(total_cnt, rowsPerPage);
			model.addAttribute("t_pages",total_pages);
			
			model.addAttribute("page", page);
			model.addAttribute("c_page", Integer.parseInt((String) page));
			model.addAttribute("totalCnt", total_cnt );
			model.addAttribute("userid", userid);
			
			model.addAttribute("rs", memberService.goMyClip(userid, page));
			return "sub/mypage/myclip";
		}
		
		// 이용약관 팝업
		@RequestMapping(value="/agreement.do" , method=RequestMethod.GET)
		public String goAgreement(){
			return "member/agreement";
		}
		
		// 개인정보보호 팝업
		@RequestMapping(value="/personal.do", method=RequestMethod.GET)
		public String goPersonal(){
			return "member/personal";
		}
		
		// update member active
		@RequestMapping(value="/updateActive.do", method=RequestMethod.GET)
		public String updateMemberActive(@RequestParam("userid") String userid,
				@RequestParam("page") String page){
			memberService.updateMemberActive(userid);
			memberService.del_pri_delete(userid);
			return "redirect:adminmp2.do?userid="+userid+"&page="+page;
		}
		
		//update member active none
		@RequestMapping(value="/updateActiveNone.do", method=RequestMethod.GET)
		public String updateMemberActiveNone(@RequestParam("userid") String userid,
				@RequestParam("page") String page){
			memberService.updateMemberActiveNone(userid);
			memberService.del_pri(userid, "관리자원한으로 활동정지");
			return"redirect:adminmp2.do?userid="+userid+"&page="+page;
		}
		
		// member search
		@RequestMapping(value="/memberSearch.do", method=RequestMethod.POST)
		public String searchMembers(Model model,
				@RequestParam("key") String key,
				@RequestParam("con") String con,
				@RequestParam("page") String page){
			if(key.equals("userid")){
				String userid = "%"+con+"%"; 
				model.addAttribute("members",memberService.searchMembersById(userid, page) );
				
				int rowsPerPage = 10;
				int total_cnt = new Integer(memberService.searchMemberByIdCount(userid));
				
				int total_pages = PageNumberingManager.getInstance().getTotalPage(total_cnt, rowsPerPage);
				model.addAttribute("t_pages",total_pages);
				model.addAttribute("page", page);
				model.addAttribute("c_page", Integer.parseInt((String) page));
				model.addAttribute("totalCnt", total_cnt );				
				model.addAttribute("admin_search", "admin_search");
				return "sub/mypage/mypage_admin";
				
			}else if(key.equals("name")){
				String name = "%"+con+"%";
				model.addAttribute("members",memberService.searchMembersByName(name, page) );
				
				int rowsPerPage = 10;
				int total_cnt = new Integer(memberService.searchMemberByNameCount(name));
				
				int total_pages = PageNumberingManager.getInstance().getTotalPage(total_cnt, rowsPerPage);
				model.addAttribute("t_pages",total_pages);
				model.addAttribute("page", page);
				model.addAttribute("c_page", Integer.parseInt((String) page));
				model.addAttribute("totalCnt", total_cnt );	
				model.addAttribute("admin_search", "admin_search");	
				return "sub/mypage/mypage_admin";
				
			}else{
				return "redirect:index.do";
			}
		}
		
		// myboard search
		@RequestMapping(value="/searchMyboard.do", method=RequestMethod.POST)
		public String searchMyboard(@RequestParam("key") String key,
				@RequestParam("con") String con,
				@RequestParam("userid") String userid,
				@RequestParam("page") String page,
				Model model){
			
			
			if(key.equals("board")){
				model.addAttribute("rs", memberService.searchMyboard(userid));
				
				int rowsPerPage = 10;
				int total_cnt = new Integer(memberService.searchMyboardCount(userid));
				
				int total_pages = PageNumberingManager.getInstance().getTotalPage(total_cnt, rowsPerPage);
				model.addAttribute("t_pages",total_pages);
				model.addAttribute("page", page);
				model.addAttribute("c_page", Integer.parseInt((String) page));
				model.addAttribute("totalCnt", total_cnt );	
				return "sub/mypage/myboard";
			}else if(key.equals("cmt")){
				model.addAttribute("rs", memberService.searchMyboardCmt(userid));
				
				int rowsPerPage = 10;
				int total_cnt = new Integer(memberService.searchMyboardCmtCount(userid));
				
				int total_pages = PageNumberingManager.getInstance().getTotalPage(total_cnt, rowsPerPage);
				model.addAttribute("t_pages",total_pages);
				model.addAttribute("page", page);
				model.addAttribute("c_page", Integer.parseInt((String) page));
				model.addAttribute("totalCnt", total_cnt );	
				return "sub/mypage/myboard";
			}else{
				return "redirect:index.do";
			}
			
		}
		
		// myboard search from admin
		@RequestMapping(value="/searchMyboardAdmin.do", method=RequestMethod.POST)
		public String searchMyboardForAdmin(@RequestParam("key") String key,
				@RequestParam("con") String con,
				@RequestParam("userid") String userid,
				@RequestParam("page") String page,
				Model model){
			
			
			if(key.equals("board")){
				model.addAttribute("rs", memberService.searchMyboard(userid));
				
				int rowsPerPage = 10;
				int total_cnt = new Integer(memberService.searchMyboardCount(userid));
				
				int total_pages = PageNumberingManager.getInstance().getTotalPage(total_cnt, rowsPerPage);
				model.addAttribute("t_pages",total_pages);
				model.addAttribute("page", page);
				model.addAttribute("c_page", Integer.parseInt((String) page));
				model.addAttribute("totalCnt", total_cnt );	
				model.addAttribute("userid", userid);
				return "sub/mypage/admin_myboard";
			}else if(key.equals("cmt")){
				model.addAttribute("rs", memberService.searchMyboardCmt(userid));
				
				int rowsPerPage = 10;
				int total_cnt = new Integer(memberService.searchMyboardCmtCount(userid));
				
				int total_pages = PageNumberingManager.getInstance().getTotalPage(total_cnt, rowsPerPage);
				model.addAttribute("t_pages",total_pages);
				model.addAttribute("page", page);
				model.addAttribute("c_page", Integer.parseInt((String) page));
				model.addAttribute("totalCnt", total_cnt );	
				model.addAttribute("userid", userid);
				return "sub/mypage/admin_myboard";
			}else{
				return "redirect:index.do";
			}
			
		}
		
		// delete clip
		@RequestMapping(value="/deleteClip.do", method=RequestMethod.GET)
		public String deleteClip(@RequestParam("from_idx") String ono,
				@RequestParam("userid") String userid){
			memberService.deleteClip(ono);
			
			return "redirect:MyclipList.do?userid="+userid+"&page=1";
		}
}
