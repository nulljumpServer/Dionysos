<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>룰렛 게임</title>
<meta charset="utf-8">
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js">
var $j363 = jQuery.noConflict();
</script>
<script type="text/javascript" src="resources/js/jquery-1.11.3.min.js"></script>
<script>
var $j1113 = jQuery.noConflict();
</script>
<script type="text/javascript" src="resources/js/jQueryRotateCompressed.js"></script>
<style>
#image{
  margin:50px 50px;z-index:10;
}
#n_id{position:absolute;left:50%;top:860px;z-index:20;}
</style>

<style type="text/css">
.result_box { 
  border:1px solid; 
  padding:50px; 
  display: block; /* 박스를 보이게 함 */
  margin: 0 auto; /* 가운데 정렬 */
  width: 95%; /* 박스 너비 조정 */
  text-align: center; /* 내용 가운데 정렬 */
}

#description_box {
  margin-top: 50px;
  padding: 20px;
  border: 1px solid black;
  width: 50%;
  text-align: center;
  background-color: #F0F0F0;
}
</style>
</head> 
<body>

<c:import url="/WEB-INF/views/common/menubar.jsp" />
<br>
<center>
<img src="resources/images/roulette.png" id="image">
<img src="resources/images/niddle.png" id="n_id">
<br>
<form action="selectRoulette.do" method="post">
<input type='button' value='START' id='start_btn'></input>
</form>
<script>
window.onload = function(){
	var pArr = ["0","1","2","3","4","5","6","7","8","9"];

	$j1113('#start_btn').click(function(){
		rotation();
	});

	function rotation(){
		$j1113("#image").rotate({
		  angle:0,
		  animateTo:360 * 5 + randomize(0, 360),
		  center: ["50%", "50%"],
		  easing: $j1113.easing.easeInOutElastic,
		  callback: function(){ 
						var n = $j1113(this).getRotateAngle();
						endAnimate(n);
					},
		  duration:5000
	   });
	}
	
	function endAnimate($n){
 		var n = $n;
		/* $('#result_id').html("<p>움직인 각도:" + n + "</p>"); */
		var real_angle = n%360 +18;
		var part = Math.floor(real_angle/36);
	
		/* $('#result_id2').html("<p>상품범위:" + part + "</p>"); */

		if(part < 1){
			$('#result_box').html("<p>당첨내역:" + pArr[0] + "</p>");
			return;
		}

		if(part >= 10){
			$('#result_box').html("<p>당첨내역:" + pArr[pArr.length-1] + "</p>");
			return;
		}
		
		var rouletteResult = pArr[part];

		 $('#result_box').html("<p>당첨내역 : " + rouletteResult + "</p>");
		 
		 $('#result_box').html("<img src=resources/images/product_single/wine_single_00" + rouletteResult + ".png><img src=resources/images/food_" + rouletteResult + ".jpg>");
		 
		 $('#description_box').html("<img src=resources/images/graph_0.png>" + "<img src=resources/images/graph_1.png>"
				 + "<img src=resources/images/graph_2.png>" + "<img src=resources/images/graph_3.png>"
				 + "<br><p>추가 설명: 이것은 " + rouletteResult + "번째 결과입니다.</p>"); 
/* 		var n = $n;
		var real_angle = n%360 +18;
		var part = Math.floor(real_angle/36);
		var rouletteResult = pArr[part];
		
		$j363.ajax({
			url: "selectRoulette.do",
			data: {pairing_id: rouletteResult},
			type: "post",
			success: function(jsonData){
				if(jsonData >= 0 && jsonData <=9){
			     console.log("jsonData : " + jsonData);
				 
				 $('#result').html("<img src=" + jsonData.product_image + ".png><img src=resources/images/food_" + jsonData.food_image + ".jpg>");
			
				 $('#description_box').html("<img src=" + jsonData.sweetness + ".png>" + "<img src=" + jsonData.acidity + ".png>"
						 + "<img src="+ jsonData.body + ".png><img src=" + jsonData.tannin + ".png>"
						 + "<br><p>추가 설명: 이것은 " + rouletteResult + "번째 결과입니다.</p>"); 
			    }
  			},
  			error: function( request, status, errorData ){
  				console.log("error code : " + request.status
  						+ "\nMessage : " + request.reponseText
  						+ "\nError : " + errorData);
			}
		}	  */
	}

	function randomize($min, $max){
		return Math.floor(Math.random() * ($max - $min + 1)) + $min;
	}
};
</script>
<br>

<div id="result_box" class="result_box"></div> 

<div id="description_box">
</div>
<%-- <div id="description_box"></div>

</center> --%>

<br>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
