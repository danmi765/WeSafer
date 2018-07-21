<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<div class="info_tablnb info_tablnb_h">
	<ul>
		<li id="rape">		<a href="info_list.do?part1=info&part2=rape&page=1">성범죄</a></li>
		<li id="rabber">	<a href="info_list.do?part1=info&part2=robber&page=1">강도/절도</a></li>
		<li id="violence">	<a href="info_list.do?part1=info&part2=violence&page=1">학교폭력</a></li>
		<li id="drug">		<a href="info_list.do?part1=info&part2=drug&page=1">약물</a></li>
		<li id="murder">	<a href="info_list.do?part1=info&part2=murder&page=1">살인</a></li>
	</ul>
</div>

 <%if(request.getAttribute("a").equals("drug")){ %>
 	<script>
   		$("#drug>a").css({"background-color":"#5b5b58","color":"#fff","font-weight":"bold"});
   	</script>
 <%}else if(request.getAttribute("a").equals("rape")){%>
	 <script>
		$("#rape>a").css({"background-color":"#5b5b58","color":"#fff","font-weight":"bold"});
	</script>
 <%}else if(request.getAttribute("a").equals("robber")){%>
	 <script>
		$("#rabber>a").css({"background-color":"#5b5b58","color":"#fff","font-weight":"bold"});
	</script>
 <%}else if(request.getAttribute("a").equals("violence")){%>
	 <script>
		$("#violence>a").css({"background-color":"#5b5b58","color":"#fff","font-weight":"bold"});
	</script>
 <%}else if(request.getAttribute("a").equals("murder")){%>
	 <script>
		$("#murder>a").css({"background-color":"#5b5b58","color":"#fff","font-weight":"bold"});
	</script>
 <%}%>

