<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Travel.co</title>
<link rel="stylesheet" href="/resources/css/ComboDetail.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet"
	href="/resources/css/Header_Footer.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

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

	<div class="containerx" style="height: 2600px !important;">
		<c:url var="bookingLink" value="/Tour/booking">
			<c:param name="tourId" value="${TOUR.travelPackageId}"></c:param>
		</c:url>
		<div class="content">
			<div class="ticket">
				<img src="/resources/library/icon/ticket-01.svg" alt="">
				<p class="code_ticket">${TOUR.travelPackageId}</p>
			</div>
			<div class="header_content">
				<div class="header_content-left">
					<p class="title_content">${TOUR.packageName}</p>
					<div class="favourite_content">
						<c:url var="cartLink" value="/Tour/addTourToCart">
							<c:param name="tourId" value="${TOUR.travelPackageId}"></c:param>
						</c:url>
						<a href="${cartLink}"> <img
							src="/resources/library/icon/favourite_2.svg" alt="">
						</a>
						<p>Thêm vào giỏ hàng</p>
					</div>
				</div>
				<div class="header_content-right">
					<div class="price_content">
						<p class="price">
							<fmt:formatNumber>${TOUR.price}</fmt:formatNumber>
							VND
						</p>
						<p>/ khách</p>
					</div>
					<div class="btn_content">
						<c:if test="${not empty sessionScope.USERID}">
							<a href="${bookingLink}" style="text-decoration: none;">
								<div class="btn_DatNgay">
									<span>Đặt Ngay</span> <img
										src="/resources/library/icon/shopping-cart-add1.svg" alt="">
								</div>
							</a>
						</c:if>
						<c:if test="${ empty sessionScope.USERID}">
							<a href="http://localhost:8080/login"
								style="text-decoration: none;">
								<div class="btn_DatNgay">
									<span>Đặt Ngay</span> <img
										src="/resources/library/icon/shopping-cart-add1.svg" alt="">
								</div>
							</a>
						</c:if>
						<div class="btn_Call">
							<input type="button" value="Liên hệ tư vấn">
						</div>
					</div>
				</div>
			</div>
			<div class="img_content">
				<div class="img_chinh">
					<img src="/resources/img/${TOUR.imagesList.toArray()[0]}" alt="">
				</div>
				<div class="img_phu">
					<div class="img_phu-top">
						<img src="/resources/img/${TOUR.imagesList.toArray()[1]}" alt="">
						<img src="/resources/img/${TOUR.imagesList.toArray()[2]}" alt="">
					</div>
					<img class="img_bottom"
						src="/resources/img/${TOUR.imagesList.toArray()[3]}" alt="">
				</div>
			</div>

			<div class="map_content">
				<div class="content_detail">
					<p>${TOUR.description}</p>
					<div class="content_time">
						<div class="time_checkin">
							<p>Khởi hành :</p>
							<p class="text-bold">${TOUR.departureDate}</p>
						</div>
						<div class="time_checkout">
							<p>Thời gian :</p>
							<p class="text-bold">${TOUR.numberDays}ngày</p>
						</div>
						<div class="time_checkout">
							<p>Nơi khởi hành :</p>
							<p class="text-bold">${TOUR.departure.location}</p>
						</div>
						<div class="time_checkout">
							<p>Số chỗ còn :</p>
							<p class="text-bold">${TOUR.availableSeats}</p>
						</div>
					</div>
				</div>
				<div class="inf-tour">
					<div class="row-inf" style="margin-bottom: 20px;">
						<div class="col-inf">
							<div class="icon">
								<img style="width: 40px; height: 40px"
									src="/resources/library/icon/icontour1.svg" alt="img">
							</div>
							<p>Thời gian</p>
							<span>${TOUR.numberDays} ngày</span>
						</div>
						<div class="col-inf">
							<div class="icon">
								<img style="width: 40px; height: 40px"
									src="/resources/library/icon/icontour2.svg" alt="img">
							</div>
							<p>Phương tiện</p>
							<span>${TOUR.vehicle}</span>
						</div>
						<div class="col-inf">
							<div class="icon">
								<img style="width: 40px; height: 40px"
									src="/resources/library/icon/icontour3.svg" alt="img">
							</div>
							<p>Địa điểm tham quan</p>
							<span
								style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden;">
								${TOUR.touristAttraction} </span>
						</div>
						<div class="col-inf">
							<div class="icon">
								<img style="width: 40px; height: 40px"
									src="/resources/library/icon/icontour4.svg" alt="img">
							</div>
							<p>Ẩm thực</p>
							<span>${TOUR.cuisine}</span>
						</div>
					</div>
					<div class="row-inf" style="margin-bottom: 20px;">
						<div class="col-inf">
							<div class="icon">
								<img style="width: 40px; height: 40px"
									src="/resources/library/icon/icontour5.svg" alt="img">
							</div>
							<p>Khách sạn</p>
							<span>${TOUR.hotel}</span>
						</div>
						<div class="col-inf">
							<div class="icon">
								<img style="width: 40px; height: 40px"
									src="/resources/library/icon/icontour6.svg" alt="img">
							</div>
							<p>Thời gian lý tưởng</p>
							<span>${TOUR.idealTime}</span>
						</div>
						<div class="col-inf">
							<div class="icon">
								<img style="width: 40px; height: 40px"
									src="/resources/library/icon/icontour7.svg" alt="img">
							</div>
							<p>Đối tượng</p>
							<span>${TOUR.object}</span>
						</div>
						<div class="col-inf">
							<div class="icon">
								<img style="width: 40px; height: 40px"
									src="/resources/library/icon/icontour8.svg" alt="img">
							</div>
							<p>Ưu đãi</p>
							<span>Đã bao gồm trong giá tour</span>
						</div>
					</div>
				</div>
			</div>
			<div class="detail_service">
				<div class="info_service">
					<h1 class="info_service-title">Chi tiết tour</h1>
					<div class="form_detail1">
						<h4>Thông tin chuyến đi</h4>
						<div class="form_full"
							style="margin-top: 60px; margin-bottom: 40px;">
							<div class="form_left">
								<div class="day_start">
									<p>Ngày đi:</p>
									<p class="text-bold">${TOUR.departureDate}</p>
								</div>
								<div class="destination_start-end">
									<div class="destination_start">
										<p>${TOUR.departure.location}</p>
										<p>(SGN)</p>
									</div>
									<div class="destination_end">
										<p>${TOUR.destination.location}</p>
										<p>(VTN)</p>
									</div>
								</div>
								<div class="trip">
									<img src="/resources/library/icon/Ellipse 8.svg" alt="">
									<p>------------</p>
									<img src="/resources/library/icon/plane1.svg" alt="">
									<p>------------</p>
									<img src="/resources/library/icon/Ellipse 9.svg" alt="">
								</div>
								<div class="trip_time-left">
									<p class="text-bold">5:00</p>
									<p>đi thẳng</p>
									<p class="text-bold">6:00</p>
								</div>

							</div>
							<div class="form_between">
								<div></div>
							</div>
							<div class="form_right">
								<div class="day_end">
									<p>Ngày về:</p>
									<p class="text-bold">${TOUR.returnDate}</p>
								</div>
								<div class="destination_start-end">
									<div class="destination_end">
										<p>${TOUR.destination.location}</p>
										<p>(VTN)</p>
									</div>
									<div class="destination_start">
										<p>${TOUR.departure.location}</p>
										<p>(SGN)</p>
									</div>
								</div>
								<div class="trip">
									<img src="/resources/library/icon/Ellipse 8.svg" alt="">
									<p>------------</p>
									<img src="/resources/library/icon/plane1.svg" alt="">
									<p>------------</p>
									<img src="/resources/library/icon/Ellipse 9.svg" alt="">
								</div>
								<div class="trip_time-right">
									<p class="text-bold">5:00</p>
									<p>đi thẳng</p>
									<p class="text-bold">6:00</p>
								</div>
							</div>
						</div>
						<div>
							<h4>Thông tin tập trung</h4>
							<p>
								Ngày giờ tập trung: <span style="font-weight: bold;">5:00-${TOUR.departureDate}</span>
							</p>
						</div>
					</div>
				</div>
				<div class="combo_include">
					<h1 class="combo_include-title">Giá tour và phụ thu phòng đơn</h1>
					<div
						style="border-radius: 20px; margin-top: 30px; background-color: #fff; padding: 10px;">
						<table class="table table-borderless" style="border-radius: 20px;">
							<thead>
								<tr>
									<th>Loại khách</th>
									<th>Giá tour</th>
									<th>Land tour</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Người lớn (từ 12 tuổi trở lên)</td>
									<td>${TOUR.price}vnđ</td>
									<td>${TOUR.price}vnđ</td>
								</tr>
								<tr>
									<td>Người lớn (từ 12 tuổi trở lên)</td>
									<td>${TOUR.price}vnđ</td>
									<td>${TOUR.price}vnđ</td>
								</tr>
								<tr>
									<td>Người lớn (từ 12 tuổi trở lên)</td>
									<td>${TOUR.price}vnđ</td>
									<td>${TOUR.price}vnđ</td>
								</tr>
								<tr>
									<td>Người lớn (từ 12 tuổi trở lên)</td>
									<td>${TOUR.price}vnđ</td>
									<td>${TOUR.price}vnđ</td>
								</tr>
								<tr>
									<td>Người lớn (từ 12 tuổi trở lên)</td>
									<td>${TOUR.price}vnđ</td>
									<td>${TOUR.price}vnđ</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="notinclude" style="margin-top: 50px;">
						<div class="notinclude_detail ">
							<h4>Thông tin hướng dẫn viên</h4>
							<div style="margin-top: 30px;">
								<p>
									Hướng dẫn viên đoàn: <span style="font-weight: bold;">Đang
										cập nhật</span>
								</p>
								<p>
									Hướng dẫn viên tiễn: <span style="font-weight: bold;">Đang
										cập nhật</span>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="note-info">
				<div class="title">
					<h1>Thông tin cần lưu ý</h1>
				</div>
				<div class="row-collapse">
					<div class="col-collapse">
						<button type="button" class="btn-collapse" data-toggle="collapse"
							data-target="#price_include">Giá tuor bao gồm</button>
						<div id="price_include" class="collapse">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

						</div>
					</div>
					<div class="col-collapse">
						<button type="button" class="btn-collapse" data-toggle="collapse"
							data-target="#cancel_tour">Lưu ý khi chuyển/hủy tour</button>
						<div id="cancel_tour" class="collapse">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
						</div>
					</div>
				</div>
				<div class="row-collapse">
					<div class="col-collapse">
						<button type="button" class="btn-collapse" data-toggle="collapse"
							data-target="#price_noinclude">Giá tuor không bao gồm</button>
						<div id="price_noinclude" class="collapse">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

						</div>
					</div>
					<div class="col-collapse">
						<button type="button" class="btn-collapse" data-toggle="collapse"
							data-target="#cancel_nortour">Các điều kiện hủy tour đối
							với ngày thường</button>
						<div id="cancel_nortour" class="collapse">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
						</div>
					</div>
				</div>
				<div class="row-collapse">
					<div class="col-collapse">
						<button type="button" class="btn-collapse" data-toggle="collapse"
							data-target="#price_kid">Giá vé trẻ em</button>
						<div id="price_kid" class="collapse">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

						</div>
					</div>
					<div class="col-collapse">
						<button type="button" class="btn-collapse" data-toggle="collapse"
							data-target="#cancel_spetour">Các điều kiện hủy tour đồi
							với ngày lễ, tết</button>
						<div id="cancel_spetour" class="collapse">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
						</div>
					</div>
				</div>
				<div class="row-collapse">
					<div class="col-collapse">
						<button type="button" class="btn-collapse" data-toggle="collapse"
							data-target="#cond_abate">Điều kiện thanh toán</button>
						<div id="cond_abate" class="collapse">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

						</div>
					</div>
					<div class="col-collapse">
						<button type="button" class="btn-collapse" data-toggle="collapse"
							data-target="#majeure_case">Trường hợp bất khả kháng</button>
						<div id="majeure_case" class="collapse">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
						</div>
					</div>
				</div>
				<div class="row-collapse">
					<div class="col-collapse">
						<button type="button" class="btn-collapse" data-toggle="collapse"
							data-target="#cond_register">Các điều kiện khi đăng ký
							tour</button>
						<div id="cond_register" class="collapse">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

						</div>
					</div>
					<div class="col-collapse">
						<button type="button" class="btn-collapse" data-toggle="collapse"
							data-target="#contact">liên hệ</button>
						<div id="contact" class="collapse">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Ut enim ad minim veniam, quis nostrud exercitation
								ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
						</div>
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