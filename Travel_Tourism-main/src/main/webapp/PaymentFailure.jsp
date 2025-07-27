<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Failed</title>
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
            color: #FF4C4C;
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
        .support {
            margin-top: 20px;
            font-size: 16px;
            color: #555;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Payment Failed</h1>
        <p>We are sorry, but your payment could not be processed at this time.</p>
        <p>Please try again later or choose a different payment method.</p>
        <a href="Payment.jsp" class="btn">Retry Payment</a>
        <div class="support">
            <p>If you continue facing issues, please <a href="contactUs.jsp">contact our support team</a>.</p>
        </div>
    </div>

</body>
</html>
