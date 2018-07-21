package chart;

import java.awt.Color;
import java.awt.Font;
import java.util.ArrayList;
import java.util.Iterator;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.beans.factory.annotation.Autowired;

import com.wesafer.bean.StatsBean;
import com.wesafer.go.service.GoService;

public class BarChartBean {
	@Autowired
	private GoService goService;

//		public static void main(String arg[])throws Exception{
//		BarChartBean bcb = new BarChartBean();
//		JFreeChart chart = bcb.getBarChart();
//		ChartFrame frame1=new ChartFrame("Bar Chart",chart);
//		frame1.setSize(400,350);  
//		frame1.setVisible(true);
//	}

	public JFreeChart getBarChart() throws Exception {
		JFreeChart chart = null ;
	
		
		ArrayList<StatsBean> sList = goService.yearStatsGraph();
		Iterator<StatsBean> sItor = sList.iterator();
		
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		//dataset.setValue(Y축 값 바높이, "바 색상 마킹", "X축 마킹");

		
		while(sItor.hasNext()){
			StatsBean sVo = sItor.next();
			dataset.setValue(sVo.getCount(), String.valueOf(sVo.getYear()), sVo.getCrime());
		}
		
		 chart = ChartFactory.createBarChart	(
				"", "" ,"" , dataset, 
			PlotOrientation.VERTICAL, true,true, false);
		 
			

			chart.setBackgroundPaint(Color.white); // 테두리
			chart.getTitle().setPaint(Color.blue); 
			chart.getTitle().setFont(new Font("돋움", Font.BOLD, 25));
			// 범례
		//	chart.getLegend().setItemFont(new Font("돋움", Font.PLAIN, 20));
			CategoryPlot p = chart.getCategoryPlot();
			// 차트의 배경색 설정입니다.
			p.setBackgroundPaint(Color.white);
			// 차트의 배경 라인 색상입니다.
			p.setRangeGridlinePaint(Color.black);
		//	p.
			// X 축의 라벨 설정입니다. (보조 타이틀)
			p.getDomainAxis().setLabelFont(new Font("고딕체", Font.BOLD, 23));
			// X 축의 도메인 설정입니다.
			p.getDomainAxis().setTickLabelFont(new Font("고딕체", Font.BOLD, 18));
			// Y 축의 라벨 설정입니다. (보조 타이틀)
			p.getRangeAxis().setLabelFont(new Font("고딕체", Font.BOLD, 18));
			// Y 축의 도메인 설정입니다.
			p.getRangeAxis().setTickLabelFont(new Font("고딕체", Font.BOLD, 18));
			p.setRangeGridlinePaint(Color.lightGray); 
			
			/* if(p.getLegendItems() != null) {
				   Iterator<LegendItem> legendIter = p.getLegendItems().iterator();
				   LegendItem item = null;
				   
				   while(legendIter.hasNext()) {
				    item = legendIter.next();
				    item.setLabelFont(new Font("vadana", Font.PLAIN, 10));
				//    logger.debug("범례 폰트설정 --> (" + item.getLabel() + ")");
				   }
			 }*/
			return chart;
			
		}
	}