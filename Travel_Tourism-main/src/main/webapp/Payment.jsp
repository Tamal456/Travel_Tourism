<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script>
        function showPaymentForm(paymentOption) {
            document.getElementById('upiForm').style.display = 'none';
            document.getElementById('cardForm').style.display = 'none';
            document.getElementById('netBankingForm').style.display = 'none';
            document.getElementById('paymentOptions').style.display = 'none';
            if (paymentOption === 'upi') {
                document.getElementById('upiForm').style.display = 'block';
            } else if (paymentOption === 'card') {
                document.getElementById('cardForm').style.display = 'block';
            } else if (paymentOption === 'netBanking') {
                document.getElementById('netBankingForm').style.display = 'block';
            }

            document.querySelector("input[name='paymentOption']").value = paymentOption;
        }

        function backToOptions() {
            document.getElementById('paymentOptions').style.display = 'block';
            document.getElementById('upiForm').style.display = 'none';
            document.getElementById('cardForm').style.display = 'none';
            document.getElementById('netBankingForm').style.display = 'none';
        }
    </script>
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
        .payment-container {
            width: 90%;
            max-width: 800px;
            max-height: 90%;
            padding: 20px;
            text-align: center;
            overflow-y: auto;
            backdrop-filter: blur(10px);
            background-color: rgba(32, 178, 170, 0.2);
            box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px;
            border: 1px solid rgba(32, 178, 170, 0.3);
            border-radius: 25px;
        }
        h1 {
            color: #333;
        }
        .payment-options, .form-group, .amount-section, .back-button, form {
            margin-bottom: 20px;
        }
        .payment-options {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }
        .payment-method {
            padding: 20px;
            border: 2px solid #ddd;
           background-color: rgba(32, 178, 170, 0.2);
   		 	border: 1px solid rgba(32, 178, 170, 0.3);
   		 	border-radius: 15px;
    		padding: 10px;
    		box-shadow: rgba(17, 12, 46, 0.15) 0px 48px 100px 0px;
            cursor: pointer;
            text-align: center;
            margin: 10px;
            flex: 1 1 calc(33% - 20px);
        }
        
        .payment-method:hover {
            background-color: rgba(32, 178, 170, 0.2);
            box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
        }
        .payment-method img {
            width: 50px;
            margin-bottom: 10px;
        }
        .amount-section {
    		margin-bottom: 20px;
		}

		.amount-display {
    		font-size: 24px;
    		font-weight: bold;
    		color: #333;
    		background-color: rgba(32, 178, 170, 0.2);
   		 	border: 1px solid rgba(32, 178, 170, 0.3);
   		 	border-radius: 15px;
    		padding: 10px;
    		box-shadow: rgba(17, 12, 46, 0.15) 0px 48px 100px 0px;
    		text-align: center;
		}

        .form-control {
            background-color: #d0f7f4;
            margin-bottom: 15px;
            border-radius: 15px;
            box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
        }
        #input:focus {
            box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
            background-color: #d0f7f4;
            transform: translateY(-0.8rem);
        }
        .form-control:focus {
            box-shadow: rgba(0, 0, 0, 0.2) 0px 12px 28px 0px, rgba(0, 0, 0, 0.1) 0px 2px 4px 0px, rgba(255, 255, 255, 0.05) 0px 0px 0px 1px inset;
            background-color: #d0f7f4;
        }
        .btn {
            border-radius: 15px;
            outline-color: green;
            background-color:rgba(32, 178, 170, 0.2);
            box-shadow: rgba(17, 12, 46, 0.15) 0px 48px 100px 0px;
        }
        .btn:hover {
            background-color: #20b2aa;
            color: #fff;
            border: 1px solid rgba(32, 178, 170, 0.3);
            box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
            transition: box-shadow 0.6s ease-in-out;
         }
        .form-group input[type="radio"] {
            margin-right: 10px;
            transform: scale(1.2);
        }
    </style>
</head>
<body>

<div class="payment-container">
    <h1>Payment Process</h1>
   		 <div class="amount-section">
   				 <h3>Amount to Pay</h3>
    		<div class="amount-display">
        		<span>₹<%= request.getParameter("amount") %></span>
    		</div>
		</div>
    <div id="paymentOptions">
        <h2>Select Payment Method</h2>
        <div class="payment-options">
            <div class="payment-method" onclick="showPaymentForm('upi')">
                <img src="https://iconape.com/wp-content/png_logo_vector/unified-payment-interface-upi-logo.png" alt="Google Pay">
                <p>UPI Payment</p>
            </div>
            <div class="payment-method" onclick="showPaymentForm('card')">
                <img src="https://www.kindpng.com/picc/m/13-130306_credit-card-debit-card-computer-icons-credit-card.png" alt="Card Payment">
                <p>Card Payment</p>
            </div>
            <div class="payment-method" onclick="showPaymentForm('netBanking')">
                <img src="https://c8.alamy.com/comp/2H1XCR1/online-banking-icon-monochrome-sign-from-banking-operations-collection-creative-online-banking-icon-illustration-for-web-design-infographics-and-2H1XCR1.jpg" alt="Net Banking">
                <p>Net Banking</p>
            </div>
        </div>
    </div>

    <div id="upiForm" style="display:none;">
        <h2>Choose UPI Payment Method</h2>
        <div class="form-group">
            <label><input type="radio" name="upiMethod" value="gpay"> Google Pay</label><br>
            <label><input type="radio" name="upiMethod" value="phonepe"> PhonePe</label><br>
        </div>
        <div class="back-button">
            <button class="btn" type="button" onclick="backToOptions()">Back</button>
        </div>
    </div>

    <div id="cardForm" style="display:none;">
        <h2>Enter Card Details</h2>
        <div class="form-group">
            <label for="cardNumber">Card Number</label>
            <input class="form-control" type="text" id="cardNumber" name="cardNumber" required placeholder="Enter your card number" maxlength="16" pattern="\d{16}" required><br>
        </div>

        <div class="form-group">
            <label for="cardHolderName">Cardholder Name</label>
            <input class="form-control" type="text" id="cardHolderName" name="cardHolderName" required placeholder="Enter your cardholder name" required><br>
        </div>

        <div class="form-group">
            <label for="expiryDate">Expiration Date</label>
            <input class="form-control" type="month" id="expiryDate" name="expiryDate" required><br>
        </div>

        <div class="form-group">
            <label for="cvv">CVV</label>
            <input class="form-control" type="text" id="cvv" name="cvv" required placeholder="Enter CVV" maxlength="3" pattern="\d{3}" required><br>
        </div>

        <div class="back-button">
            <button class="btn" type="button" onclick="backToOptions()">Back</button>
        </div>
    </div>

    <div id="netBankingForm" style="display:none;">
        <h2>Select Your Bank</h2>
        <select  class="form-control" id="bankSelect" name="bank">
            <option value="icici">ICICI Bank</option>
            <option value="hdfc">HDFC Bank</option>
            <option value="axis">Axis Bank</option>
            <option value="sbi">State Bank of India (SBI)</option>
            <option value="kotak">Kotak Mahindra</option>
            <option value="yes">Yes Bank</option>
        </select><br>
        <div class="back-button">
            <button class="btn" type="button" onclick="backToOptions()">Back</button>
        </div>
    </div>

    <form action="PaymentServ" method="POST" style="margin-top: 30px;">
        <input type="hidden" name="paymentOption" value="">
        <input type="hidden" name="amount" value="100.00">
        <button class="btn proceed" type="submit">Proceed to Payment</button>
    </form>
</div>

</body>
</html>
