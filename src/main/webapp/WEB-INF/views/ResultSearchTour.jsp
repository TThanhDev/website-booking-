<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Travel.co</title>
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
</head>

<body>
	<div class="menu_header">
		<div class="logo col-sm-2">
			<img src="/resources/img/Logo.png" alt="logo">
		</div>
		<div class="menu col-sm-8 navbar">
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
					onclick="window.location.href='http://localhost:8080/login';return false;">
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
	<div class="containerx">

		<div class="row" style="margin-top: 30px; margin-bottom: 20px;">
			<ul class="wrapper">
				<li itemprop=""><a href="#">Du lịch</a></li> &raquo;
				<li><a href="#">Danh sách tour du lịch</a></li>
			</ul>
		</div>
		<div class="section">
			<div>
				<div class="section1">
					<div style="padding-left: 25px;">
						<h3 s>
							Lọc kết quả
							</h1>
					</div>
					<div class="first-row">
						<h5>Tour du lịch</h5>
					</div>

					<div class="section_filter" style="padding-left: 25px;">
						<div class="row-filter-2">
							<label>Loại tour</label><br>
							<div class="btn-group" role="group">
								<c:url var="Domestic" value="searchByInternationalType">
									<c:param name="type" value="Domestic" />
								</c:url>
								<c:url var="Foreign" value="searchByInternationalType">
									<c:param name="type" value="Foreign" />
								</c:url>
								<div>
									<button class="btn col" id=""
										onclick="window.location.href='${Domestic}'; return false;">Trong
										nước</button>
								</div>

								<div>
									<button class="btn col" id=""
										onclick="window.location.href='${Foreign}';return false;">Nước
										ngoài</button>
								</div>
							</div>
						</div>
						<form
							action="${pageContext.request.contextPath}/Tour/searchByDesADep"
							method="get">
							<div class="row-filter">
								<label>Khởi hành</label><br> <select name="departureId"
									id="departureId" class="custom-select">
									<option value="0" selected>--Tất cả--</option>
									<c:forEach var="tempDep" items="${LISTDEP}">
										<option value="${tempDep.departureId}">${tempDep.location}</option>
									</c:forEach>

								</select>
							</div>
							<div class="row-filter">
								<label>Điểm đến</label><br> <select name="destinationId"
									id="destinationId" class="custom-select">
									<option value="0" selected>--Chọn điểm đến--</option>
									<c:forEach var="tempDes" items="${LISTDES}">
										<option value="${tempDes.destinationId}">${tempDes.location}</option>
									</c:forEach>
								</select>

							</div>
							<div class="row-filter">
								<button class="btnSearch" id="" type="submit">Tìm kiếm</button>
							</div>
						</form>
					</div>
				</div>
				<div class="section2">
					<div style="display: flex; margin-top: 20px;">
						<div
							style="float: left; display: flex; width: 30%; justify-items: center; align-items: center;">
							<p>
								Chúng tôi tìm thấy <span
									style="font-weight: bold; color: #3B0EEE;">${SUM}</span> tour
							</p>
						</div>
						<div
							style="float: right; width: 250px; position: relative; right: -40%;">
							<span>sắp xếp theo</span> <select name="sapXep" id=""
								class="custom-select"
								style="width: 150px; height: 40px; text-align: center;">
								<option value="0" selected>--Tất cả--</option>
							</select>
						</div>
					</div>
					<div class="row row-cols-3" style="clear: both;">
						<c:forEach var="temp" items="${TOURS}">
							<c:url var="detailLink" value="/Tour/showTour">
								<c:param name="tourId" value="${temp.travelPackageId}"></c:param>
							</c:url>
							<c:url var="bookinglLink" value="/Tour/booking">
								<c:param name="tourId" value="${temp.travelPackageId}"></c:param>
							</c:url>
							<div class="item-card">
								<div class="card">
									<div class="card-img">
										<c:if test="${not empty temp.imagesList}">
											<a href="#"> <img class="card-avt"
												src="/resources/img/${temp.imagesList.iterator().next()}"
												alt="img">
										</c:if>
										</a> <a href="#"> <img class="card-icon"
											src="/resources/library/icon/favourite.svg" alt="">
										</a>
									</div>
									<div class="card-content">
										<div style="margin-bottom: 5px;">
											<div class="card-inf1">Giá tốt</div>
											<div class="card-inf2">
												Số chỗ còn <span style="color: red; margin-left: 10px;">${temp.availableSeats}</span>
											</div>
										</div>
										<div
											style="opacity: 70%; clear: both; font-size: smaller; margin-bottom: 5px;">
											<span>${temp.departureDate}</span> &ndash; <span>${temp.numberDays}</span>
										</div>
										<div class="card-title">
											<a href="${detailLink}">${temp.packageName}</a>
										</div>
										<div style="opacity: 70%; font-size: smaller;">
											<span>Nơi khởi hành: </span><span>${temp.departure.location}</span>
										</div>
										<div
											style="color: red; font-size: x-large; font-weight: bold;">
											<span> <fmt:formatNumber value="${temp.price}" />
											</span><span> VND</span>
										</div>
									</div>
									<div class="card-btn row row-cols-2">
										<div style="padding: 0 5px 0 5px;">
											<c:if test="${not empty sessionScope.USERID}">
												<a href="${bookinglLink}">
													<div class="a-btn"
														style="background-color: #3B0EEE; color: #fff;">
														<span><img src="/resources/library/icon/add.svg"
															alt=""> Đặt ngay</span>
													</div>
												</a>
											</c:if>
											<c:if test="${ empty sessionScope.USERID}">
												<a href="http://localhost:8080/login">
													<div class="a-btn"
														style="background-color: #3B0EEE; color: #fff;">
														<span><img src="/resources/library/icon/add.svg"
															alt=""> Đặt ngay</span>
													</div>
												</a>
											</c:if>
										</div>
										<div style="padding: 0 5px 0 5px;">
											<a href="${detailLink}">
												<div class="a-btn">
													<span><img src="/resources/library/icon/detail.svg"
														alt=""> Chi tiết</span>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="pag">
						<ul class="pagination">
							<li class="page-item "><a class="page-link" href="#">Previous</a></li>
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="footer ">
		<div class="footer_content1 row ">
			<div class="content_detail col-xl ">
				<div class="detail_header ">
					<h4>Du lịch trong nước</h4>
				</div>
				<div class="detail_link ">
					<a href=" ">Hạ Lọng</a> <a href=" ">Ninh Bình</a> <a href=" ">Đà
						Nẵng</a> <a href=" ">Hội An</a>
				</div>
			</div>
			<div class="content_detail col-xl ">
				<div class="detail_header ">
					<h4>Du lịch nước ngoài</h4>
				</div>
				<div class="detail_link ">
					<a href=" ">Ấn Độ</a> <a href=" ">Hàn Quốc</a> <a href=" ">Úc</a> <a
						href=" ">Singapore</a>
				</div>
			</div>
			<div class="content_detail col-xl ">
				<div class="detail_header ">
					<h4>Dòng Tour</h4>
				</div>
				<div class="detail_link ">
					<a href=" ">Cao cấp</a> <a href=" ">Tiêu chuẩn</a> <a href=" ">Tiết
						kiệm</a> <a href=" ">Giá tốt</a>
				</div>
			</div>
			<div class="content_detail col-xl ">
				<div class="detail_header ">
					<h4>Ứng dụng di động</h4>
				</div>
				<div class="detail_app ">
					<div class="app_android ">
						<p>Android</p>
						<a href=" "> <img src="/resources/library/icon/android.svg "
							alt=" ">
						</a>
					</div>
					<div class="app_ios ">
						<p>IOS</p>
						<a href=" "> <img src="/resources/library/icon/ios.svg "
							alt=" ">
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="footer_content2 row ">
			<div class="content_detail2 col-xl ">
				<div class="detail_header ">
					<h4>Liên hệ</h4>
				</div>
				<div class="detail_link ">
					<a href=" ">190 Pasteur, Phường Võ Thị Sáu, Quận 3, TPHCM</a> <a
						href=" ">(+84 28) 3822 8898</a> <a href=" ">(+84 28) 3829 9142</a>
					<a href=" ">info@travelco.com</a>
				</div>
			</div>
			<div class="content_detail2 col-xl ">
				<div class="detail_header ">
					<h4>Thông tin</h4>
				</div>
				<div class="detail_link ">
					<a href=" ">Tạp chí du lịch</a> <a href=" ">Tin tức</a> <a href=" ">Site
						map</a> <a href=" ">Chính sách quyền riêng tư</a> <a href=" ">Thỏa
						thuận sử dụng</a>
				</div>
			</div>
			<div class="content_detail2 col-xl ">
				<div class="detail_header ">
					<h4>Chứng nhận</h4>
				</div>
				<div class="detail_link ">
					<a href=" "> <img class="chungnhan1 "
						src="/resources/img/chungnhan1.png " alt=" ">
					</a> <a href=" "> <img src="/resources/img/chungnhan2.png " alt=" ">
					</a>
				</div>
			</div>
			<div class="content_detail2 col-xl ">
				<div class="detail_header ">
					<h4>Chứng nhận thanh toán</h4>
				</div>
				<div class="detail_link ">
					<div class="thanhtoan_row ">
						<a href=" "> <img src="/resources/img/thanhtoan (1).png "
							alt=" ">
						</a> <a href=" "> <img style="padding-left: 20px;"
							src="/resources/img/thanhtoan (2).png " alt=" ">
						</a>
					</div>
					<div class="thanhtoan_row ">
						<a href=" "> <img src="/resources/img/thanhtoan (3).png "
							alt=" ">
						</a> <a href=" "> <img style="padding-left: 20px;"
							src="/resources/img/thanhtoan (4).png " alt=" ">
						</a>
					</div>
					<div class="thanhtoan_row ">
						<a href=" "> <img src="/resources/img/thanhtoan (5).png "
							alt=" ">
						</a> <a href=" "> <img style="padding-left: 20px;"
							src="/resources/img/thanhtoan (6).png " alt=" ">
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="footer_content3 row ">
			<div class="content_detail col-xl ">
				<div class="detail_header ">
					<h4>Mạng xã hội</h4>
				</div>
				<div class="mxh ">
					<a href=" "> <img src="/resources/library/icon/facebook.svg "
						alt=" ">
					</a> <a href=" "> <img src="/resources/library/icon/ins.svg "
						alt=" ">
					</a> <a href=" "> <img src="/resources/library/icon/youtube.svg "
						alt=" ">
					</a> <a href=" "> <img src="/resources/library/icon/mxh.svg "
						alt=" ">
					</a>
				</div>
			</div>
			<div class="content_detail col-xl ">
				<div class="detail_header ">
					<h4>Hot Line</h4>
				</div>
				<div class="detail_hotline ">
					<input type="button " value="1900 1113 "
						style="padding-left: 40px !important;"> <img
						src="/resources/library/icon/phone.svg " alt=" ">
				</div>
				<p>Từ 8:00 - 22:00 hàng ngày</p>
			</div>
			<div class="content_detail col-xl ">
				<div class="detail_header ">
					<h4>Nhận tin qua Email</h4>
				</div>
				<div class="detail_input ">
					<form action=" ">
						<input type="email " placeholder="nhập email ... "> <img
							src="/resources/library/icon/email.svg " alt=" "> <input
							type="button " value="Gửi ">
					</form>
				</div>
			</div>
			<div class="content_detail col-xl ">
				<div class="detail_header ">
					<h5>n</h5>
				</div>
				<div class="detail_app "></div>
			</div>
		</div>
	</div>
	<div class="giayphep ">
		<p>Số giấy phép kinh doanh lữ hành Quốc tế: 79-234/2014/TCDL-GP
			LHQT</p>
	</div>
</body>

</html>