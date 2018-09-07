select home_team_goal,away_team_goal, WHD, WHA, WHH, 
(WHD*100/(WHA+WHD+WHH)) as Draw_Odds, (WHH*100/(WHA+WHD+WHH)) as Home_odds, (WHA*100/(WHA+WHD+WHH))as Away_odds
from match