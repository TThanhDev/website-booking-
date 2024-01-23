<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page
	import="org.springframework.web.servlet.support.RequestContextUtils"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Giỏ hàng</title>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

<!-- link css -->
<link rel="stylesheet" href="/resources/css/resetGH.css" />
<link rel="stylesheet" href="/resources/css/styleGH.css" />
<link rel="stylesheet"
	href="/resources/library/bootstrap/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet" />
<!-- LINK JS -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
        var message = "${message}";

        if (message && message.trim() !== "") {
            alert(message);
        }
        console.log(message);
        
        function decreaseQuantity(itemId) {
            $.get('decreaseQuantity?itemId=' + itemId, function() {
                // Cập nhật giao diện người dùng nếu cần
                console.log("xoa");
                location.reload();
            });
        }
        
        function calculateTotal() {
            var total = 0;

            // Lặp qua từng sản phẩm trong giỏ hàng
            $(".cart-item").each(function () {
                var priceText = $(this).find(".price").text();
                var quantityText = $(this).find(".remain").text();

                // Loại bỏ tất cả kí tự không phải là số hoặc dấu phẩy
                var cleanedPriceText = priceText.replace(/[^\d,]/g, ''); // Sử dụng regex để giữ lại chỉ số và dấu phẩy
                var price = parseFloat(cleanedPriceText.replace(',', '.')); // Chuyển đổi chuỗi thành số, bao gồm cả dấu phẩy

                var quantity = parseInt(quantityText);
                console.log(cleanedPriceText);
                console.log(price);
                console.log(quantity);

                // Kiểm tra xem giá và số lượng có là số hợp lệ hay không
                if (!isNaN(price) && !isNaN(quantity)) {
                    total += price * quantity;
                }
            });

            // Hiển thị tổng tiền vào thẻ span
            $("#total").text(new Intl.NumberFormat('vi-VN').format(total));
        }

        // Gọi hàm tính tổng tiền khi trang tải hoặc có sự thay đổi trong giỏ hàng
        $(document).ready(function() {
            calculateTotal();
        });
    </script>

</head>
<body>
	<div class="cart">
		<div class="top">
			<h1 class="title">Giỏ hàng</h1>
			<a href="${pageContext.request.contextPath}/">
				<button class="back-button">Thoát</button>
			</a>
		</div>
		<form:form action="" modelAttribute="">
			<div class="content">
				<div class="cart-list">
					<c:forEach var="cart" items="${sessionScope.userCart}">
						<div class="cart-item">
							<!-- <input type="checkbox" class="check-button" /> -->
							<div class="code">
								<img src="/resource/library/icon/ticket-01.svg" alt="" /> <span
									class="code-id">Mã ${cart.cartItem.travelPackageId}</span>
							</div>
							<h3 class="name">Siêu Sale 🔥 | ${cart.cartItem.packageName}</h3>
							<span class="price"> <fmt:formatNumber>${cart.cartItem.price}</fmt:formatNumber>
							</span>
							<p>
								Khởi hành: <span class="date">
									${cart.cartItem.departureDate} </span>
							</p>
							<p>
								Nơi khởi hành: <span class="from">
									${cart.cartItem.departure.location } </span>
							</p>
							<p>
								Số chổ còn nhận: <span class="">
									${cart.cartItem.availableSeats} </span>
							</p>
							<div style="display: flex; justify-content: space-between;">
								<p>
									Số lượng: <span class="remain"> ${cart.quantity} </span>
								</p>
								<button type="button" class="delete-button btn btn-danger"
									onclick="decreaseQuantity(${cart.cartItem.travelPackageId})">Xóa</button>

							</div>
						</div>
					</c:forEach>
				</div>
				<div class="form">
					<div class="info">
						<h2>Thông tin liên lạc</h2>
						<div class="wrapper">
							<label for="fullname">Họ và tên *</label> <input type="text"
								name="fullname" id="fullname" placeholder=""
								value="${sessionScope.User.fullName}" />
						</div>
						<div class="wrapper">
							<label for="email">Email *</label> <input type="email"
								name="email" id="email" value="${sessionScope.User.email}" />
						</div>
						<div class="wrapper">
							<label for="phone">Số điện thoại *</label> <input type="text"
								name="phone" id="phone" value="${sessionScope.User.phone}" />
						</div>
						<div class="wrapper">
							<label for="address">Địa chỉ</label> <input type="text"
								name="address" id="address" placeholder=""
								value="${sessionScope.User.address}" />
						</div>
					</div>

					<div class="attention">
						<h2>Lưu ý</h2>
						<textarea name="attention" id="attention"></textarea>
					</div>

					<div class="pay">
						<h2>Phương thức thanh toán</h2>
						<div class="pay-list">
							<!-- <div class="pay-option">
								<img src="/resource/library/icon/applepay.svg" alt="" /> <input
									type="radio" name="pay" class="check-button" />
							</div>
							<div class="pay-option">
								<img src="/resource/library/icon/momo.svg" alt="" /> <input
									type="radio" name="pay" class="check-button" />
							</div> -->
							<div class="pay-option">
								<h3>Thanh toán tiền mặt</h3>
								<input type="radio" name="pay" class="check-button" checked />
							</div>
						</div>
					</div>

					<h2>
						Tổng: <span id="total" class="total"></span>
					</h2>

					<c:if test="${not empty sessionScope.USERID}">
						<button
							onclick="window.location.href ='http://localhost:8080/Cart/bookAll';return false;"
							type="submit" class="submit-button">Thanh toán</button>
					</c:if>
					<c:if test="${ empty sessionScope.USERID}">
						<button
							onclick="window.location.href ='http://localhost:8080/login';return false;"
							type="submit" class="submit-button">Thanh toán</button>
					</c:if>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>