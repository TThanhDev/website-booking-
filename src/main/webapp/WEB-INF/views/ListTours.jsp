<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet"
	href="/resources/css/styleUserForm.css" />
<title>Admin Travel.co</title>
</head>
<body>
	<div style="display: flex; justify-content: space-between;">
		<div>
			<input type="button" value="Quản lý Người Dùng"
				onclick="window.location.href='http://localhost:8080/user/showUsers'; return false;"
				class="button_manager" /> <input type="button" value="Quản lý Tour"
				onclick="window.location.href='http://localhost:8080/Tour/showListTours'; return false;"
				class="button_manager"
				style="background-color: #3B0EEE; color: #fff" /> <input
				type="button" value="Quản lý Combo Tour"
				onclick="window.location.href='http://localhost:8080/Combo/showListCombos'; return false;"
				class="button_manager" /> <input type="button"
				value="Quản lý Booking"
				onclick="window.location.href='http://localhost:8080/Booking/showBooking'; return false;"
				class="button_manager" /><input type="button"
				value="Quản lý điểm đi"
				onclick="window.location.href='http://localhost:8080/Departure/showDeparture'; return false;"
				class="button_manager" /><input type="button"
				value="Quản lý điểm đến"
				onclick="window.location.href='http://localhost:8080/Destination/showDestination'; return false;"
				class="button_manager" /> <br> <br>
		</div>
		<div>
			<input type="button" value="Quay lại trang chủ"
				onclick="window.location.href='http://localhost:8080/'; return false;"
				class="button_manager" style="background-color: red; color: #fff" />
		</div>
	</div>
	<div class="body_manager">
		<h1 class="title">QUẢN LÝ TOUR</h1>

		<input type="button" value="Thêm tour mới"
			onclick="window.location.href='addTour'; return false;"
			class="add-button" /> <br> <br>

		<div>
			<form action="searchTour" modelAttribute="tour" method="GET">
				<input type="submit" value="Tìm kiếm" class="add-button" /> <input
					type="text" placeholder="Tìm kiếm tour" class="search row_2"
					name="tourId" />
			</form>
		</div>
		<br> <br>
		<p style="font-size: 25px; color: red">${ERROR}</p>
		<div class="table">

			<table>
				<tr>
					<th class="row_head_1">Mã tour</th>
					<th class="row_head_2">Tên tour</th>
					<th class="row_head_2">Nơi khỏi hành</th>
					<th class="row_head_2">Điểm đến</th>
					<th class="row_head_2">Ngày đi</th>
					<th class="row_head_2">Ngày về</th>
					<th class="row_head_2">Giá tour</th>
					<th class="row_head_2">Số chỗ còn</th>
					<th class="row_head_2">Update</th>
					<th class="row_head_3">Delete</th>
					<!-- Add more columns as needed -->
				</tr>

				<c:forEach var="tempTour" items="${LISTTOURS}">
					<c:url var="updateLink" value="/Tour/updateTour">
						<c:param name="tourId" value="${tempTour.travelPackageId}"></c:param>
					</c:url>
					<c:url var="deleteLink" value="/Tour/deleteTour">
						<c:param name="tourId" value="${tempTour.travelPackageId}"></c:param>
					</c:url>
					<tr>
						<td class="row_head">${tempTour.travelPackageId}</td>
						<td class="row_head">${tempTour.packageName}</td>
						<td class="row_head">${tempTour.departure.location}</td>
						<td class="row_head">${tempTour.destination.location}</td>
						<td class="row_head">${tempTour.departureDate}</td>
						<td class="row_head">${tempTour.returnDate}</td>
						<td class="row_head"><fmt:formatNumber>${tempTour.price}</fmt:formatNumber></td>
						<td class="row_head">${tempTour.availableSeats}</td>
						<td class="row_head"><a href="${updateLink}"
							class="manager_button">Cập nhật</a></td>
						<td class="row_head"><a href="${deleteLink}"
							onclick="if(!(confirm('Việc xóa dữ liệu này có thể làm mất các dữ liệu có liên quan bạn vẫn muốn tiếp tục?'))) return false;"
							class="manager_button_delete">Xóa</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>

	</div>
</body>
</html>