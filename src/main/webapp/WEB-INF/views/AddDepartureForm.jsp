<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEPARTURE MANAGER</title>
<link type="text/css" rel="stylesheet"
	href="/resources/css/styleAddUserForm.css" />
<body>
</head>
<body>

	<div class="body_manager">

		<div class="container">
			<h2 class="title">ĐĂNG KÝ ĐIỂM ĐI</h2>
			<form:form action="saveDepartute" modelAttribute="departure" method="POST"
				class="form">
				<form:hidden path="departureId" />
				
				<table>
					<tbody>
					<tr>
					
						
						<td class="row_1"><label>Điểm đến mới</label></td>
						<td> <form:input type="text"  class="row_2" path="location"/></td>
						
						</tr>
							<br>
						
						<tr>
							<td><label></label></td>
							<td><input type="submit" value="Lưu" class="save" /></td>
						</tr>


					</tbody>
				</table>

			</form:form>
			

			<div>
				<p>
					<a href="${pageContext.request.contextPath}/Departure/showDeparture"
						class="back">Quay lại</a>
				</p>
			</div>

		</div>



	</div>

</body>
</html>