<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/ComboDetail.css">
<link type="text/css" rel="stylesheet"
	href="/resources/css/Header_Footer.css">

<!-- <link rel="stylesheet" href="/resources/css/introduce.css"> -->
<link rel="stylesheet" href="..//css/contact.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<script src="/resources/library/bootstrap/js/bootstrap.bundle.min.js"></script>
<script
	src="/resources/library/swiper/cdn.jsdelivr.net_npm_swiper@10.2.0_swiper-element-bundle.min.js"></script>
<script
	src="/resources/library/swiper/cdn.jsdelivr.net_npm_swiper@10.2.0_swiper-bundle.min.js"></script>
</head>
<body>
	<div class="menu_header">
		<div class="logo col-sm-2">
			<img src="/resources/img/Logo.png" alt="logo">
		</div>
		<div class="menu col-sm-8 navbar"
			style="display: flex; align-items: center; justify-content: center;">
			<ul class="menu_list navbar-nav">
				<li class="menu_item nav-item"><a class="nav-link"
					href="http://localhost:8080/">Trang chủ</a></li>
				<li class="menu_item nav-item dropdown"><a
					class=" dropdown-toggle" href="#" role="button"
					id="dropdownMenuLink" data-bs-toggle="dropdown"
					aria-expanded="false"> Du lịch </a>
					<ul style="position: absolute;" class="dropdown-menu"
						aria-labelledby="dropdownMenuLink">
						<li><a class="dropdown-item"
							href="http://localhost:8080/Tour/resultSearchTour">Tour</a></li>
						<li><a class="dropdown-item"
							href="http://localhost:8080/Combo/comBoTours">Combo Tour</a></li>
					</ul></li>
				<li class="menu_item nav-item"><a class="nav-link"
					href="http://localhost:8080/TinTuc">Tin tức</a></li>
				<li class="menu_item nav-item"><a class="nav-link"
					href="http://localhost:8080/LienHe">Liên hệ</a></li>
				<li class="menu_item nav-item"><a class="nav-link"
					href="http://localhost:8080/KhuyenMai">Khuyến mãi</a></li>
				<c:if
					test="${not empty sessionScope.USERID and sessionScope.ROLEUSER eq 'A'}">
					<li class="menu_item nav-item"><a class="nav-link"
						href="http://localhost:8080/user/showUsers">Quản lý</a></li>
				</c:if>
			</ul>
		</div>
		<div class="btnLogin_Cart col-sm-2">
			<c:if test="${ empty sessionScope.USERID}">
				<input type="button" value="Đăng nhập"
					onclick="window.location.href='login';return false;">
			</c:if>
			<c:if test="${not empty sessionScope.USERID}">
				<li class="menu_item nav-item dropdown"><a class="nav-link"
					href="#" role="button" id="dropdownMenuLink"
					data-bs-toggle="dropdown" aria-expanded="false"> <img
						alt="account" src="/resources/library/icon/account.svg">
				</a>
					<ul style="position: absolute;"
						class="dropdown-menu dropdown-menu-end"
						aria-labelledby="dropdownMenuLink">
						<li><a class="dropdown-item"
							href="http://localhost:8080/user/updateUsersNotAdmin?userId=${sessionScope.USERID}">Thông
								tin tài khoản</a></li>
						<li><a class="dropdown-item"
							href="http://localhost:8080/Account/showFormAccount?USERNAME=${sessionScope.USERNAME}">Đổi
								mật khẩu</a></li>
						<li><a class="dropdown-item"
							href="http://localhost:8080/user/logout">Đăng xuất</a></li>
					</ul></li>
			</c:if>
			<a href="http://localhost:8080/Cart/showCart"> <img
				src="/resources/library/icon/Cart.svg" alt="cart">
			</a>
			<c:if test="${not empty sessionScope.userCart }">
				<img style="position: absolute; width: 12px; height: 12px" alt="red"
					src="/resources/library/icon/red.svg">
			</c:if>
		</div>
	</div>

	<div class="content" style="height: 1300px; width: 1440px">
		<div class="title_contact">
			<h1 style="font-family: Inter">Liên hệ</h1>
			<p>Để có thể đáp ứng được các yêu cầu và các ý kiến đóng góp của
				quý vị một cách nhanh chóng xin vui lòng liên hệ</p>

		</div>
		<div class="row mb-3" style="margin-top: 50px;">
			<div class="col-12 col-md-7 mb-5" style="padding: 70px;">
				<h3 style="color: red; font-family: Inter">Gửi thông tin</h3>
				<form action="senEmail" id="SendEmail"
					style="font-size: 20px; display: grid; grid-template-columns: auto auto; gap: 20px;">
					<div class="col-12 col-md-4">
						<div class=" mb-3">
							<label for="" style="width: 130px;">Loại thông tin</label> <select
								name="Type" id=""
								style="border-radius: 5px; border: 1px solid rgb(203, 203, 203); height: 35px;">
								<option value="1">Du lịch</option>
								<option value="2">Chăm sóc khách hàng</option>
								<option value="3">Liên hệ thông tin khác</option>
							</select>
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="mb-3">
							<label for="">SĐT<span
								style="color: red; font-family: Inter;">*</span></label> <br> <input
								type="tel" placeholder="0000000000"
								style="border-radius: 5px; border: 1px solid rgb(203, 203, 203); height: 35px;">
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="mb-3">
							<label for="">Họ tên<span style="color: red;">*</span></label> <input
								type="text" placeholder="abc"
								style="border-radius: 5px; border: 1px solid rgb(203, 203, 203); height: 35px;">
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="mb-3">
							<label for="">Email<span style="color: red;">*</span></label> <br>
							<input type="email" placeholder="user@abc.com"
								style="border-radius: 5px; border: 1px solid rgb(203, 203, 203); height: 35px;">
						</div>
					</div>
					<div class="col-12" style="grid-column: span 2;">
						<div class="mb-3">
							<label for="">Địa chỉ</label> <br> <input type="text"
								placeholder="abc"
								style="border-radius: 5px; border: 1px solid rgb(203, 203, 203); width: 600px; height: 35px;">
						</div>
					</div>
					<div class="col-12" style="grid-column: span 2;">
						<div class="mb-3">
							<label for="textNoidung">Nội dung</label> <br>
							<textarea name="" id="textNoidung" cols="54" rows="5"
								style="border-radius: 5px; border: 1px solid rgb(203, 203, 203);"></textarea>
						</div>
					</div>
					<div class="btnSend">
						<button type="submit" class="btn btn-primary"
							style="background-color: rgb(59, 14, 238);">
							Gửi đi <i class="fa fa-paper-plane" aria-hidden="true"></i>
						</button>
					</div>
				</form>
			</div>
			<div class="info_content2 col-12 col-md-5" style="padding: 68px;">
				<h3 style="color: red;">Gửi thông tin</h3>
				<div class="warpper bg-light p-4"
					style="border-radius: 6px; font-size: 15px; font-family: Inter;">
					<h3>Khu vực Thành Phố Hồ Chí Minh</h3>
					<div class="item" style="margin-top: 20px;">
						<h3>Trụ sở chính</h3>
						<p>
							190 Pasteur, P. Võ Thị Sáu, Q.3, Tp. Hồ Chí Minh, Việt Nam <br>
							Tel: (84-28) 38 668 999 (20 lines) <br> Fax: (84-28) 38 29
							9142 <br> Email: info@vietravel.com -
							info.asia@vietravel.com (English Support)
						</p>
					</div>
					<div class="item" style="margin-top: 20px;">
						<h3>Trụ sở chính</h3>
						<p>
							190 Pasteur, P. Võ Thị Sáu, Q.3, Tp. Hồ Chí Minh, Việt Nam <br>
							Tel: (84-28) 38 668 999 (20 lines) <br> Fax: (84-28) 38 29
							9142 <br> Email: info@vietravel.com -
							info.asia@vietravel.com (English Support)
						</p>
					</div>
					<div class="item" style="margin-top: 20px;">
						<h3>Trụ sở chính</h3>
						<p>
							190 Pasteur, P. Võ Thị Sáu, Q.3, Tp. Hồ Chí Minh, Việt Nam <br>
							Tel: (84-28) 38 668 999 (20 lines) <br> Fax: (84-28) 38 29
							9142 <br> Email: info@vietravel.com -
							info.asia@vietravel.com (English Support)
						</p>
					</div>
					<div class="item" style="margin-top: 20px;">
						<h3>Trụ sở chính</h3>
						<p>
							190 Pasteur, P. Võ Thị Sáu, Q.3, Tp. Hồ Chí Minh, Việt Nam <br>
							Tel: (84-28) 38 668 999 (20 lines) <br> Fax: (84-28) 38 29
							9142 <br> Email: info@vietravel.com -
							info.asia@vietravel.com (English Support)
						</p>
					</div>
				</div>
			</div>

		</div>
	</div>
	<div class="footer">
		<div class="footer_content1 row">
			<div class="content_detail col-xl">
				<div class="detail_header">
					<h4>Du lịch trong nước</h4>
				</div>
				<div class="detail_link">
					<a href="">Hạ Lọng</a> <a href="">Ninh Bình</a> <a href="">Đà
						Nẵng</a> <a href="">Hội An</a>
				</div>
			</div>
			<div class="content_detail col-xl">
				<div class="detail_header">
					<h4>Du lịch nước ngoài</h4>
				</div>
				<div class="detail_link">
					<a href="">Ấn Độ</a> <a href="">Hàn Quốc</a> <a href="">Úc</a> <a
						href="">Singapore</a>
				</div>
			</div>
			<div class="content_detail col-xl">
				<div class="detail_header">
					<h4>Dòng Tour</h4>
				</div>
				<div class="detail_link">
					<a href="">Cao cấp</a> <a href="">Tiêu chuẩn</a> <a href="">Tiết
						kiệm</a> <a href="">Giá tốt</a>
				</div>
			</div>
			<div class="content_detail col-xl">
				<div class="detail_header">
					<h4>Ứng dụng di động</h4>
				</div>
				<div class="detail_app">
					<div class="app_android">
						<p>Android</p>
						<a href=""> <img src="/resources/library/icon/android.svg"
							alt="">
						</a>
					</div>
					<div class="app_ios">
						<p>IOS</p>
						<a href=""> <img src="/resources/library/icon/ios.svg" alt="">
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="footer_content2 row">
			<div class="content_detail2 col-xl">
				<div class="detail_header">
					<h4>Liên hệ</h4>
				</div>
				<div class="detail_link">
					<a href="">190 Pasteur, Phường Võ Thị Sáu, Quận 3, TPHCM</a> <a
						href="">(+84 28) 3822 8898</a> <a href="">(+84 28) 3829 9142</a> <a
						href="">info@travelco.com</a>
				</div>
			</div>
			<div class="content_detail2 col-xl">
				<div class="detail_header">
					<h4>Thông tin</h4>
				</div>
				<div class="detail_link">
					<a href="">Tạp chí du lịch</a> <a href="">Tin tức</a> <a href="">Site
						map</a> <a href="">Chính sách quyền riêng tư</a> <a href="">Thỏa
						thuận sử dụng</a>
				</div>
			</div>
			<div class="content_detail2 col-xl">
				<div class="detail_header">
					<h4>Chứng nhận</h4>
				</div>
				<div class="detail_link">
					<a href=""> <img class="chungnhan1" src="../img/chungnhan1.png"
						alt="">
					</a> <a href=""> <img src="../img/chungnhan2.png" alt="">
					</a>
				</div>
			</div>
			<div class="content_detail2 col-xl">
				<div class="detail_header">
					<h4>Chứng nhận thanh toán</h4>
				</div>
				<div class="detail_link">
					<div class="thanhtoan_row">
						<a href=""> <img src="../img/thanhtoan (1).png" alt="">
						</a> <a href=""> <img style="padding-left: 20px;"
							src="../img/thanhtoan (2).png" alt="">
						</a>
					</div>
					<div class="thanhtoan_row">
						<a href=""> <img src="../img/thanhtoan (3).png" alt="">
						</a> <a href=""> <img style="padding-left: 20px;"
							src="../img/thanhtoan (4).png" alt="">
						</a>
					</div>
					<div class="thanhtoan_row">
						<a href=""> <img src="../img/thanhtoan (5).png" alt="">
						</a> <a href=""> <img style="padding-left: 20px;"
							src="../img/thanhtoan (6).png" alt="">
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="footer_content3 row">
			<div class="content_detail col-xl">
				<div class="detail_header">
					<h4>Mạng xã hội</h4>
				</div>
				<div class="mxh">
					<a href=""> <img src="/resources/library/icon/facebook.svg"
						alt="">
					</a> <a href=""> <img src="/resources/library/icon/ins.svg" alt="">
					</a> <a href=""> <img src="/resources/library/icon/youtube.svg"
						alt="">
					</a> <a href=""> <img src="/resources/library/icon/mxh.svg" alt="">
					</a>
				</div>
			</div>
			<div class="content_detail col-xl">
				<div class="detail_header">
					<h4>Hot Line</h4>
				</div>
				<div class="detail_hotline">
					<input type="button" value="1900 1113"> <img
						src="/resources/library/icon/phone.svg" alt="">
				</div>
				<p>Từ 8:00 - 22:00 hàng ngày</p>
			</div>
			<div class="content_detail col-xl">
				<div class="detail_header">
					<h4>Nhận tin qua Email</h4>
				</div>
				<div class="detail_input">
					<form action="">
						<input type="email" placeholder="nhập email ..."> <img
							src="/resources/library/icon/email.svg" alt=""> <input
							type="button" value="Gửi">
					</form>
				</div>
			</div>
			<div class="content_detail col-xl">
				<div class="detail_header">
					<h5>n</h5>
				</div>
				<div class="detail_app"></div>
			</div>
		</div>
	</div>
	<div class="giayphep">
		<p>Số giấy phép kinh doanh lữ hành Quốc tế: 79-234/2014/TCDL-GP
			LHQT</p>
	</div>
</body>
</html>