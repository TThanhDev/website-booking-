<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Travel.co</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link type="text/css" rel="stylesheet"
	href="/resources/css/styleAddUserForm.css" />
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>

	<div class="body_manager">
		<div class="container" style="height: 1150px">
			<h2 class="title">CẬP NHẬT TOUR</h2>
			<table>
				<form:form action="saveTour" method="POST" modelAttribute="TOUR">
					<form:hidden path="travelPackageId" />
					<tr>
						<td class="row_1">Tour:</td>
						<td><form:input path="packageName" class="row_2" /> <form:errors
								path="packageName" cssClass="red" /></td>
					</tr>
					<tr>
						<td class="row_1">Ngày đi:</td>
						<td><form:input path="departureDate" id="departureDate"
								class="datepicker row_2" /> <form:errors path="departureDate"
								cssClass="red" /></td>
						<script>
							$(document).ready(function() {
								$(".datepicker").datepicker({
									dateFormat : 'yy-mm-dd', // Set the desired date format
									changeMonth : true,
									changeYear : true
								// Add other options as needed
								});
							});
						</script>
					</tr>

					<tr>
						<td class="row_1">Ngày về:</td>
						<td><form:input path="returnDate" id="returnDate"
								class="datepicker row_2" /> <form:errors path="returnDate"
								cssClass="red" /></td>
						<script>
							$(document).ready(function() {
								$(".datepicker").datepicker({
									dateFormat : 'yy-mm-dd', // Set the desired date format
									changeMonth : true,
									changeYear : true
								// Add other options as needed
								});
							});
						</script>
					</tr>
					<tr>
						<td class="row_1">Giá:</td>
						<td><form:input path="price" class="row_2" /> <form:errors
								path="price" cssClass="red" /></td>
					</tr>
					<tr>
						<td class="row_1">Mô tả:</td>
						<td><form:textarea path="description" class="row_2" /></td>
					</tr>
					<tr>
						<td class="row_1">Số chỗ:</td>
						<td><form:input path="availableSeats" class="row_2" /> <form:errors
								path="availableSeats" cssClass="red" /></td>
					</tr>
					<tr>
						<td class="row_1">Hình ảnh:</td>
						<td><input class="row_2" type="file" name="imagesList"
							id="imagesList" accept="image/*" multiple /></td>
					</tr>
					<tr>
						<td class="row_1">Phương tiện:</td>
						<td><form:select path="vehicle" class="row_2">
								<form:options items="${EVehicle.values()}" />
							</form:select></td>
					</tr>
					<tr>
						<td class="row_1">Nơi khỏi hành:</td>
						<td><form:select path="departure" id="departureLocation"
								class="row_2">
								<form:option value="" label="-- Chọn nơi khởi hành --" />
								<form:options items="${LISTDEP}" itemLabel="location" />
							</form:select> <br> <form:errors path="departure" cssClass="red" /></td>
					</tr>
					<tr>
						<td class="row_1">Điểm đến:</td>
						<td><form:select path="destination" id="destinationLocation"
								class="row_2">
								<form:option value="" label="-- chọn điểm đến --" />
								<form:options items="${LISTDES}" itemLabel="location" />
							</form:select> <br> <form:errors path="destination" cssClass="red" /></td>
					</tr>
					<tr>
						<td class="row_1">Số ngày:</td>
						<td><form:input path="numberDays" class="row_2" /> <form:errors
								path="numberDays" cssClass="red" /></td>
					</tr>
					<tr>
						<td class="row_1">Điểm tham quan:</td>
						<td><form:input path="touristAttraction" class="row_2" /></td>
					</tr>
					<tr>
						<td class="row_1">Ẩm thực:</td>
						<td><form:input path="cuisine" class="row_2" /></td>
					</tr>
					<tr>
						<td class="row_1">Khách sạn:</td>
						<td><form:input path="hotel" class="row_2" /></td>
					</tr>
					<tr>
						<td class="row_1">Thời gian lý tưởng:</td>
						<td><form:input path="idealTime" class="row_2" /></td>
					</tr>
					<tr>
						<td class="row_1">Đối tượng:</td>
						<td><form:input path="object" class="row_2" /></td>
					</tr>
					<tr>
						<td class="row_1">Loai tour:</td>
						<td><form:select path="internationalType" class="row_2">
								<form:options items="${EInternationalType.values()}" />
							</form:select> <form:errors path="internationalType" cssClass="red" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="Lưu" class="save"
							style="width: 200px;" /></td>
					</tr>
				</form:form>

			</table>
			<div style="margin-left: -200px;margin-bottom: 20px">
				<p>
					<a href="${pageContext.request.contextPath}/Tour/showListTours"
						class="back">Quay lại</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>