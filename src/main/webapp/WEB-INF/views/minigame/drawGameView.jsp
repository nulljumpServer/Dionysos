<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DrawGame</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Hahmlet&display=swap');

@font-face{
 src:url("../fonts/Hahmlet-VariableFont_wght.woff");
 font-family : "Hahmlet";
}

* {
font-family: 'Hahmlet', serif;
}

#topBtn {
	position: fixed;
	right: 25px;
	bottom: 25px;
	display: none;
	z-index: 9;
}
</style>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

ul {
	list-style: none;
}

img {
	width: 100%;
    vertical-align: center; 
}

.wrap__card {
	display: flex;
	
	align-items: center;
	justify-content: center;
	height: 100vh;
}

.card__inner {
	width: 700px;
	height: 700px;
	border-radius: 20px;
	padding: 30px;
	
}

.cards {
   
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
	align-content: space-around;
	width: 100%;
	height: 100%;
}

.cards li {
	width: calc(100%/ 4 - 20px);
	height: calc(100%/ 4 - 20px);
	border: 1px solid #ccc;
	perspective: 1000px;
	transform-style: preserve-3d;
	position: relative;
}

.cards li .view {
	position: absolute;
	background: rgba(0, 0, 255, 0.2);
	padding: 10%;
	transition: transform 0.7s linear;
	backface-visibility: hidden;
	width: 100%;
	height: 100%;
	user-select: none;
	pointer-events: none;\
}

.cards li .view.front {
	z-index: 10;
	transform: rotateY(0deg);
}

.cards li .view.back {
	transform: rotateY(180deg);
}

.cards li.flip .view.front {
	transform: rotateY(-180deg);
}

.cards li.flip .view.back {
	transform: rotateY(0deg);
}

.cards li.shake {
	animation: shake 0.5s ease-in-out;
}

@
keyframes shake { 0% {
	transform: translateX(0);
}
20
%
{
transform
:
translateX(
-13px
);
}
40
%
{
transform
:
translateX(
13px
);
}
60
%
{
transform
:
translateX(
-8px
);
}
80
%
{
transform
:
translateX(
8px
);
}
100
%
{
transform
:
translateX(
0
);
}
}

#dresult {
  margin-top: 30px;
  padding: 20px;
  border: 2px solid pink;
  width: 500px;
  height: 350px;
  text-align: center;
  background-color: white;
}
</style>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
<script>
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 200) {
				$('#topBtn').fadeIn();
			} else {
				$('#topBtn').fadeOut();
			}
		});
		$("#topBtn").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 300);
			return false;
		});
	});
</script>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/animate.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/magnific-popup.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">

<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/users/style.css">
</head>
<body>
	<div class="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-6 d-flex align-items-center">
					<div class="top-total-sch main-sch-section">
						<form action="psearch.do" class="input-box">
						<input type="hidden" name="action" value="product_name">
						
						<div class="search">
                            <input class="put" type="search" size="20" name="keyword" placeholder="상품검색">
						</div>
						
						</form>
					</div>
				</div>
				<div class="col-md-6 d-flex justify-content-md-end">
					<div class="social-media mr-4"></div>
					<div class="reg">
						<p class="mb-0">

							<c:if test="${empty loginUsers}">
								<a
									href="${pageContext.servletContext.contextPath}/enrollPage.do"
									class="mr-2">Sign Up</a>
								<a href="${pageContext.servletContext.contextPath}/loginPage.do">Log
									In</a>
							</c:if>
							<c:if test="${!empty loginUsers}">
		        	 		${loginUsers.name}님 &nbsp;
		        	 		<a
									href="${pageContext.servletContext.contextPath}/logout.do">Log
									out</a>
		        	 		&nbsp;
		        	 		<c:url var="callMyInfo" value="/myinfo.do">
									<c:param name="user_id" value="${loginUsers.user_id}"></c:param>
								</c:url>
								<a href="${callMyInfo}">My Page</a>
							</c:if>

						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 비로그인 상태 -->
	<c:if test="${empty loginUsers}">
		<nav
			class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
			id="ftco-navbar">
			<div class="container">
				<a class="navbar-brand" href="main.do">Dionysos <span>store</span></a>


				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#ftco-nav" aria-controls="ftco-nav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="oi oi-menu"></span> Menu
				</button>



				<div class="collapse navbar-collapse" id="ftco-nav">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a href="main.do"
							class="nav-link">Home</a></li>
						<li class="nav-item"><a href="wdlist.do" class="nav-link">와인사전</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="plistView.do" id="dropdown04"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">상품</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item" href="plistView.do">전체상품 목록</a> <a
									class="dropdown-item" href="advsearch.do">상품 필터링 검색</a>
							</div></li>
						<li class="nav-item"><a href="minigame.do" class="nav-link">미니게임</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown04"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">고객센터</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item"
									href="${pageContext.servletContext.contextPath}/nplist.do">공지사항</a>
								<a class="dropdown-item"
									href="${pageContext.servletContext.contextPath}/flist.do">자주하는
									질문</a> <a class="dropdown-item"
									href="${pageContext.servletContext.contextPath}/qlist.do">1:1
									문의</a>
							</div></li>
					</ul>
				</div>
			</div>
		</nav>
	</c:if>
	<!-- 로그인(일반 유저) -->
	<c:if test="${!empty loginUsers}">
		<nav
			class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
			id="ftco-navbar">
			<div class="container">
				<a class="navbar-brand" href="main.do">Dionysos <span>store</span></a>


				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#ftco-nav" aria-controls="ftco-nav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="oi oi-menu"></span> Menu
				</button>

				<div class="collapse navbar-collapse" id="ftco-nav">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a href="main.do"
							class="nav-link">Home</a></li>
						<li class="nav-item"><a href="wdlist.do" class="nav-link">와인사전</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown04"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">상품</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item" href="plistView.do">전체상품 목록</a> <a
									class="dropdown-item" href="advsearch.do">상품 필터링 검색</a>
							</div></li>
						<li class="nav-item"><a href="minigame.do" class="nav-link">미니게임</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown04"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">고객센터</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item"
									href="${pageContext.servletContext.contextPath}/nplist.do">공지사항</a>
								<a class="dropdown-item"
									href="${pageContext.servletContext.contextPath}/flist.do">자주하는
									질문</a> <a class="dropdown-item"
									href="${pageContext.servletContext.contextPath}/qlist.do">1:1
									문의</a>
							</div></li>
					</ul>
				</div>
			</div>
		</nav>
	</c:if>

	<div class="hero-wrap"
		style="background-image: url('resources/images/users/bg_5.jpg');">
		<div class="overlay"></div>
		
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-8 ftco-animate d-flex align-items-end">
					<div class="text w-100 text-center">
						<h1 class="mb-4">
							Dionysos <span>Wine</span> Shop<span>
						</h1>
					</div>
				</div>
			</div>
		</div>


	<script
		src="${pageContext.servletContext.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/popper.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/jquery.stellar.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/scrollax.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/js/main.js"></script>
	
	<br>
	<p align="center">
		<label for="Timer">남은 시간 : </label> <input id="Timer" type="text"
			value="" readonly />
	</p>
	<br><br><br><br><br>
	<div class="wrap__card" >
		<div class="card__inner">
			<ul class="cards" id="card">
				<li>
					<div class="view front">
						<img src="resources/images/game/gameWine_1.png"
							alt="gameWine_1.png">
					</div>
					<div class="view back">
						<img src="resources/images/game/gameWine_2.png"
							alt="gameWine_2.png">
					</div>
				</li>
				<li>
					<div class="view front">
						<img src="resources/images/game/gameWine_1.png"
							alt="gameWine_1.png">
					</div>
					<div class="view back">
						<img src="resources/images/game/gameWine_12.png"
							alt="gameWine_12.png">
					</div>
				</li>
				<li>
					<div class="view front">
						<img src="resources/images/game/gameWine_1.png"
							alt="gameWine_1.png">
					</div>
					<div class="view back">
						<img src="resources/images/game/gameWine_14.png"
							alt="gameWine_14.png">
					</div>
				</li>
				<li>
					<div class="view front">
						<img src="resources/images/game/gameWine_1.png"
							alt="gameWine_1.png">
					</div>
					<div class="view back">
						<img src="resources/images/game/gameWine_4.png"
							alt="gameWine_4.png">
					</div>
				</li>
				<br>
				<li>
					<div class="view front">
						<img src="resources/images/game/gameWine_1.png"
							alt="gameWine_1.png">
					</div>
					<div class="view back">
						<img src="resources/images/game/gameWine_6.png"
							alt="gameWine_6.png">
					</div>
				</li>
				<li>
					<div class="view front">
						<img src="resources/images/game/gameWine_1.png"
							alt="gameWine_1.png">
					</div>
					<div class="view back">
						<img src="resources/images/game/gameWine_6.png"
							alt="gameWine_6.png">
					</div>
				</li>
				<li>
					<div class="view front">
						<img src="resources/images/game/gameWine_1.png"
							alt="gameWine_1.png">
					</div>
					<div class="view back">
						<img src="resources/images/game/gameWine_8.png"
							alt="gameWine_8.png">
					</div>
				</li>
				<li>
					<div class="view front">
						<img src="resources/images/game/gameWine_1.png"
							alt="gameWine_1.png">
					</div>
					<div class="view back">
						<img src="resources/images/game/gameWine_18.png"
							alt="gameWine_18.png">
					</div>
				</li>
				<br>
				<li>
					<div class="view front">
						<img src="resources/images/game/gameWine_1.png"
							alt="gameWine_1.png">
					</div>
					<div class="view back">
						<img src="resources/images/game/gameWine_12.png"
							alt="gameWine_12.png">
					</div>
				</li>
				<li>
					<div class="view front">
						<img src="resources/images/game/gameWine_1.png"
							alt="gameWine_1.png">
					</div>
					<div class="view back">
						<img src="resources/images/game/gameWine_2.png"
							alt="gameWine_2.png">
					</div>
				</li>
				<li>
					<div class="view front">
						<img src="resources/images/game/gameWine_1.png"
							alt="gameWine_1.png">
					</div>
					<div class="view back">
						<img src="resources/images/game/gameWine_4.png"
							alt="gameWine_4.png">
					</div>
				</li>
				<li>
					<div class="view front">
						<img src="resources/images/game/gameWine_1.png"
							alt="gameWine_1.png">
					</div>
					<div class="view back">
						<img src="resources/images/game/gameWine_14.png"
							alt="gameWine_14.png">
					</div>
				</li>
				<br>
				<li>
					<div class="view front">
						<img src="resources/images/game/gameWine_1.png"
							alt="gameWine_1.png">
					</div>
					<div class="view back">
						<img src="resources/images/game/gameWine_16.png"
							alt="gameWine_16.png">
					</div>
				</li>
				<li>
					<div class="view front">
						<img src="resources/images/game/gameWine_1.png"
							alt="gameWine_1.png">
					</div>
					<div class="view back">
						<img src="resources/images/game/gameWine_8.png"
							alt="gameWine_8.png">
					</div>
				</li>
				<li>
					<div class="view front">
						<img src="resources/images/game/gameWine_1.png"
							alt="gameWine_1.png">
					</div>
					<div class="view back">
						<img src="resources/images/game/gameWine_18.png"
							alt="gameWine_18.png">
					</div>
				</li>
				<li>
					<div class="view front">
						<img src="resources/images/game/gameWine_1.png"
							alt="gameWine_1.png">
					</div>
					<div class="view back">
						<img src="resources/images/game/gameWine_16.png"
							alt="gameWine_16.png">
					</div>
				</li>
				<br>
	<center>
	    <br>
	    <button class="btn btn-primary py-2 px-4" id="result_b">결과보기</button> 
	    &nbsp; &nbsp; &nbsp; &nbsp;
		<button class="btn btn-primary py-2 px-4" onclick="moveSalePage()">상품 페이지로 이동</button>
	    <div id="dresult"></div>

	</center>
	<script>
	var rproduct_id;
	
	const Timer=document.getElementById('Timer'); //스코어 기록창-분
	let time= 60000;
	let min=1;
	let sec=60;
	
	const cards = document.querySelectorAll(".cards li");

    let cardOne, cardTwo; // 선택한 카드
    let disableDeck = false;
    let answerCount = 0;

	Timer.value=min+":"+'00'; 
	
	function moveSalePage() {
		location.href= "pdiscount.do?product_id=" + rproduct_id;	
	}

	function TIMER(){
		playtime=setInterval(function(){
	        time=time-1000; //1초씩 줄어듦
	        min=time/(60*1000); //초를 분으로 나눠준다.

	       if(sec>0){ //sec=60 에서 1씩 빼서 출력해준다.
	          sec=sec-1;
	          Timer.value=Math.floor(min)+':'+sec; //소숫점 아래를 버리고 출력
	       }
	       if(sec===0){
	          //0이 되면 바로 sec을 60으로 돌려주고 0을 출력함
	          sec=60;
	          Timer.value=Math.floor(min)+':'+'00'
	       }     
	    },1000); //1초마다 
	}

	TIMER();

	setTimeout(function(){
		if(Timer.value=='0:00'){
		alert("시간이 다 되었습니다. 다음 기회에 도전해주세요~~");
	    clearInterval(playtime);
	    timeoutEndGame();
	    }
	},60000); //1분이 되면 게임을 종료한다.

        function flipCard(e) {
            let clickedCard = e.target;

            if(clickedCard !== cardOne && !disableDeck){ 
                clickedCard.classList.add("flip");

                if(!cardOne){
                    return cardOne = clickedCard
                }
                cardTwo = clickedCard;
                disableDeck = true;

                let cardOneImg = cardOne.querySelector(".back img").src;
                let cardTwoImg = cardTwo.querySelector(".back img").src;

                matchCards(cardOneImg, cardTwoImg);
            }
        }
        //두개의 이미지 비교하기
        function matchCards(cardOneImg, cardTwoImg){
            if(cardOneImg == cardTwoImg){
            	answerCount++; //정답 시 카운트 증가
                cardOne.removeEventListener("click", flipCard);
                cardTwo.removeEventListener("click", flipCard);
                cardOne = cardTwo = "";
                console.log("answerCount : " + answerCount);
                if(answerCount == 8){
            		endCardGame();
            	}
                return disableDeck = false;
            }else{
                //틀린 이미지 애니메이션 효과 주기
                setTimeout(() => {
                    cardOne.classList.add("shake");
                    cardTwo.classList.add("shake");
                }, 400);

                setTimeout(() => {
                    cardOne.classList.remove("shake", "flip");
                    cardTwo.classList.remove("shake", "flip");
                    cardOne = cardTwo = "";
                    return disableDeck = false;
                }, 1200);
            }
        }

        cards.forEach(card => {
            card.addEventListener("click", flipCard);
        });
        
        function randomResult() {
        	return parseInt(Math.random() * 10) + 201;
        }
        
        function endCardGame(){
            alert("endCardGame");
            clearInterval(playtime);
            rproduct_id = randomResult();
        	
        	$('#result_b').on('click', function(){
        		
            	$.ajax({ 
          			  url: "drawResult.do",
        			  data: { product_id: rproduct_id },
        			  type: "post",
        			  dataType: "json",
        			  success: function(jsonData){
        				  console.log("jsonData : " + jsonData);
        				  $('#dresult').html( "상품명 : " + decodeURIComponent(jsonData.product_name).replace(/\+/gi, ' ') + "<br>"
        						         + "가격 : " + jsonData.product_price / 8 * 10 + "(원) <br>"
        						         + "할인된 가격 : " + jsonData.product_price + "(원)" + "<br>"
        						         +"<img style=width:200px height:200px src=." + decodeURIComponent(jsonData.product_image).replace(/\+/gi, ' ') + ">"
        						         + "<br> 당도 <img style=width:40px height:40px src=resources/images/graph_" + jsonData.sweetness + ".png>"
        							     + "&nbsp; 산도 <img style=width:40px height:40px src=resources/images/graph_" + jsonData.acidity + ".png>"
        								 + "&nbsp; 바디 <img style=width:40px height:40px src=resources/images/graph_"+ jsonData.body + ".png>"
        							     + "&nbsp; 탄닌 <img style=width:40px height:40px src=resources/images/graph_" + jsonData.tannin + ".png>");
        				  
        			  },
        			  error: function( request, status, errorData ){
          				console.log("error code : " + request.status
          						+ "\nMessage : " + request.reponseText
          						+ "\nError : " + errorData);
          			  }
                });
        		
            });
        }
        function timeoutEndGame(){
        	alert("Timeout End...");
        	$('#dresult').html("<br>다시 도전해 주세요~~~");
        	return disableDeck = true;
        }
    </script>
    
	<br>
	<%-- <c:import url="/WEB-INF/views/common/footer.jsp" /> --%>
</body>
</html>