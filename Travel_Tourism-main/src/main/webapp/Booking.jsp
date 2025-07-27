<%@page import="master.dao.BookingDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="NavClient.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style>
      .main{
    background-color: #d0f7f4; 
    font-family: serif; 
    display: flex; 
    justify-content: center; 
    align-items: center; 
    height: 100vh; 
    margin: 0; 
    } 
    .CardContainer { 
    width: 30%; 
    padding: 20px; 
    text-align: center;
    backdrop-filter: blur(10px); 
    background-color: rgba(32, 178, 170, 0.2); 
    box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px; 
    border: 1px solid rgba(32, 178, 170, 0.3); 
    border-radius: 25px;
     }
     .form-control {
      background: #d0f7f4;
       margin-bottom: 15px; 
       border-radius: 15px; 
       box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px; 
       }
       #input:focus{
          box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
       background-color: #d0f7f4;
       transform: translateY(-0.8rem);
       } 
      
       .form-control:focus{
       box-shadow: rgba(0, 0, 0, 0.2) 0px 12px 28px 0px, rgba(0, 0, 0, 0.1) 0px 2px 4px 0px, rgba(255, 255, 255, 0.05) 0px 0px 0px 1px inset;
         background-color: #d0f7f4;
       }
       a 
       { display: block;
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
         background-color: #d0f7f4; 
       box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
         } .btn:hover { 
         background-color: #20b2aa; 
         color: #fff; 
         border: 1px solid rgba(32, 178, 170, 0.3);
         box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px; 
         }
       .hidden-fields {
    display: none;
	}
		#tourDataContainer {
    		opacity: 0;
    		transition: opacity 1s ease-in-out; 
		}

		#tourDataContainer.show {
    		opacity: 1; 
		}
</style>
</head>
<body>
    <div class="main">
        <div class="CardContainer">
            <form action="BookingServ" method="post">
                <input type="text" class="form-control" placeholder="TOUR ID" name="tid" id="tid" onchange="fetchTourData()">
                <div id="tourDataContainer"></div>
                <div id="hiddenFields" class="hidden-fields">
                    <label for="roomtype">ROOM TYPE:</label>
                    <select class="form-control" name="room" id="roomtype">
                        <option value="">choose:</option>
                        <option value="NONE AC">NONE AC</option>
                        <option value="AC">AC</option>
                    </select>
                    <input type="text" class="form-control" placeholder="USER NAME" name="uname" id="">
                    <button class="btn " style="width: 40%;">ADD</button>
                </div>
            </form>
        </div>
    </div>
    <script>
    function fetchTourData() {
        const tidElement = document.getElementsByName('tid')[0];
        const tid = tidElement.value;
        const xhr = new XMLHttpRequest();
        const hiddenFields = document.getElementById('hiddenFields');
        const tourDataContainer = document.getElementById('tourDataContainer');

        xhr.open('POST', 'TourHotelServ', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            if (this.status === 200) {
                setTimeout(() => {
                    tourDataContainer.innerHTML = this.responseText;
                    tourDataContainer.classList.add('show');
                    hiddenFields.style.display='block';
                }, 500);
            }
        };
        xhr.send('tid=' + tid);
    }

    </script>
</body>
</html>
