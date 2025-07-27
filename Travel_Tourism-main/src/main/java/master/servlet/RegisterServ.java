package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.dao.RegisterDao;
import master.dto.RegisterDto;

/**
 * Servlet implementation class RegisterServ
 */
@WebServlet("/RegisterServ")
public class RegisterServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String uname=request.getParameter("uname");
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		String nm=request.getParameter("nm");
		String phno=request.getParameter("phno");
		
		RegisterDto rdto = new RegisterDto();
		rdto.setUname(uname);
		rdto.setEmail(email);
		rdto.setPass(pass);
		rdto.setNm(nm);
		rdto.setPhno(phno);
		
		
		
		RegisterDao rdau=new RegisterDao();
		rdau.insertData(rdto);
		response.sendRedirect("Login.jsp");
	}
  }

