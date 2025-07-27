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
 * Servlet implementation class TourDelServ
 */
@WebServlet("/TourDelServ")
public class TourDelServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String tid=request.getParameter("tid");
		
        TourDto tdto = new TourDto();
		
		tdto.setTid(tid);
		TourDao tdao=new TourDao();
		tdao.deleteData(tdto);
		response.sendRedirect("TourDel.jsp");
	}

}
