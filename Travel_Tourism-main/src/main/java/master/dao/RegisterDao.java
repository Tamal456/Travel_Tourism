package master.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import master.dto.RegisterDto;
import master.utilities.ConnectionFactory;

public class RegisterDao {
	 private Connection cn = null;
	   private Statement st = null;
	   private PreparedStatement ps = null;
	   private ResultSet rs = null;
	   //private String select_sql = "select * from food";
	   private String insert_sql="insert into register values(?,?,?,?,?)";
	   
	   //private String delete_sql = "delete from food where fid=?";
	   //private String update_sql = "update food set fname=?,fprice=? where fid=?";
	   
	   
	   
//	   public ResultSet getData() {
//		      try {
//		         ConnectionFactory con = new ConnectionFactory();
//		         this.cn = con.getConn();
//		         this.st = this.cn.createStatement();
//		         this.rs = this.st.executeQuery(this.select_sql);
//
//		         
//		      } catch (SQLException var2) {
//		         var2.printStackTrace();
//		      }
//		      return rs;
//
//		   }
//	
	   public void insertData(RegisterDto rdto) {
		      try {
		         ConnectionFactory con = new ConnectionFactory();
		         this.cn = con.getConn();
		         ps = this.cn.prepareStatement(insert_sql);
		         ps.setString(1, rdto.getUname());
		         ps.setString(2, rdto.getEmail());
		         ps.setString(3, rdto.getPass());
		         ps.setString(4, rdto.getNm());
		         ps.setString(5, rdto.getPhno());
		         ps.executeUpdate();
		      } 
		      catch (SQLException var2) 
		      {
		         var2.printStackTrace();
		      }

		   }
	   
	   public boolean checkLogin(String uname,String pass)
		{
			boolean flag=false;
			String sql="select * from register where uname='"+uname+"' and password='"+pass+"'";
			try
			{
				ConnectionFactory con=new ConnectionFactory();
				cn=con.getConn();
			    st=cn.createStatement();
			    rs=st.executeQuery(sql);
			    if(rs.next())
			    {
			    	flag=true;
			    }
			 	
			}
			
			catch(SQLException se)
			{
				se.printStackTrace();
			}
			
			return flag;
		}
}
