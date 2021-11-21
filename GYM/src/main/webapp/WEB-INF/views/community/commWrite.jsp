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
        <form method="post" id="writeForm">
            <div class="write_form">
                <div class="category">
                    <span class="left">분류</span>
                    <select class="category_info" name="boardcategory">
                        <option value="소통">소통</option>
                        <option value="질문/답변">질문/답변</option>
                    </select>
                </div>
                <div class="name">
                    <span class="left">닉네임</span>
                    <span class="name_info"><input type="text" name="postnick" value="${loginSession.memnick}" readonly></span>
                </div>
                <div class="title">
                    <span class="left">제목</span>
                    <span><input type="text" name="postname" value="" required></span>
                </div>
                <div class="content">
                    <span class="left">내용</span>
                    <span class="editor">
                            <textarea class="form-control" name="postcontent" id="postcontent" ></textarea>
                        </span>
                </div>
            </div>
            <div class="btn">
                <input type="submit" value="작성 완료" id="writeBtn">
                <a href="javascript:window.history.back();">취소</a>
            </div>
            <input type="hidden" id="memidx" name="memidx" value="${loginSession.memidx}">
        </form>

    </div>
</div>

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


<!-- footer -->
<%@ include file="/WEB-INF/views/frame/footer.jsp"%>

