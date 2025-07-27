package master.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import master.dto.TourDto;
import master.utilities.ConnectionFactory;

public class TourDao {
	 private Connection cn = null;
	   private Statement st = null;
	   private PreparedStatement ps = null;
	   private ResultSet rs = null;
	   private String select_sql = "SELECT tname , stdt , price FROM tour WHERE tid = ?";
	   private String insert_sql="insert into tour values(?,?,?,?,?,?,?)";
	  // private String billing_sql ="select o.oid,o.odt,f.fid,f.fname,o.oqty,f.fprice,o.oqty*f.fprice totalprice from food f,order_details o where f.fid=o.fid";
	   private String delete_sql = "delete from tour where tid=?";
	   private String update_sql = "update tour set stdt=?,price=? where tid=?";
	   
	   
	   public void insertData(TourDto tdto)
		{
			try
			{
				ConnectionFactory con = new ConnectionFactory();
				cn=con.getConn();
				ps=cn.prepareStatement(insert_sql);
				
				ps.setString(1,tdto.getTid());
				ps.setString(2,tdto.getTname());
				ps.setString(3,tdto.getTplace1());
				ps.setString(4,tdto.getTplace2());
				ps.setString(5,tdto.getTplace3());
				ps.setString(6,tdto.getStdt());
				ps.setDouble(7,tdto.getPrice());
				ps.executeUpdate();//Insert Data
			}
			
			catch(SQLException se)
			{
				se.printStackTrace();
			}
		}
		
		public void deleteData(TourDto tdto)
		{
			try
			{
				ConnectionFactory con = new ConnectionFactory();
				cn=con.getConn();
				ps=cn.prepareStatement(delete_sql);
				
				ps.setString(1,tdto.getTid());
				ps.executeUpdate();
			}
			
			catch(SQLException se)
			{
				se.printStackTrace();
			}
		}
		
//		public ResultSet getData()
//		{
//			try
//			{
//				ConnectionFactory con = new ConnectionFactory();
//				cn=con.getConn();
//				st=cn.createStatement();
//				rs=st.executeQuery(select_sql);
//			}
//			
//			catch(SQLException se)
//			{
//				se.printStackTrace();
//			}
//			return rs;
//		}
//		
		public void updateData(TourDto tdto)
		{
			try
			{
				ConnectionFactory con = new ConnectionFactory();
				cn=con.getConn();
				ps=cn.prepareStatement(update_sql);
				
				ps.setString(3,tdto.getTid());
				ps.setString(1,tdto.getStdt());
				ps.setDouble(2,tdto.getPrice());
				ps.executeUpdate();
			}
			
			catch(SQLException se)
			{
				se.printStackTrace();
			}
		}
		
		public ResultSet searchData(String tid) throws SQLException {
		    try {
		        ConnectionFactory con = new ConnectionFactory();
		        cn = con.getConn();
		        ps = cn.prepareStatement(select_sql);
		        ps.setString(1, tid);
		        rs = ps.executeQuery();
		    } catch (SQLException e) {
		        e.printStackTrace();
		        return null;
		    }
		    
		    return rs;
		}



}
