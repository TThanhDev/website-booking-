<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Khuyến mãi</title>
<!-- link css -->
<link rel="stylesheet" href="/resources/css/styleC.css">
<link rel="stylesheet" href="/resources/css/reset.css" />
<!-- <link rel="stylesheet" href="/resources/css/TinTuc.css" /> -->
<link rel="stylesheet" href="/resources/css/style.scss" />
<link type="text/css" rel="stylesheet"
	href="/resources/css/Header_Footer.css">

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
		<a href="">Du lịch >></a> <a href="">Khuyến mãi</a>
	</div> -->
	<div class="containerx">
		<div class="promotion">
			<div class="content">
				<h2 class="title">Vietravel & Sacombank: Quẹt thẻ liền tay -
					Giảm ngay 1 triệu đồng</h2>
				<div class="wrap">
					<span class="tag">Tin tức du lịch</span> <span class="date">08/09/2023</span>
				</div>
				<div class="details">
					<div class="desc">
						<p>Những năm trở lại đây, du lịch dần trở thành nhu cầu thiết
							yếu đối với mọi người. Bên cạnh mong muốn tận hưởng chuyến đi
							nghỉ dưỡng cùng gia đình và bạn bè, nhiều khách hàng còn quan tâm
							đến các dịch vụ thanh toán hiện đại.</p>
						<br> <img src="../img/khuyenmai.png" alt="">
						<p>Với xu hướng trên, bên cạnh các chương trình ưu đãi chính,
							Vietravel là đơn vị lữ hành tiên phong hợp tác cùng các đối tác
							ngân hàng, tài chính - gần đây nhất là Sacombank - nhằm mang đến
							cho khách hàng đa dạng hình thức thanh toán cùng những giá trị
							thiết thực với các chương trình ưu đãi như sau:</p>
						<p>Cụ thể, kể từ ngày 06/04 đến hết ngày 31/05/2023, khi Quý
							khách hàng thanh toán hóa đơn tour du lịch từ 30 triệu đồng bằng
							Thẻ tín dụng Quốc tế Sacombank sẽ được giảm liền tay 1 triệu
							đồng, áp dụng với Quý khách hàng đang sở hữu thẻ có mã BIN (06 số
							đầu của thẻ) như sau: 356062; 356480; 356481; 436438; 423238;
							455376; 466243; 472074; 472075; 486265; 512341; 526830; 552332;
							625002.</p>
						<br>
					</div>
					<div class="location">
						<h4 class="highlight">Địa điểm áp dụng:</h4>
						<ul>
							<li>Ưu đãi áp dụng tại Trụ sở chính, hệ thống Văn phòng Bán
								lẻ và Chi nhánh toàn quốc.</li>
							<li>Tham khảo địa chỉ văn phòng tại website:
								www.travel.com.vn</li>
							<li>Hotline hỗ trợ khách hàng của Vietravel: 1900 1839</li>
						</ul>
					</div>
					<div class="condition">
						<h4 class="highlight">Điều kiện áp dụng:</h4>
						<ul>
							<li>Ưu đãi áp dụng cho tour du lịch trong nước và quốc tế
								với hóa đơn thanh toán từ 30 triệu đồng (là số tiền sau khi trừ
								tất cả ưu đãi, khuyến mại khác tại Vietravel) và có số tiền
								thanh toán sau cùng bằng Thẻ tín dụng Quốc tế Sacombank qua máy
								POS (thiết bị chấp nhận thẻ) phải từ 29.000.000 đồng.</li>
							<li>Mỗi Thẻ tín dụng Quốc tế Sacombank hợp lệ có thể tham
								gia 01 lần trong thời gian diễn ra chương trình với mức giảm tối
								đa 1.000.000 đồng/thẻ/hóa đơn (xác định “thẻ” theo dãy số: 6 số
								đầu và 4 số cuối in trên thẻ).</li>
							<li>Thanh toán qua máy POS 100% giá trị hóa đơn tham gia
								chương trình.</li>
							<li>Ưu đãi của chương trình này được áp dụng đồng thời tất
								cả chương trình ưu đãi, khuyến mại hiện có tại Vietravel và
								chương trình “Trả góp lãi suất 0%”.</li>
							<li>Giao dịch cần thỏa mãn điều kiện giao dịch thành công,
								không áp dụng cho giao dịch hủy/giao dịch hoàn tiền (“giao dịch
								thành công” là giao dịch đã được ghi nhận tại hệ thống
								Sacombank, được hiểu là giao dịch được bút toán, lên sao kê tài
								khoản hoặc giao dịch đang chờ cập nhật sao kê).</li>
							<li>Đối với những thắc mắc, khiếu nại liên quan đến việc mua
								hàng và/hoặc chất lượng sản phẩm dịch vụ, chủ thẻ vui lòng liên
								hệ Vietravel để được tư vấn và hướng dẫn chi tiết.</li>
							<li>Chương trình diễn ra từ 06/04 đến hết ngày 31/05/2023
								hoặc đến khi hết ngân sách (ngân sách tối đa 99 lượt giao dịch
								hợp lệ đầu tiên).</li>
						</ul>
					</div>
				</div>

			</div>
			<div class="news">
				<div class="latest-news">
					<div class="highlight">Tin mới</div>
					<ul>
						<li>Du lịch Cao Bằng - Có hẹn với mùa thu thác Bản Giốc</li>
						<li>Du lịch Cao Bằng - Có hẹn với mùa thu thác Bản Giốc</li>
						<li>Du lịch Cao Bằng - Có hẹn với mùa thu thác Bản Giốc</li>
					</ul>
				</div>
				<div class="random-news">
					<div class="highlight">Tin ngẫu nhiên</div>
					<ul>
						<li>Du lịch Cao Bằng - Có hẹn với mùa thu thác Bản Giốc</li>
						<li>Du lịch Cao Bằng - Có hẹn với mùa thu thác Bản Giốc</li>
						<li>Du lịch Cao Bằng - Có hẹn với mùa thu thác Bản Giốc</li>
					</ul>
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