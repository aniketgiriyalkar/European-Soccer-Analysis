select Player_Attributes.player_api_id, Player.player_name, avg(overall_rating) as lifetime_average
from Player_Attributes FULL OUTER JOIN Player on Player_Attributes.player_api_id = Player.player_api_id 
where overall_rating > 0 
group by Player_Attributes.player_api_id, Player.player_name
order by lifetime_average DESC;