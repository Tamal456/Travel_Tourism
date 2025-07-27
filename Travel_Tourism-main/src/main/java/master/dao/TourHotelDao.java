package master.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import master.utilities.ConnectionFactory;

public class TourHotelDao {

    public ResultSet getTourPlaces(String tid) throws SQLException {
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String select_sql = "SELECT tplace1, tplace2, tplace3 FROM tour WHERE tid=?";

        ConnectionFactory con = new ConnectionFactory();
        cn = con.getConn();
        ps = cn.prepareStatement(select_sql);
        ps.setString(1, tid);
        rs = ps.executeQuery();

        return rs;
    }

    public ResultSet getHotels(String tplace) throws SQLException {
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String select_hotels_sql = "SELECT hname FROM hotel WHERE place=?";

        ConnectionFactory con = new ConnectionFactory();
        cn = con.getConn();
        ps = cn.prepareStatement(select_hotels_sql);
        ps.setString(1, tplace);
        rs = ps.executeQuery();

        return rs;
    }
}
