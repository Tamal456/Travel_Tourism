package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.dao.TourHotelDao;
import master.dto.TourHotelDto;

/**
 * Servlet implementation class TourHotel
 */
@WebServlet("/TourHotel")
public class TourHotel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String tid=request.getParameter("tid");
		String hid=request.getParameter("hid");
		TourHotelDto thdto = new TourHotelDto();
		thdto.setTid(tid);
		thdto.setHid(hid);
		TourHotelDao thdao = new TourHotelDao();
		//thdao.insertData(thdto);
		response.sendRedirect("TourHotel.jsp");
	}

}
