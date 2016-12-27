SELECT DISTINCT F1.last_name, F1.first_name, F2.first_name FROM
(SELECT id, booking_date, nights, last_name, first_name FROM booking
JOIN guest ON guest_id=id) F1
JOIN
(SELECT id, booking_date, nights, last_name, first_name FROM booking
JOIN guest ON guest_id=id) F2
ON F1.last_name=F2.last_name
WHERE F1.id>F2.id AND  ((F1.booking_date<=F2.booking_date 
AND DATE_ADD(F1.booking_date,INTERVAL F1.nights DAY)>F2.booking_date) OR
(F2.booking_date<=F1.booking_date AND 
DATE_ADD(F2.booking_date,INTERVAL F2.nights DAY)>F1.booking_date))
ORDER BY F1.last_name
