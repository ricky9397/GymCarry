<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
<!--개인 css-->
<link rel="stylesheet" href="/gym/css/mypage/grid.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>

<!--제이쿼리 CDN-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- bootstrap -->
<link rel="stylesheet" href="/gym/css/mypage/bootstrap.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<%@ include file="/WEB-INF/views/frame/metaheader.jsp"%>
</head>
<body>


	<div class="col-right-top-memo">

		<h3>일일 메모</h3>

		<a class="" data-toggle="modal" href="#registerModal1"
			data-backdrop="static"><img onclick="printName()"
			class="edit_text" src="<c:url value="/images/icon/edit.png"/>"></a>
		<div class="memo-input-div">
			<textarea class="memo-input" id="memo-input-memo" type="text"
				readonly="readonly"></textarea>
		</div>

	</div>


	<div class="col-right-left">
		<h3>눈 바디</h3>
		<a class="" data-toggle="modal" href="#registerModal2"
			data-backdrop="static"><img onclick="printName()"
			class="edit_text" src="<c:url value="/images/icon/upload.png"/>"></a>
		<div class="memo-input-div-photo">


			<img class="imgc" id="memo-input-photo"><br>
		</div>

	</div>

	<div class="col-right-right">
		<h3>오늘의 체중</h3>
		<a class="" data-toggle="modal" href="#registerModal3"
			data-backdrop="static"> <img onclick="printName()"
			class="edit_text" src="<c:url value="/images/icon/edit.png"/>"></a>
		<div class="memo-input-div">
			<input class="input-kg" id="memo-input-kg" type="text"
				readonly="readonly"> <input class="input-kg-left"
				type="text" readonly="readonly" value="kg">
		</div>
	</div>


	<div class="col-right-right2">
		<h3>식단</h3>
		<a class="" data-toggle="modal" href="#registerModal4"
			data-backdrop="static"><img onclick="printName()"
			class="edit_text" src="<c:url value="/images/icon/edit.png"/>"></a>
		<div class="memo-input-div">
			<input class="memo-input" id="memo-input-food" type="text"
				readonly="readonly">
		</div>
	</div>
	<section>
		<div class="modal fade" id="registerModal1" tabindex="-1"
			role="dialog" aria-labelledby="modal4" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">

						<h3>일일 메모</h3>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="close">
							<span aria-hidden="true"> X </span>
						</button>

					</div>
					<form id="memoform" name="memoform" class="reg_form" method="post"
						action="<c:url value='/mypage/mypage3'/>">
						<div class="modal-body modal-mypage">
							<div class="content">
								<span class="left"></span> <span class="editor"> <textarea
										class="form-control memo_input" name="infocontent"
										id="infocontent" style="resize: none;"></textarea>
								</span>
							</div>

							<div class="btn modal-submit-btn">
								<button onClick="fn_review()" type="submit" class="btn"
									type="button">확인</button>
							</div>
							<input type="hidden" name="infodate" /> <input type="hidden"
								id="memidx" name="memidx" value="${memidx}" /> <input
								type="hidden" name="infotype" id="infotype" value="memo" />
						</div>
					</form>

				</div>
			</div>
		</div>

		<div class="modal fade" id="registerModal2" tabindex="-1"
			role="dialog" aria-labelledby="modal4" aria-hidden="true">
			<div class="modal-dialog modal-photo">
				<div class="modal-content modal-photo">
					<div class="modal-header">

						<h3>눈 바디</h3>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="close">
							<span aria-hidden="true"> X </span>
						</button>

					</div>
					<form method="post" class="modal-photo"
						action="<c:url value='/mypage/mypage4'/>"
						enctype="multipart/form-data">
						<div class="modal-body modal-mypage modal-photo">

							<!-- 	<div class="my-info profile_form"> -->
							<input type="button" value="사진업로드" class="profilebtn infophoto"
								name="infocontent" onclick=document.all.file.click();> <input
								type="file" name="infocontent" id="file" class="profilebtn"
								style="display: none;" />
							<div class="photo-margin display_none profileimg "
								id="image_container">
								<img class="imgc" id="memo-input-photo2"><br>
							</div>


							<div class="btn modal-submit-btn">
								<button onClick="fn_review()" type="submit" class="btn"
									type="button">확인</button>
							</div>
							<input type="hidden" name="infodate" /> <input type="hidden"
								id="memidx" name="memidx" value="${memidx}" /> <input
								type="hidden" name="infotype" id="infotype" value="photo" /> <input
								type="hidden" name="oldmemophoto" value="${memberList.memphoto}">


						</div>
					</form>
				</div>
			</div>
		</div>

		<div class="modal fade" id="registerModal3" tabindex="-1"
			role="dialog" aria-labelledby="modal4" aria-hidden="true">
			<div class="modal-dialog modal-kg">
				<div class="modal-content">
					<div class="modal-header">

						<h3>체중 입력</h3>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="close">
							<span aria-hidden="true"> X </span>
						</button>

					</div>
					<form class="reg_form3" method="post"
						action="<c:url value='/mypage/mypage3'/>">
						<div class="modal-body modal-mypage">

							<div class="content">
								<span class="editor"> <textarea
										class="form-control memo_input" name="infocontent"
										id="infocontent" style="resize: none;"></textarea>

								</span>
								<div class="modal-kg-kg">
									<h1>kg</h1>
								</div>


							</div>

							<div class="btn modal-submit-btn">
								<button onClick="fn_review()" type="submit" class="btn"
									type="button">확인</button>

							</div>
							<input type="hidden" name="infodate" /> <input type="hidden"
								id="memidx" name="memidx" value="${memidx}" /> <input
								type="hidden" name="infotype" id="infotype" value="kg" />
						</div>
					</form>
				</div>
			</div>
		</div>

		<div class="modal fade" id="registerModal4" tabindex="-1"
			role="dialog" aria-labelledby="modal4" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">

						<h3>식단</h3>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="close">
							<span aria-hidden="true"> X </span>
						</button>

					</div>
					<form class="reg_form4" method="post"
						action="<c:url value='/mypage/mypage3'/>">
						<div class="modal-body modal-mypage">

							<div class="content">
								<span class="left"></span> <span class="editor"> <textarea
										class="form-control" name="infocontent" id="infocontent"
										style="resize: none;"></textarea>
								</span>
							</div>
							<div class="btn modal-submit-btn">
								<button onClick="fn_review()" type="submit" class="btn"
									type="button">확인</button>
							</div>
							<input type="hidden" name="infodate" /> <input type="hidden"
								id="memidx" name="memidx" value="${memidx}" /> <input
								type="hidden" name="infotype" id="infotype" value="food" />

						</div>
					</form>
				</div>
			</div>
		</div>
	</section>


</body>


<script>
	function readInputFile(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#image_container').html("<img src="+ e.target.result +">");
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	$(".profilebtn").on('change', function() {
		readInputFile(this);
	});
</script>
</html>
