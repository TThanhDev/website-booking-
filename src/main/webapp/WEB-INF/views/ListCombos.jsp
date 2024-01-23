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
				class="button_manager" /> <input type="button"
				value="Quản lý Combo Tour"
				onclick="window.location.href='http://localhost:8080/Combo/showListCombos'; return false;"
				class="button_manager"
				style="background-color: #3B0EEE; color: #fff" /> <input
				type="button" value="Quản lý Booking"
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
		<h1 class="title">QUẢN LÝ COMBO TOUR</h1>

		<input type="button" value="Thêm combo mới"
			onclick="window.location.href='addCombo'; return false;"
			class="add-button" /> <br> <br>

		<div>
			<form action="searchCombo" modelAttribute="combo" method="GET">
				<input type="submit" value="Tìm kiếm" class="add-button" /> <input
					type="text" placeholder="Tìm kiếm combo tour" class="search row_2"
					name="comboId" />
			</form>
		</div>
		<br> <br>
		<p style="font-size: 25px; color: red">${ERROR}</p>
		<div class="table">

			<table>

				<tr>
					<th class="row_head_1">Mã combo</th>
					<th class="row_head_2">Tên combo</th>
					<th class="row_head_2">Nơi khỏi hành</th>
					<th class="row_head_2">Điểm đến</th>
					<th class="row_head_2">Ngày đi</th>
					<th class="row_head_2">Ngày về</th>
					<th class="row_head_2">Giá combo</th>
					<th class="row_head_2">Số chỗ còn</th>
					<th class="row_head_2">Update</th>
					<th class="row_head_3">Delete</th>
					<!-- Add more columns as needed -->
				</tr>

				<c:forEach var="temp" items="${combos}">
					<c:url var="updateLink" value="/Combo/updateCombo">
						<c:param name="comboId" value="${temp.travelPackageId}"></c:param>
					</c:url>
					<c:url var="deleteLink" value="/Combo/deleteCombo">
						<c:param name="comboId" value="${temp.travelPackageId}"></c:param>
					</c:url>
					<tr>
						<td class="row_head">${temp.travelPackageId}</td>
						<td class="row_head">${temp.packageName}</td>
						<td class="row_head">${temp.departure.location}</td>
						<td class="row_head">${temp.destination.location}</td>
						<td class="row_head">${temp.departureDate}</td>
						<td class="row_head">${temp.returnDate}</td>
						<td class="row_head"><fmt:formatNumber>${temp.price}</fmt:formatNumber></td>
						<td class="row_head">${temp.availableSeats}</td>
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