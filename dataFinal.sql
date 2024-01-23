go
use DuLich
go
insert into Userr (phone,email,address,full_name)
values
('0359594415','phamducnhan.it@gmail.com','Go Vap','Pham Duc Nhan'),
('0977578795','pdnchannel1@gmail.com','Binh Thanh','Duc Nhan'),
('0202020202','vananh@gmail.com','Ha Noi','Nguyen Van Anh'),
('0303030303','thithanh@gmail.com','HCM','Tran Thi Thanh'),
('0404040404','vanhung@gmail.com','Da Nang','Nguyen Van Hung'),
('0505050505','thutrang@gmail.com','Hue','Ho Thi Trang'),
('0606060606','cuongdt@gmail.com','Ha Noi','Do Tien Cuong'),
('0707070707','maithao@gmail.com','HCM','Tran Thi Mai Thao'),
('0808080808','quocdat@gmail.com','Da Nang','Pham Quoc Dat'),
('0909090909','lananh@gmail.com','Hue','Nguyen Thi Lan Anh'),
('1010101010','minhngoc@gmail.com','Ha Noi','Bui Minh Ngoc'),
('1111111111','tienphong@gmail.com','HCM','Le Tien Phong');
go
select * from Userr
go
/*0:admin, 1:customer(mac dinh)*/
insert into Account(role,user_id,username,password) values
(1,1,'admin','admin'),
(0,2,'abc','test1'),
(0,3,'nguyenvana','123123'),
(0,4,'tranthithanh','456789'),
(0,5,'levanhung','147258'),
(0,6,'hotrithu','963852'),
(0,7,'dotiencuong','852147'),
(0,8,'tranthimai','357951'),
(0,9,'phaquocdat','159357'),
(0,10,'nguyentilan','569874'),
(0,12,'nhan1','nhan1'),
(1,11,'nhandeptrai','123')
go
select * from Account
go
insert into Departure
values 
(N'Hà Nội'),
(N'Hồ Chí Minh'),
(N'Đà Nẵng'),
(N'Thanh Hóa'),
(N'Phú Quốc'),
(N'Đà Lạt'),
(N'Cần Thơ'),
(N'Hải Phòng');
go
select * from  Departure
go
/* 0: trong nuoc, 1: nuoc ngoai*/
insert into Destination(type,location)
values 
(0,N'Vũng Tàu'),
(0,N'Cao Bằng'),
(0,N'Côn Đảo'),
(0,N'Hạ Long'),
(0,N'Nha Trang'),
(0,N'Nghệ An'),
(0,N'Phan Thiết'),
(0,N'Phú Yên'),
(0,N'Quy Nhơn'),
(0,N'Quảng Trị'),
(0,N'Thái Bình'),
(1, N'Trung Quốc'),
(1, N'Thái Lan'),
(1, N'Ấn Độ'),
(1, N'Anh'),
(1, N'Hàn Quốc'),
(1, N'Mỹ-Hoa kỳ'),
(1, N'Đức'),
(1, N'Nhật Bản'),
(1, N'Maldives')
go
select * from Destination
go
/*Tour*/
/*vehicle: 0: xe, 1: may bay
internationalType: 0: trong nuoc, 1: nuoc ngoai
travelPackage_type: 1: tour, 2: combo
*/
insert into travel_package(travel_package_type,package_name,departure_date,return_date,price,description,available_seats,vehicle,departure_id,destination_id,number_days,tourist_attraction,cuisine,hotel,ideal_time,object,international_type)
values(1,N'Tour  Vũng Tàu - Sắc Màu Biển Xanh - Mở mùa Xuân','2023-12-03','2023-12-04',2990000,N'Biển xanh, nắng vàng, phong cảnh trữ tình cùng công trinh kiến trúc tầm cỡ và sự nhộn nhịp, hiện đại đến khó tả, Vũng Tàu luôn là một điểm đến đặc sắc dành cho du khách bốn phương.',9,0,2,1,1,N'Vũng Tàu, Tượng Chúa Kito, Vạn Phật Đại Tòng Tâm',N'Theo thực đơn',N'Khách sạn 1 sao',N'quanh năm',N'Gia đình nhiều thế hệ',0),
(1,N'Tour Đông Bắc: Hà Nội - Hà Giang - Lũng Cú - Đồng Văn - Mã Pí Lèng - Mèo Vạc - Cao Bằng - Thác Bản Giốc - Hồ Ba Bể','2023-11-30','2023-12-03',7500000,N'Quý khách không thể bỏ lỡ những sự kiện đáng mong chờ nhất tại Cao Bằng.',6,0,1,2,4,N'Đông Bắc: Hà Nội - Hà Giang - Lũng Cú - Đồng Văn - Mã Pí Lèng - Mèo Vạc - Cao Bằng - Thác Bản Giốc - Hồ Ba Bể',N'Theo thực đơn, Đặc sản địa phương',N'Khách sạn 3 sao',N'quanh năm',N'Người lớn tuổi, Cặp đôi, Gia đình nhiều thế hệ, Thanh niên, Trẻ em',0),
(1,N'Tour Nha Trang - Làng Chài Xưa Mũi Né - Biển Nhũ Tiên - Vinwonders','2023-11-26','2023-11-29',3900000,N'Tự do tắm biển tại biển Nhũ Tiên, đắm mình trong làn nước biển trong xanh, mát mẻ, được bao bọc bởi bãi cát dài trắng xóa và những hàng dừa lao xao trong gió',2,0,2,5,4,N'4 địa điểm ngoài trời, 2 địa điểm trong nhà',N'Theo thực đơn',N'Khách sạn 3 sao',N'Quanh năm',N'Cặp đôi, Gia đình nhiều thế hệ, Thanh niên',0),
(1,N'Tour Quy Nhơn - Eo Gió - Phú Yên - Gành Đá Dĩa','2023-11-23','2023-11-26',5700000,N'Tham quan khu du lịch Hầm Hô với thiên nhiên hùng vĩ, được đắm mình trong thế giới Bồng lai tiên cảnh và như được trút bỏ mọi lo toan của cuộc sống hiện đại.',6,1,2,8,4,N'Quy Nhơn - Eo Gió - Phú Yên - Gành Đá Dĩa',N'Theo thực đơn',N'Khách sạn 2 sao',N'Quanh năm',N'Gia đình nhiều thế hệ',0),
(1,N'Tour CÔN ĐẢO - THIÊN ĐƯỜNG CỦA BIỂN','2023-12-03','2023-12-05',7800000,N'Những tọa độ ngắm hoàng hôn đẹp ngây ngất, những bãi cát trải dài mịn màng, thảm thực vật xanh mướt phủ kín, … & một hành trình khám phá thiên nhiên với biết bao điều khác lạ.',5,1,2,3,3,N'CÔN ĐẢO, BẢO TÀNG CÔN ĐẢO, MIẾU BÀ PHI YẾN, TRẠI PHÚ HẢI, CHUỒNG CỌP',N'Theo thực đơn',N'Khách sạn 4 sao',N'Quanh năm',N'Gia đình nhiều thế hệ, Thanh niên',0),
(1,N'Tour Trung Quốc: Thượng Hải - Chu Gia Giác - Bắc Kinh - Chinh phục Vạn Lý Trường Thành ','2023-12-24','2024-1-2',9900000,N' Quý khách sẽ tham quan những điểm như: Cầu Phóng Sinh (Fangsheng Qiao), Đền Thành Hoàng (ChengHuang Miao) hoặc Vườn Khoá Thực (Kezhi Yuan).',5,1,2,12,6,N'Trung Quốc, Thượng Hải, Bắc Kinh',N'Buffet sáng, Theo thực đơn',N'Khách sạn 4 sao',N'Quanh năm',N'Gia đình nhiều thế hệ, Cặp đôi, Thanh niên',1),
(1,N'Tour Bờ Đông Hoa Kỳ: New York - Philadelphia - Washington DC','2023-12-14','2023-12-18',9900000,N'Đến New York thành phố lớn nhất Mỹ, sở hữu những điểm đến nổi tiếng như tượng Nữ thần Tự Do, Trụ sở Liên Hiệp Quốc, Rockefeller Center, Wall Street, Ðại lộ Broadway',4,1,2,17,7,N'Hoa Kỳ, Mỹ, Los Angeles, New York, Philadelphia, Washington DC, Las Vegas, San Diego',N'Buffet sáng, Theo thực đơn',N'Khách sạn 4 sao',N'Quanh năm',N'Cặp đôi, Gia đình nhiều thế hệ, Thanh niên',1),
(1,N'Tour Maldives: Trải nghiệm thủy phi cơ và 2 đêm nghỉ dưỡng đẳng cấp tại Siyam World Maldives Resort 5*','2023-12-12','2023-12-17',7400000,N'Siyam World Maldives 5* là một chuỗi resort cao cấp, với những dịch vụ sang trọng và đẳng cấp - Siyam World là một biểu tượng cho sự nghỉ dưỡng xa hoa và giải trí tuyệt vời.',8,1,2,20,5,N'Dubai, Abu Dhabi , Bastakiya, Burj Khalifa, Vịnh Marina',N'Buffet sáng, Theo thực đơn',N'Khách sạn 4 sao',N'Quanh năm',N'Cặp đôi, Gia đình nhiều thế hệ, Thanh niên',1),
(1,N'Tour Nhật Bản: Tokyo - Núi Phú Sĩ - Odaiba - Korankei - Nagoya - Kyoto - Osaka','2023-12-21','2023-12-25',4100000,N'Nhật Bản: Tokyo - Núi Phú Sĩ - Oshino Hakkai - Obara - Nagoya - Kyoto - Kobe - Osaka,Hái trái cây,Ngắm Hoa Anh Đào mùa thu,Thu Bên Nhau',9,1,1,19,5,N'Tokyo, Núi Phú Sĩ, Kyoto, Osaka, Asakusa Kannon, Oshino Hakkai, Nagoya, Nhật Bản',N'Buffet sáng, Theo thực đơn',N'Khách sạn 3 sao',N'Quanh năm',N'Cặp đôi, Gia đình nhiều thế hệ, Thanh niên',1),
(1,N'Tour Thái Lan: Bangkok -Pattaya ','2023-11-23','2023-12-27',7400000,N'Thái Lan: Bangkok -Pattaya (Vườn lan Nong Nooch, tặng Show Colosseum và Buffet tại BaiYoke Sky)',3,1,2,13,5,N'Bangkok, Pattaya, Thai Lan, Coral Island, Gems Gallery',N'Buffet sáng, Theo thực đơn, Đặc sản địa phương',N'Khách sạn 4 sao',N'Quanh năm',N'Cặp đôi, Gia đình nhiều thế hệ, Thanh niên,Cặp đôi',1)
go
/*comboType: 0: xe+hotel, 1: maybay+hotel*/
insert into travel_package(travel_package_type,package_name,departure_date,return_date,price,description,available_seats,vehicle,departure_id,destination_id,checkin_time,checkout_time,vehicle_inf,combo_inf,combo_type)
values(2,N'Combo Quy Nhơn:Khu Du Lịch Cồn Chim - Trung Tâm Khám Phá Khoa Học','2023-11-28','2023-12-1',2100000,N'Quý khách sẽ được đến khám phá khoa học kỳ vĩ không chỉ dừng lại ở trải nghiệm tìm hiểu dải ngân hà mà còn những thí nghiệm vật lý vô cùng thú vị lý giải về những hiện tượng xung quanh chúng ta.',10,1,1,9,15,12,N'Vietravel Airlines',N'Vé máy bay khứ hồi HCM-Quy Nhơn,02 đêm lưu trú tại phòng tiêu chuẩn,Ăn sáng tại khách sạn.Miễn phí kết nối Internet không dây tại khách sạn.Sử dụng hồ bơi, phòng gym khách sạn',1),
(2,N'Combo Nha Trang: Dịch vụ xe Limousine khứ hồi + 2 đêm nghỉ tại Cam Ranh Riviera Beach Resort','2023-11-28','2023-12-1',2100000,N'Hãy trốn đến một góc thiên đường của trái đất,tất cả trải dài trên bãi cát trắng mịn và hoang sơ tại vùng biển Bãi Dài tuyệt đẹp.',2,0,2,5,5,7,N'Vietravel Limousine',N'Vé xe Limousine khứ hồi Tphcm - Cam Ranh - Tphcm,02 đêm nghỉ dưỡng,Bữa sáng tại khu nghỉ dưỡng,Miễn phí sử dụng các tiện ích của khách sạn: hồ bơi',0),
(2,N'Combo Vũng Tàu: Dịch vụ xe Limousine khứ hồi + 1 đêm nghỉ dưỡng tại Pullman Vũng Tàu 5 sao','2023-11-26','2023-11-27',2000000,N'Kiến trúc của Pullman Vũng Tàu là sự pha trộn giữa phong cách đương đại và bản sắc châu Á. Nơi đây thường được ưa chuộng bởi đối tượng khách đi công tác, hội nghị hay khách có nhu cầu nghỉ dưỡng trong không gian yên tĩnh.',5,0,2,1,15,12,N'Vietravel Limousine',N'Xe Limousine đưa đón từ TP.HCM - Vũng Tàu,01 đêm nghỉ dưỡng tại khách sạn,Bữa sáng hằng ngày,Trà và cà phê cùng 2 chai nước suối ',0),
(2,N'Combo Hạ Long: Dịch vụ vé máy bay + 2 đêm nghỉ dưỡng tại khách sạn Mường Thanh Grand 4 sao','2023-12-1','2023-12-03',3100000,N'Thưởng thức toàn cảnh non nước Hạ Long từ khách sạn đạt tiêu chuẩn 4 sao Mường Thanh Grand Hạ Long, quý khách sẽ có những trải nghiệm tuyệt vời và thú vị.',3,1,2,4,15,12,N'Vietravel Airlines',N'Vé máy bay khứ hồi TP.HCM - ĐÀ NẴNG (7kg xách tay, 15 kg ký gửi),02 đêm nghỉ dưỡng tại khách sạn,Bữa sáng tại khu nghỉ dưỡng,Trà và cà phê cùng 2 chai nước suối',1),
(2,N'Combo 3N2Đ CÔN ĐẢO - THIÊN ĐƯỜNG CỦA BIỂN','2023-12-9','2023-12-11',4990000,N'Với đội ngũ nhân viên trẻ, thân thiện luôn mong muốn làm hài lòng quý khách khi đặt chân đến Côn Đảo. Khách sạn còn tổ chức tour tham quan, bán vé máy bay, cho thuê xe ô tô, xe máy, hướng dẫn viên địa phương theo yêu cầu.',10,1,1,3,15,12,N'Bamboo Airways',N'Vé máy bay khứ hồi đi Côn Đảo,02 đêm nghỉ dưỡng tại khách sạn,02 bữa sáng theo tiêu chuẩn khách sạn',1),
(2,N'Combo Ấn Độ: Mumbai - Bollywood - Aurangabad - Ajanta - Ellora','2023-11-29','2023-12-04',3100000,N'Đến Mumbai - Thủ đô tài chính của Ấn Độ, nơi đây còn được gọi với cái tên "Thành phố của những giấc mơ" cũng chính là cái nôi của ngành công nghiệp điện ảnh lớn thứ hai trên thế giới Bollywood.',5,1,2,14,17,20,N'VietNam Airlines',N'Ghé thăm Hang động Elephanta,Tham quan Dhobi Ghat (Mahalaxmi Dhobi Ghat),Tham quan nơi làm việc của các diễn viên Bollywood',1),
(2,N'Combo Hàn Quốc: Seoul - Công viên Everland - Panda World - Đảo Nami - Thủy Cung Lotte Aquarium','2023-11-26','2023-11-26',9000000,N'Tham quan Bảo tàng văn hóa truyền thống quốc gia – là bảo tàng hàng đầu trưng bày văn hóa dân gian Hàn Quốc, thu hút 3 triệu lượt khách tham quan hằng năm.',7,1,2,16,12,10,N'Vietravel Airlines',N'Khám phá kinh đô thời trang bậc nhất tại Hàn Quốc Myeongdong Fashion Street,Quý khách tự do mua sắm,Thưởng thức chương trình biểu diễn nghệ thuật đặc sắc:',1),
(2,N'Combo Maldives:trải nghiệm đẳng cấp Water Villa giữa biển tại Adaaran Select Hudhuranfushi','2023-12-12','2023-12-15',9900000,N'Maldives, quốc đảo xinh đẹp nằm ở Ấn Độ Dương, được mệnh danh là thiên đường du lịch biển. Đặt chân tới hòn đảo xinh đẹp này, bạn sẽ được chào đón bởi khí hậu nhiệt đới quanh năm với bãi cát trắng.',9,1,2,20,15,12,N'Vietravel Airlines',N'2 Đêm nghỉ tại Water Villa,Ăn sáng trong khu resort,Tập yoga bên hồ bơi, massage',1),
(2,N'Combo Anh Quốc - Scotland: Di sản Thế giới Stonehenge','2023-12-08','2023-12-15',8900000,N'Du lịch Anh Quốc khiến du khách không khỏi sửng sốt trước sự hiện đại của một quốc gia hàng đầu thế giới. Không chỉ có những tòa nhà cao trọc trời, Anh Quốc còn bảo tồn gần như nguyên vẹn các công trình kiến trúc, điều đó thật đáng quý.',9,1,2,15,1,7,N'Vietnam Airlines',N'Nghỉ ngơi tại khách sạn của các thành phố bạn ghé qua,Tự do mua sắm tại London,Tham quan các CLB bóng đá Anh',1),
(2,N'Combo Đức: Khu đồng quê cối xay gió Zaanse Schans','2023-11-26','2023-12-03',9900000,N'Đức là thế giới của các hãng xe hơi danh tiếng như BMW, Ferrari, Porsche, Mercedes nơi có bảo tàng xe hơi đầy thú vị.Không chỉ có vậy, đất nước này nhộn nhịp với lễ hội bia Oktoberfest và xúc xích danh tiếng.',4,1,2,18,9,12,N'Vietnam Airlines',N'Quý khách ghé thăm quảng trường Schlossplatz và chụp hình bên ngoài lâu đài Neues Schloss,Du ngoạn phố cổ Luxembourg: Quảng trường D’Arme, Cung điện Grand Ducal',1)
go
select * from travel_package
go
insert into Images
values(1,'VungTau1.png'),(1,'VungTau2.png'),(1,'VungTau3.png'),(1,'VungTau4.png'),
(2,'CaoBang1.png'), (2,'CaoBang2.png'), (2,'CaoBang3.png'), (2,'CaoBang4.png'),
(3,'NhaTrang1.png'),(3,'NhaTrang2.png'),(3,'NhaTrang3.png'),(3,'NhaTrang4.png'),
(4,'QuyNhon1.png'),(4,'QuyNhon2.png'),(4,'QuyNhon3.png'),(4,'QuyNhon4.png'),
(5,'ConDao1.png'),(5,'ConDao2.png'),(5,'ConDao3.png'),(5,'ConDao4.png'),
(6,'DaiLoan1.png'),(6,'DaiLoan2.png'),(6,'DaiLoan3.png'),(6,'DaiLoan4.png'),
(7,'My1.png'),(7,'My2.png'),(7,'My3.png'),(7,'My4.png'),
(8,'Maldives1.png'),(8,'Maldives2.png'),(8,'Maldives3.png'),(8,'Maldives4.png'),
(9,'Nhat1.png'),(9,'Nhat2.png'),(9,'Nhat3.png'),(9,'Nhat4.png'),
(10,'Thai1.png'),(10,'Thai2.png'),(10,'Thai3.png'),(10,'Thai4.png'),
(11,'QuyNhon1.png'),(11,'QuyNhon2.png'),(11,'QuyNhon3.png'),(11,'QuyNhon4.png'),
(12,'NhaTrang1.png'),(12,'NhaTrang2.png'),(12,'NhaTrang3.png'),(12,'NhaTrang4.png'),
(13,'VungTau1.png'),(13,'VungTau2.png'),(13,'VungTau3.png'),(13,'VungTau4.png'),
(14,'HaLong1.png'),(14,'HaLong2.png'),(14,'HaLong3.png'),(14,'HaLong4.png'),
(15,'ConDao1.png'),(15,'ConDao2.png'),(15,'ConDao3.png'),(15,'ConDao4.png'),
(16,'AnDo1.png'), (16,'AnDo2.png'), (16,'AnDo3.png'), (16,'AnDo4.png'),
(17,'HanQuoc1.png'), (17,'HanQuoc2.png'), (17,'HanQuoc3.png'), (17,'HanQuoc4.png'),
(18,'Maldives1.png'),(18,'Maldives2.png'),(18,'Maldives3.png'),(18,'Maldives4.png'),
(19,'Anh1.png'), (19,'Anh2.png'), (19,'Anh3.png'), (19,'Anh4.png'),
(20,'Duc1.png'), (20,'Duc2.png'), (20,'Duc3.png'), (20,'Duc4.png')
go
select * from Images






