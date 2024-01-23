<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tin tức</title>
<!-- link css -->
<!-- <link rel="stylesheet" href="/resources/css/Header_Footer.css"> -->
<link rel="stylesheet" href="/resources/css/styleC.css">

<link type="text/css" rel="stylesheet"
	href="/resources/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="/resources/css/Result.css">
<!-- <link rel="stylesheet" href="/resources/css/Home.css"> -->
<link type="text/css" rel="stylesheet"
	href="/resources/css/Header_Footer.css">
<script src="/resources/js/Result.js"></script>
<script src="/resources/library/bootstrap/js/bootstrap.bundle.min.js"></script>
<script
	src="/resources/library/swiper/cdn.jsdelivr.net_npm_swiper@10.2.0_swiper-element-bundle.min.js"></script>
<script
	src="/resources/library/swiper/cdn.jsdelivr.net_npm_swiper@10.2.0_swiper-bundle.min.js"></script>

<script src="/resources/library/bootstrap/js/bootstrap.bundle.min.js"></script>
<script
	src="/resources/library/swiper/cdn.jsdelivr.net_npm_swiper@10.2.0_swiper-element-bundle.min.js"></script>
<script
	src="/resources/library/swiper/cdn.jsdelivr.net_npm_swiper@10.2.0_swiper-bundle.min.js"></script>

<!-- link css swiper -->
<link rel="stylesheet"
	href="/resources/library/swiper/cdn.jsdelivr.net_npm_swiper@10.2.0_swiper-bundle.min.css">
<link rel="stylesheet"
	href="/resources/library/swiper/cdn.jsdelivr.net_npm_swiper@10.2.0_swiper.css">
<!-- link Bootstrap -->
<link rel="stylesheet"
	href="/resources/library/bootstrap/css/bootstrap.min.css">

<!-- link JS -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="../js/app.js"></script>
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
	<!-- 	<div class="link_bar">
		<a href="">Tin Tức >></a>
	</div> -->
	<div class="containerx">
		<div class="news">
			<h2 class="news-title">Tin tức du lịch</h2>
			<div class="popular-news">
				<div class="popular-main">
					<div class="media">
						<img
							src="https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"
							alt="" class="image" />
					</div>

					<div class="content">
						<span class="tag">Tin tức du lịch</span>
						<h3 class="title">Du lịch Đà Lạt trải nghiệm cầu kính Ngàn
							Thông 7D - tọa độ sống ảo mới siêu mê</h3>
						<span class="date">08/09/2023</span>
					</div>
				</div>
				<div class="popular-others">
					<div class="popular-item">
						<div class="media">
							<img
								src="https://images.unsplash.com/photo-1488085061387-422e29b40080?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1031&q=80"
								alt="" class="image" />
						</div>

						<div class="content">
							<span class="tag">Tin tức du lịch</span>
							<h3 class="title">Lắng đọng mùa thu Toronto, thiên đường
								ngập tràn lá phong ở Canada</h3>
							<span class="date">08/09/2023</span>
						</div>
					</div>
					<div class="popular-item">
						<div class="media">
							<img
								src="https://images.unsplash.com/photo-1488085061387-422e29b40080?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1031&q=80"
								alt="" class="image" />
						</div>

						<div class="content">
							<span class="tag">Tin tức du lịch</span>
							<h3 class="title">Lắng đọng mùa thu Toronto, thiên đường
								ngập tràn lá phong ở Canada</h3>
							<span class="date">08/09/2023</span>
						</div>
					</div>
					<div class="popular-item">
						<div class="media">
							<img
								src="https://images.unsplash.com/photo-1488085061387-422e29b40080?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1031&q=80"
								alt="" class="image" />
						</div>

						<div class="content">
							<span class="tag">Tin tức du lịch</span>
							<h3 class="title">Lắng đọng mùa thu Toronto, thiên đường
								ngập tràn lá phong ở Canada</h3>
							<span class="date">08/09/2023</span>
						</div>
					</div>
				</div>
			</div>
			<div class="news-list">
				<div class="news-item">
					<div class="media">
						<img
							src="https://images.unsplash.com/photo-1539635278303-d4002c07eae3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
							alt="" class="image" />
					</div>
					<div class="content">
						<div class="title">Du lịch Đà Lạt trải nghiệm cầu kính Ngàn
							Thông 7D - tọa độ sống ảo mới siêu mê</div>
						<span class="tag">Tin tức du lịch</span>
						<p class="desc">Mùa thu, với những tán lá đỏ rực và không khí
							se se lạnh, là thời điểm lý tưởng để bạn khám phá vùng đất nổi
							tiếng với vẻ đẹp thiên nhiên hoang sơ của vùng Đông Bắc. Và trong
							danh sách những điểm đến không thể bỏ lỡ ở Cao Bằng, thác Bản
							Giốc chắc chắn xứng đáng với sự chú ý của bạn.</p>
					</div>
				</div>
				<div class="news-item">
					<div class="media">
						<img
							src="https://images.unsplash.com/photo-1539635278303-d4002c07eae3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
							alt="" class="image" />
					</div>
					<div class="content">
						<div class="title">Du lịch Đà Lạt trải nghiệm cầu kính Ngàn
							Thông 7D - tọa độ sống ảo mới siêu mê</div>
						<span class="tag">Tin tức du lịch</span>
						<p class="desc">Mùa thu, với những tán lá đỏ rực và không khí
							se se lạnh, là thời điểm lý tưởng để bạn khám phá vùng đất nổi
							tiếng với vẻ đẹp thiên nhiên hoang sơ của vùng Đông Bắc. Và trong
							danh sách những điểm đến không thể bỏ lỡ ở Cao Bằng, thác Bản
							Giốc chắc chắn xứng đáng với sự chú ý của bạn.</p>
					</div>
				</div>
				<div class="news-item">
					<div class="media">
						<img
							src="https://images.unsplash.com/photo-1539635278303-d4002c07eae3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
							alt="" class="image" />
					</div>
					<div class="content">
						<div class="title">Du lịch Đà Lạt trải nghiệm cầu kính Ngàn
							Thông 7D - tọa độ sống ảo mới siêu mê</div>
						<span class="tag">Tin tức du lịch</span>
						<p class="desc">Mùa thu, với những tán lá đỏ rực và không khí
							se se lạnh, là thời điểm lý tưởng để bạn khám phá vùng đất nổi
							tiếng với vẻ đẹp thiên nhiên hoang sơ của vùng Đông Bắc. Và trong
							danh sách những điểm đến không thể bỏ lỡ ở Cao Bằng, thác Bản
							Giốc chắc chắn xứng đáng với sự chú ý của bạn.</p>
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
					<a href=""> <img class="chungnhan1"
						src="/resources/img/chungnhan1.png" alt="">
					</a> <a href=""> <img src="/resources/img/chungnhan2.png" alt="">
					</a>
				</div>
			</div>
			<div class="content_detail2 col-xl">
				<div class="detail_header">
					<h4>Chứng nhận thanh toán</h4>
				</div>
				<div class="detail_link">
					<div class="thanhtoan_row">
						<a href=""> <img src="/resources/img/thanhtoan (1).png" alt="">
						</a> <a href=""> <img style="padding-left: 20px;"
							src="/resources/img/thanhtoan (2).png" alt="">
						</a>
					</div>
					<div class="thanhtoan_row">
						<a href=""> <img src="/resources/img/thanhtoan (3).png" alt="">
						</a> <a href=""> <img style="padding-left: 20px;"
							src="/resources/img/thanhtoan (4).png" alt="">
						</a>
					</div>
					<div class="thanhtoan_row">
						<a href=""> <img src="/resources/img/thanhtoan (5).png" alt="">
						</a> <a href=""> <img style="padding-left: 20px;"
							src="/resources/img/thanhtoan (6).png" alt="">
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