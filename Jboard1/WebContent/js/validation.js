$(function(){
	var form = $('.register > form');
	
	// form의 전송버튼(submit)을 클릭하면
	form.submit(function(){
		
		console.log('여기1 : '+isUidOk);
		if(isUidOk == false){
			alert('아이디를 확인하세요.');
			return false;
		}
		
		console.log('여기2 : '+isPassOk);
		if(!isPassOk){
			alert('비밀번호를 확인하세요.');
			return false;
		}
		
		console.log('여기3 : '+isNameOk);
		if(!isNameOk){
			alert('이름을 확인하세요.');
			return false;
		}
		
		console.log('여기4 : '+isNickOk);
		if(!isNickOk){
			alert('별명을 확인하세요.');
			return false;
		}
		
		console.log('여기5 : '+isEmailOk);
		if(!isEmailOk){
			alert('이메일을 확인하세요.');
			return false;
		}
		
		console.log('여기6 : '+isHpOk);
		if(!isHpOk){
			alert('휴대폰을 확인하세요.');
			return false;
		}
		
		// 최종 모든 검증을 통과 된 후 서버로 데이터 전송
		return true;
	});
});