<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>GYM CARRY : 캐리 정보 수정</title>

<%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>

<link rel="stylesheet" href="/gym/css/mypage/modify.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title>캐리 정보 수정</title>

</head>
<body>
<!-- header -->
<%@ include file="/WEB-INF/views/frame/header.jsp" %>

<!-- content S-->
<div class="wrap">
    <div class="container">
        <div class="form_txtInput">

            <form action="<c:url value="/mypage/update"/>" method="post" enctype="multipart/form-data">
                <!--캐리 프로필 영역-->
                <h1 class="sub_tit_txt">캐리 정보 수정</h1>
                <div class="edit_form">

                    <table>
                        <colgroup>
                            <col width="30%"/>
                            <col width="auto"/>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th><span>캐리 소개</span></th>
                            <td>
                                <form>
                                    <textarea class="crintro" id="introduce" type="text" name="crintro"
                                              required></textarea>
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <th><span>소속플레이스</span></th>
                            <td>
                                <div class="place">
                                    <input type="text" placeholder="" name="crplace" id="search" required>
                                    <input type="hidden" name="placeidx" id="placeidx">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><span>종목</span></th>
                            <div class="selectbox">
                                <td>
                                    <div class="selectbox">
                                        <label for="health">
                                            <input type="radio" value="헬스" id="health"
                                                   name="crfield" ${carry.crfield == '헬스' ? 'checked' : ''}>헬스</input>
                                        </label>
                                        <label for="pilates">
                                            <input type="radio" value="필라테스" name="crfield"
                                                   id="pilates" ${carry.crfield == '필라테스' ? 'checked' : ''}>필라테스</input>
                                        </label>
                                        <label for="yoga">
                                            <input type="radio" value="요가" name="crfield"
                                                   id="yoga" ${carry.crfield == '요가' ? 'checked' : ''}>요가</input>
                                        </label>
                                    </div>
                                </td>
                            </div>

                        </tr>

                        <tr>
                            <th><span>전문 분야</span></th>
                            <td>
                                <div class="selectbox">
                                    <label for="diet">
                                        <input type="radio" value="다이어트" id="diet"
                                               name="crdepart" ${carry.crdepart == '다이어트' ? 'checked' : ''}>다이어트</input>
                                    </label>
                                    <label for="dump">
                                        <input type="radio" value="근력강화" id="dump"
                                               name="crdepart" ${carry.crdepart == '근력강화' ? 'checked' : ''}>근력강화</input>
                                    </label>
                                    <label for="weight_gain">
                                        <input type="radio" value="체중증가" id="weight_gain"
                                               name="crdepart" ${carry.crdepart == '체중증가' ? 'checked' : ''}>체중증가</input>
                                    </label>
                                    <label for="bodyfix">
                                        <input type="radio" value="체형교정" id="bodyfix"
                                               name="crdepart" ${carry.crdepart == '체형교정' ? 'checked' : ''}>체형교정</input>
                                    </label>
                                    <label for="rehabilitation">
                                        <input type="radio" value="재활/통증케어" id="rehabilitation"
                                               name="crdepart" ${carry.crdepart == '재활/통증케어' ? 'checked' : ''}>재활/통증케어</input>
                                    </label>
                                    <label for="body_profile">
                                        <input type="radio" value="바디프로필" id="body_profile"
                                               name="crdepart" ${carry.crdepart == '바디프로필' ? 'checked' : ''}>바디프로필</input>
                                    </label>
                                    <label for="competition">
                                        <input type="radio" value="대회준비" id="competition"
                                               name="crdepart" ${carry.crdepart == '대회준비' ? 'checked' : ''}>대회준비</input>
                                    </label>
                                    <label for="etc">
                                        <input type="radio" value="기타" id="etc"
                                               name="crdepart" ${carry.crdepart == '기타' ? 'checked' : ''}>기타</input>
                                    </label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><span>PT 이용금액 </span></th>
                            <td>
                                <input type="text" placeholder="1회 금액 (숫자만 입력해주세요)" name="proprice1" required>
                                <input type="text" placeholder="5회 금액 (숫자만 입력해주세요)" name="proprice2" required>
                                <input type="text" placeholder="10회 금액 (숫자만 입력해주세요)" name="proprice3" required>
                                <input type="text" placeholder="20회 금액 (숫자만 입력해주세요)" name="proprice4" required>
                            </td>
                        </tr>

                        <tr>
                            <th><span>자격 및 경력<br>
                                <p>(최대 5개까지 입력 가능합니다)</p></span>
                            </th>
                            <td><input type="text" placeholder="자격 및 경력1" name="crcerti1">
                                <input type="text" placeholder="자격 및 경력2" name="crcerti2">
                                <input type="text" placeholder="자격 및 경력3" name="crcerti3">
                                <input type="text" placeholder="자격 및 경력4" name="crcerti4">
                                <input type="text" placeholder="자격 및 경력5" name="crcerti5">
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label for="file">바디프로필 업로드</label>
                            </th>
                            <td>
                                <div class="bodyprofile_form">
                                <div class="bodyprofile_photo">
                                    <img src="<c:url value="/uploadfile/${carry.crbfphoto}"/>">
                                </div>
                                <input type="button" value="사진업로드" class="profilebtn" name="crbfphoto" onclick=document.all.file.click();>
                                <input type="file" name="crbfphoto" id="file" class="profilebtn" style="display: none;"/>
                            </div>

                            </td>
                        </tr>
                        </tbody>

                        <input type="hidden" name="cridx" id="cridx" value="${cridx}">
                        <input type="hidden" name="oldcrbfphoto" value="${carry.crbfphoto}">

                    </table>
                </div>
                <div class="btn_wrap2">
                    <input class="btn_update" type="submit" value="수정">
                </div>
                <div class="btn_wrap2">
                    <a href="javascript:window.history.back();">취소</a>
                </div>
            </form>
        </div>


    </div>
</div>

<script>

    //등록 이미지 등록 미리보기
    function readInputFile(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('.bodyprofile_photo').html("<img src=" + e.target.result + ">");
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $(".profilebtn").on('change', function () {
        readInputFile(this);
    });

    // 검색 자동완성
    $(document).ready(function () {

        $("#search").autocomplete({

            source: function (request, response) {
                $.ajax({
                    url: '<c:url value="/autocomplete"/>',
                    type: "post",
                    dataType: "json",
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                    data: {term: request.term},
                    success: function (data) {
                        response(
                            $.map(data, function (item) {
                                var idx = item.placeidx;
                                console.log(idx);
                                return {
                                    label: item.placename,
                                    value: item.placename,
                                    idx: item.placeidx
                                }
                            })
                        )

                    },
                    error: function (data) {
                        alert("에러가 발생하였습니다.")
                    }
                });
            },
            select: function (event, ui, item, response) {
                let placeidx = ui.item.idx;
                $.ajax({
                    url: '<c:url value="/place/detail"/>',
                    type: "get",
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                    data: {placeidx: placeidx},
                    success: function (data) {
                        //location.href = '<c:url value="/place/detail"/>?placeidx=' + placeidx;
                        $("#placeidx").val(placeidx);
                        console.log(placeidx);
                    },
                    error: function (data) {
                        alert("에러가 발생하였습니다.")
                    }
                });

            },
            focus: function (event, ui) {
                return false;
            }
        }).autocomplete('instance')._renderItem = function (ul, item) {

            <c:set var="placeSearchDetail" value="${placeSearchDetail}"/>


            return $('<li>') //기본 tag가 li
                .append('<span>' + item.value + '</span>')
                .appendTo(ul);
        };
    });


</script>

<!-- footer -->
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>