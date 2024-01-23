<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thanh toán thành công</title>
<link rel="stylesheet" href="/resources/css/stylePaySucsess.css">
</head>
<body>
	<div class="div">
		<div class="div-2"></div>
		<div class="div-3">
			<div class="div-4">
				<div class="div-5">
					<div class="div-6">
						<img loading="lazy"
							srcset="https://cdn.builder.io/api/v1/image/assets/TEMP/dc383d1c-e07e-42df-b6a3-2a00ed49f5a4?apiKey=4199bce945f94ca8b074b87433b64698&width=100 100w, https://cdn.builder.io/api/v1/image/assets/TEMP/dc383d1c-e07e-42df-b6a3-2a00ed49f5a4?apiKey=4199bce945f94ca8b074b87433b64698&width=200 200w, https://cdn.builder.io/api/v1/image/assets/TEMP/dc383d1c-e07e-42df-b6a3-2a00ed49f5a4?apiKey=4199bce945f94ca8b074b87433b64698&width=400 400w, https://cdn.builder.io/api/v1/image/assets/TEMP/dc383d1c-e07e-42df-b6a3-2a00ed49f5a4?apiKey=4199bce945f94ca8b074b87433b64698&width=800 800w, https://cdn.builder.io/api/v1/image/assets/TEMP/dc383d1c-e07e-42df-b6a3-2a00ed49f5a4?apiKey=4199bce945f94ca8b074b87433b64698&width=1200 1200w, https://cdn.builder.io/api/v1/image/assets/TEMP/dc383d1c-e07e-42df-b6a3-2a00ed49f5a4?apiKey=4199bce945f94ca8b074b87433b64698&width=1600 1600w, https://cdn.builder.io/api/v1/image/assets/TEMP/dc383d1c-e07e-42df-b6a3-2a00ed49f5a4?apiKey=4199bce945f94ca8b074b87433b64698&width=2000 2000w, https://cdn.builder.io/api/v1/image/assets/TEMP/dc383d1c-e07e-42df-b6a3-2a00ed49f5a4?apiKey=4199bce945f94ca8b074b87433b64698&"
							class="img" />
					</div>
					<div class="div-7">Đặt thành công</div>
					<div class="div-8">
						<div class="div-9">
							<p>Chúng tôi đã gửi thông tin chi tiết về email:</p>
						</div>
						<div class="div-10">
							<p>${acc.email}</p>
						</div>
					</div>
					<div class="div-11"></div>
				</div>
				<div class="div-12"></div>
			</div>
			<div class="div-13">
				<div class="div-14">
					<div class="div-15">Mã khách hàng</div>
					<div class="div-16">Tên khách hàng</div>
					<div class="div-17">Email</div>
					<div class="div-18">Số điện thoại</div>
					<!-- <div class="div-19">Số tiền thanh toán</div> -->
				</div>
				<div class="div-20">
					<div class="div-21">${sessionScope.USERID}</div>
					<div class="div-22">
						<div class="div-23">${acc.fullName}</div>
						<div class="div-24">${acc.email}</div>
						<div class="div-25">${acc.phone}</div>
					</div>
					<!-- <div class="div-26">2.900.000đ</div> -->
				</div>
			</div>
		</div>
	</div>
	<div
		style="margin-top: 50px; margin-left: 50px; width: 150px; height: 50px;">
		<button onclick="window.location.href ='http://localhost:8080/';return false;"
			style="width: 130px; height: 40px; background-color: #3B0EEE; color: #fff;">Trở
			lại trang chủ</button>
	</div>
</body>
</html>