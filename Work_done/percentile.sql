Use European_Soccer
Select *
from (SELECT DISTINCT
            player_name,
            /*STDEV(overall_rating) OVER (PARTITION BY [player_name]) as Standard_Deviation,*/
            PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY overall_rating) OVER (PARTITION BY player_name) as 'Percentile'
FROM        Player_Attributes,Player
where Player.player_api_id = Player_Attributes.player_api_id
) as col
where col.Percentile > 87
order by col.Percentile Desc