<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="master.dao.BookingDao" %>
<%@ page import="master.dto.BookingDto" %>
<jsp:include page="NavClient.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        .main {
            background-color: #d0f7f4;
            font-family: serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            flex-direction: column;
        }
        .register-Container {
            width: 80%;
            padding: 20px;
            text-align: center;
            backdrop-filter: blur(10px);
            background-color: rgba(32, 178, 170, 0.2);
            box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px;
            border: 1px solid rgba(32, 178, 170, 0.3);
            border-radius: 25px;
        }
        a {
            display: block;
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            color: #0056b3;
        }
        .btn {
            border-radius: 15px;
            outline-color: green;
            background-color: rgba(32, 178, 170, 0.2);
            box-shadow: rgba(17, 12, 46, 0.15) 0px 48px 100px 0px;
            margin-left: auto;
            margin-top: 20px;
        }
        .btn:hover {
            background-color: #20b2aa;
            color: #fff;
            border: 1px solid rgba(32, 178, 170, 0.3);
            box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
            transition: box-shadow 0.6s ease-in-out;
        }
        table {
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: rgba(32, 178, 170, 0.5);
        }
        tr:hover {
            background-color: #d0f7f4;
        }
    </style>
    <script type="text/javascript">
        function proceedToPay(price) {
            window.open("Payment.jsp?amount=" + price, "_blank", "width=800,height=600");
        }
    </script>
</head>
<body>
<div class="main">
    <div class="register-Container">
        <h1>Your Booking Details</h1>
        <%
            String uname = (String) session.getAttribute("username");

            if (uname == null) {
                response.sendRedirect("login.jsp");
            } else {
                BookingDao bdao = new BookingDao();
                ResultSet rs = null;
                boolean showButton = false;
                double price = 0;
                try {
                    rs = bdao.bookingDetails(uname);
                    if (rs != null) {
        %>
        <table class="table">
            <tr>
                <th>Booking ID</th>
                <th>Tour ID</th>
                <th>Tour Name</th>
                <th>Hotel 1</th>
                <th>Hotel 2</th>
                <th>Hotel 3</th>
                <th>Room</th>
                <th>Start Date</th>
                <th>Price</th>
                <th>Status</th>
            </tr>
            <%
                while (rs.next()) {
                    String status = rs.getString("status");
                    if ("pending..".equals(status)) {
                        showButton = true;
                        price = rs.getDouble("price");
                    }
            %>
            <tr>
                <td><%= rs.getString("bid") %></td>
                <td><%= rs.getString("tid") %></td>
                <td><%= rs.getString("tname") %></td>
                <td><%= rs.getString("hotel1") %></td>
                <td><%= rs.getString("hotel2") %></td>
                <td><%= rs.getString("hotel3") %></td>
                <td><%= rs.getString("room") %></td>
                <td><%= rs.getString("stdt") %></td>
                <td><%= rs.getDouble("price") %></td>
                <td><%= status %></td>
            </tr>
            <%
                }
            %>
        </table>
        <%  
                    } else {
                        out.println("No bookings found for the logged-in user.");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                if (showButton) {
        %>
        <button type="button" class="btn" onclick="proceedToPay(<%= price %>)">Proceed to Pay</button>
        <%
                }
            }
        %>
    </div>
</div>
</body>
</html>
