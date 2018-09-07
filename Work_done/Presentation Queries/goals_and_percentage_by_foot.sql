select count(preferred_foot) as Goals_by_foot, preferred_foot, (count(preferred_foot)*100.0/(select count(*) from Player_Attributes)) as Percentage
from Player_Attributes 
where preferred_foot != 'NULL'
group by preferred_foot
order by preferred_foot