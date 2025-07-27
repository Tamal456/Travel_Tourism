<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:include page="NavClient.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Client Menu Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<style>
*{
  margin 0;
  padding; 0;
  user-select: none;
}
.main {
    font-family: serif;
    background-color: #d0f7f4;
    height: 100vh;
    padding: 20px;
    overflow: hidden;
    position: relative;
}

.header {
    text-align: center;
    margin-bottom: 20px; 
} 

.header h1 { 
    font-size: 2.5em; 
    color: #00796b; 
    margin: 0; 
} 

.header p { 
    font-size: 1.2em; 
    color: #004d40; 
    margin: 0;
}

.main-content {
    display: flex;
    align-items: center;
    justify-content: center;
    height: calc(100% - 80px); /* Adjust height to account for the header */
}

.swiper-container {
    width: 100%;
    height: 100%; /* Use remaining height */
}

.swiper-wrapper {
    display: flex;
    align-items: center;
    padding: 0;
    margin: 0;
    list-style: none;
}

.flip {
    width: 450px;
    height: 450px;
    perspective: 1000px;
    list-style: none;
    margin: auto; /* Center align the flip cards */
}

.flip .front,
.flip .back {
    cursor: pointer;
    width: 100%;
    height: 100%;
    border-radius: 25px;
    backface-visibility: hidden;
    position: absolute;
    top: 0;
    left: 0;
    transition: transform 0.5s ease, opacity 0.5s ease;
}

.flip .front {
    background-color: rgba(32, 178, 170, 0.2);
    box-shadow: rgba(0, 0, 0, 0.19) 0px 10px 20px, rgba(0, 0, 0, 0.23) 0px 6px 6px;
    border: 1px solid rgba(32, 178, 170, 0.3);
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
}

.flip .back {
    background-color: rgba(32, 178, 170, 0.4);
    box-shadow: rgba(0, 0, 0, 0.19) 0px 10px 20px, rgba(0, 0, 0, 0.23) 0px 6px 6px;
    border: 1px solid rgba(32, 178, 170, 0.3);
    opacity: 0;
    transform: rotateY(180deg);
    display: flex;
    justify-content: center;
    align-items: center;
    color: #fff;
}

.flip.clicked .front {
    transform: rotateY(180deg);
}

.flip.clicked .back {
    opacity: 1;
    transform: rotateY(0deg);
}
</style>
</head>
<body>
<div class="main">
    <div class="header"> 
        <h1>Welcome to Your Travel Adventure</h1> 
        <p>Explore the world's best destinations with us</p> 
    </div>
    <div class="main-content">
        <div class="swiper-container">
            <ul class="swiper-wrapper">
                <li class="swiper-slide flip" data-tour-name="Tour Name 1 - Lorem ipsum dolor sit amet" onclick="toggleFlip(this)">
                    <div class="front">
                        <img src="tour_image1.jpg" alt="Tour Image 1">
                    </div>
                    <div class="back">Loading...</div>
                </li>
                <li class="swiper-slide flip" data-tour-name="Tour Name 2 - Consectetur adipiscing elit" onclick="toggleFlip(this)">
                    <div class="front">
                        <img src="tour_image2.jpg" alt="Tour Image 2">
                    </div>
                    <div class="back">Loading...</div>
                </li>
                <li class="swiper-slide flip" data-tour-name="Tour Name 3 - Sed do eiusmod tempor incididunt" onclick="toggleFlip(this)">
                    <div class="front">
                        <img src="tour_image3.jpg" alt="Tour Image 3">
                    </div>
                    <div class="back">Loading...</div>
                </li>
                <li class="swiper-slide flip" data-tour-name="Tour Name 4 - Excepteur sint occaecat" onclick="toggleFlip(this)">
                    <div class="front">
                        <img src="tour_image4.jpg" alt="Tour Image 4">
                    </div>
                    <div class="back">Loading...</div>
                </li>
                <li class="swiper-slide flip" data-tour-name="Tour Name 5 - Cupidatat non proident" onclick="toggleFlip(this)">
                    <div class="front">
                        <img src="tour_image5.jpg" alt="Tour Image 5">
                    </div>
                    <div class="back">Loading...</div>
                </li>
            </ul>
            <div class="swiper-pagination"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script>
function toggleFlip(element) {
    element.classList.toggle('clicked');
    if (element.classList.contains('clicked')) {
        const imageSrc = element.querySelector('img').src.split('/').pop();
        
        const xhr = new XMLHttpRequest();
        xhr.open('POST', 'FetchTourDetails', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function() {
            if (xhr.status === 200) {
                element.querySelector('.back').innerHTML = xhr.responseText;
            }
        };
        xhr.send('image=' + imageSrc);
    }
}

new Swiper('.swiper-container', {
    loop: false,
    slidesPerView: 3,
    spaceBetween: 30,

    pagination: {
        el: '.swiper-pagination',
    },

    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    }
});
</script>
</body>
</html>
