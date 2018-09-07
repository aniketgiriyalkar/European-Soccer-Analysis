select top 20 Player.player_name as Name, avg(Player_Attributes.gk_diving) as Diving, avg(Player_Attributes.gk_handling) as Handling, 
avg(Player_Attributes.gk_kicking) as Kicking, avg(Player_Attributes.gk_positioning) as Positioning, avg(Player_Attributes.gk_reflexes) as Reflexes, 
(2*avg(Player_Attributes.gk_diving) + avg(Player_Attributes.gk_handling) + avg(Player_Attributes.gk_kicking) + avg(Player_Attributes.gk_positioning) + 3*avg(Player_Attributes.gk_reflexes) )/8 as Rating,
Floor(datediff(day,substring(birthday,1,10), GETDATE())/365.25) as Age,
(case 
	when Floor(datediff(day,substring(birthday,1,10), GETDATE())/365.25) > 40 
	then'Retired' 
	else 
		case 
			when Floor(datediff(day,substring(birthday,1,10), GETDATE())/365.25) <= 40 
			then 'Playing'
		end
end) as Playing_Status
from Player_Attributes full outer join Player on Player_Attributes.player_api_id = Player.player_api_id
group by Player.player_name, Player.birthday
order by Rating desc