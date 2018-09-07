select top 20 Player.player_name as Name, avg(Player_Attributes.heading_accuracy) as Heading_Accuracy, avg(Player_Attributes.interceptions) as Interceptions, 
avg(Player_Attributes.sliding_tackle) as Sliding_Tackles, avg(Player_Attributes.standing_tackle) as Standing_Tackles, 
avg(Player_Attributes.aggression) as Aggression, avg(Player_Attributes.strength) as Strength, 
(avg(Player_Attributes.heading_accuracy) + 3*avg(Player_Attributes.interceptions) + 2*avg(Player_Attributes.sliding_tackle) + 
2*avg(Player_Attributes.standing_tackle) + avg(Player_Attributes.aggression) + 2*avg(Player_Attributes.strength) )/11 as Rating,
Floor(datediff(day,substring(birthday,1,10), GETDATE())/365.25) as Age,
(case 
	when Floor(datediff(day,substring(birthday,1,10), GETDATE())/365.25) > 33 
	then'Retired' 
	else 
		case 
			when Floor(datediff(day,substring(birthday,1,10), GETDATE())/365.25) <= 33 
			then 'Playing'
		end
end) as Playing_Status
from Player_Attributes full outer join Player on Player_Attributes.player_api_id = Player.player_api_id
group by Player.player_name, Player.birthday
order by Rating desc