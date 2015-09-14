package com.test;

import java.io.File;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.swing.JOptionPane;

import com.liferay.util.mail.MailEngine;
import com.liferay.util.mail.MailEngineException;
import com.liferay.portal.kernel.mail.MailMessage;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;


/**
 * Portlet implementation class Analytics
 */
public class Analytics extends MVCPortlet {
	/*
	private JasperReport report;
	private JasperPrint reportFilled;
	private JasperViewer viewer;
	
	public void createReport(String path){
		try {
			report = (JasperReport) JRLoader.loadObjectFromFile("C:\\Users\\AndresR\\JaspersoftWorkspace\\MyReports\\Cherry.jrxml");
			reportFilled = JasperFillManager.fillReport(report, null);//hay que crear el map <string, object> con los parametros
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "Se desmadro en create report: " + e.getMessage());
		}
		
	}
	
	public void showViewer(){
		viewer = new JasperViewer(reportFilled);
		viewer.setVisible(true);
		
	}
	
	public void exportToPDF(String destination){
		try {
			JasperExportManager.exportReportToPdfFile(reportFilled, destination);
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "Se desmadro en create report: " + e.getMessage());
		}
		
	}*/
	
	
	
	
	/*public static void main(String[] args) {
        
		
		
		/*try 
        {
            FileOutputStream fileStream;     
 
            // create an API client instance
            Client client = new Client("username", "1234");

            // convert a web page and save the PDF to a file
            fileStream = new FileOutputStream("example.pdf");
            client.convertURI("https://www.google.com/?gws_rd=ssl", fileStream);
            fileStream.close();

            // convert an HTML string and store the PDF into a byte array
            ByteArrayOutputStream memStream  = new ByteArrayOutputStream();
            String html = "<html><body>In-memory HTML.</body></html>";
            client.convertHtml(html, memStream);

            // convert an HTML file
            fileStream = new FileOutputStream("file.pdf");
            client.convertFile("/path/to/local/file.html", fileStream);
            fileStream.close();

            // retrieve the number of tokens in your account
            Integer ntokens = client.numTokens();
        }
        catch(PdfcrowdError why) {
            System.err.println(why.getMessage());
        }
        catch(IOException exc) {
            // handle the exception
        }*/
		
		
	public String darFormato(String arg){
		
		String[] aux=arg.split(",");
		String res="";
		for(int i=0; i<aux.length-1; i=i+2){
			res=res+aux[i]+": "+aux[i+1]+"\n";
		}
		return res;
	}	
		
	public void addAnalytic(ActionRequest actionRequest, ActionResponse actionResponse){
		String email = ParamUtil.getString(actionRequest, "txtemail");
		System.out.println(email);
		//Date prueba = ParamUtil.getd
		String finicio = ParamUtil.getString(actionRequest, "finicio");
		String ffinal = ParamUtil.getString(actionRequest, "ffinal");
		String sessions = ParamUtil.getString(actionRequest, "sessions");
		String country = ParamUtil.getString(actionRequest, "country");
		String city = ParamUtil.getString(actionRequest, "city");
		String browser = ParamUtil.getString(actionRequest, "browser");
		String sos = ParamUtil.getString(actionRequest, "sos");
		System.out.println("sesiones"+ sessions);
		
		Reporte.createReport(sessions, darFormato(country), darFormato(city), darFormato(browser),darFormato(sos),finicio,ffinal);
		//Reporte.showViewer();
		Reporte.exportToPDF();
		
		
			//String id = ParamUtil.getString(actionRequest, "id");
		 try {
			//String email= ParamUtil.getString(actionRequest, "txtemail");
			//System.out.print(email);
			File adjunto = new  File("C:\\Users\\AndresR\\Desktop\\a\\reporte.pdf");	
			InternetAddress from;
			InternetAddress to;
			//Reporte r = new Reporte();
			//Reporte.createReport();
			
			
			from = new InternetAddress("arodriguez@imagineercx.com");
			to = new InternetAddress(email);
			MailMessage mensaje= new MailMessage(from,to, "subjecasdasdasdat", "mi primer email",true);
			mensaje.addFileAttachment(adjunto);
			//MailEngine.send(mensaje);
		
		 
		 } catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "se desmadro en el primer catch: "+e.getMessage());
		}
			//MailMessage mensaje2= new MailMessage
		/*catch (MailEngineException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "se desmadro en el segundo catch: "+e.getMessage());
		}	*/
			//actionRequest.setAttribute(arg0, arg1);
			//actionResponse.setRenderParameter("mvcPath", PathJSPDisplay);
	}
	//}
}

