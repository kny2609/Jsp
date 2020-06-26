// 정규표현식
var regEmail    = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일
  
    // 최종 점검을 위한 상태변수 선언 
var isEmailOk = false;

$(document).ready(function(){
	
	var alreadyCheck = false;
	
	$('input[name=email]').focusout(function(){
		
		if(alreadyCheck){
			alreadyCheck = false;
			return false;
		}
		
		var tag = $(this);
		var email = tag.val();
		var json = {"email":email};
		
		if(regEmail.test(email) == false){
			alert('이메일을 다시 확인해주세요.');
			tag.focus();
			alreadyCheck = true;
			return false;
		}
		
		
		// 모든 검증이 통과되고 통신시작
		$.ajax({
			url:'/Farmstory1/user/proc/checkEmail.jsp',
			type:'get',
			data:json,
			dataType:'json',
			success: function(data){
				if(data.result == 1){
					$('.resultEmail').css('color', 'red').text('이미 사용 중인 이메일 입니다.');
					tag.focus();
				}else{
					$('.resultEmail').css('color', 'green').text('사용 하실 수 있는 이메일 입니다.');
					isEmailOk = true;
				}
			}
		});
	});
});	