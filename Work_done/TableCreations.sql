Use EuroSoccer
CREATE TABLE Country (
    id   INTEGER PRIMARY KEY,
    country_name VARCHAR(256)    UNIQUE
);

CREATE TABLE League (
    id         INTEGER PRIMARY KEY,
    country_id INTEGER,
    league_name       VARCHAR(256)    UNIQUE,
    FOREIGN KEY (
        country_id
    )
    REFERENCES country (id) 
);
CREATE TABLE Player (
    id                 INTEGER PRIMARY KEY,
    player_api_id      INTEGER UNIQUE,
    player_name        VARCHAR(256),
    player_fifa_api_id INTEGER UNIQUE,
    birthday           VARCHAR(256),
    height             INTEGER,
    weight             INTEGER
);
CREATE TABLE Team (
    id               INTEGER PRIMARY KEY,
    team_api_id      INTEGER UNIQUE,
    team_fifa_api_id INTEGER UNIQUE,
    team_long_name   VARCHAR(256),
    team_short_name  VARCHAR(256)
);

CREATE TABLE [Match] (
    id               INTEGER PRIMARY KEY,
    country_id       INTEGER,
    league_id        INTEGER,
    season           VARCHAR(256),
    stage            INTEGER,
    date             VARCHAR(256),
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
    goal             VARCHAR(256),
    shoton           VARCHAR(256),
    shotoff          VARCHAR(256),
    foulcommit       VARCHAR(256),
    card             VARCHAR(256),
    [cross]          VARCHAR(256),
    corner           VARCHAR(256),
    possession       VARCHAR(256),
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
CREATE TABLE Player_Attributes (
    id                  INTEGER PRIMARY KEY,
    player_fifa_api_id  INTEGER,
    player_api_id       INTEGER,
    date                VARCHAR(256),
    overall_rating      INTEGER,
    potential           INTEGER,
    preferred_foot      VARCHAR(256),
    attacking_work_rate VARCHAR(256),
    defensive_work_rate VARCHAR(256),
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
    FOREIGN KEY (
        player_fifa_api_id
    )
    REFERENCES Player (player_fifa_api_id),
    FOREIGN KEY (
        player_api_id
    )
    REFERENCES Player (player_api_id) 
);
CREATE TABLE Team_Attributes (
    id                             INTEGER PRIMARY KEY,
    team_fifa_api_id               INTEGER,
    team_api_id                    INTEGER,
    date                           VARCHAR(256),
    buildUpPlaySpeed               INTEGER,
    buildUpPlaySpeedClass          VARCHAR(256),
    buildUpPlayDribbling           INTEGER,
    buildUpPlayDribblingClass      VARCHAR(256),
    buildUpPlayPassing             INTEGER,
    buildUpPlayPassingClass        VARCHAR(256),
    buildUpPlayPositioningClass    VARCHAR(256),
    chanceCreationPassing          INTEGER,
    chanceCreationPassingClass     VARCHAR(256),
    chanceCreationCrossing         INTEGER,
    chanceCreationCrossingClass    VARCHAR(256),
    chanceCreationShooting         INTEGER,
    chanceCreationShootingClass    VARCHAR(256),
    chanceCreationPositioningClass VARCHAR(256),
    defencePressure                INTEGER,
    defencePressureClass           VARCHAR(256),
    defenceAggression              INTEGER,
    defenceAggressionClass         VARCHAR(256),
    defenceTeamWidth               INTEGER,
    defenceTeamWidthClass          VARCHAR(256),
    defenceDefenderLineClass       VARCHAR(256),
    FOREIGN KEY (
        team_fifa_api_id
    )
    REFERENCES Team (team_fifa_api_id),
    FOREIGN KEY (
        team_api_id
    )
    REFERENCES Team (team_api_id) 
);