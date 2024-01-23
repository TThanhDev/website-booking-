<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> -->

<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/Login.css">
<!-- <link rel="stylesheet" href="font.css"> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- <script src="js/bootstrap.min.js.map"></script> -->
<script src="js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<title>Dang nhap</title>
</head>
<body>


	<div class="containerx">
		<div class="image-container"></div>
		<div class="login-container">
			<a href="http://localhost:8080/" style="text-decoration: none;">
				<h3 style="margin-top: 90px; color: #000">
					Travelor<span style="color: rgb(59, 14, 238);">.co</span>
				</h3>
			</a>
			<h2 style="margin-top: 30px;">Đăng nhập</h2>
			<form action="/user/login" method="post">
				<div class="form-group "
					style="margin-left: 95px; margin-top: 50px;">
					<label for="email" style="font-family: Inter;">Email:</label> <input
						type="text" class="form-control" id="email" name="username"
						placeholder="abc@gmail.com"
						style="font-family: Inter; font-weight: 700; width: 380px; height: 40px;">

					<!-- <img src="..//WebDuLich/img/eye-crossed 1.svg" alt=""> -->
				</div>
				<div class="form-group" style="margin-left: 95px;">
					<label for="password" style="font-family: Inter;">Mật khẩu:</label>
					<input type="password" class="form-control" id="password"
						name="password" placeholder="**********"
						style="font-family: Inter; font-weight: 700; width: 380px; height: 40px;">
					<div id="toggle" onclick="showPassword"></div>
				</div>
				<div style="margin-left: 95px;">
					<p style="color: red">${ERROR}</p>
				</div>

				<div class="Checkbox" style="margin-left: 95px;">
					<input name="checkbox" type="checkbox" value="Nhớ mật khẩu"><span
						class="remember ml-2" style="font-family: Inter;">Nhớ đăng
						nhập</span> <a href="http://localhost:8080/Account/showFormForgot"
						class="Link"
						style="color: black; font-family: Inter; margin-left: 117px;">Quên
						mật khẩu?</a>
				</div class="Button">
				<button type="submit" class="btn btn-primary"
					style="background-color: rgb(59, 14, 238); font-family: Inter; font-weight: bold; margin-top: 40px; margin-left: 95px; height: 45px; width: 135px; font-size: 20px;">Đăng
					nhập</button>
				<button type="button" class="btn btn-secondary ml-2"
					onclick="window.location.href='http://localhost:8080/user/showFormRegister'; return false;"
					style="background-color: rgb(255, 255, 255); border: 2px solid rgb(59, 14, 238); width: 118px; margin-top: 40px; margin-left: 30px; font-family: Inter; font-weight: 700; height: 45px; width: 135px; font-size: 20px;">
					<span style="color: rgb(59, 14, 238);">Đăng ký</span>
				</button>
				<!-- Nút Đăng ký mới -->

				<div class="Or" style="margin-top: 35px; margin-left: 95px;">
					<a style="margin-right: 20px; font-family: Inter;">Hoặc đăng
						nhập bằng <img src="/resources/library/icon/Gmail1.svg" alt=""
						class="icon ml-2"> <img
						src="/resources/library/icon/Facebook1.svg" alt=""
						class="icon2 ml-3"> <img
						src="/resources/library/icon/GG1.svg" alt="" class="icon3 ml-3">
					</a>
				</div>
			</form>

		</div>
	</div>

</body>
</head>
<script>
	const password = document.getElementById('password');
	const toggle = document.getElementById('toggle');

	function showPassword() {
		if (password.type === 'password') {
			password.setAttribute('type', 'text');
			toggle.classList.add('hide');

		} else {
			password.setAttribute('type', 'password');
			toggle.classList.remove('hide');
		}
	}
</script>
</html>