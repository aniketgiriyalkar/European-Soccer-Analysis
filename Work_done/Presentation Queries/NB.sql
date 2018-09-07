	select HomeTeam.team_long_name as 'Home Team', AwayTeam.team_long_name as 'Away Team', 
	M.home_team_goal as 'Home Team Goals', M.away_team_goal as 'Away Team Goals',
	(case 
		when M.home_team_goal > M.away_team_goal
		then '1' 
		else 
			case 
				when M.home_team_goal < M.away_team_goal
				then '2'
				else
					case
						when M.home_team_goal = M.away_team_goal
						then '3'
					end
			end
	end) as 'Win/Loss/Draw Class', 
	Country.name as 'Country of Match'
	from match as M 
	inner join team as HomeTeam on M.home_team_api_id = HomeTeam.team_api_id
	inner join team as AwayTeam on M.away_team_api_id = AwayTeam.team_api_id
	inner join Country on M.country_id = Country.id
	inner join League on M.country_id = League.id