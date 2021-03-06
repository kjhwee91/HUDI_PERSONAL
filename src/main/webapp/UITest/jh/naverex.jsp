<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,
	maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<title> 터치 이벤트 활용 예제 </title>
<style>
	div, span {
		margin : 0px;
		padding : 0px;
	}
</style>
</head>
<body>
	<!--터치 영역-->
	<div id="touch" style="background-color:grey; width:100%; height:100px;">
		<br>
			이 영역을 터치하세요.
	</div>
	<br>
	<!--로그 영역-->
	<div id="log" style="border:1px solid black; width:100%;"></div>
</body>
<script>
	var elTouch = document.getElementById("touch");

	//로그 영역에 로그를 추가한다.
	function addLog(s){
		var elLog = document.getElementById('log');
		var sText = elLog.innerHTML + "<br>" + s;
		elLog.innerHTML = sText;
	}

	// window.addEventListener('touchstart', function(){
	// 	console.log(event);
	// });

	//페이지 로딩이 완료된 경우
	window.onload = function(){
		//touch start 이벤트를 등록한다.
		elTouch.addEventListener("touchstart",function(event){
			//touch start 이벤트의 기본 동작을 막는다. 이 영역에서는 브라우저의 스크롤 기능이 동작하지 않는다.
			event.preventDefault();
			var oTouch = event.changedTouches;
			var sTxt = '';
			for (var i=0, nLen=oTouch.length ; i<nLen ; i++){
				sTxt += ' [nX:' + oTouch[i].pageX + ', nY:'+ oTouch[i].pageY + "],";
			}
			addLog('[touchstart]' + sTxt);
		});
		//touch move 이벤트를 등록한다.
		elTouch.addEventListener('touchmove', function(event){
			var oTouch = event.changedTouches;
			var sTxt = "";
			for (var i=0, nLen=oTouch.length ; i<nLen ; i++){
				sTxt += ' [nX:' + oTouch[i].pageX + ", nY:" + oTouch[i].pageY + "],";
			}
			addLog('[touchmove]' + sTxt);
		});

		//touch end 이벤트를 등록한다.
		elTouch.addEventListener('touchend', function(event){
			var oTouch = event.changedTouches;
			var sTxt = "";
			for (var i=0, nLen=oTouch.length ; i<nLen ; i++){
				sTxt += ' [nX:' + oTouch[i].pageX + ", nY:" + oTouch[i].pageY + "],";
			}
			addLog('[touchend]' + sTxt);
		});

	}

</script>
</html>









