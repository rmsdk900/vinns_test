<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<!-- <style>
	* {
		padding: 0;
		margin: 0;
	}
	body {
		width: 100%;
		height: 700px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.wrapper {
		width : 500px;
		height : 500px;
		border : 1px solid #333;
	}
	
	.wrapper_input_score {
		width: 100%;
		display:flex;
		
	}
</style> -->
	<h1>야구게임</h1>
	<div class="wrapper">
		<div class="wrapper_input_score">
			<div>
				<label>Blue팀</label>
				<br/>
				<input type="number" min=0 max=10000 step=1 class="input_score" id="score_blue"/>
			</div>
			<span>:</span>
			<div>
				<label>Red팀</label>
				<br/>
				<input type="number" min=0 max=10000 step=1 class="input_score" id="score_red" />
			</div>
		</div>
		<br/>
		<div>
			<button class="btn_calc_hits">안타 수 계산하기</button>
			<br/><br/>
			<div>
				<span>최소 </span>
				<span><input type="text" class="result" readonly/></span>
				<span>안타가 필요 합니다.</span>
			</div>
		</div>
		<div>
			<a href="${path}">메인</a>
		</div>	
	</div>
	<script>
		// 숫자 이외 막기
		var input_score = document.getElementsByClassName("input_score");
		for(var i=0;i<input_score.length;i++){
			input_score[i].addEventListener("keydown",function(e){
				if(e.keyCode == 69 
	               || e.keyCode == 190 
	               || e.keyCode == 109 
	               || e.keyCode == 110 
	               || e.keyCode == 107 
	               || e.keyCode == 189 
	               || e.keyCode == 187){
					e.preventDefault();
	                           
	           }
			});
		}
		// 제대로 된 값 전달 후 답 구하기
		var btn_calc_hits = document.querySelector(".btn_calc_hits");
		btn_calc_hits.addEventListener("click",function(){
			var score_blue = document.getElementById("score_blue");
			var score_red = document.getElementById("score_red");
			
			if(score_blue.value > 10000){
				alert("10000점 이하의 점수만 입력 가능합니다.");
				score_blue.value = "";
				score_blue.focus();
			}else if(score_red.value > 10000){
				alert("10000점 이하의 점수만 입력 가능합니다.");
				score_red.value = "";
				score_red.focus();
				
			}else {
				$.ajax({
					url: path+"/baseball/calc",
					data: {
						score_blue: score_blue.value,
						score_red: score_red.value
					},
					dataType: 'text',
					type: 'POST',
					success: function(data){
						// 받아온 안타 수를 넣어주자!
						var result = document.querySelector(".result");
						result.value = data;
					}
				})
			}
		});
	</script>
</body>
</html>