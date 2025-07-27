package master.dao;
import java.sql.*;

import master.dto.HotelDto;
import master.utilities.ConnectionFactory;
public class HotelDao {
	  private Connection cn = null;
	   private Statement st = null;
	   private PreparedStatement ps = null;
	   private ResultSet rs = null;
	   private String select_sql = "select * from hotel";
	   private String insert_sql = "insert into hotel values(?,?,?)";
	   private String delete_sql = "delete from hotel where hid=?";
	   private String update_sql = "update hotel set hname=?,place=? where hid=?";
	   
	   
	   
	//    public ResultSet getData() {
	// 	      try {
	// 	         ConnectionFactory con = new ConnectionFactory();
	// 	         this.cn = con.getConn();
	// 	         this.st = this.cn.createStatement();
	// 	         this.rs = this.st.executeQuery(this.select_sql);

		         
	// 	      } catch (SQLException var2) {
	// 	         var2.printStackTrace();
	// 	      }
	// 	      return rs;

	// 	   }
//	
	   public void insertData(HotelDto hdto) {
		      try {
		         ConnectionFactory con = new ConnectionFactory();
		         this.cn = con.getConn();
		         this.ps = this.cn.prepareStatement(this.insert_sql);
		         this.ps.setString(1, hdto.getHid());
		         this.ps.setString(2, hdto.getHname());
		         this.ps.setString(3, hdto.getPlace());
		         this.ps.executeUpdate();
		      } catch (SQLException var2) {
		         var2.printStackTrace();
		      }

		   }
	   public void deleteData(HotelDto hdto) {
		      try {
		         ConnectionFactory con = new ConnectionFactory();
		         this.cn = con.getConn();
		         this.ps = this.cn.prepareStatement(this.delete_sql);
		         this.ps.setString(1, hdto.getHid());
		         this.ps.executeUpdate();
		      } catch (SQLException var2) {
		         var2.printStackTrace();
		      }

		   }
	   public void updateData(HotelDto hdto) {
		      try {
		         ConnectionFactory con = new ConnectionFactory();
		         this.cn = con.getConn();
		         this.ps = this.cn.prepareStatement(this.update_sql);
		         this.ps.setString(3, hdto.getHid());
		         this.ps.setString(1, hdto.getHname());
		         this.ps.setString(2, hdto.getPlace());
		         this.ps.executeUpdate();
		      } catch (SQLException var2) {
		         var2.printStackTrace();
		      }

		   }
	  public ResultSet getDataById(String hid) {
	        try {
	        	 ConnectionFactory con = new ConnectionFactory();
		         this.cn = con.getConn();
	            PreparedStatement ps = cn.prepareStatement("SELECT * FROM hotel WHERE hid = ?");
	            ps.setString(1, hid);
	            rs = ps.executeQuery();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return rs;
	    }


}
