USE Photographer_Online
--Xem customer book những service nào của photographer nào

SELECT US.UserID, US.FullName, SV.ServiceName, ST.PhotographerID, tblUser.FullName  
	FROM tblBooking BK INNER JOIN tblUser US ON BK.CustomerID = US.UserID 
	INNER JOIN tblServicePhotographer ST ON BK.STID = ST.STID INNER JOIN tblService SV 
	ON ST.ServiceID = SV.ServiceID  INNER JOIN tblUser ON ST.PhotographerID = tblUser.UserID 
--Top 3 dịch vụ được book nhiều nhất
 
SELECT ST.ServiceID, COUNT(ST.ServiceID) FROM tblBooking BK INNER JOIN tblServicePhotographer ST ON BK.STID = ST.STID GROUP BY ST.ServiceID
			
SELECT Top 3 A.ServiceID, SV.Category, SV.ServiceName, A.[So Lan Book] FROM 
	(SELECT ST.ServiceID, COUNT(ST.ServiceID) as 'So Lan Book'  FROM tblBooking BK INNER JOIN tblServicePhotographer ST ON BK.STID = ST.STID GROUP BY ST.ServiceID)
	 as A INNER JOIN tblService SV ON A.ServiceID = SV.ServiceID
--Dịch vụ có doanh thu cao nhất trong tháng rồi
SELECT ST.ServiceID, SUM(ST.PRICE) as 'Tong Tien', COUNT(ST.ServiceID) as 'So Lan Book' 
	FROM tblBooking BK INNER JOIN tblServicePhotographer ST ON BK.STID = ST.STID 
		GROUP BY ST.ServiceID 
SELECT SV.ServiceID as 'Service ID'
	FROM tblBooking BK INNER JOIN tblServicePhotographer ST ON BK.STID = ST.STID
			INNER JOIN tblService SV ON ST.ServiceID = SV.ServiceID  
				WHERE MONTH(TimeBooking) = (SELECT MONTH(GETDATE())-1)

SELECT TOP 1 ST.ServiceID, SUM(ST.PRICE) as 'Tong Tien', COUNT(ST.ServiceID) as 'So Lan Book' 
	FROM tblBooking BK INNER JOIN tblServicePhotographer ST ON BK.STID = ST.STID 
		GROUP BY ST.ServiceID 
			HAVING ST.ServiceID in (SELECT SV.ServiceID as 'Service ID'
				FROM tblBooking BK INNER JOIN tblServicePhotographer ST ON BK.STID = ST.STID
					INNER JOIN tblService SV ON ST.ServiceID = SV.ServiceID  
						WHERE MONTH(TimeBooking) = (SELECT MONTH(GETDATE())-1)) 
