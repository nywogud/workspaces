<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Dash board</title>

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(
			function() {
				$('#button1').click(
						function() {
							$.ajax({
								type : "POST",
								url : "${contextPath}/sucResultNum",
								success : function(result) {
									$("#convertChart").empty();
									$("#convertChart").append(result);
								},

								error : function(request, status, error) {
									alert("code = " + request.status
											+ "message = "
											+ request.responseText + "error = "
											+ error);
								}
							});
						});
			});
</script>

<script type="text/javascript">
	$(document).ready(
			function() {
				$('#button2').click(
						function() {
							$.ajax({
								type : "POST",
								url : "${contextPath}/failResultNum",
								success : function(result) {
									$("#convertChart").empty();
									$("#convertChart").append(result);
								},

								error : function(request, status, error) {
									alert("code = " + request.status
											+ "message = "
											+ request.responseText + "error = "
											+ error);
								}
							});
						});
			});
</script>

<script type="text/javascript">
	$(document).ready(
			function() {
				$('#button3').click(
						function() {
							$.ajax({
								type : "POST",
								url : "${contextPath}/sucPerFail",
								success : function(result) {
									$("#convertChart").empty();
									$("#convertChart").append(result);
								},

								error : function(request, status, error) {
									alert("code = " + request.status
											+ "message = "
											+ request.responseText + "error = "
											+ error);
								}
							});
						});
			});
</script>

</head>
<body>
	<h2>Hello World</h2>
	<input style="display: inline-block;" type="button" id="button1" value="??????1" />
	<input style="display: inline-block;" type="button" id="button2" value="??????2" />
	<input style="display: inline-block;" type="button" id="button3" value="??????3" />

	<form style="display: inline-block; float:right;" method="POST" action="fileUpload" enctype="multipart/form-data">
		<input name="fileCsv" type="file" placeholder="CVS?????? ?????????" /> 
		<input type="submit" name="upload" value="CSV?????? ?????????"/>
	</form>

	<div>

		<script type="text/javascript"
			src="https://www.gstatic.com/charts/loader.js"></script>
		<!-- ?????? ????????? ?????? ?????? ??????. ?????? 1??? -->
		${script1String}
		<div style="display: inline-block; width: 600px; height: 350px;"
			id="numAttem"></div>

		<!-- ????????? ?????? ??? ?????? ?????? ??????(???????????? ?????? 1) -->
		<div id="convertChart" style="display: inline-block;">${scriptButton1}</div>

	</div>

	<br>

	<div>
		<!-- ?????? ?????? ?????? ??????. ?????? 2??? -->
		${script2String}
		<div id="countNumAttem"
			style="display: inline-block; width: 600px; height: 300px;"></div>

		<!-- ?????? ????????? ???????????? ??? -->
		<div style="display: inline-block">
			<table border="1">
				<tr>
					<th>??????</th>
					<th style="width: 200px;">????????????</th>
					<th style="width: 200px;">????????????</th>
				</tr>

				<c:forEach var="list" items="${numAttemWithRowNum}">
					<tr>
						<td><c:out value="${list.rowNum}" /></td>
						<td style="width: 200px;"><c:out value="${list.method}" /></td>
						<td style="width: 200px;"><c:out value="${list.numAttem}" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>