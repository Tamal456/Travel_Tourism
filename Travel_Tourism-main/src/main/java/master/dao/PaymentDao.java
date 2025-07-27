//package master.dao;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//import master.dto.PaymentDto;
//import master.utilities.ConnectionFactory;
//
//public class PaymentDao {
//    private Connection cn = null;
//    private PreparedStatement ps = null;
//    private ResultSet rs = null;
//    
//    // SQL Queries
//    private String insert_sql = "INSERT INTO payments (full_name, payment_method, amount, card_number, card_holder_name, expiry_date, cvv, bank_name) "
//                                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
//    
//    private String update_sql = "UPDATE payments SET full_name = ?, payment_method = ?, amount = ?, card_number = ?, card_holder_name = ?, "
//                                + "expiry_date = ?, cvv = ?, bank_name = ? WHERE payment_id = ?";
//    
//    private String select_sql = "SELECT * FROM payments WHERE payment_id = ?";
//    
//    private String delete_sql = "DELETE FROM payments WHERE payment_id = ?";
//
//    // Insert payment data
//    public void insertPayment(PaymentDto paymentDTO) {
//        try {
//            ConnectionFactory con = new ConnectionFactory();
//            cn = con.getConn();
//            ps = cn.prepareStatement(insert_sql);
//            
//            ps.setString(1, paymentDTO.getFullName());
//            ps.setString(2, paymentDTO.getPaymentMethod());
//            ps.setString(3, paymentDTO.getAmount());
//            ps.setString(4, paymentDTO.getCardNumber());
//            ps.setString(5, paymentDTO.getCardHolderName());
//            ps.setString(6, paymentDTO.getExpiryDate());
//            ps.setString(7, paymentDTO.getCvv());
//            ps.setString(8, paymentDTO.getBankName());
//            
//            ps.executeUpdate(); // Insert payment record into the database
//        } catch (SQLException se) {
//            se.printStackTrace();
//        } finally {
//            closeResources();
//        }
//    }
//
//    // Update payment data (e.g., for editing a payment record)
//    public void updatePayment(PaymentDto paymentDTO) {
//        try {
//            ConnectionFactory con = new ConnectionFactory();
//            cn = con.getConn();
//            ps = cn.prepareStatement(update_sql);
//            
//            ps.setString(1, paymentDTO.getFullName());
//            ps.setString(2, paymentDTO.getPaymentMethod());
//            ps.setString(3, paymentDTO.getAmount());
//            ps.setString(4, paymentDTO.getCardNumber());
//            ps.setString(5, paymentDTO.getCardHolderName());
//            ps.setString(6, paymentDTO.getExpiryDate());
//            ps.setString(7, paymentDTO.getCvv());
//            ps.setString(8, paymentDTO.getBankName());
//            ps.setString(9, paymentDTO.getPaymentId());
//            
//            ps.executeUpdate(); // Update payment record in the database
//        } catch (SQLException se) {
//            se.printStackTrace();
//        } finally {
//            closeResources();
//        }
//    }
//
//    // Select a payment record by payment ID
//    public ResultSet getPaymentById(String paymentId) {
//        try {
//            ConnectionFactory con = new ConnectionFactory();
//            cn = con.getConn();
//            ps = cn.prepareStatement(select_sql);
//            ps.setString(1, paymentId);
//            
//            rs = ps.executeQuery(); // Retrieve the payment record
//        } catch (SQLException se) {
//            se.printStackTrace();
//        }
//        return rs;
//    }
//
//    // Delete a payment record
//    public void deletePayment(String paymentId) {
//        try {
//            ConnectionFactory con = new ConnectionFactory();
//            cn = con.getConn();
//            ps = cn.prepareStatement(delete_sql);
//            ps.setString(1, paymentId);
//            
//            ps.executeUpdate(); // Delete the payment record from the database
//        } catch (SQLException se) {
//            se.printStackTrace();
//        } finally {
//            closeResources();
//        }
//    }
//
//    // Close resources (connection, statement, result set)
//    private void closeResources() {
//        try {
//            if (rs != null) rs.close();
//            if (ps != null) ps.close();
//            if (cn != null) cn.close();
//        } catch (SQLException se) {
//            se.printStackTrace();
//        }
//    }
//}

/* The above part is for emergency*/

package master.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import master.dto.PaymentDto;
import master.utilities.ConnectionFactory;

public class PaymentDao {

    private Connection cn;
    private PreparedStatement ps;

    private String insert_sql = "INSERT INTO payments (transaction_id, payment_method, amount, card_number, card_holder_name, expiry_date, cvv, upi_method, bank_name, payment_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    // Method to insert payment data into the database
    public void insertPayment(PaymentDto paymentDto) {
        try {
            ConnectionFactory con = new ConnectionFactory();
            cn = con.getConn();
            ps = cn.prepareStatement(insert_sql);
            ps.setString(1, paymentDto.getTransactionId());
            ps.setString(2, paymentDto.getPaymentMethod());
            ps.setDouble(3, paymentDto.getAmount());
            ps.setString(4, paymentDto.getCardNumber());
            ps.setString(5, paymentDto.getCardHolderName());
            ps.setString(6, paymentDto.getExpiryDate());
            ps.setString(7, paymentDto.getCvv());
            ps.setString(8, paymentDto.getUpiMethod());
            ps.setString(9, paymentDto.getBankName());
            ps.setString(10, paymentDto.getPaymentStatus());
            ps.executeUpdate();
        } catch (SQLException se) {
            se.printStackTrace();
        }
    }
}


