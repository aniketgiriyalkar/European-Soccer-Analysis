Use European_Soccer
select col.Height, avg(col.Header) as 'Average Header Accuracy'
from(
select Player.height as 'Height', avg(Player_Attributes.heading_accuracy) as 'Header'
from Player inner join Player_Attributes on Player.id = Player_Attributes.id
group by Player.height, Player_Attributes.heading_accuracy
)col
group by col.Height
order by col.Height desc