package master.servlet;

import java.io.IOException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import master.dao.PaymentDao;
import master.dao.BookingDao;
import master.dto.PaymentDto;
import java.sql.SQLException;

@WebServlet("/PaymentServ")
public class PaymentServ extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentMethod = request.getParameter("paymentOption");
        String amount = request.getParameter("amount");
        String transactionID = UUID.randomUUID().toString().replace("-", "").substring(0, 10).toUpperCase();
        String username = (String) request.getSession().getAttribute("username"); // Assuming username is stored in session
        String cardNumber = request.getParameter("cardNumber");
        String cardHolderName = request.getParameter("cardHolderName");
        String expiryDate = request.getParameter("expiryDate");
        String cvv = request.getParameter("cvv");
        String upiMethod = request.getParameter("upiMethod");
        String bankName = request.getParameter("bank");

        PaymentDto paymentDto = new PaymentDto();
        paymentDto.setTransactionId(transactionID);
        paymentDto.setPaymentMethod(paymentMethod);
        paymentDto.setAmount(Double.parseDouble(amount));

        if ("card".equals(paymentMethod)) {
            paymentDto.setCardNumber(cardNumber);
            paymentDto.setCardHolderName(cardHolderName);
            paymentDto.setExpiryDate(expiryDate);
            paymentDto.setCvv(cvv);
        } else if ("upi".equals(paymentMethod)) {
            paymentDto.setUpiMethod(upiMethod);
        } else if ("netBanking".equals(paymentMethod)) {
            paymentDto.setBankName(bankName);
        }

        boolean isPaymentSuccessful = simulatePaymentProcessing();

        PaymentDao paymentDao = new PaymentDao();
        BookingDao bdao = new BookingDao();
        if (isPaymentSuccessful) {
            paymentDto.setPaymentStatus("Success");
            paymentDao.insertPayment(paymentDto);

            try {
                bdao.updateBookingStatus(username);
            } catch (SQLException e) {
                e.printStackTrace();
            }

            request.setAttribute("transactionID", transactionID);
            request.getRequestDispatcher("PaymentSuccess.jsp").forward(request, response);
        } else {
            paymentDto.setPaymentStatus("Failure");
            paymentDao.insertPayment(paymentDto);
            response.sendRedirect("PaymentFailure.jsp");
        }
    }

    private boolean simulatePaymentProcessing() {
        return Math.random() <= 0.7;
    }
}
