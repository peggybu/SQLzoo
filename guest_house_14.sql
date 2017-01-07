SELECT qq.qid, qq.qend FROM
(SELECT q.id AS qid, q.end AS qend, MIN(q.start) AS MINS FROM
(SELECT  q1.room_no AS id, q1.booking_date AS i, q1.ending_date AS end, q2.booking_date as start FROM
(SELECT booking_date, room_no, DATE_ADD(booking_date,INTERVAL nights DAY) AS ending_date FROM room JOIN booking
ON room.id=booking.room_no
WHERE room_type='double' and booking_date>'2016-11-02'
and DATE_ADD(booking_date,INTERVAL nights DAY) <'2016-12-20') q1
JOIN
(SELECT booking_date, room_no, DATE_ADD(booking_date,INTERVAL nights DAY) AS ending_date FROM room JOIN booking
ON room.id=booking.room_no
WHERE room_type='double' and booking_date>'2016-11-02'
and DATE_ADD(booking_date,INTERVAL nights DAY) <'2016-12-20') q2
ON q1.room_no=q2.room_no and q1.ending_date<=q2.booking_date) q
GROUP BY q.id, q.end) qq
WHERE DATEDIFF(qq.MINS, qq.qend)>=7
