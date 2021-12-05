<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	
$(function() {
	
	PAGE_LOGIN.init();
	alert('asd');
	
});

/* 화면  ID 설정 */
const ID = {
	INPUT_ID : $("#id"),			/* 아이디 */
	INPUT_PASS : $("#pw"),			/* 비밀번호 */
	SAVE_ID : $("#id_save"),		/* 아이디 저장 버튼 */
	BTN_LOGIN : $("#submitBtn"),	/* 로그인 버튼 */
	
};

/* 로그인 클릭 */
clicked = () => {

	var id = ID.INPUT_ID.val().trim();
	var pwd = ID.INPUT_PASS.val();
	var saveId = ID.SAVE_ID.is(":checked");

	if(saveId){
		setCookie("Cookie_userId", id, 30);
	}else{
		deleteCookie("Cookie_userId");
	}

	if(id == ''){
		alert("아이디를 입력해주세요.");
		return false;
	}else if(pwd == ''){
		alert("비밀번호를 입력해주세요.");
		return false;
	}else{

		var params = {
				"adminId" : id,
				"password" : pwd,
			}

		login(params);
		
	}
};


/* 쿠키 설정 */
setCookie = function(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
};


/* 쿠키 얻기 */
getCookie = function(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
};	
	
/* 쿠키 삭제 */
deleteCookie = function(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
};	
	
	
const PAGE_LOGIN = (function() {

	var init = function(){

		var userId = getCookie("Cookie_userId");
		ID.INPUT_ID.val(userId);
		    
	    if(ID.INPUT_ID.val() != ""){
	        ID.SAVE_ID.attr("checked", true);
	    }
	};

	return {
		init : function () {
			init();
		}
	}
	
})();	
	
	
</script>