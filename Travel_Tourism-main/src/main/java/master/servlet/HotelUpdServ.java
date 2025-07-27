package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.dao.HotelDao;
import master.dto.HotelDto;


/**
 * Servlet implementation class FoodUpdServ
 */
@WebServlet("/HotelUpdServ")
public class HotelUpdServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String hid=request.getParameter("hid");
		String hname=request.getParameter("hname");
		String tplace=request.getParameter("tplace");
		
		HotelDto hdto = new HotelDto();
		hdto.setHid(hid);
		hdto.setHname(hname);
		hdto.setPlace(tplace);
		
		
		HotelDao hdao=new HotelDao();
		hdao.updateData(hdto);
		response.sendRedirect("NavAdmin.jsp");
		
	}

}
