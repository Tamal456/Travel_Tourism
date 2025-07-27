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
 * Servlet implementation class TourUpdServ
 */
@WebServlet("/TourUpdServ")
public class TourUpdServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String tid=request.getParameter("tid");
		String stdt=request.getParameter("stdt");
		double price=Double.parseDouble(request.getParameter("price"));
		TourDto tdto = new TourDto();
		
		tdto.setTid(tid);
		tdto.setStdt(stdt);
		tdto.setPrice(price);
		
		TourDao tdao=new TourDao();
		tdao.updateData(tdto);
		response.sendRedirect("TourUpd.jsp");
	}

}
