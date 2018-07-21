package com.wesafer.go.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.wesafer.bean.CrimBean;
import com.wesafer.bean.LatlngBean;
import com.wesafer.bean.MemberBean;
import com.wesafer.go.service.GoService;

import chart.BarChartBean;

@Controller
public class GoController {

		@Autowired
		private GoService goService;
		
		@Autowired
		private BarChartBean bcb;
		
		// 지역별 분석통계 서울시통계로 이동
		@RequestMapping(value="/seoul.do",method=RequestMethod.GET)
		public String goT(HttpServletRequest request){
			String spic = goService.spic();
			request.setAttribute("spic", spic);
			return"sub/go/go_t";
		}
		
		// 지역별 분석통계 전국통계로 이동
		@RequestMapping(value="/wholestats.do",method=RequestMethod.GET)
		public String go(HttpServletRequest request){
			String spic = goService.WholeSpic();
			request.setAttribute("spic", spic);
			return"sub/go/go";
		}
		
		// 유형별 분석통계 그래프로 이동
		@RequestMapping(value="/typegra.do",method=RequestMethod.GET)
		public String goCo(){
			return"sub/go/go_co";
		}
		
		// 유형별 분석통계 표로 이동
		@RequestMapping(value="/typetable.do",method=RequestMethod.GET)
		public String goCot(Model model){
			model.addAttribute("stats", goService.yearStats());
			return"sub/go/go_cot";
		}
		
		// 글쓰기 페이지로 이동
		@RequestMapping(value="/gowrite.do",method=RequestMethod.GET)
		public String goWrite(){
			return"sub/go/go_board_write";
		}
		
		// 글쓰기  처리
		@RequestMapping(value="/gowrite.do",method=RequestMethod.POST)
		public String insertWrite(HttpServletRequest request) throws IOException{
			String path = "C:\\Users\\hkb\\workspace_spring\\WeSafer\\WebContent\\upload\\news";
			String encType="UTF-8";
			int sizeLimit = 8*1024*1024;
			MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, encType, new DefaultFileRenamePolicy());

			String cate =multi.getParameter("cate");
			String spic = multi.getFilesystemName("statspic");
			String cont = multi.getParameter("cont");
			
			goService.insertGo(cate, spic, cont);
			
			return"sub/go/go";
		}
		
		// 그래프 관련
		@RequestMapping(value="/gochart.do",method=RequestMethod.GET)
		public void goChart(HttpServletResponse response) throws Exception{
			ServletOutputStream sos = response.getOutputStream();

			JFreeChart chart = bcb.getBarChart();
			ChartUtilities.writeChartAsPNG(sos, chart, 700, 400);
		}
		
		
		
		// 내주변 검색으로 이동 
		@RequestMapping(value="/map.do", method=RequestMethod.GET)
		public String goMap(HttpServletRequest request, HttpSession session,
				@RequestParam(value="cate") String cate,
				@RequestParam(value="nouser", required=false) String nouser,
				@RequestParam(value="imlatlng", required=false) String imlatlng){
			StringBuffer buf = new StringBuffer();
			
			if(session.getAttribute("loginUser") != null){
				// 로그인 되어있을 때
				MemberBean memberBean = (MemberBean) session.getAttribute("loginUser");
				String userid = memberBean.getUserid();
				System.out.println("loginUser : " + userid);

				if(cate.equals("0")){
					ArrayList<LatlngBean> ltlnList = goService.getLatlng();
					Iterator<LatlngBean> ltlnItor = ltlnList.iterator();
					
					while(ltlnItor.hasNext()){
						LatlngBean bean = ltlnItor.next();

						buf.append("{");
						buf.append("content: '<div><div>").append(bean.getTitle()).append("</div></div>',");
						buf.append("latlng: new daum.maps.LatLng(").append(bean.getY()).append(", ").append(bean.getX()).append("),");
						buf.append("ourl:'").append(bean.getOurl()).append("'");
						buf.append("}");
			     		
						if(ltlnItor.hasNext()){
							buf.append(",");
						}
					}//while E
					
		     		request.setAttribute("positionString", buf.toString());
		     		
				}else{
					ArrayList<LatlngBean> ltlnList = goService.getCateLatlng(cate);
					Iterator<LatlngBean> ltlnItor = ltlnList.iterator();
					
					while(ltlnItor.hasNext()){
						LatlngBean bean = ltlnItor.next();

						buf.append("{");
						buf.append("content: '<div><div>").append(bean.getTitle()).append("</div></div>',");
						buf.append("latlng: new daum.maps.LatLng(").append(bean.getY()).append(", ").append(bean.getX()).append("),");
						buf.append("ourl:'").append(bean.getOurl()).append("'");
						buf.append("}");
			     		
						if(ltlnItor.hasNext()){
							buf.append(",");
						}
					}

		     		request.setAttribute("positionString", buf.toString());
				}
				
				
					String loc2 = goService.getMemberLoc2(userid);
					String lat = "";
					String lng = "";
		     		
					if(imlatlng != null){
						if(imlatlng.equals("금천구")){
							lat="37.463054";
							lng="126.901181";
							request.setAttribute("imlatlng", "금천구");
						}else if(imlatlng.equals("영등포구")){
							lat="37.526224";
							lng="126.896471";
							request.setAttribute("imlatlng", "영등포구");
						}else if(imlatlng.equals("동작구")){
							lat="37.501537";
							lng="126.952875";
							request.setAttribute("imlatlng", "동작구");
						}else if(imlatlng.equals("구로구")){
							lat="37.497058";
							lng="126.856153";
							request.setAttribute("imlatlng", "구로구");
						}else if(imlatlng.equals("관악구")){
							lat="37.478122";
							lng="126.933862";
							request.setAttribute("imlatlng", "관악구");
						}
						
					}else{
						lat = goService.getUserLatlngY(userid);
						lng = goService.getUserLatlngX(userid);
					}

					request.setAttribute("userLoc2", loc2);
					request.setAttribute("cate", "0");
					request.setAttribute("lat", lat);
					request.setAttribute("lng", lng);
					return "sub/go/map";
				
				
				
				// 로그인 되어있지 않을 때
			}else if(session.getAttribute("loginUser") == null){
				
				System.out.println("no login");
				
				if(cate.equals("0")){
					
					ArrayList<LatlngBean> ltlnList = goService.getLatlng();
					Iterator<LatlngBean> ltlnItor = ltlnList.iterator();
					
					while(ltlnItor.hasNext()){
						LatlngBean bean = ltlnItor.next();
						
						buf.append("{");
						buf.append("content: '<div><div>").append(bean.getTitle()).append("</div></div>',");
						buf.append("latlng: new daum.maps.LatLng(").append(bean.getY()).append(", ").append(bean.getX()).append("),");
						buf.append("ourl:'").append(bean.getOurl()).append("'");
						buf.append("}");
			     		
						if(ltlnItor.hasNext()){
							buf.append(",");
						}
					}//while E
					
					if(nouser != null){
						request.setAttribute("nouser", "nouser");
					}
		     		request.setAttribute("positionString", buf.toString());
					
				}else{
					
					ArrayList<LatlngBean> ltlnList = goService.getCateLatlng(cate);
					Iterator<LatlngBean> ltlnItor = ltlnList.iterator();
					
					while(ltlnItor.hasNext()){
						LatlngBean bean = ltlnItor.next();

						buf.append("{");
						buf.append("content: '<div><div>").append(bean.getTitle()).append("</div></div>',");
						buf.append("latlng: new daum.maps.LatLng(").append(bean.getY()).append(", ").append(bean.getX()).append("),");
						buf.append("ourl:'").append(bean.getOurl()).append("'");
						buf.append("}");
			     		
						if(ltlnItor.hasNext()){
							buf.append(",");
						}
					}//while E

		     		request.setAttribute("positionString", buf.toString());
					
				}
				
				String lat = "37.501126";
				String lng = "126.884608";
				
				if(imlatlng != null){
					if(imlatlng.equals("금천구")){
						lat="37.463054";
						lng="126.901181";
						request.setAttribute("imlatlng", "금천구");
					}else if(imlatlng.equals("영등포구")){
						lat="37.526224";
						lng="126.896471";
						request.setAttribute("imlatlng", "영등포구");
					}else if(imlatlng.equals("동작구")){
						lat="37.501537";
						lng="126.952875";
						request.setAttribute("imlatlng", "동작구");
					}else if(imlatlng.equals("구로구")){
						lat="37.497058";
						lng="126.856153";
						request.setAttribute("imlatlng", "구로구");
					}else if(imlatlng.equals("관악구")){
						lat="37.478122";
						lng="126.933862";
						request.setAttribute("imlatlng", "관악구");
					}
					
				}
				
				request.setAttribute("lat", lat);
				request.setAttribute("lng", lng);
				request.setAttribute("cate", "0");
				
			} // login session check if E
			
			
			return "sub/go/map";
		}
		
		
		// 지도검색 성범죄자보기 이동
		@RequestMapping(value="mapCrim.do", method=RequestMethod.GET)
		public String goMapCrim(HttpServletRequest request, HttpSession session){
			session = request.getSession();
			if(session.getAttribute("loginUser") == null && session.getAttribute("admin") == null){
				request.setAttribute("nouser", "nouser");
	     		return "redirect:map.do?cate=0&nouser=nouser";
			}
			
			StringBuffer buf = new StringBuffer();
			ArrayList<Iterator<CrimBean>> itorList = new ArrayList<Iterator<CrimBean>>();
			
			String loc2 = "구로동";
			ArrayList<CrimBean> ltlnList0 = goService.getCrim(loc2);
			
			String loc3 = "고척동";
			ArrayList<CrimBean> ltlnList1 = goService.getCrim(loc3);
			
			String loc4 = "궁동";
			ArrayList<CrimBean> ltlnList2 = goService.getCrim(loc4);
			
			String loc5 = "가리봉동";
			ArrayList<CrimBean> ltlnList3 = goService.getCrim(loc5);
			
			String loc6 = "개봉동";
			ArrayList<CrimBean> ltlnList4 = goService.getCrim(loc6);

			String loc7 = "신도림동";
			ArrayList<CrimBean> ltlnList5 = goService.getCrim(loc7);

			String loc8 = "신길동";
			ArrayList<CrimBean> ltlnList6 = goService.getCrim(loc8);
			
			itorList.add(ltlnList0.iterator());
			itorList.add(ltlnList1.iterator());
			itorList.add(ltlnList2.iterator());
			itorList.add(ltlnList3.iterator());
			itorList.add(ltlnList4.iterator());
			itorList.add(ltlnList5.iterator());
			itorList.add(ltlnList6.iterator());

			Iterator<Iterator<CrimBean>> ittt = itorList.iterator();
			
			while(ittt.hasNext()){
				Iterator<CrimBean> ttt = ittt.next();
				
				buf.append("{");
				buf.append("content:");
				buf.append("'<table>");
				buf.append("	<thead>");
				buf.append("		<tr>");
				buf.append("			<th>이름</th>");
				buf.append("			<th>범죄발생지역</th>");
				buf.append("			<th>범죄발생날짜</th>");
				buf.append("			<th>범죄내용</th>");
				buf.append("		</tr>");
				buf.append("	</thead>");
				buf.append("	<tbody>");
				
				while(ttt.hasNext()){
					CrimBean t = ttt.next();
					
					buf.append("		<tr>");
					buf.append("			<td>").append(t.getC_name()).append("</td>");
					buf.append("			<td>").append(t.getC_loc()).append("</td>");
					buf.append("			<td>").append(t.getC_date()).append("</td>");
					buf.append("			<td>").append(t.getCharge()).append("</td>");
					buf.append("		</tr>");
				}
				
				buf.append("	</tbody>");
				buf.append("</table>'");
				buf.append("}");
				
				if(ittt.hasNext()){
					buf.append(",");
				}
			}
			
			request.setAttribute("contentsString", buf.toString());
			request.setAttribute("cate", "6");
			return "sub/go/map";
		}
		
		
}
