package com.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.swing.JOptionPane;

import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JasperViewer;

public class Reporte {
	private static JasperReport report;
	private static JasperPrint reportFilled;
	private static JasperViewer viewer;
	
	public static void createReport(String sessions, String country, String city, String browser, String sos, String finicio, String ffinal){
		try {
			ArrayList<String> aux = new ArrayList<String>();
			//for (int i = 1; i <= 1; i++) 
			//{ 
			    String p = "";
			    aux.add(p);
			//}
			
			 //File file;
			 //file = new File("C:\\Users\\AndresR\\JaspersoftWorkspace\\MyReports\\Cherry.jasper");
			 //report = (JasperReport) JRLoader.loadObject(file);
			//ArrayList<String> ALsos = new ArrayList<String>(Arrays.asList(sessions.split(",")));
			report = (JasperReport) JRLoader.loadObjectFromFile("C:\\Users\\AndresR\\JaspersoftWorkspace\\MyReports\\ReporteGA.jasper");
			Map<String, Object> parametros = new HashMap<String, Object>();
			parametros.put("FechaInicio", finicio);
			parametros.put("FechaFinal", ffinal);
			parametros.put("Sesiones", sessions);
			parametros.put("Paises", country);
			parametros.put("Ciudad", city);
			parametros.put("Navegador", browser);
			parametros.put("OS", sos);
			
			
			reportFilled = JasperFillManager.fillReport(report, parametros, new JRBeanCollectionDataSource(aux));//hay que crear el map <string, object> con los parametros
			//reportFilled = JasperFillManager.fillReport(report, parametros);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "Se desmadro en create report: " + e.getMessage());
			System.out.println("Se desmadro en create report: ");
			System.out.println(e.getMessage());
			System.out.println("Se desmadro en create report: ");
			
		}
		
	}
	
	public static void showViewer(){
		viewer = new JasperViewer(reportFilled);
		viewer.setVisible(true);
		
	}
	
	public static void exportToPDF(){
		try {
			//JRExporter exporter = new JRPdfExporter();
			//exporter.setParameter(JRExporterParameter.JASPER_PRINT, reportFilled);
			//exporter.setParameter(JRExporterParameter.OUTPUT_FILE,new java.io.File("C:\\Users\\AndresR\\JaspersoftWorkspace\\MyReports\\reportePDF.pdf"));
			//exporter.exportReport();
			JasperExportManager.exportReportToPdfFile(reportFilled, "C:\\Users\\AndresR\\Desktop\\a\\reporte.pdf");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Se desmadro en export to pdf: ");
			System.out.println(e.getMessage());
			System.out.println("Se desmadro en export to pdf: ");
		}
		
	}

}
