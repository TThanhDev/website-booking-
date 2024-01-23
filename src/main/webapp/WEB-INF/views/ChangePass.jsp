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

<script>
	function validateForm() {
		// Lấy giá trị của mật khẩu và mật khẩu nhập lại từ các trường input
		var password = document.getElementById("password").value;
		var confirmPassword = document.getElementById("confirmPassword").value;

		// Kiểm tra xem mật khẩu và mật khẩu nhập lại có giống nhau hay không
		if (password !== confirmPassword) {
			// Hiển thị thông báo lỗi và ngăn chặn form từ việc submit
			document.getElementById("confirmPasswordError").innerHTML = "Mật khẩu và mật khẩu nhập lại không khớp";
			return false;
		} else {
			// Nếu giống nhau, xóa thông báo lỗi và cho phép form submit
			document.getElementById("confirmPasswordError").innerHTML = "";
			return true;
		}
	}
</script>
</head>
<body>

	<div class="body_manager">

		<div class="container">
			<h2 class="title">ĐỔI MẬT KHẨU</h2>
			<form:form action="savePass" modelAttribute="account"
				method="POST" class="form" onsubmit="return validateForm()">
				<input type="hidden" name="userId" value="${sessionScope.USERID}">
				<form:hidden class="row_2" path="username"
									value="${username}" />
				<table>
					<tbody>
						<tr>
							<td class="row_1"><label>Tài khoản</label></td>
							<td><p>${sessionScope.USERNAME}</p></td>
						</tr>
						<tr>
							<td class="row_1"><label>Mật khẩu mới</label></td>
							<td><form:input class="row_2" path="password" id="password" />
								<form:errors path="password" cssClass="error" /></td>
						</tr>
						<tr>
							<td class="row_1"><label>Nhập lại Mật khẩu mới</label></td>
							<td><input class="row_2" name="confirmPassword"
								id="confirmPassword" />
								<div id="confirmPasswordError" class="error"></div></td>
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