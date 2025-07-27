package master.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import master.dao.RegisterDao;

/**
 * Servlet implementation class LoginServ
 */
@WebServlet("/LoginServ")
public class LoginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String uname=request.getParameter("uname");
		String pass=request.getParameter("pass");
		PrintWriter out = response.getWriter();
		RegisterDao rdau = new RegisterDao();
		boolean flag=rdau.checkLogin(uname, pass);
		if(pass.equals("admin") && uname.equals("admin"))
		{
			response.sendRedirect("HomeAdmin.jsp");
		}
		else
		{
			if(flag==true)
			{
			        HttpSession session = request.getSession();
			        session.setAttribute("username", uname);

				
				response.sendRedirect("HomeClient.jsp");

				    
				    } else {
				        response.sendRedirect("login.jsp?error=invalidCredentials");
				    }
				}

			}
		}
