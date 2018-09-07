select top 10 Player.player_name as Name, avg(overall_rating) as Lifetime_Average,
avg(Player_Attributes.acceleration) as Acceleration, avg(Player_Attributes.aggression) as Aggresion,
avg(Player_Attributes.agility) as Agility, avg(Player_Attributes.balance) as Balance,
avg(Player_Attributes.ball_control) as Ball_control, avg(Player_Attributes.crossing) as Crossing,
avg(Player_Attributes.curve) as Curve, avg(Player_Attributes.dribbling) as Dribbling,
avg(Player_Attributes.finishing) as Finishing, avg(Player_Attributes.free_kick_accuracy) as Free_Kick_Accuracy, 
avg(Player_Attributes.heading_accuracy) as Header_Accuracy, avg(Player_Attributes.interceptions) as Interceptions,
avg(Player_Attributes.jumping) as Jumping, avg(Player_Attributes.long_passing) as Long_Passing, 
avg(Player_Attributes.long_shots) as Long_Shots, avg(Player_Attributes.marking) as Marking, 
avg(Player_Attributes.penalties) as Penalties,avg(Player_Attributes.positioning) as Positioning, 
avg(Player_Attributes.potential) as Potential, avg(Player_Attributes.reactions) as Reactions, 
avg(Player_Attributes.short_passing) as Short_Passing, avg(Player_Attributes.shot_power) as Shot_Power,
avg(Player_Attributes.sliding_tackle) as Sliding_Tackle, avg(Player_Attributes.sprint_speed) as Sprint_Speed, 
avg(Player_Attributes.stamina) as Stamina, avg(Player_Attributes.standing_tackle) as Standing_Tackle, 
avg(Player_Attributes.strength) as Strength, avg(Player_Attributes.vision) as Vision, 
avg(Player_Attributes.volleys) as Volleys
from Player_Attributes FULL OUTER JOIN Player on Player_Attributes.player_api_id = Player.player_api_id 
where overall_rating > 0
group by Player_Attributes.player_api_id, Player.player_name
order by lifetime_average DESC;