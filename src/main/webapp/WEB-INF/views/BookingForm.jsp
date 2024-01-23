<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Travel.co</title>
<link type="text/css" rel="stylesheet"
	href="/resources/css/styleUserForm.css" />
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
				class="button_manager" /> <input type="button"
				value="Quản lý Booking"
				onclick="window.location.href='http://localhost:8080/Booking/showBooking'; return false;"
				class="button_manager"
				style="background-color: #3B0EEE; color: #fff" /><input
				type="button" value="Quản lý điểm đi"
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
		<h1 class="title">Quản lý Booking</h1>

		<form action="searchBooking" method="GET">
			<input type="submit" value="Tìm kiếm" class="add-button" /> <input
				type="text" placeholder="Tìm kiếm booking" name="bookingId"
				style="justify-content: center; width: 1310px; font-size: 15px; padding: 10px; height: 20px" />
		</form>

		<div class="table">
			<table>
				<tr>
					<th class="row_head_1">Mã hóa đơn</th>
					<th class="row_head_2">Tên Tour</th>
					<th class="row_head_2">Mã tour</th>
					<th class="row_head_2">Giá</th>
					<th class="row_head_2">Tên khách hàng</th>
					<th class="row_head_2">Số điện thoại</th>
					<th class="row_head_3">Email</th>
					<!-- <th class="row_head_3">Chức năng</th> -->
					<!-- Add more columns as needed -->
				</tr>
				<c:forEach var="tempBooking" items="${booking}">
					<c:url var="deleteLink" value="/Booking/deleteBooking">
						<c:param name="bookingId" value="${tempBooking.bookingId}"></c:param>
					</c:url>
					<tr>
						<td class="row_head">${tempBooking.bookingId}</td>
						<td class="row_head">${tempBooking.travelPackage.packageName}</td>
						<td class="row_head">${tempBooking.travelPackage.travelPackageId}</td>
						<td class="row_head">${tempBooking.travelPackage.price}</td>
						<td class="row_head">${tempBooking.user.fullName}</td>
						<td class="row_head">${tempBooking.user.phone}</td>
						<td class="row_head">${tempBooking.user.email}</td>
						<%-- <td class="row_head""><a
							href="${deleteLink}"
							onclick="if(!(confirm('Việc xóa dữ liệu này có thể làm mất các dữ liệu có liên quan bạn vẫn muốn tiếp tục?'))) return false;"
							class="manager_button_delete">Xóa</a></td> --%>
					</tr>
				</c:forEach>
			</table>
		</div>

	</div>



</body>
</html>