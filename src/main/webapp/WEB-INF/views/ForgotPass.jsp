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

</head>
<body>

	<div class="body_manager">

		<div class="container">
			<h2 class="title">QUÊN MẬT KHẨU</h2>
			<p>Chúng tôi sẽ gửi mật khẩu mới vào gmail của bạn</p>
			<form action="sendPass" method="get">
				<table>
					<tbody>
						<!-- <tr>
							<td class="row_1"><label>Nhập Email</label></td>
							<td> <input class="row_2" name="emailUser"></td>
						</tr> -->
						<tr>
							<td class="row_1"><label>Nhập tài khoản</label></td>
							<td><input class="row_2" name="userName"></td>
						</tr>
						<tr>
							<td><label></label></td>
							<td><input type="submit" value="Gửi" class="save" /></td>
						</tr>
					</tbody>
				</table>
			</form>
			<div>
				<p>
					<a href="http://localhost:8080/login" class="back">Quay lại</a>
				</p>
			</div>

		</div>
	</div>
</body>
</html>