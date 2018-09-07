Use European_Soccer
CREATE TABLE Country (
    id   INTEGER PRIMARY KEY,
    name Varchar(512)    UNIQUE
);
CREATE TABLE League (
    id         INTEGER PRIMARY KEY,
    country_id INTEGER,
    name       Varchar(512)   UNIQUE,
    FOREIGN KEY (country_id)
    REFERENCES country (id) 
);
Use European_Soccer
Insert into Country(id, name)
select id,name
from openquery(MYSQLITE, 'select * from country ')
Use European_Soccer
Insert into League(id, country_id , name)
select id,country_id,name
from openquery(MYSQLITE, 'select * from league ')

CREATE TABLE Player (
    id                 INTEGER PRIMARY KEY,
    player_api_id      INTEGER UNIQUE,
    player_name        Varchar(512),
    player_fifa_api_id INTEGER UNIQUE,
    birthday           Varchar(512),
    height             INTEGER,
    weight             INTEGER
);

Use European_Soccer
Insert into Player([id]
      ,[player_api_id]
      ,[player_name]
      ,[player_fifa_api_id]
      ,[birthday]
      ,[height]
      ,[weight])
Select [id]
      ,[player_api_id]
      ,[player_name]
      ,[player_fifa_api_id]
      ,[birthday]
      ,[height]
      ,[weight]
from openquery(MYSQLITE, 'select * from player ')

CREATE TABLE Team (
    id               INTEGER PRIMARY KEY,
    team_api_id      INTEGER UNIQUE,
    team_fifa_api_id INTEGER,
    team_long_name   Varchar(512),
    team_short_name  Varchar(512)
);
Use European_Soccer
insert into team([id]
      ,[team_api_id]
      ,[team_fifa_api_id]
      ,[team_long_name]
      ,[team_short_name])
select [id]
      ,[team_api_id]
      ,[team_fifa_api_id]
      ,[team_long_name]
      ,[team_short_name]
from openquery(MYSQLITE, 'select * from team ')

Drop Table Team_attributes
CREATE TABLE Team_Attributes (
    id                             INTEGER PRIMARY KEY,
    team_fifa_api_id               INTEGER,
    team_api_id                    INTEGER,
    date                           Varchar(512),
    buildUpPlaySpeed               INTEGER,
    buildUpPlaySpeedClass          Varchar(512),
    buildUpPlayDribbling           INTEGER,
    buildUpPlayDribblingClass      Varchar(512),
    buildUpPlayPassing             INTEGER,
    buildUpPlayPassingClass        Varchar(512),
    buildUpPlayPositioningClass    Varchar(512),
    chanceCreationPassing          INTEGER,
    chanceCreationPassingClass     Varchar(512),
    chanceCreationCrossing         INTEGER,
    chanceCreationCrossingClass    Varchar(512),
    chanceCreationShooting         INTEGER,
    chanceCreationShootingClass    Varchar(512),
    chanceCreationPositioningClass Varchar(512),
    defencePressure                INTEGER,
    defencePressureClass           Varchar(512),
    defenceAggression              INTEGER,
    defenceAggressionClass         Varchar(512),
    defenceTeamWidth               INTEGER,
    defenceTeamWidthClass          Varchar(512),
    defenceDefenderLineClass       Varchar(512),
    FOREIGN KEY (team_fifa_api_id)
    REFERENCES Team (team_fifa_api_id),
    FOREIGN KEY (team_api_id)
    REFERENCES Team (team_api_id) 
);

CREATE TABLE Player_Attributes (
    id                  INTEGER PRIMARY KEY,
    player_fifa_api_id  INTEGER,
    player_api_id       INTEGER,
    date                Varchar(512),
    overall_rating      INTEGER,
    potential           INTEGER,
    preferred_foot      Varchar(512),
    attacking_work_rate Varchar(512),
    defensive_work_rate Varchar(512),
    crossing            INTEGER,
    finishing           INTEGER,
    heading_accuracy    INTEGER,
    short_passing       INTEGER,
    volleys             INTEGER,
    dribbling           INTEGER,
    curve               INTEGER,
    free_kick_accuracy  INTEGER,
    long_passing        INTEGER,
    ball_control        INTEGER,
    acceleration        INTEGER,
    sprint_speed        INTEGER,
    agility             INTEGER,
    reactions           INTEGER,
    balance             INTEGER,
    shot_power          INTEGER,
    jumping             INTEGER,
    stamina             INTEGER,
    strength            INTEGER,
    long_shots          INTEGER,
    aggression          INTEGER,
    interceptions       INTEGER,
    positioning         INTEGER,
    vision              INTEGER,
    penalties           INTEGER,
    marking             INTEGER,
    standing_tackle     INTEGER,
    sliding_tackle      INTEGER,
    gk_diving           INTEGER,
    gk_handling         INTEGER,
    gk_kicking          INTEGER,
    gk_positioning      INTEGER,
    gk_reflexes         INTEGER,
    FOREIGN KEY (player_fifa_api_id)
    REFERENCES Player(player_fifa_api_id),
    FOREIGN KEY (player_api_id )
    REFERENCES Player (player_api_id) 
);
Use European_Soccer
Insert into Team_Attributes([id]
      ,[team_fifa_api_id]
      ,[team_api_id]
      ,[date]
      ,[buildUpPlaySpeed]
      ,[buildUpPlaySpeedClass]
      ,[buildUpPlayDribbling]
      ,[buildUpPlayDribblingClass]
      ,[buildUpPlayPassing]
      ,[buildUpPlayPassingClass]
      ,[buildUpPlayPositioningClass]
      ,[chanceCreationPassing]
      ,[chanceCreationPassingClass]
      ,[chanceCreationCrossing]
      ,[chanceCreationCrossingClass]
      ,[chanceCreationShooting]
      ,[chanceCreationShootingClass]
      ,[chanceCreationPositioningClass]
      ,[defencePressure]
      ,[defencePressureClass]
      ,[defenceAggression]
      ,[defenceAggressionClass]
      ,[defenceTeamWidth]
      ,[defenceTeamWidthClass]
      ,[defenceDefenderLineClass])
Select [id]
      ,[team_fifa_api_id]
      ,[team_api_id]
      ,[date]
      ,[buildUpPlaySpeed]
      ,[buildUpPlaySpeedClass]
      ,[buildUpPlayDribbling]
      ,[buildUpPlayDribblingClass]
      ,[buildUpPlayPassing]
      ,[buildUpPlayPassingClass]
      ,[buildUpPlayPositioningClass]
      ,[chanceCreationPassing]
      ,[chanceCreationPassingClass]
      ,[chanceCreationCrossing]
      ,[chanceCreationCrossingClass]
      ,[chanceCreationShooting]
      ,[chanceCreationShootingClass]
      ,[chanceCreationPositioningClass]
      ,[defencePressure]
      ,[defencePressureClass]
      ,[defenceAggression]
      ,[defenceAggressionClass]
      ,[defenceTeamWidth]
      ,[defenceTeamWidthClass]
      ,[defenceDefenderLineClass]
from openquery(MYSQLITE, 'Select * from Team_Attributes where team_api_id in ( Select team_api_id from Team) ')

 Use European_Soccer
 insert into Player_Attributes([id]
      ,[player_fifa_api_id]
      ,[player_api_id]
      ,[date]
      ,[overall_rating]
      ,[potential]
      ,[preferred_foot]
      ,[attacking_work_rate]
      ,[defensive_work_rate]
      ,[crossing]
      ,[finishing]
      ,[heading_accuracy]
      ,[short_passing]
      ,[volleys]
      ,[dribbling]
      ,[curve]
      ,[free_kick_accuracy]
      ,[long_passing]
      ,[ball_control]
      ,[acceleration]
      ,[sprint_speed]
      ,[agility]
      ,[reactions]
      ,[balance]
      ,[shot_power]
      ,[jumping]
      ,[stamina]
      ,[strength]
      ,[long_shots]
      ,[aggression]
      ,[interceptions]
      ,[positioning]
      ,[vision]
      ,[penalties]
      ,[marking]
      ,[standing_tackle]
      ,[sliding_tackle]
      ,[gk_diving]
      ,[gk_handling]
      ,[gk_kicking]
      ,[gk_positioning]
      ,[gk_reflexes])
select [id]
      ,[player_fifa_api_id]
      ,[player_api_id]
      ,[date]
      ,[overall_rating]
      ,[potential]
      ,[preferred_foot]
      ,[attacking_work_rate]
      ,[defensive_work_rate]
      ,[crossing]
      ,[finishing]
      ,[heading_accuracy]
      ,[short_passing]
      ,[volleys]
      ,[dribbling]
      ,[curve]
      ,[free_kick_accuracy]
      ,[long_passing]
      ,[ball_control]
      ,[acceleration]
      ,[sprint_speed]
      ,[agility]
      ,[reactions]
      ,[balance]
      ,[shot_power]
      ,[jumping]
      ,[stamina]
      ,[strength]
      ,[long_shots]
      ,[aggression]
      ,[interceptions]
      ,[positioning]
      ,[vision]
      ,[penalties]
      ,[marking]
      ,[standing_tackle]
      ,[sliding_tackle]
      ,[gk_diving]
      ,[gk_handling]
      ,[gk_kicking]
      ,[gk_positioning]
      ,[gk_reflexes]
from openquery(MYSQLITE, 'Select * from Player_Attributes where player_fifa_api_id in ( Select player_fifa_api_id from Player) ')
Select * from Player_Attributes

CREATE TABLE [Match] (
    id               INTEGER PRIMARY KEY,
    country_id       INTEGER,
    league_id        INTEGER,
    season           Varchar(max),
    stage            INTEGER,
    date             Varchar(max),
    match_api_id     INTEGER UNIQUE,
    home_team_api_id INTEGER,
    away_team_api_id INTEGER,
    home_team_goal   INTEGER,
    away_team_goal   INTEGER,
    home_player_X1   INTEGER,
    home_player_X2   INTEGER,
    home_player_X3   INTEGER,
    home_player_X4   INTEGER,
    home_player_X5   INTEGER,
    home_player_X6   INTEGER,
    home_player_X7   INTEGER,
    home_player_X8   INTEGER,
    home_player_X9   INTEGER,
    home_player_X10  INTEGER,
    home_player_X11  INTEGER,
    away_player_X1   INTEGER,
    away_player_X2   INTEGER,
    away_player_X3   INTEGER,
    away_player_X4   INTEGER,
    away_player_X5   INTEGER,
    away_player_X6   INTEGER,
    away_player_X7   INTEGER,
    away_player_X8   INTEGER,
    away_player_X9   INTEGER,
    away_player_X10  INTEGER,
    away_player_X11  INTEGER,
    home_player_Y1   INTEGER,
    home_player_Y2   INTEGER,
    home_player_Y3   INTEGER,
    home_player_Y4   INTEGER,
    home_player_Y5   INTEGER,
    home_player_Y6   INTEGER,
    home_player_Y7   INTEGER,
    home_player_Y8   INTEGER,
    home_player_Y9   INTEGER,
    home_player_Y10  INTEGER,
    home_player_Y11  INTEGER,
    away_player_Y1   INTEGER,
    away_player_Y2   INTEGER,
    away_player_Y3   INTEGER,
    away_player_Y4   INTEGER,
    away_player_Y5   INTEGER,
    away_player_Y6   INTEGER,
    away_player_Y7   INTEGER,
    away_player_Y8   INTEGER,
    away_player_Y9   INTEGER,
    away_player_Y10  INTEGER,
    away_player_Y11  INTEGER,
    home_player_1    INTEGER,
    home_player_2    INTEGER,
    home_player_3    INTEGER,
    home_player_4    INTEGER,
    home_player_5    INTEGER,
    home_player_6    INTEGER,
    home_player_7    INTEGER,
    home_player_8    INTEGER,
    home_player_9    INTEGER,
    home_player_10   INTEGER,
    home_player_11   INTEGER,
    away_player_1    INTEGER,
    away_player_2    INTEGER,
    away_player_3    INTEGER,
    away_player_4    INTEGER,
    away_player_5    INTEGER,
    away_player_6    INTEGER,
    away_player_7    INTEGER,
    away_player_8    INTEGER,
    away_player_9    INTEGER,
    away_player_10   INTEGER,
    away_player_11   INTEGER,
    goal             Varchar(max),
    shoton           Varchar(max),
    shotoff          Varchar(max),
    foulcommit       Varchar(max),
    card             Varchar(max),
    [cross]          Varchar(max),
    corner           Varchar(max),
    possession       Varchar(max),
    B365H            NUMERIC,
    B365D            NUMERIC,
    B365A            NUMERIC,
    BWH              NUMERIC,
    BWD              NUMERIC,
    BWA              NUMERIC,
    IWH              NUMERIC,
    IWD              NUMERIC,
    IWA              NUMERIC,
    LBH              NUMERIC,
    LBD              NUMERIC,
    LBA              NUMERIC,
    PSH              NUMERIC,
    PSD              NUMERIC,
    PSA              NUMERIC,
    WHH              NUMERIC,
    WHD              NUMERIC,
    WHA              NUMERIC,
    SJH              NUMERIC,
    SJD              NUMERIC,
    SJA              NUMERIC,
    VCH              NUMERIC,
    VCD              NUMERIC,
    VCA              NUMERIC,
    GBH              NUMERIC,
    GBD              NUMERIC,
    GBA              NUMERIC,
    BSH              NUMERIC,
    BSD              NUMERIC,
    BSA              NUMERIC,
    FOREIGN KEY (
        country_id
    )
    REFERENCES country (id),
    FOREIGN KEY (
        league_id
    )
    REFERENCES League (id),
    FOREIGN KEY (
        home_team_api_id
    )
    REFERENCES Team (team_api_id),
    FOREIGN KEY (
        away_team_api_id
    )
    REFERENCES Team (team_api_id),
    FOREIGN KEY (
        home_player_1
    )
    REFERENCES Player (player_api_id),
    FOREIGN KEY (
        home_player_2
    )
    REFERENCES Player (player_api_id),
    FOREIGN KEY (
        home_player_3
    )
    REFERENCES Player (player_api_id),
    FOREIGN KEY (
        home_player_4
    )
    REFERENCES Player (player_api_id),
    FOREIGN KEY (
        home_player_5
    )
    REFERENCES Player (player_api_id),
    FOREIGN KEY (
        home_player_6
    )
    REFERENCES Player (player_api_id),
    FOREIGN KEY (
        home_player_7
    )
    REFERENCES Player (player_api_id),
    FOREIGN KEY (
        home_player_8
    )
    REFERENCES Player (player_api_id),
    FOREIGN KEY (
        home_player_9
    )
    REFERENCES Player (player_api_id),
    FOREIGN KEY (
        home_player_10
    )
    REFERENCES Player (player_api_id),
    FOREIGN KEY (
        home_player_11
    )
    REFERENCES Player (player_api_id),
    FOREIGN KEY (
        away_player_1
    )
    REFERENCES Player (player_api_id),
    FOREIGN KEY (
        away_player_2
    )
    REFERENCES Player (player_api_id),
    FOREIGN KEY (
        away_player_3
    )
    REFERENCES Player (player_api_id),
    FOREIGN KEY (
        away_player_4
    )
    REFERENCES Player (player_api_id),
    FOREIGN KEY (
        away_player_5
    )
    REFERENCES Player (player_api_id),
    FOREIGN KEY (
        away_player_6
    )
    REFERENCES Player (player_api_id),
    FOREIGN KEY (
        away_player_7
    )
    REFERENCES Player (player_api_id),
    FOREIGN KEY (
        away_player_8
    )
    REFERENCES Player (player_api_id),
    FOREIGN KEY (
        away_player_9
    )
    REFERENCES Player (player_api_id),
    FOREIGN KEY (
        away_player_10
    )
    REFERENCES Player (player_api_id),
    FOREIGN KEY (
        away_player_11
    )
    REFERENCES Player (player_api_id) 
);



Insert Into Match( [id]
      ,[country_id]
      ,[league_id]
      ,[season]
      ,[stage]
      ,[date]
      ,[match_api_id]
      ,[home_team_api_id]
      ,[away_team_api_id]
      ,[home_team_goal]
      ,[away_team_goal]
      ,[home_player_X1]
      ,[home_player_X2]
      ,[home_player_X3]
      ,[home_player_X4]
      ,[home_player_X5]
      ,[home_player_X6]
      ,[home_player_X7]
      ,[home_player_X8]
      ,[home_player_X9]
      ,[home_player_X10]
      ,[home_player_X11]
      ,[away_player_X1]
      ,[away_player_X2]
      ,[away_player_X3]
      ,[away_player_X4]
      ,[away_player_X5]
      ,[away_player_X6]
      ,[away_player_X7]
      ,[away_player_X8]
      ,[away_player_X9]
      ,[away_player_X10]
      ,[away_player_X11]
      ,[home_player_Y1]
      ,[home_player_Y2]
      ,[home_player_Y3]
      ,[home_player_Y4]
      ,[home_player_Y5]
      ,[home_player_Y6]
      ,[home_player_Y7]
      ,[home_player_Y8]
      ,[home_player_Y9]
      ,[home_player_Y10]
      ,[home_player_Y11]
      ,[away_player_Y1]
      ,[away_player_Y2]
      ,[away_player_Y3]
      ,[away_player_Y4]
      ,[away_player_Y5]
      ,[away_player_Y6]
      ,[away_player_Y7]
      ,[away_player_Y8]
      ,[away_player_Y9]
      ,[away_player_Y10]
      ,[away_player_Y11]
      ,[home_player_1]
      ,[home_player_2]
      ,[home_player_3]
      ,[home_player_4]
      ,[home_player_5]
      ,[home_player_6]
      ,[home_player_7]
      ,[home_player_8]
      ,[home_player_9]
      ,[home_player_10]
      ,[home_player_11]
      ,[away_player_1]
      ,[away_player_2]
      ,[away_player_3]
      ,[away_player_4]
      ,[away_player_5]
      ,[away_player_6]
      ,[away_player_7]
      ,[away_player_8]
      ,[away_player_9]
      ,[away_player_10]
      ,[away_player_11]
      ,[goal]
      ,[shoton]
      ,[shotoff]
      ,[foulcommit]
      ,[card]
      ,[cross]
      ,[corner]
      ,[possession]
      ,[B365H]
      ,[B365D]
      ,[B365A]
      ,[BWH]
      ,[BWD]
      ,[BWA]
      ,[IWH]
      ,[IWD]
      ,[IWA]
      ,[LBH]
      ,[LBD]
      ,[LBA]
      ,[PSH]
      ,[PSD]
      ,[PSA]
      ,[WHH]
      ,[WHD]
      ,[WHA]
      ,[SJH]
      ,[SJD]
      ,[SJA]
      ,[VCH]
      ,[VCD]
      ,[VCA]
      ,[GBH]
      ,[GBD]
      ,[GBA]
      ,[BSH]
      ,[BSD]
      ,[BSA])
Select  [id]
      ,[country_id]
      ,[league_id]
      ,[season]
      ,[stage]
      ,[date]
      ,[match_api_id]
      ,[home_team_api_id]
      ,[away_team_api_id]
      ,[home_team_goal]
      ,[away_team_goal]
      ,[home_player_X1]
      ,[home_player_X2]
      ,[home_player_X3]
      ,[home_player_X4]
      ,[home_player_X5]
      ,[home_player_X6]
      ,[home_player_X7]
      ,[home_player_X8]
      ,[home_player_X9]
      ,[home_player_X10]
      ,[home_player_X11]
      ,[away_player_X1]
      ,[away_player_X2]
      ,[away_player_X3]
      ,[away_player_X4]
      ,[away_player_X5]
      ,[away_player_X6]
      ,[away_player_X7]
      ,[away_player_X8]
      ,[away_player_X9]
      ,[away_player_X10]
      ,[away_player_X11]
      ,[home_player_Y1]
      ,[home_player_Y2]
      ,[home_player_Y3]
      ,[home_player_Y4]
      ,[home_player_Y5]
      ,[home_player_Y6]
      ,[home_player_Y7]
      ,[home_player_Y8]
      ,[home_player_Y9]
      ,[home_player_Y10]
      ,[home_player_Y11]
      ,[away_player_Y1]
      ,[away_player_Y2]
      ,[away_player_Y3]
      ,[away_player_Y4]
      ,[away_player_Y5]
      ,[away_player_Y6]
      ,[away_player_Y7]
      ,[away_player_Y8]
      ,[away_player_Y9]
      ,[away_player_Y10]
      ,[away_player_Y11]
      ,[home_player_1]
      ,[home_player_2]
      ,[home_player_3]
      ,[home_player_4]
      ,[home_player_5]
      ,[home_player_6]
      ,[home_player_7]
      ,[home_player_8]
      ,[home_player_9]
      ,[home_player_10]
      ,[home_player_11]
      ,[away_player_1]
      ,[away_player_2]
      ,[away_player_3]
      ,[away_player_4]
      ,[away_player_5]
      ,[away_player_6]
      ,[away_player_7]
      ,[away_player_8]
      ,[away_player_9]
      ,[away_player_10]
      ,[away_player_11]
      ,[goal]
      ,[shoton]
      ,[shotoff]
      ,[foulcommit]
      ,[card]
      ,[cross]
      ,[corner]
      ,[possession]
      ,[B365H]
      ,[B365D]
      ,[B365A]
      ,[BWH]
      ,[BWD]
      ,[BWA]
      ,[IWH]
      ,[IWD]
      ,[IWA]
      ,[LBH]
      ,[LBD]
      ,[LBA]
      ,[PSH]
      ,[PSD]
      ,[PSA]
      ,[WHH]
      ,[WHD]
      ,[WHA]
      ,[SJH]
      ,[SJD]
      ,[SJA]
      ,[VCH]
      ,[VCD]
      ,[VCA]
      ,[GBH]
      ,[GBD]
      ,[GBA]
      ,[BSH]
      ,[BSD]
      ,[BSA]
from openquery(MYSQLITE, ' 
Select * from [Match] where ( home_team_api_id in ( Select team_api_id from Team) and away_team_api_id in ( Select team_api_id from Team)) ')

Select * from match