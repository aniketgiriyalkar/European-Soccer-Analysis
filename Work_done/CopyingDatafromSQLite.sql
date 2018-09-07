Use Soccer
select * 
into Country
from openquery(MYSQLITE, 'select * from country ')
Use Soccer
select * 
into Match
from openquery(MYSQLITE, 'select * from [match] ')
Use Soccer
select * 
into League
from openquery(MYSQLITE, 'select * from league ')
Use Soccer
select * 
into Team
from openquery(MYSQLITE, 'select * from team')
Use Soccer
select * 
into Player
from openquery(MYSQLITE, 'select * from player ')
Use Soccer
select * 
into Player_Attributes
from openquery(MYSQLITE, 'select * from player_attributes ')
Use Soccer
select * 
into Team_Attributes
from openquery(MYSQLITE, 'select * from team_attributes ')