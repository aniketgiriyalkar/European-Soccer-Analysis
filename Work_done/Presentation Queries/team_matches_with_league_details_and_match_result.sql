--match.id, match.country_id, match.season, team.team_short_name, match.home_team_goal, match.away_team_goal
--select match.home_team_api_id as HTid, match.away_team_api_id as ATid, team.team_api_id as HT, team.team_long_name as AT
--from match 
	--inner join 
--		Team on match.home_team_api_id = team.team_api_id 
select M.id, Country.name as Country, League.name as 'League Name', m.season as Season, 
substring(m.date,1,10) AS Date, HomeTeam.team_long_name as 'Home Team', AwayTeam.team_long_name as 'Away Team', 
M.home_team_goal as 'Home Team Goals', M.away_team_goal as 'Away Team Goals',
(case 
	when M.home_team_goal > M.away_team_goal
	then 'Home team won' 
	else 
		case 
			when M.home_team_goal < M.away_team_goal
			then 'Away team won'
			else
				case
					when M.home_team_goal = M.away_team_goal
					then 'Match Drawn'
				end
		end
end) as 'Win/Loss/Draw Class'
from match as M 
inner join team as HomeTeam on M.home_team_api_id = HomeTeam.team_api_id
inner join team as AwayTeam on M.away_team_api_id = AwayTeam.team_api_id
inner join Country on M.country_id = Country.id
inner join League on M.country_id = League.id