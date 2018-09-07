select top 20 Player.player_name as Name, avg(Player_Attributes.crossing) as Crossing, avg(Player_Attributes.short_passing) as Short_Passing, 
avg(Player_Attributes.vision) as Vision, avg(Player_Attributes.ball_control) as Ball_Control, 
avg(Player_Attributes.penalties) as Penalties, avg(Player_Attributes.potential) as Potential, 
avg(Player_Attributes.volleys) as Volleys, avg(Player_Attributes.finishing) as Finishing, avg(Player_Attributes.dribbling) as Dribbling,
(avg(Player_Attributes.crossing) + avg(Player_Attributes.short_passing) + 2*avg(Player_Attributes.vision) + 3*avg(Player_Attributes.ball_control) + 
2*avg(Player_Attributes.penalties) + 2*avg(Player_Attributes.potential) + avg(Player_Attributes.volleys) + 3*avg(Player_Attributes.finishing) + 
3*avg(Player_Attributes.dribbling) )/18 as Rating,
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


select top 20 Player.player_name as Name, avg(Player_Attributes.crossing) as Crossing, avg(Player_Attributes.short_passing) as Short_Passing, 
avg(Player_Attributes.vision) as Vision, avg(Player_Attributes.ball_control) as Ball_Control, 
avg(Player_Attributes.penalties) as Penalties, avg(Player_Attributes.potential) as Potential, 
avg(Player_Attributes.volleys) as Volleys, avg(Player_Attributes.finishing) as Finishing, avg(Player_Attributes.dribbling) as Dribbling,
(avg(Player_Attributes.crossing) + avg(Player_Attributes.short_passing) + 2*avg(Player_Attributes.vision) + 3*avg(Player_Attributes.ball_control) + 
2*avg(Player_Attributes.penalties) + 2*avg(Player_Attributes.potential) + avg(Player_Attributes.volleys) + 3*avg(Player_Attributes.finishing) + 
3*avg(Player_Attributes.dribbling) )/18 as Rating,
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
where Floor(datediff(day,substring(birthday,1,10), GETDATE())/365.25) > 33
group by Player.player_name, Player.birthday
order by Rating desc