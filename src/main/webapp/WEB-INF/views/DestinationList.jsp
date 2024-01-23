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
				class="button_manager" /><input type="button"
				value="Quản lý điểm đi"
				onclick="window.location.href='http://localhost:8080/Departure/showDeparture'; return false;"
				class="button_manager" /><input type="button"
				value="Quản lý điểm đến"
				onclick="window.location.href='http://localhost:8080/Destination/showDestination'; return false;"
				class="button_manager"
				style="background-color: #3B0EEE; color: #fff; padding: 10px; margin-left: 5px; border-radius: 7px; border-color: #E2E2E2;" /><br>
			<br>
		</div>
		<div>
			<input type="button" value="Quay lại trang chủ"
				onclick="window.location.href='http://localhost:8080/'; return false;"
				class="button_manager" style="background-color: red; color: #fff" />
		</div>
	</div>
	<div class="body_manager">
		<h1 class="title">Quản lý điểm đến</h1>
		<input type="button" value="Thêm điểm đến"
			onclick="window.location.href='addDestination'; return false;"
			class="add-button" /> <br> <br>

		<form action="searchDestination" method="GET">
			<input type="submit" value="Tìm kiếm" class="add-button" /> <input
				type="text" placeholder="Tìm kiếm điểm đến" name="destinationId"
				style="justify-content: center; width: 1310px; font-size: 15px; padding: 10px; height: 20px" />
		</form>
		<p style="font-size: 25px; color: red">${ERROR}</p>
		<div class="table"
			style="alialign-items: center; display: flex; justify-content: center">
			<table>
				<tr>
					<th class="row_head_1">Mã điểm đến</th>
					<th class="row_head_2">Điểm đến</th>
					<th class="row_head_2">Khu vực</th>
					<th class="row_head_3">Chức năng</th>

					<!-- Add more columns as needed -->
				</tr>
				<c:forEach var="tempDestination" items="${destination}">
					<c:url var="updateLink" value="/Destination/updateDestination">
						<c:param name="destinationId"
							value="${tempDestination.destinationId}"></c:param>
					</c:url>
					<c:url var="deleteLink" value="/Destination/deleteDestination">
						<c:param name="destinationId"
							value="${tempDestination.destinationId}"></c:param>
					</c:url>

					<tr>
						<td class="row_head">${tempDestination.destinationId}</td>
						<td class="row_head">${tempDestination.location}</td>
						<td class="row_head">${tempDestination.type}</td>
						<td class="row_head" style="display: flex;"><a
							href="${updateLink}" class="manager_button">Cập nhật</a> <a
							href="${deleteLink}"
							onclick="if(!(confirm('Việc xóa dữ liệu này có thể làm mất các dữ liệu có liên quan bạn vẫn muốn tiếp tục?'))) return false;"
							class="manager_button_delete">Xóa</a></td>


					</tr>
				</c:forEach>
			</table>
		</div>

	</div>



</body>
</html>