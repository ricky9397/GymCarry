<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Community</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<link rel="stylesheet" href="/gym/css/community/commWrite.css">
<script src="/gym/ckeditor/ckeditor.js" charset="utf-8"></script>
<script>
    var ckeditor_config = {
        resize_enaleb : false,
        enterMode : CKEDITOR.ENTER_BR,
        shiftEnterMode : CKEDITOR.ENTER_P,
        filebrowserUploadUrl : '${pageContext.request.contextPath}/adm/fileupload'
    };
</script>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	
	<!-- Contents -->
    <div class="community_write container container_fix">
        <h1 class="page_title">
            COMMUNITY
        </h1>
        <div class="board_write">
            <form method="post" id="updateForm">
                <div class="write_form">
                    <div class="category">
                        <span class="left">분류</span>
                        <select class="category_info" name="boardcategory" value="${update.boardcategory}">
                            <option value="소통">소통</option>
                            <option value="질문/답변">질문/답변</option>
                        </select>
                    </div>
                    <div class="name">
                        <span class="left">닉네임</span>
                        <span class="name_info"><input type="text" name="postnick" value="${update.postnick}" readonly></span>
                    </div>
                    <div class="title">
                        <span class="left">제목</span>
                        <span><input type="text" name="postname" value="${update.postname}" required></span>
                    </div>
                    <div class="content">
                        <span class="left">내용</span>
                        <span class="editor">
                            <textarea class="form-control" name="postcontent" id="postcontent" value="">${update.postcontent}</textarea>
                        </span>
                    </div>
                </div>
                <div class="btn">
                    <input type="submit" value="수정 완료" id="updateBtn">
                    <a href="javascript:window.history.back();">취소</a>
                </div>
                <input type="hidden" id="memidx" name="memidx">
            </form>

        </div>
    </div>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
	
<script>
	
	CKEDITOR.replace('postcontent', ckeditor_config);

    CKEDITOR.on('dialogDefinition', function( ev ){
        var dialogName = ev.data.name;
        var dialogDefinition = ev.data.definition;
     
        switch (dialogName) {
            case 'image': //Image Properties dialog
                //dialogDefinition.removeContents('info');
                dialogDefinition.removeContents('Link');
                dialogDefinition.removeContents('advanced');
                break;
        }
    });
</script>
	
    
    <script>
    	// selected 값 가져오기
		$(document).ready(function(){
			var s_value = '${update.boardcategory}';
			
			$(".category_info").val(s_value).prop("selected", true);
		});
	</script>
