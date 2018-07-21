<%@ page contentType="image/jpeg"%>
<%@ page import="org.jfree.chart.*"%>
<%@ page import="chart.*"%>
<% 
//reset to out  on jsp --> servlet :
out.clear();
pageContext.pushBody();

// 
    ServletOutputStream sos = response.getOutputStream();
	BarChartBean bcb = new BarChartBean();
	JFreeChart chart = bcb.getBarChart();
	ChartUtilities.writeChartAsPNG(sos, chart, 700, 400);
%>