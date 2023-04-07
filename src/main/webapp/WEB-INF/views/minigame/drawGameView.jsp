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
	vertical-align: top;
}

body {
	background: none;
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
	background-color: #fff;
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
	pointer-events: none;
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
</style>

</head>
<body>
	<c:import url="/WEB-INF/views/common/menubar.jsp" />
	<br>

	<p align="center">
		<label for="Timer">남은 시간:</label> <input id="Timer" type="text"
			value="" readonly />
	</p>
	<script>
const Timer=document.getElementById('Timer'); //스코어 기록창-분
let time= 60000;
let min=1;
let sec=60;

Timer.value=min+":"+'00'; 

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
	alert("시간이 다 되었습니다. 다음 기회에 도전해주세요~~");
    clearInterval(playtime);
    earlyEndGame();
},60000);//1분이 되면 타이머를 삭제한다.
</script>

	<div class="wrap__card">
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
			</ul>
		</div>
	</div>
	<br>
	<center>
		<div id="dresult" style="width: 400px; height: 150px; border: 1px solid gray;"></div>
		<button id="result_b">결과보기</button>
		<button>상품 페이지로 이동</button>
	</center>
	<script>
        const cards = document.querySelectorAll(".cards li");

        let cardOne, cardTwo; // 선택한 카드
        let disableDeck = false;
        let answerCount = 0;

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
        
        function endCardGame(){
            alert("endCardGame start...");
        	
        	$('#result_b').on('click', function(){
            	$.ajax({
          			  url: "drawResult.do",
        			  type: "post",
        			  dataType: "json", 
        			  success: function(jsonData){
        				  console.log("jsonData : " + jsonData);
        				  
        				  $('#dresult').html("" + jsonData.product_name
        						      + "" + jsonData.product_image   
        					+ "" + jsonData.product_price
        				  );
        			  },
        			  error: function( request, status, errorData ){
          				console.log("error code : " + request.status
          						+ "\nMessage : " + request.reponseText
          						+ "\nError : " + errorData);
          			  }
                });
        		
            });
        }
        function earlyEndGame(){
        	alert("earlyEndGame start...");
        }
    </script>
	<br>
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>