<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
	<h1>단방향 해시 함수</h1>
	<div>
		<div>
			<label>Before</label>
			<textarea cols=40 rows=5 id="input_msg" onkeyup="checkMsg(this, '127')"></textarea>
			<span id="byte_info">0</span><span> / 127bytes</span>
		</div>
		<div>
			<button class="btn_hashing">해시 생성!</button>
		</div>
		<div>
			<label>After</label>
			<textarea cols=40 rows=5 class="result" readonly></textarea>
		</div>
		<div>
			<a href="${path}">메인</a>
		</div>
	</div>
	<script>
		// 한글, 한자 제외
		function checkMsg(obj, maxBytes){
			var str = obj.value;
			console.log(str);
			var pattern = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|\u4E00-\u9FD5]/g;
			document.getElementById("input_msg").value = str.replace(pattern, "");
			var byteLen = stringByteLen(str);
			$("#byte_info").html(byteLen);
			if(stringByteLen(str)>maxBytes){
				alert("입력 메시지는 최대"+maxBytes+"bytes를 초과할 수 없습니다.");
				var limitedStr = str.substr(0,maxBytes);
				console.log(limitedStr);
				obj.value = limitedStr;
				$("#byte_info").html(stringByteLen(limitedStr));
				
			}
			
		}
		
		// 메시지 byte길이 구하는 함수
		var stringByteLen = function(s,b,i,c){
			for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
			return b;
		}
		
		$(".btn_hashing").on("click",function(){
			var input_msg = $("#input_msg");
			if(input_msg.val()!=null && input_msg.val()!=""){
				$.ajax({
					url: path+"/hash/hashing",
					data: {
						msg: input_msg.val()
					},
					dataType: 'text',
					type: 'POST',
					success: function(data){
						console.log(data);
						$(".result").val(data);
					}
				});
			}
		});
		
	</script>
</body>
</html>