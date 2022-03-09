function CheckJoinUser(){
		var userID = document.getElementById("userID");
		var userPassword = document.getElementById("userPassword");
		var userName = document.getElementById("userName");
		
		if(!check (/^[0-9|a-z]{4,11}$/, userID,"[아이디]\n영어 소문자와 숫자를 조합하여 4~11자까지 입력하세요."))
			return false;
		
		if(!check (/^[0-9|a-z|A-Z]{4,11}$/, userPassword,"[비밀번호]\n영어와 숫자를 조합하여 4~11자까지 입력하세요."))
			return false;
			
		if(userName.value.length<2||userName.value.length>6){
			alert("[이름은]\n최소 2자에서 최대 6자까지 입력하세요.");
			name.select();
			name.focus();
			return false;
		}
		
		function check(regExp, e, msg){
			if (regExp.test(e.value)){
				return true;
			}
			alert(msg);
			e.select();
			e.focus();
			return false;
		}
		
		document.newUser.submit();
}