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
			<h2 class="title">ĐĂNG KÝ NGƯỜI DÙNG</h2>
			<form:form action="saveUser" modelAttribute="userAccount" method="POST"
				class="form">
				<form:hidden path="user.userId" />
				<form:hidden path="account.role"/>
				<table>
					<tbody>
					<tr>
					
						
						<td class="row_1"><label>Tài khoản</label></td>
						<td> <form:input class="row_2" path="account.username"/> <form:errors path="account.username" cssClass="error" /> ${ERROR}</td>
						</tr>
							<br>
						<tr>
						<td class="row_1"><label>Mật khẩu</label></td>
						<td> <form:input class="row_2" path="account.password"/> <form:errors path="account.password" cssClass="error" /></td>
							
					
					</tr>
						<tr>
							<td class="row_1"><label>Full name</label></td>
							<td><form:input path="user.fullName" class="row_2" /><form:errors path="user.fullName" cssClass="error" /></td>
						</tr>
						<tr>
							<td class="row_1"><label>Email</label></td>
							<td><form:input path="user.email" class="row_2" /><form:errors path="user.email" cssClass="error" /></td>
						</tr>
						<tr>
							<td class="row_1"><label>Phone</label></td>
							<td><form:input path="user.phone" class="row_2" /><form:errors path="user.phone" cssClass="error" /></td>
						</tr>
						<tr>
							<td class="row_1"><label>Address</label></td>
							<td><form:input path="user.address" class="row_2" /></td>
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
					<a href="${pageContext.request.contextPath}/user/showUsers"
						class="back">Quay lại</a>
				</p>
			</div>

		</div>



	</div>

</body>
</html>