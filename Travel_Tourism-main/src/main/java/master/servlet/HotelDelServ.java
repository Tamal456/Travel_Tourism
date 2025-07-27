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
 * Servlet implementation class FoodDelServ
 */
@WebServlet("/HotelDelServ")
public class HotelDelServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String hid=request.getParameter("hid");
		
		
		HotelDto hdto = new HotelDto();
		hdto.setHid(hid);
		
		
		
		HotelDao hdao=new HotelDao();
		hdao.deleteData(hdto);
		response.sendRedirect("NavAdmin.jsp");
		
	}

}
