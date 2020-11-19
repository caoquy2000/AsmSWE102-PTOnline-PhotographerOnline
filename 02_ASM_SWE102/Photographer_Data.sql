USE Photographer_Online

--TBL ROLE
INSERT INTO tblRole 
	VALUES ('RL001','Customer')
INSERT INTO tblRole 
	VALUES ('RL002','Photographer')
INSERT INTO tblRole
	VALUES ('RL003','Admin')
--TBL USER
INSERT INTO tblUser
	VALUES ('US1412','quych1412','5546556aD',N'Cao Hoàng Quy',N'TP.HCM','09146824232','RL001')
INSERT INTO tblUser
	VALUES ('US1757','dat093124','142421aD',N'Lê Quốc Đạt',N'TP.HCM','09451644223','RL002')
INSERT INTO tblUser
	VALUES ('US1642','duchieupro9x','leBong9x',N'Bành Đức Hiếu',N'TP.CT','09166423167','RL001')
INSERT INTO tblUser
	VALUES ('US1235','ngoctran14','20112000hQ',N'Phùng Ngọc Trân',N'Ha Noi','09146873748','RL001')
INSERT INTO tblUser
	VALUES ('US1892','nguyen1999','056837Tn',N'Lý Khánh Nguyên',N'TP.CT','09451688992','RL002')
INSERT INTO tblUser
	VALUES ('US1980','trungkien9x','892914Tnng',N'Lưu Trung Kiên',N'Ha Noi','09234543125','RL001')
INSERT INTO tblUser
	VALUES ('US1421','trangdepgai9x','89315732Tava',N'Trần Thị Thảo Trang',N'TP.HCM','0989755423','RL001')
INSERT INTO tblUser
	VALUES ('US1425','trangdesfa','8931a57g32Tava',N'Lê Đức Anh',N'TP.CT','0989755423','RL002')
--TBL Message
select * from tblMessage
INSERT INTO tblMessage
	VALUES ('MS0001',N'Customer','2020-10-25 01:05:10 PM',N'Hi! Could you talk about service?','US1412','US1757')
INSERT INTO tblMessage
	VALUES ('MS0002',N'Photographer','2020-10-25 01:10:10 PM',N'I provide many service you can see','US1412','US1757')
INSERT INTO tblMessage
	VALUES ('MS0003',N'Customer','2020-10-25 01:15:10 PM',N'Ok. Thanks.','US1412','US1757')
INSERT INTO tblMessage
	VALUES ('MS0004',N'Customer','2020-10-26 05:02:10 PM',N'Hi! Could you have free time in saturday?','US1642','US1892')
INSERT INTO tblMessage
	VALUES ('MS0005',N'Photographer','2020-10-26 05:05:10 PM',N'Uh hmmm. I am free at 2pm','US1642','US1892')
INSERT INTO tblMessage
	VALUES ('MS0006',N'Customer','2020-10-26 05:07:10 PM',N'Ok. Help me practice','US1642','US1892')
INSERT INTO tblMessage
	VALUES ('MS0007',N'Photographer','2020-10-26 05:08:10 PM',N'See you at the gym','US1642','US1892')
--TBL Service
INSERT INTO tblService
	VALUES ('SV001',N'Photojournalism',N'Concierge Service')
INSERT INTO tblService
	VALUES ('SV002',N'Fashion',N'Matting and Framing')
INSERT INTO tblService
	VALUES ('SV003',N'Sports',N'Lifestyle and Composite')
INSERT INTO tblService
	VALUES ('SV004',N'Still Life Photography',N'Sports')
INSERT INTO tblService
	VALUES ('SV005',N'Architectural Photography',N'Portrait ')
INSERT INTO tblService
	VALUES ('SV006',N'Fashion',N'Wedding')
INSERT INTO tblService
	VALUES ('SV007',N'Fashion',N'Event')
--TBL ServicePhotographer
INSERT INTO tblServicePhotographer
	VALUES ('ST001',100,'SV001','US1757')
INSERT INTO tblServicePhotographer
	VALUES ('ST002',200,'SV002','US1757')
INSERT INTO tblServicePhotographer
	VALUES ('ST003',150,'SV003','US1757')
INSERT INTO tblServicePhotographer
	VALUES ('ST004',300,'SV001','US1892')
INSERT INTO tblServicePhotographer
	VALUES ('ST005',120,'SV004','US1892')
INSERT INTO tblServicePhotographer
	VALUES ('ST006',100,'SV005','US1892')
INSERT INTO tblServicePhotographer
	VALUES ('ST007',500,'SV007','US1892')
--TBL Photo

--TBL Booking
INSERT INTO tblBooking
	VALUES ('BK0001',N'Hi! I want to take photo','2020-10-20 01:15:10 PM',N'TP.HCM',N'Accepted',N'good!',5,'2020-10-22 02:15:15 PM','US1642','ST003')
INSERT INTO tblBooking
	VALUES ('BK0002',N'Hi! Reply me','2020-09-21 02:15:10 PM',N'TP.HCM',N'Waiting',NULL,NULL,NULL,'US1412','ST005')
INSERT INTO tblBooking
	VALUES ('BK0003',N'Hello! ','2020-10-21 03:15:10 PM',N'TP.CT',N'Accepted',N'good!',5,'2020-10-29 02:15:15 PM','US1235','ST007')
INSERT INTO tblBooking
	VALUES ('BK0004',N'Hi! ','2020-10-22 04:15:10 PM',N'Ha Noi',N'Waiting',NULL,NULL,NULL,'US1980','ST002')
INSERT INTO tblBooking
	VALUES ('BK0005',N'Hi!','2020-08-20 05:15:10 PM',N'TP.HCM',N'Accepted',N'good!',5,'2020-10-21 02:15:15 PM','US1421','ST001')
INSERT INTO tblBooking
	VALUES ('BK0006',N'Lorem is amaaaa','2020-09-20 05:15:10 PM',N'TP.CT',N'Accepted',N'Good!',5,'2020-09-21 02:15:15 PM','US1421','ST004')
INSERT INTO tblBooking
	VALUES ('BK0007',N'Lois ama ka','2020-10-20 05:15:10 PM',N'TP.HCM',N'Accepted',N'Bad!',0,'2020-10-21 02:15:15 PM','US1642','ST004')
--TBL TimeTable

INSERT INTO tblTimeTable
	VALUES('TT0001','2020-10-26 07:00:00','2020-10-26 08:00:00',N'Monday',N'Attended','BK0001','US1757')
INSERT INTO tblTimeTable
	VALUES('TT0002','2020-10-26 13:00:00','2020-10-26 15:00:00',N'Monday',N'Not Yet','BK0001','US1757')
INSERT INTO tblTimeTable
	VALUES('TT0003','2020-10-27 07:00:00','2020-10-27 08:00:00',N'Tuesday',N'Not Yet','BK0002','US1892')
INSERT INTO tblTimeTable
	VALUES('TT0004','2020-10-27 16:00:00','2020-10-27 17:00:00',N'Tuesday',N'Not Yet','BK0002','US1892')
INSERT INTO tblTimeTable
	VALUES('TT0005','2020-10-31 07:00:00','2020-10-31 08:00:00',N'Saturday',N'Attended','BK0003','US1892')
INSERT INTO tblTimeTable
	VALUES('TT0006','2020-11-01 09:00:00','2020-11-01 10:00:00',N'Sunday',N'Not Yet','BK0004','US1757')
INSERT INTO tblTimeTable
	VALUES('TT0007','2020-10-30 09:00:00','2020-10-30 10:00:00',N'Friday',N'Not Yet','BK0004','US1757')
INSERT INTO tblTimeTable
	VALUES('TT0008','2020-11-02 09:00:00','2020-11-02 10:00:00',N'Monday',N'Not Yet','BK0005','US1757')
INSERT INTO tblTimeTable
	VALUES('TT0009','2020-11-04 07:00:00','2020-11-04 08:00:00',N'Thursday',N'Not Yet','BK0005','US1757')