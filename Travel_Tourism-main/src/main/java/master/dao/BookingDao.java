package master.dao;

import java.sql.*;

import master.dto.BookingDto;
import master.utilities.ConnectionFactory;

public class BookingDao {
    private Connection cn = null;
    private Statement st = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    private String insert_sql="insert into bookings(tname,hotel1,hotel2,hotel3,room,uname,tid,stdt,price) values(?,?,?,?,?,?,?,?,?)";
    private String select_sql="select * from bookings";
    public void insertData(BookingDto bdto) {
        try {
            ConnectionFactory con = new ConnectionFactory();
            cn = con.getConn();
            ps = cn.prepareStatement(insert_sql);
            
            ps.setString(1, bdto.getTname());
            ps.setString(2, bdto.getHotel1());
            ps.setString(3, bdto.getHotel2());
            ps.setString(4, bdto.getHotel3());
            ps.setString(5, bdto.getRoom());
            ps.setString(6, bdto.getUname());
            ps.setString(7, bdto.getTid());
            ps.setString(8, bdto.getStdt());
            ps.setDouble(9, bdto.getPrice());
            ps.executeUpdate();
        } catch(SQLException se) {
            se.printStackTrace();
        }
    }

    public ResultSet bookingDetails(String uname) throws SQLException {
        try {
            ConnectionFactory con = new ConnectionFactory();
            cn = con.getConn();
            String sql = "SELECT * FROM bookings WHERE uname = ?";
            ps = cn.prepareStatement(sql);
            ps.setString(1, uname);
            rs = ps.executeQuery();
        } catch(SQLException se) {
            se.printStackTrace();
        }
        return rs;
    }
    public ResultSet bookingDetails() throws SQLException {
        try {
            ConnectionFactory con = new ConnectionFactory();
            cn = con.getConn();
            st=cn.createStatement();
            rs = st.executeQuery(select_sql);
        } catch(SQLException se) {
            se.printStackTrace();
        }
        return rs;
    }
  
        public void updateBookingStatus(String username) throws SQLException {
            try {
            	ConnectionFactory con = new ConnectionFactory();
                cn = con.getConn();
                String sql = "UPDATE bookings SET status = 'Booked' WHERE uname = ? AND status = 'pending..'";
                ps = cn.prepareStatement(sql);
                ps.setString(1, username);
                ps.executeUpdate();
            } finally {
                if (ps != null) {
                    ps.close();
                }
                if (cn != null) {
                    cn.close();
                }
            }
        }
    }


