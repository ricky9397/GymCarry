<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<title>Community</title>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
<link rel="stylesheet" href="/gym/css/community/postContent.css">
</head>
<body>
<!-- header -->
<%@ include file="/WEB-INF/views/frame/header.jsp"%>
53233

<!-- Contents -->
<div class="contents_wrap">
    <div class="contents container_fix">

        <!-- Nav -->
        <div class="post_back">
            <a class="post_back_link" href="<c:url value="/community/boardList"/>">
                <img class="arrow_img" src="/gym/images/icon/arrow.png"> 글 목록
            </a>
            <div class="content_right off">
                <ul>
                    <li>
                        <a class="con_edit" href="<c:url value="/community/update?postidx=${boardDetail.postidx }"/>">수정 </a>
                    </li>
                    <li>
                        <a class="con_delete">삭제</a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- Profile -->
        <div class="space_between">
            <div class="btn_right">
                <button class="title_btn" type="button">${boardDetail.boardcategory}</button>
                <h2 class="board_title">${boardDetail.postname}</h2>
            </div>
            <div class="profile">
                <div class="profile_img">
                    <img alt="" src="<c:url value="/uploadfile/${boardDetail.memphoto}"/>">
                    <div id="nickname">${boardDetail.postnick}</div>
                </div>
                <ul class="profile_right">
                    <li class="profile_left">
                        <img class="left_board_icon" img src="<c:url value="/images/icon/time.png"/>" alt="img">
                        <c:set var="date" value="${boardDetail.postdate}"/>
                        <c:set var="onlydate" value="${fn:substring(date, 0, 16)}" />
                        <div id="write_date"><c:out value="${onlydate}"/></div>
                    </li>
                    <li class="profile_viewcnt">
                        <img class="left_board_icon2" img src="<c:url value="/images/icon/board.png"/>" alt="img">
                        ${boardDetail.postview}
                    </li>
                </ul>
            </div>

        </div>
        <!-- /Profile -->
        <!-- /Nav-->

        <!-- Content -->
        <div class="content_wrap">
            <div class="post_content">
                ${boardDetail.postcontent}
            </div>
        </div>
        <div class="postbtn_wrap">
            <div class="post_btn">
                <c:if test="${checkResult == 1}">
                <div class="like_btn on">
                    <img class="post_icon" src="/gym/images/icon/heart.png">
                    </c:if>
                    <c:if test="${checkResult == 0}">
                    <div class="like_btn off">
                        <img class="post_icon" src="/gym/images/icon/heart_off.png">
                        </c:if>
                        <span>${likeLength}</span>
                    </div>
                    <div class="comm_length">
                        <img class="post_icon" src="/gym/images/icon/speech-bubble.png">
                        <span></span>
                    </div>
                </div>
            </div>
            <!-- /Content -->

            <!-- Comment -->
            <ul class="comment_section">

            </ul>
            <!-- /Comment -->

            <!-- Comment Input -->
            <div class="comment_input_wrap off">
                <div class="search_wrap search_wrap_6">
                    <div class="search_box">
                        <input type="text" class="comm_input" placeholder="댓글을 작성해주세요.">
                        <label name="btn_input" class="btn_input">
                            <input type="submit" name="btn_input" class="btn">
                            <img src="/gym/images/icon/input_icon.png" alt="icon">
                        </label>
                    </div>
                </div>
            </div>
            <!-- /Comment Input -->
        </div>
        <!-- /Content -->
    </div>
    <!-- /Contents -->

    <!-- footer -->
    <%@ include file="/WEB-INF/views/frame/footer.jsp"%>
    <script>
        // 좋아요 버튼 클릭
        $('.like_btn').click(function(){

            var postidx = "${boardDetail.postidx}"; // 글번호
            var memidx = "${loginSession.memidx}"; // 회원번호

            if(${loginSession.memidx == 0 || loginSession == null}) {
                alert("일반회원 로그인 후 이용해 주세요.");
            } else {
                if($(this).hasClass('on')){ // 이미 좋아요를 누른 상태(클릭하면 좋아요가 취소된다)
                    $.ajax({
                        type : "POST",
                        url : '<c:url value="/likeOff"/>',
                        dataType : "json",
                        data : {"postidx" : postidx,
                            "memidx" : memidx},
                        error : function(){
                            console.log("통신 에러","error","확인");
                        },
                        success : function(result) {
                            console.log(result);
                            if(result == 1){
                                $(".like_btn").removeClass("on");
                                $(".like_btn").addClass("off");
                                $(".like_btn > img").attr("src","/gym/images/icon/heart_off.png");

                                likeidx()
                            } else {
                                console.log("좋아요 오류")
                            }
                        }
                    });

                } else{ // 좋아요를 누르지 않은 상태(클릭하면 좋아요된다)
                    $.ajax({
                        type : "POST",
                        url : '<c:url value="/likeOn"/>',
                        dataType : "json",
                        data : {"postidx" : postidx,
                            "memidx" : memidx},
                        error : function(){
                            console.log("통신 에러","error","확인");
                        },
                        success : function(result) {
                            console.log(result);
                            if(result == 1){
                                $(".like_btn").removeClass("off");
                                $(".like_btn").addClass("on");
                                $(".like_btn > img").attr("src","/gym/images/icon/heart.png");

                                likeidx();
                            } else {
                                console.log("좋아요 오류")
                            }
                        }
                    });
                }
            }
        });

        // 좋아요 갯수 ajax
        function likeidx(){
            var postidx = "${boardDetail.postidx}";

            $.ajax({
                url : '<c:url value="/likeIdx"/>',
                type : "post",
                data : {"postidx" : postidx},
                success : function(idx){
                    $(".like_btn > span").html("");
                    $(".like_btn > span").append(idx);
                }
            });
        }

    </script>

    <script>
        // 수정/삭제 버튼 노출 여부
        $(function(){
            var memidx = ${boardDetail.memidx};
            if(${loginSession != null}) { // 로그인 여부
                if(${loginSession.memidx} == memidx){ // 로그인세션과 작성자 idx 일치 여부 확인
                    $(".content_right").removeClass('off');
                }
            }
        });
        
        
        // 댓글 작성 로그인 검사
        $(function(){
			console.log(${loginSession.memidx})
            if (${loginSession.memidx != 0}) {
            	 $(".comment_input_wrap").removeClass('off');
            }
        }); 
	        
    </script>



    <script>
        // 댓글 등록
        $(".btn_input .btn").on("click", function(){
            var memberidx; // 회원 번호
            var memberNick; // 회원 닉네임
            var postidx = "${boardDetail.postidx}"; // 글번호
            var commContent = $(".comm_input").val(); // 댓글내용

            // 로그인 여부 검사
            if(${loginSession == null}) {
                alert("로그인 후 이용해 주세요.");
                $(location).attr('href','<c:url value="/member/login"/>');
            } else {
                // Session에서 회원 번호를 얻어옴.
                // ""를 하지 않으면 변수명 처럼 인식됨
                memberidx = "${loginSession.memidx}";
                memberNick = "${loginSession.memnick}";
                // 자바 스크립트 객체 방식으로 작성

                $.ajax({
                    url : '<c:url value="/insertComm"/>',
                    type : "POST",
                    data : {"commContent" : commContent,
                        "postidx" : postidx,
                        "memberidx" : memberidx,
                        "membernick" : memberNick},
                    success : function(result){
                        var msg;

                        switch(result) {
                            case 1 :  //성공
                                msg = "댓글이 작성 되었습니다.";
                                // 내용을 작성한 textarea를 다 지워줌
                                $(".comm_input").val("");
                                selectRlist(); // selectRlist()함수 호출
                                break;

                            case 0 :  //등록실패
                                msg = "댓글 등록 실패";
                                break;
                            case -1 :
                                msg = "댓글 등록 오류 발생";
                                break;
                        }

                        alert(msg);
                    },
                    error : function(){
                        console.log("ajax 통신 실패");
                    }
                });
            }
        });

        // 댓글 목록 조회 함수
        function selectRlist() {
            var postidx = "${boardDetail.postidx}";

            $.ajax({
                url : '<c:url value="/selectReplyList"/>',
                type : "post",
                data : {"postidx" : postidx},
                dataType : "json", // javascriptObjectNation
                success : function(commList){
					
                	
                    // $붙으면 이 변수를 대상으로 jquery 메소드를 사용가능
                    // 없으면 그냥 변수임
                    var $rArea = $(".comment_section");
                    // jQuery 변수 : 변수에 jQuery 메소드를 사용할 수 있음

                    var comm_count = 0;
                    // javascript는 isEmpty가 없음
                    // javascript 빈리스트 확인은 rList = []
                    // 하지만 json은 string이므로 ""(빈문자열)로 비교
                    if(commList == "") { // 조회할 댓글이 없는 경우
                        $rArea.html('<li class="comment_wrap"><p class="non_comm">등록된 댓글이 없습니다</p></li>');
                        $('.comm_length > span').append(comm_count);
                    } else {
                        $rArea.html(""); // 기존 댓글 목록 삭제

                        $.each(commList, function(i){
                        	
                        	
                            var html = '<li class="comment_wrap">';
                            html += '<div class="profile">';
                            html += '<div class="profile_img">';
                            html += '<img src="<c:url value="/uploadfile/"/>' + commList[i].memphoto + '" alt="img">';
                            html += '</div>';
                            html += '<div class="profile_left">';
                            html += '<div id="nickname">' + commList[i].commentnick + '</div>';
                            html += '<div id="write_date">' + commList[i].commentdate + '</div>';
                            html += '</div>';
                            html += '</div>';
                            html += '<div class="text_wrap">';
                            html += '<div class="comment_text">';
                            html += '<p>' + commList[i].commentcontent +'</p>';
                            html += '</div>';
                            html += '</div>';
                            html += '</li>';

                            $rArea.append(html);
                        });
                        var comm_count = commList.length;
                        $('.comm_length > span').html("");
                        $('.comm_length > span').append(comm_count);

                    }
                },
                error : function(){
                    console.log("댓글 목록 조회 ajax 통신 실패");
                }
            });
        }

        $(function(){
            selectRlist();

            // 10초마다 댓글 갱신
            setInterval(function(){
                selectRlist
            }, 10000);
        });

    </script>

    <script>
        // 게시물 삭제
        $(function(){
            var form = $("<form></form>");
            $('.con_delete').on("click", function(){
                var deletePush = confirm("해당 게시글을 삭제 하시겠습니까?\n\n삭제 후엔 복구가 불가능합니다.")
                if(deletePush){
                    location.href = '<c:url value="/community/delete?postidx=${boardDetail.postidx}"/>';
                }
            });
        })
    </script>

