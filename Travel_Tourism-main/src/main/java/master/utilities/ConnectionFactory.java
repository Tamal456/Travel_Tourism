package master.utilities;
import java.sql.*;

public class ConnectionFactory {
   private  Connection cn = null;


   public  Connection getConn() {
      try {
         Class.forName("com.mysql.cj.jdbc.Driver");
         cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/travel_tourism", "root", "arkoroy");
         
      } catch (ClassNotFoundException var2) {
    	  
         var2.printStackTrace();
         
      } catch (SQLException var3) {
         var3.printStackTrace();
      }

      return cn;
   }
}