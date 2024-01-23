<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>USER MANAGER</title>
<link type="text/css" rel="stylesheet"
	href="/resources/css/styleAddUserForm.css" />
<body>
</head>
<body>

	<div class="body_manager">

		<div class="container">
			<h2 class="title">THÔNG TIN NGƯỜI DÙNG</h2>
			<form:form action="saveUserNotAdmin" modelAttribute="user"
				method="POST" class="form">
				<form:hidden path="userId" />
				<table>
					<tbody>					
						<tr>
							<td class="row_1"><label>Full name</label></td>
							<td><form:input path="fullName" class="row_2" /> <form:errors
									path="fullName" cssClass="error" /></td>
						</tr>
						<tr>
							<td class="row_1"><label>Email</label></td>
							<td><form:input path="email" class="row_2" /> <form:errors
									path="email" cssClass="error" /></td>
						</tr>
						<tr>
							<td class="row_1"><label>Phone</label></td>
							<td><form:input path="phone" class="row_2" /> <form:errors
									path="phone" cssClass="error" /></td>
						</tr>
						<tr>
							<td class="row_1"><label>Address</label></td>
							<td><form:input path="address" class="row_2" /></td>
						</tr>
						<tr>
							<td><label></label></td>
							<td><input type="submit" value="Lưu" class="save" /></td>
						</tr>

					</tbody>
				</table>

			</form:form>


			<div>
				<p>
					<a href="http://localhost:8080/" class="back">Quay lại</a>
				</p>
			</div>

		</div>



	</div>

</body>
</html>