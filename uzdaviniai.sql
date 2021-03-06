-- 1. Lentelėje UserClicks (clickId, userId, dateTime) saugomi vartotojų click’ai. Parašykite užklausą, kuri suskaičiuotų kiek unikalių vartotojų buvo per mėnesį nuo šių metų pražios.
SELECT COUNT(userId) as Unique_Users, MONTH(dateTime) as Month FROM UserClicks WHERE dateTime >= CONCAT(YEAR(CURDATE()),'-01-01 00:00:00') GROUP BY MONTH(dateTime);

-- 2. Lentelėje Clients (clientId, birthDate) saugomi klientų gimimo datos. Išrinkite vartotojus, kurie švenčia šiandiena gimtadienius ir kiek jiems metų.
SELECT clientId as Client_Id, (YEAR(CURDATE()) - YEAR(birthDate)) as Years  FROM Clients WHERE MONTH(birthDate) = MONTH(CURDATE()) AND DAY(birthDate) = DAY(CURDATE());

-- 3. Straipsniai saugomi lenteles News (newsId, text, date), straipsnio komentarai saugomi lentelėje Comments (commentId, text, date, newsId). Išrinkite naujausios 10 straipsnių su paskutiniu parašytu komentaru.
SELECT News.*, Comments.text AS Comment_Text, Comments.date AS Comment_date
FROM News INNER JOIN Comments ON News.newsId = Comments.newsId
WHERE Comments.date IN (SELECT MAX(Comments.date) FROM Comments GROUP BY Comments.newsId)
ORDER BY News.date DESC LIMIT 10;