/* 회원 등록 버튼 */
$("#reg_submit").click(function() {
	$.ajax({
		type : "post",
		url : "/join/reg_proc.ajax",
		dataType : "json",
		data : $(".reg_form").serialize(),
		success : function(data) {
			alert("등록처리 되었습니다.");
		},
	// error:function(jqXHR, textStatus, errorThrown){
	// alert("사용자 등록 도중 오류 발생했습니다."+textStatus);
	// }
	})
});
