select player_name AS Name,Floor(datediff(day,substring(birthday,1,10), GETDATE())/365.25) as Age 
from Player
where Floor(datediff(day,substring(birthday,1,10), GETDATE())/365.25) < 34
order by Age desc