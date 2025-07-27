package master.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.dao.BookingDao;
import master.dao.TourDao;
import master.dto.BookingDto;
import master.dto.TourDto;

/**
 * Servlet implementation class BookingServ
 */
@WebServlet("/BookingServ")
public class BookingServ extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String tid = request.getParameter("tid");
        String hotel1 = request.getParameter("hotel1");
        String hotel2 = request.getParameter("hotel2");
        String hotel3 = request.getParameter("hotel3");
        String room = request.getParameter("room");
        String uname = request.getParameter("uname");

        BookingDto bdto = new BookingDto();
        TourDao tdao = new TourDao();
        ResultSet rs = null;
        try {
            rs = tdao.searchData(tid);
            if (rs != null && rs.next()) {
            	bdto.setTname(rs.getString("tname"));
                bdto.setTid(tid); // Ensure this is not null
                bdto.setStdt(rs.getString("stdt"));
                double price =rs.getDouble("price");
                bdto.setPrice(price);
            } else {
                System.out.println("No data found for the given tid");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
        bdto.setRoom(room);
        bdto.setUname(uname);
        bdto.setHotel1(hotel1);
        bdto.setHotel2(hotel2);
        bdto.setHotel3(hotel3);

        BookingDao bdao = new BookingDao();
        bdao.insertData(bdto);
        response.sendRedirect("BookingDetails.jsp");
    }
}



