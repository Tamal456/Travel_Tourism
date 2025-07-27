package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.dao.TourDao;
import master.dto.TourDto;

/**
 * Servlet implementation class TourServ
 */
@WebServlet("/TourServ")
public class TourServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String tid=request.getParameter("tid");
		String tname=request.getParameter("tname");
		String tplace1=request.getParameter("tplace1");
		String tplace2=request.getParameter("tplace2");
		String tplace3=request.getParameter("tplace3");
		String stdt=request.getParameter("stdt");
		double price=Double.parseDouble(request.getParameter("price"));
		TourDto tdto = new TourDto();
		
		tdto.setTid(tid);
		tdto.setTname(tname);
		tdto.setTplace1(tplace1);
		tdto.setTplace2(tplace2);
		tdto.setTplace3(tplace3);
		tdto.setStdt(stdt);
		tdto.setPrice(price);
		
		TourDao tdao=new TourDao();
		tdao.insertData(tdto);
		response.sendRedirect("Tour.jsp");

	}

}
