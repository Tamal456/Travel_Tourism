<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Menu Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

<style>
body {
    font-family: 'Roboto', sans-serif;
     overflow: hidden;
}

.mainContainer {
    backdrop-filter: blur(10px);
    background-color: #00796b; 
    box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
    border: 1px solid #00796b; 
    background-color: #00796b;
    display: flex;
    justify-content: space-between;
    padding: 10px;
    height: 10vh;
}

.leftContainer h2 {
    color: #e0ffff; 
    margin: 0;
    
}
.leftContainer {
	cursor: pointer;
    width: 20%;
    margin-left: 30px;
    display: flex;
    justify-content: center;
    align-items: center;
   border-radius: 20px;
   box-shadow: rgba(14, 30, 37, 0.12) 0px 2px 4px 0px, rgba(14, 30, 37, 0.32) 0px 2px 16px 0px;
}
.rightContainer {
    width: 70%;
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.rightContainer a {
    color: #e0ffff; 
    text-decoration: none;
    margin: 0 10px;
    padding: 5px 10px;
    border-radius: 5px;
    transition: background-color 0.3s ease-in-out;
    box-shadow: rgba(17, 12, 46, 0.15) 0px 48px 100px 0px;
   border-radius: 15px;
}

.rightContainer a:hover {
    background-color: #00796b;
    box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
    transition: box-shadow 0.6s ease;
    color: #e0ffff;
    text-decoration: blink;
}

.rightContainer a.active {
    background-color:#00796b;
    color: #343a40;
    box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
    }
</style>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const links = document.querySelectorAll('.rightContainer a');
        
        function setActiveLink() {
            const currentPage = window.location.pathname.split('/').pop();
            links.forEach(link => {
                link.classList.remove('active');
                if (link.getAttribute('href') === currentPage) {
                    link.classList.add('active');
                }
            });
        }

        setActiveLink();

        links.forEach(link => {
            link.addEventListener('click', function(e) {
                links.forEach(link => link.classList.remove('active'));
                e.target.classList.add('active');
            });
        });
    });
    document.addEventListener("DOMContentLoaded", function() {
        const leftContainer = document.querySelector('.leftContainer');
        
        if (leftContainer) {
            leftContainer.addEventListener('click', function() {
                window.location.href = 'HomeAdmin.jsp';
            });
        }
    });
</script>
</head>
<body>
<nav class="mainContainer">
    <div class="leftContainer">
        <h2>ADMIN-MENU</h2>
    </div>
    <div class="rightContainer">
        <a href="Tour.jsp">ADD TOUR</a>
        <a href="TourDel.jsp">DELETE TOUR</a>
        <a href="TourUpd.jsp">UPDATE TOUR</a>
        <a href="Hotel.jsp">ADD HOTEL</a>
        <a href="HotelUpd.jsp">UPDATE HOTEL</a>
        <a href="HotelDel.jsp">DELETE HOTEL</a>
        <a href="Bookings.jsp">BOOKINGS</a>
    </div>
</nav>
</body>
</html>
