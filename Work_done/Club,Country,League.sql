Use European_Soccer 
select team_long_name as Club, League.name as League, Country.name as Country
from Team, League, Country, Match
where (Match.home_team_api_id = Team.team_api_id or Match.away_team_api_id = Team.team_api_id) and league.id = country.id
order by club