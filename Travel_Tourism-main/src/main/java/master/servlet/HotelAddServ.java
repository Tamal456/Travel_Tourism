package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.dao.HotelDao;
import master.dao.TourDao;
import master.dto.HotelDto;
import master.dto.TourDto;


 /* Servlet implementation class FoodAddServ
 */
@WebServlet("/HotelAddServ")
 
public class HotelAddServ extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String hid=request.getParameter("hid");
		String hname=request.getParameter("hname");
		String place=request.getParameter("place");
		
		HotelDto hdto = new HotelDto();
		hdto.setHid(hid);
		hdto.setHname(hname);
		hdto.setPlace(place);
		
		
		HotelDao hdao=new HotelDao();
		hdao.insertData(hdto);
		response.sendRedirect("Hotel.jsp");
	}

}
