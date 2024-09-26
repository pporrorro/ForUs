<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지-Help지원</title>
<!-- table -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<link href="./css/my/mycommon.css" rel="stylesheet" type="text/css">
</head>
<style>
.support {
	font-weight: bold;
	color: #03C75A;
}


.support {
	font-weight: bold;
	color: #03C75A;
}

.mypage {
	font-weight: bold;
	color: #03C75A;
}
</style>

<body>
	<%@ include file="../mainmypage.jsp"%>
	<div class="mypage-content-list">
		<div class="mytitle">
			<p>Help 지원</p>
		</div>
					<c:choose>
            <c:when test="${not empty myApplyList}">
		<div class="listcnt">
			<p>총 ${myApplyList.size()}건</p>
		</div>
		<table class="table table-hover mytable">
			<thead>
				<tr>
					<th class="center">지원일</th>
					<th class="center">제목</th>
					<th class="center">게재상태</th>
					<th class="center">지원상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${myApplyList }" var="apply">
					<tr
						onclick="location.href='./recruitApplyDetailpage?apply_id=${apply.apply_id}'">
						<td class="applytable-td1">${apply.apply_date }</td>
						<td class="applytable-td2">${apply.apply_title }</td>
						<td class="applytable-td3">${apply.post_status }</td>
						<c:choose>
							<c:when test="${apply.apply_status eq '지원완료'}">
								<td>
									<form action="myApplyList" method="POST" style="display: inline;" class="align-items_center">
										<input type="hidden" name="apply_id" value="${apply.apply_id}" />
										<button class="minibtn center" type="submit">취소하기</button>
									</form>
								</td>
							</c:when>
							<c:otherwise>
								<td style="text-align: center;"><p>${apply.apply_status}</p></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			            </c:when>
            <c:otherwise>
            <div align="center">
                <br><br><br>
                <img src="https://img.icons8.com/?size=100&id=nqFv5FwmrPCR&format=png">
                <br><br>
                <p>당신의 지원을 기다리고 있어요</p>
                </div>
            </c:otherwise>
		</c:choose>
	</div>
	<br><br>
</body>
</html>