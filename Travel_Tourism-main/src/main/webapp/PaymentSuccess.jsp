<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Successful</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #d0f7f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            text-align: center;
            max-width: 600px;
            padding: 30px;
            background-color: rgba(32, 178, 170, 0.2);
            box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px;
            border-radius: 25px;
            backdrop-filter: blur(10px);
        }
        h1 {
            color: #4CAF50;
            font-size: 36px;
        }
        p {
            color: #333;
            font-size: 18px;
        }
        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 15px 25px;
            background-color: #20b2aa;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            outline-color: green;
            box-shadow: rgba(17, 12, 46, 0.15) 0px 48px 100px 0px;
        }
        .btn:hover {
            background-color: #20b2aa;
            color: #fff;
            border: 1px solid rgba(32, 178, 170, 0.3);
            box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
            transition: box-shadow 0.6s ease-in-out;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Payment Successful!</h1>
        <p>Thank you for your payment. Your transaction has been successfully processed.</p>
        <p>Transaction ID: <strong><%= request.getAttribute("transactionID") %></strong></p>
        <p>You will receive a confirmation email shortly.</p>
        <a href="#" onClick="window.close()" class="btn">Go Back to Home</a>
    </div>

</body>
</html>
