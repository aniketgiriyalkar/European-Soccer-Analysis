Use European_Soccer
/*select DISTINCT Player.height as 'Height', avg(Player_Attributes.potential) as 'Potential'
from Player_Attributes full outer join Player on Player_Attributes.id = Player.id
where Player.height > 0
group by potential, height
order by 'Height' DESC*/
select col.Height, avg(col.Potential) as 'Average Potential'
from(
select Player.height as 'Height', avg(Player_Attributes.potential) as 'Potential'
from Player inner join Player_Attributes on Player.id = Player_Attributes.id
group by Player.height, Player_Attributes.potential
)col
group by col.Height
order by col.Height desc