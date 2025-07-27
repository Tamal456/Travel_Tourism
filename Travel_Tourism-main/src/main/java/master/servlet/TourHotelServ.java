package master.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.dao.TourHotelDao;

@WebServlet("/TourHotelServ")
public class TourHotelServ extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String tid = request.getParameter("tid");

        TourHotelDao dao = new TourHotelDao();
        ResultSet rs = null;
        ResultSet rsHotel = null;

        try {
            rs = dao.getTourPlaces(tid);

            if (rs.next()) {
                for (int i = 1; i <= 3; i++) {
                    String tplace = rs.getString("tplace" + i);
                    out.println("<label for='tplace" + i + "'> Hotels in " + tplace + ":</label>");
                    out.println("<select class='form-control' name='hotel" + i + "' id='tplace" + i + "'>");
                    out.println("<option value=''>choose: </option>");

                    rsHotel = dao.getHotels(tplace);
                    while (rsHotel.next()) {
                        out.println("<option value='" + rsHotel.getString("hname") + "'>" + rsHotel.getString("hname") + "</option>");
                    }
                    out.println("</select>");
                }
            } else {
                out.println("<p>No data found for the given tid.</p>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (rsHotel != null) rsHotel.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
