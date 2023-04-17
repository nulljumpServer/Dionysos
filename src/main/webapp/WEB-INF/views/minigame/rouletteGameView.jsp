<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>룰렛 게임</title>
<meta charset="utf-8">
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js">
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
#n_id{position:absolute;left:50%;top:610px;z-index:20;}
</style>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Hahmlet&display=swap');

@font-face{
 src:url("../fonts/Hahmlet-VariableFont_wght.woff");
 font-family : "Hahmlet";
}

* {
font-family: 'Hahmlet', serif;
}

.result_box { 
  /* border:1px solid;  */
  padding:50px; 
  display: block; /* 박스를 보이게 함 */
  margin: 0 auto; /* 가운데 정렬 */
  width: 60%; /* 박스 너비 조정 */
  text-align: center; /* 내용 가운데 정렬 */
}

#description_box {
  margin-top: 30px;
  padding: 20px;
  border: 1px solid black;
  width: 60%;
  text-align: center;
  /* background-color: #f68cff; */ 
}
</style>
</head> 
<body style="background-color: #fff0fd;">

<c:import url="/WEB-INF/views/common/menubar.jsp" />
<br>
<center>
<img src="resources/images/roulette.png" id="image">
<img src="resources/images/niddle.png" id="n_id">
<br>
<form action="selectRoulette.do" method="post">
<input type='button' class="btn btn-primary py-2 px-4" value='START' id='start_btn'></input>
</form>
<script>
window.onload = function(){
	var pArr = ["10","1","2","3","4","5","6","7","8","9"];

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
		
		$.ajax({
			url: "selectRoulette.do",
			data: {pairing_id: rouletteResult},
			type: "post",
			dataType: "json",
			success: function(jsonData){
			     console.log("jsonData : " + jsonData);
				 $('#result_box').html("<img style=width:400px; height:400px src=." + decodeURIComponent(jsonData.product_image).replace(/\+/gi, ' ') + ">" 
						 + "<img style=width:400px; height:400px src=" + decodeURIComponent(jsonData.food_image).replace(/\+/gi, ' ') + ">"
				 );
			
				 $('#description_box').html("<br>당도 &nbsp;<img src=resources/images/graph_" + jsonData.sweetness + ".png>" 
						 + "&nbsp; &nbsp; &nbsp; 산도 &nbsp;<img src=resources/images/graph_" + jsonData.acidity + ".png>"
						 + "<br>바디 &nbsp;<img src=resources/images/graph_"+ jsonData.body + ".png>"
						 + "&nbsp; &nbsp; &nbsp; 탄닌 &nbsp;<img src=resources/images/graph_" + jsonData.tannin + ".png>"
						 + "<br><br>상품명 : " + decodeURIComponent(jsonData.product_name).replace(/\+/gi, ' ')
						 + "<br>음식명 : " + decodeURIComponent(jsonData.food_name).replace(/\+/gi, ' ')
						 + "<br><p>설명:" + decodeURIComponent(jsonData.food_detail).replace(/\+/gi, ' ') + "</p>"); 
  			},
  			error: function( request, status, errorData ){
  				console.log("error code : " + request.status
  						+ "\nMessage : " + request.reponseText
  						+ "\nError : " + errorData);
  			}                                                                                                                                                                                                                     });
	}

	function randomize($min, $max){
		return Math.floor(Math.random() * ($max - $min + 1)) + $min;
	}
};
</script>
<br>

<div id="result_box" class="result_box"></div> 

<table>
  <tr>
    <td id="description_box" style="background-color: white;"></td>
  </tr>
</table>

<br>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
