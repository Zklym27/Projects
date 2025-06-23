CREATE TABLE players(player_id        INTEGER,
					player_name       varchar(100),
					 country          varchar(50),
					 age       		  INTEGER,
	   CONSTRAINT pk_players PRIMARY KEY (player_id)
					);
					
CREATE TABLE tournaments (tournament_id INTEGER,
    					tournament_name VARCHAR(255) NOT NULL,
    					year INTEGER CHECK (year > 0 AND year <= 2024),
    					host_course VARCHAR(255),
    					winner_id INTEGER,
    		CONSTRAINT fk_tournaments_winner_id FOREIGN KEY (winner_id) REFERENCES Players(player_id) ON DELETE SET NULL ON UPDATE CASCADE,
    		CONSTRAINT pk_tournaments PRIMARY KEY (tournament_id)
);

CREATE TABLE scores (score_id INTEGER,
    				tournament_id INTEGER,
    				player_id INTEGER,
    				round_number INTEGER,
    				total_score INTEGER,
    		CONSTRAINT fk_scores_tournament_id FOREIGN KEY (tournament_id) REFERENCES Tournaments(tournament_id) ON DELETE CASCADE ON UPDATE CASCADE,
    		CONSTRAINT fk_scores_player_id FOREIGN KEY (player_id) REFERENCES Players(player_id) ON DELETE CASCADE ON UPDATE CASCADE,
    		CONSTRAINT pk_scores PRIMARY KEY (score_id)
);

CREATE TABLE rankings (ranking_id INTEGER,
					tournament_id INTEGER,
    				player_id INTEGER,
    				position varchar(30),
    	CONSTRAINT fk_rankings_tournament_id FOREIGN KEY (tournament_id) REFERENCES Tournaments(tournament_id) ON DELETE CASCADE ON UPDATE CASCADE,
    	CONSTRAINT fk_rankings_player_id FOREIGN KEY (player_id) REFERENCES Players(player_id) ON DELETE CASCADE ON UPDATE CASCADE,
    	CONSTRAINT pk_rankings PRIMARY KEY (ranking_id)
);

CREATE TABLE officials (official_id INTEGER,
    					official_name varchar(255) NOT NULL,
    					role varchar(100),
    					tournament_id INTEGER,		
				CONSTRAINT pk_officials PRIMARY KEY (official_id),
    			CONSTRAINT fk_officials_tournament_id FOREIGN KEY (tournament_id) REFERENCES tournaments(tournament_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE sponsors (sponsor_id INTEGER,
    				sponsor_name varchar(255) NOT NULL,
    				industry varchar(100),
    				contact_info varchar(255),
    				player_id INTEGER,
			CONSTRAINT pk_sponsors PRIMARY KEY (sponsor_id),
    		CONSTRAINT fk_sponsors_player_id FOREIGN KEY (player_id) REFERENCES players(player_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE prizes (prize_id INTEGER,
    				tournament_id INTEGER,
    				rank_position varchar(30),
					prize_value NUMERIC(10, 2),
    	CONSTRAINT fk_prizes_tournament_id FOREIGN KEY (tournament_id) REFERENCES Tournaments(tournament_id) ON DELETE CASCADE ON UPDATE CASCADE,
    	CONSTRAINT pk_prizes PRIMARY KEY (prize_id)
);

CREATE TABLE Holes (hole_id INTEGER,
    				tournament_id INTEGER,
    				hole_number INTEGER,
    				par_value INTEGER,
    				yardage INTEGER,
    CONSTRAINT fk_holes_tournament_id FOREIGN KEY (tournament_id) REFERENCES Tournaments(tournament_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT pk_holes PRIMARY KEY (hole_id)
);

INSERT INTO players(player_id,player_name,country,age) VALUES (1,'Scottie Scheffler','United States',27);
INSERT INTO players(player_id,player_name,country,age) VALUES (2,' Ludvig Aberg','Sweden',24);
INSERT INTO players(player_id,player_name,country,age) VALUES (3,'Tommy Fleetwood','England',33);
INSERT INTO players(player_id,player_name,country,age) VALUES (4,'Max Homa','United States',33);
INSERT INTO players(player_id,player_name,country,age) VALUES (5,'Collin Marikawa','United States',27);
INSERT INTO players(player_id,player_name,country,age) VALUES (6,'Cameron Smith','Australia',30);
INSERT INTO players(player_id,player_name,country,age) VALUES (7,'Bryson DeChambeau','United States',30);
INSERT INTO players(player_id,player_name,country,age) VALUES (8,'Xander Schauffele','United States',30);
INSERT INTO players(player_id,player_name,country,age) VALUES (9,'Will Zalatoris','United States',27);
INSERT INTO players(player_id,player_name,country,age) VALUES (10,'Tyrell Hatton','England',32);
INSERT INTO players(player_id,player_name,country,age) VALUES (11,'Cameron Young','United States',26);
INSERT INTO players(player_id,player_name,country,age) VALUES (12,'Matthieu Pavon','France',31);
INSERT INTO players(player_id,player_name,country,age) VALUES (13,'Patrick Reed','United States',33);
INSERT INTO players(player_id,player_name,country,age) VALUES (14,'Adam Schenk','United States',32);
INSERT INTO players(player_id,player_name,country,age) VALUES (15,'Cameron Davis','Australia',28);
INSERT INTO players(player_id,player_name,country,age) VALUES (16,'Sepp Straka','Australia',30);
INSERT INTO players(player_id,player_name,country,age) VALUES (17,'Chris Kirk','United States',38);
INSERT INTO players(player_id,player_name,country,age) VALUES (18,'Byeong Hun An','Korea',32);
INSERT INTO players(player_id,player_name,country,age) VALUES (19,'Nicolai Højgaard','Denmark',23);
INSERT INTO players(player_id,player_name,country,age) VALUES (20,'Taylor Moore','United States',30);
INSERT INTO players(player_id,player_name,country,age) VALUES (21,'Brain Harman','United States',37);
INSERT INTO players(player_id,player_name,country,age) VALUES (22,'Wydndham Clark','United States',30);
INSERT INTO players(player_id,player_name,country,age) VALUES (23,'Matt FitzPatrick','England',29);
INSERT INTO players(player_id,player_name,country,age) VALUES (24,'Si Woo Kim','Korea',28);
INSERT INTO players(player_id,player_name,country,age) VALUES (25,'Hideki Matsuyama','Japan',32);
INSERT INTO players(player_id,player_name,country,age) VALUES (26,'Sahith Theegala','United States',26);
INSERT INTO players(player_id,player_name,country,age) VALUES (27,'Maverick McNealy','United States',28);
INSERT INTO players(player_id,player_name,country,age) VALUES (28,'Joel Dahmen','United States',36);
INSERT INTO players(player_id,player_name,country,age) VALUES (29,'Taylor Montgomery','United States',29);
INSERT INTO players(player_id,player_name,country,age) VALUES (30,'Corey Conners','Canada',32);
INSERT INTO players(player_id,player_name,country,age) VALUES (31,'Christiaan Bezuidenhout','South Africa',29);
INSERT INTO players(player_id,player_name,country,age) VALUES (32,'Nate Lashley','United States',41);
INSERT INTO players(player_id,player_name,country,age) VALUES (33,'Sam Ryder','United Kingdom',34);
INSERT INTO players(player_id,player_name,country,age) VALUES (34,'Doug Ghim','United States',28);
INSERT INTO players(player_id,player_name,country,age) VALUES (35,'Harris English','United States',34);
INSERT INTO players(player_id,player_name,country,age) VALUES (36,'Shane Lowery','Ireland',37);
INSERT INTO players(player_id,player_name,country,age) VALUES (37,'Rory Mcllroy','Ireland',34);
INSERT INTO players(player_id,player_name,country,age) VALUES (38,'Robert MacIntyre','Scotland',27);
INSERT INTO players(player_id,player_name,country,age) VALUES (39,'David Lingmerth','Sweden',36);
INSERT INTO players(player_id,player_name,country,age) VALUES (40,'J.T Poston','United States',30);
INSERT INTO players(player_id,player_name,country,age) VALUES (41,'Tom Kim','Korea',21);
INSERT INTO players(player_id,player_name,country,age) VALUES (42,'Grant Forrest','Scotland',30);
INSERT INTO players(player_id,player_name,country,age) VALUES (43,'Jordan Smith','England',31);
INSERT INTO players(player_id,player_name,country,age) VALUES (44,'Ewen Ferguson','Scotland',27);
INSERT INTO players(player_id,player_name,country,age) VALUES (45,'Lee Hodges','United States',28);
INSERT INTO players(player_id,player_name,country,age) VALUES (46,'Ryan Fox','New Zealand',37);
INSERT INTO players(player_id,player_name,country,age) VALUES (47,'Sean Crocker','United States',27);
INSERT INTO players(player_id,player_name,country,age) VALUES (48,'Nick Taylor','Canada',36);

INSERT INTO tournaments(tournament_id, tournament_name, year, host_course, winner_id) VALUES (121212, 'The Masters', 2024, 'Augusta National Golf Club', 1);
INSERT INTO tournaments(tournament_id, tournament_name, year, host_course, winner_id) VALUES (121213, 'The Players ', 2024, 'TPC Sawgrass', 1);
INSERT INTO tournaments(tournament_id, tournament_name, year, host_course, winner_id) VALUES (121214, 'Genesis Scottish Open', 2023, 'The Renaissance Club', 37);
INSERT INTO tournaments (tournament_id, tournament_name, year, host_course, winner_id) VALUES (121215, 'PGA Championship', 2024, 'The Links', 28);
INSERT INTO tournaments (tournament_id, tournament_name, year, host_course, winner_id) VALUES (121216, 'The Open Championship', 2024, 'St. Andrews Links', 40);



INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2222, 121212, 1, 1, 66);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2223, 121212, 1, 2, 72);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2224, 121212, 1, 3, 71);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2225, 121212, 1, 4, 68);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2226, 121212, 2, 1, 73);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2227, 121212, 2, 2, 69);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2228, 121212, 2, 3, 70);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2229, 121212, 2, 4, 69);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2230, 121212, 3, 1, 72);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2231, 121212, 3, 2, 71);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2232, 121212, 3, 3, 72);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2233, 121212, 3, 4, 69);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2234, 121212, 4, 1, 67);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2235, 121212, 4, 2, 71);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2236, 121212, 4, 3, 73);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2237, 121212, 4, 4, 73);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2238, 121212, 5, 1, 71);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2239, 121212, 5, 2, 70);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2240, 121212, 5, 3, 69);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2241, 121212, 5, 4, 74);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2242, 121212, 6, 1, 71);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2243, 121212, 6, 2, 72);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2244, 121212, 6, 3, 72);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2245, 121212, 6, 4, 71);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2246, 121212, 7, 1, 65);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2247, 121212, 7, 2, 73);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2248, 121212, 7, 3, 75);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2249, 121212, 7, 4, 73);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2250, 121212, 8, 1, 72);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2251, 121212, 8, 2, 72);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2252, 121212, 8, 3, 70);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2253, 121212, 8, 4, 73);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2254, 121212, 9, 1, 70);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2255, 121212, 9, 2, 77);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2256, 121212, 9, 3, 72);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2257, 121212, 9, 4, 69);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2258, 121212, 10, 1, 72);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2259, 121212, 10, 2, 74);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2260, 121212, 10, 3, 73);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2261, 121212, 10, 4, 69);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2262, 121212, 11, 1, 70);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2263, 121212, 11, 2, 73);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2264, 121212, 11, 3, 72);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2265, 121212, 11, 4, 73);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2266, 121212, 12, 1, 70);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2267, 121212, 12, 2, 73);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2268, 121212, 12, 3, 74);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2269, 121212, 12, 4, 72);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2270, 121212, 13, 1, 74);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2271, 121212, 13, 2, 70);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2272, 121212, 13, 3, 73);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2273, 121212, 13, 4, 72);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2274, 121212, 14, 1, 73);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2275, 121212, 14, 2, 71);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2276, 121212, 14, 3, 72);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2277, 121212, 14, 4, 73);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2278, 121212, 15, 1, 69);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2279, 121212, 15, 2, 72);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2280, 121212, 15, 3, 73);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2281, 121212, 15, 4, 75);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2282, 121212, 16, 1, 73);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2283, 121212, 16, 2, 71);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2284, 121212, 16, 3, 74);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2285, 121212, 16, 4, 72);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2286, 121212, 17, 1, 74);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2287, 121212, 17, 2, 75);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2288, 121212, 17, 3, 68);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2289, 121212, 17, 4, 73);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2290, 121212, 18, 1, 70);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2291, 121212, 18, 2, 73);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2292, 121212, 18, 3, 72);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2293, 121212, 18, 4, 75);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2294, 121212, 19, 1, 67);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2295, 121212, 19, 2, 73);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2296, 121212, 19, 3, 74);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2297, 121212, 19, 4, 76);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2298, 121212, 20, 1, 71);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2299, 121212, 20, 2, 75);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2300, 121212, 20, 3, 75);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2301, 121212, 20, 4, 70);	
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2302, 121213, 1, 1, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2303, 121213, 1, 2, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2304, 121213, 1, 3, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2305, 121213, 1, 4, 64);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2306, 121213, 21, 1, 72);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2307, 121213, 21, 2, 65);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2308, 121213, 21, 3, 64);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2309, 121213, 21, 4, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2310, 121213, 8, 1, 65);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2311, 121213, 8, 2, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2312, 121213, 8, 3, 65);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2313, 121213, 8, 4, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2314, 121213, 22, 1, 65);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2315, 121213, 22, 2, 65);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2316, 121213, 22, 3, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2317, 121213, 22, 4, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2318, 121213, 23, 1, 66);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2319, 121213, 23, 2, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2320, 121213, 23, 3, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2321, 121213, 23, 4, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2322, 121213, 24, 1, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2323, 121213, 24, 2, 71);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2324, 121213, 24, 3, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2325, 121213, 24, 4, 64);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2326, 121213, 25, 1, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2327, 121213, 25, 2, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2328, 121213, 25, 3, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2329, 121213, 25, 4, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2330, 121213, 2, 1, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2331, 121213, 2, 2, 73);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2332, 121213, 2, 3, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2333, 121213, 2, 4, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2334, 121213, 26, 1, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2335, 121213, 26, 2, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2336, 121213, 26, 3, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2337, 121213, 26, 4, 71);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2338, 121213, 27, 1, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2339, 121213, 27, 2, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2340, 121213, 27, 3, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2341, 121213, 27, 4, 72);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2342, 121213, 28, 1, 74);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2343, 121213, 28, 2, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2344, 121213, 28, 3, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2345, 121213, 28, 4, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2346, 121213, 29, 1, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2347, 121213, 29, 2, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2348, 121213, 29, 3, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2349, 121213, 29, 4, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2350, 121213, 30, 1, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2351, 121213, 30, 2, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2352, 121213, 30, 3, 73);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2353, 121213, 30, 4, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2354, 121213, 31, 1, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2355, 121213, 31, 2, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2356, 121213, 31, 3, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2357, 121213, 31, 4, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2358, 121213, 32, 1, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2359, 121213, 32, 2, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2360, 121213, 32, 3, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2361, 121213, 32, 4, 72);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2362, 121213, 33, 1, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2363, 121213, 33, 2, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2364, 121213, 33, 3, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2365, 121213, 33, 4, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2366, 121213, 16, 1, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2367, 121213, 16, 2, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2368, 121213, 16, 3, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2369, 121213, 16, 4, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2370, 121213, 34, 1, 71);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2371, 121213, 34, 2, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2372, 121213, 34, 3, 66);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2373, 121213, 34, 4, 71);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2374, 121213, 35, 1, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2375, 121213, 35, 2, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2376, 121213, 35, 3, 75);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2377, 121213, 35, 4, 66);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2378, 121213, 36, 1, 71);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2379, 121213, 36, 2, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2380, 121213, 36, 3, 72);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2381, 121213, 36, 4, 66);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2382, 121214, 37, 1, 64);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2383, 121214, 37, 2, 66);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2384, 121214, 37, 3, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2385, 121214, 37, 4, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2386, 121214, 38, 1, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2387, 121214, 38, 2, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2388, 121214, 38, 3, 66);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2389, 121214, 38, 4, 62);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2390, 121214, 39, 1, 66);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2391, 121214, 39, 2, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2392, 121214, 39, 3, 66);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2393, 121214, 39, 4, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2394, 121214, 18, 1, 66);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2395, 121214, 18, 2, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2396, 121214, 18, 3, 66);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2397, 121214, 18, 4, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2398, 121214, 1, 1, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2399, 121214, 1, 2, 65);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2400, 121214, 1, 3, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2401, 121214, 1, 4, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2402, 121214, 19, 1, 61);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2403, 121214, 19, 2, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2404, 121214, 19, 3, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2405, 121214, 19, 4, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2406, 121214, 10, 1, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2407, 121214, 10, 2, 63);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2408, 121214, 10, 3, 71);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2409, 121214, 10, 4, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2410, 121214, 40, 1, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2411, 121214, 40, 2, 62);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2412, 121214, 40, 3, 71);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2413, 121214, 40, 4, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2414, 121214, 3, 1, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2415, 121214, 3, 2, 66);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2416, 121214, 3, 3, 63);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2417, 121214, 3, 4, 72);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2418, 121214, 41, 1, 66);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2419, 121214, 41, 2, 65);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2420, 121214, 41, 3, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2421, 121214, 41, 4, 73);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2422, 121214, 42, 1, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2423, 121214, 42, 2, 65);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2424, 121214, 42, 3, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2425, 121214, 42, 4, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2426, 121214, 43, 1, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2427, 121214, 43, 2, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2428, 121214, 43, 3, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2429, 121214, 43, 4, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2430, 121214, 44, 1, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2431, 121214, 44, 2, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2432, 121214, 44, 3, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2433, 121214, 44, 4, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2434, 121214, 45, 1, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2435, 121214, 45, 2, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2436, 121214, 45, 3, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2437, 121214, 45, 4, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2438, 121214, 46, 1, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2439, 121214, 46, 2, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2440, 121214, 46, 3, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2441, 121214, 46, 4, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2442, 121214, 4, 1, 66);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2443, 121214, 4, 2, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2444, 121214, 4, 3, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2445, 121214, 4, 4, 72);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2446, 121214, 36, 1, 71);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2447, 121214, 36, 2, 64);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2448, 121214, 36, 3, 65);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2449, 121214, 36, 4, 73);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2450, 121214, 21, 1, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2451, 121214, 21, 2, 65);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2452, 121214, 21, 3, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2453, 121214, 21, 4, 74);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2454, 121214, 47, 1, 69);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2455, 121214, 47, 2, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2456, 121214, 47, 3, 67);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2457, 121214, 47, 4, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2458, 121214, 48, 1, 68);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2459, 121214, 48, 2, 70);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2460, 121214, 48, 3, 65);
INSERT INTO scores (score_id, tournament_id, player_id, round_number, total_score) VALUES (2461, 121214, 48, 4, 71);

INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10000, 121212, 1, '1');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10001, 121212, 2, '2');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10002, 121212, 3, '3');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10003, 121212, 4, '3');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10004, 121212, 5, '3');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10005, 121212, 6, '6');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10006, 121212, 7, '6');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10007, 121212, 8, '8');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10008, 121212, 9, '9');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10009, 121212, 10, '9');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10010, 121212, 11, '9');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10011, 121212, 12, '12');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10012, 121212, 13, '12');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10013, 121212, 14, '12');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10014, 121212, 15, '12');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10015, 121212, 16, '16');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10016, 121212, 17, '16');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10017, 121212, 18, '16');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10018, 121212, 19, '16');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10019, 121212, 20, '20');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10020, 121213, 1, '1');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10021, 121213, 21, '2');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10022, 121213, 8, '2');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10023, 121213, 22, '2');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10024, 121213, 23, '5');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10025, 121213, 24, '6');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10026, 121213, 25, '6');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10027, 121213, 2, '8');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10028, 121213, 26, '9');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10029, 121213, 27, '9');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10030, 121213, 28, '11');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10031, 121213, 29, '11');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10032, 121213, 30, '13');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10033, 121213, 31, '13');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10034, 121213, 32, '13');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10035, 121213, 33, '16');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10036, 121213, 16, '16');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10037, 121213, 34, '16');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10038, 121213, 35, '19');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10039, 121213, 36, '19');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10040, 121214, 37, '1');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10041, 121214, 38, '2');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10042, 121214, 39, '3');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10043, 121214, 18, '3');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10044, 121214, 1, '3');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10045, 121214, 19, '6');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10046, 121214, 10, '6');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10047, 121214, 40, '6');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10048, 121214, 3, '6');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10049, 121214, 41, '6');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10050, 121214, 42, '6');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10051, 121214, 43, '12');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10052, 121214, 44, '12');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10053, 121214, 45, '12');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10054, 121214, 46, '12');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10055, 121214, 4, '12');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10056, 121214, 36, '12');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10057, 121214, 21, '12');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10058, 121214, 47, '19');
INSERT INTO rankings (ranking_id, tournament_id, player_id, position) VALUES (10059, 121214, 48, '19');

INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223344, 121212, '1', 3600000);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223345, 121212, '2', 2160000);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223346, 121212, '3', 1040000);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223347, 121212, '6', 695000);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223348, 121212, '8', 620000);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223349, 121212, '9', 540000);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223350, 121212, '12', 405000);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223351, 121212, '16', 310000);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223352, 121213, '1', 4500000);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223353, 121213, '2', 1891666);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223354, 121213, '5', 1025000);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223355, 121213, '6', 875000);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223356, 121213, '8', 781250);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223357, 121213, '9', 706250);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223358, 121213, '11', 606250);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223359, 121213, '13', 489583);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223360, 121213, '16', 406250);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223361, 121213, '19', 285535);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223362, 121214, '1', 1575000);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223363, 121214, '2', 985500);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223364, 121214, '3', 468450);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223365, 121214, '6', 261990);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223366, 121214, '11', 197100);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223367, 121214, '12', 151007);
INSERT INTO prizes (prize_id, tournament_id, rank_position, prize_value) VALUES (1223368, 121214, '19', 105750);

INSERT INTO officials (official_id, official_name, role, tournament_id)
VALUES
    (55555, 'Michael Johnson', 'Referee', 121212),
    (55556, 'Sarah Adams', 'Scorekeeper', 121213),
    (55557, 'David Lee', 'Official', 121212),
    (55558, 'Emily White', 'Referee', 121214),
    (55559, 'James Smith', 'Scorekeeper', 121213),
    (55560, 'Linda Davis', 'Official', 121214),
    (55561, 'Jessica Brown', 'Referee', 121212),
    (55562, 'Daniel Wilson', 'Scorekeeper', 121213),
    (55563, 'Jennifer Taylor', 'Official', 121214),
    (55564, 'Matthew Clark', 'Referee', 121212),
    (55565, 'Laura Martinez', 'Scorekeeper', 121213),
    (55566, 'Christopher Moore', 'Official', 121212),
    (55567, 'Amanda Anderson', 'Referee', 121214),
    (55568, 'Joshua Rodriguez', 'Scorekeeper', 121213),
    (55569, 'Stephanie Harris', 'Official', 121214),
    (55570, 'Ryan Thompson', 'Referee', 121212),
    (55571, 'Nicole Walker', 'Scorekeeper', 121213),
    (55572, 'Kevin Carter', 'Official', 121212),
    (55573, 'Melissa King', 'Referee', 121214),
    (55574, 'Brandon Martinez', 'Scorekeeper', 121213),
    (55575, 'Rachel Allen', 'Official', 121212),
    (55576, 'Justin Adams', 'Referee', 121214),
    (55577, 'Samantha Hill', 'Scorekeeper', 121213),
    (55578, 'Tyler Garcia', 'Official', 121214),
    (55579, 'Victoria Lopez', 'Referee', 121212),
    (55580, 'Austin Thomas', 'Scorekeeper', 121213),
    (55581, 'Ashley Baker', 'Official', 121212),
    (55582, 'Erica Rivera', 'Referee', 121214),
    (55583, 'Jacob Scott', 'Scorekeeper', 121213),
    (55584, 'Olivia Young', 'Official', 121214);

INSERT INTO sponsors (sponsor_id, sponsor_name, industry, contact_info, player_id)
VALUES
    (99999, 'Nike Golf', 'Sports Equipment', 'info@nikegolf.com', 1),
    (100000, 'Titleist', 'Sports Equipment', 'info@titleist.com', 2),
    (100001, 'Callaway Golf', 'Sports Equipment', 'info@callawaygolf.com', 3),
    (100002, 'Ping Golf', 'Sports Equipment', 'info@pinggolf.com', 4),
    (100003, 'TaylorMade Golf', 'Sports Equipment', 'info@taylormadegolf.com', 5),
    (100004, 'Cobra Golf', 'Sports Equipment', 'info@cobragolf.com', 6),
    (100005, 'Adidas Golf', 'Sports Apparel', 'info@adidasgolf.com', 7),
    (100006, 'FootJoy', 'Sports Apparel', 'info@footjoy.com', 8),
    (100007, 'Puma Golf', 'Sports Apparel', 'info@pumagolf.com', 9),
    (100008, 'Under Armour Golf', 'Sports Apparel', 'info@underarmourgolf.com', 10),
    (100009, 'Golf Digest', 'Media & Publishing', 'info@golfdigest.com', 11),
    (100010, 'Golf Channel', 'Media & Broadcasting', 'info@golfchannel.com', 12),
    (100011, 'PGA Tour', 'Sports Organization', 'info@pgatour.com', 13),
    (100012, 'USGA', 'Sports Organization', 'info@usga.org', 14),
    (100013, 'PGA of America', 'Sports Organization', 'info@pga.com', 15),
    (100014, 'Titleist Performance Institute', 'Sports Performance', 'info@mytpi.com', 16),
    (100015, 'Golftec', 'Golf Instruction', 'info@golftec.com', 17),
    (100016, 'Topgolf', 'Entertainment & Hospitality', 'info@topgolf.com', 18),
    (100017, 'Bushnell Golf', 'Sports Technology', 'info@bushnellgolf.com', 19),
    (100018, 'Garmin', 'Sports Technology', 'info@garmin.com', 20),
    (100019, 'TrackMan', 'Sports Technology', 'info@trackmangolf.com', 21),
    (100020, 'SkyTrak', 'Sports Technology', 'info@skytrakgolf.com', 22),
    (100021, 'Scotty Cameron', 'Sports Equipment', 'info@scottycameron.com', 23),
    (100022, 'Vokey Wedges', 'Sports Equipment', 'info@vokeywedges.com', 24),
    (100023, 'Bushnell Rangefinders', 'Sports Equipment', 'info@bushnellrangefinders.com', 25),
    (100024, 'Bridgestone Golf', 'Sports Equipment', 'info@bridgestonegolf.com', 26),
    (100025, 'Mizuno Golf', 'Sports Equipment', 'info@mizunogolf.com', 27),
    (100026, 'Srixon', 'Sports Equipment', 'info@srixon.com', 28),
    (100027, 'Wilson Golf', 'Sports Equipment', 'info@wilsongolf.com', 29),
    (100028, 'Adams Golf', 'Sports Equipment', 'info@adamsgolf.com', 30),
    (100029, 'Ben Hogan Golf', 'Sports Equipment', 'info@benhogangolf.com', 31),
    (100030, 'Oakley', 'Eyewear & Apparel', 'info@oakley.com', 32),
    (100031, 'Sun Mountain', 'Golf Bags & Accessories', 'info@sunmountaingolf.com', 33),
    (100032, 'Golf Pride', 'Golf Grips', 'info@golfpride.com', 34),
    (100033, 'SuperStroke', 'Golf Grips', 'info@superstroke.com', 35),
    (100034, 'TravisMathew', 'Golf Apparel', 'info@travismathew.com', 36),
    (100035, 'Linksoul', 'Lifestyle Apparel', 'info@linksoul.com', 37),
    (100036, 'Peter Millar', 'Luxury Apparel', 'info@petermillar.com', 38),
    (100037, 'RLX Ralph Lauren', 'Premium Apparel', 'info@rlx.com', 39),
    (100038, 'Stitch Golf', 'Premium Accessories', 'info@stitchgolf.com', 40);
 
 INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111111, 121212, 1, 4, 455);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111112, 121212, 2, 5, 585);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111113, 121212, 3, 4, 350);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111114, 121212, 4, 3, 240);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111115, 121212, 5, 4, 450);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111116, 121212, 6, 3, 180);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111117, 121212, 7, 4, 450);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111118, 121212, 8, 5, 570);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111119, 121212, 9, 4, 460);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111120, 121212, 10, 4, 495);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111121, 121212, 11, 4, 520);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111122, 121212, 12, 3, 155);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111123, 121212, 13, 5, 545);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111124, 121212, 14, 4, 440);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111125, 121212, 15, 5, 550);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111126, 121212, 16, 3, 170);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111127, 121212, 17, 4, 440);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111128, 121212, 18, 4, 465);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111129, 121213, 1, 4, 423);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111130, 121213, 2, 5, 532);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111131, 121213, 3, 3, 177);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111132, 121213, 4, 4, 384);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111133, 121213, 5, 4, 471);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111134, 121213, 6, 4, 393);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111135, 121213, 7, 4, 442);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111136, 121213, 8, 3, 237);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111137, 121213, 9, 5, 583);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111138, 121213, 10, 4, 424);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111139, 121213, 11, 5, 558);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111140, 121213, 12, 4, 358);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111141, 121213, 13, 3, 181);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111142, 121213, 14, 4, 481);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111143, 121213, 15, 4, 449);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111144, 121213, 16, 5, 523);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111145, 121213, 17, 3, 137);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111146, 121213, 18, 4, 462);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111147, 121214, 1, 4, 488);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111148, 121214, 2, 4, 490);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111149, 121214, 3, 5, 601);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111150, 121214, 4, 4, 425);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111151, 121214, 5, 4, 335);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111152, 121214, 6, 3, 145);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111153, 121214, 7, 5, 557);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111154, 121214, 8, 4, 446);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111155, 121214, 9, 3, 217);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111156, 121214, 10, 5, 591);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111157, 121214, 11, 4, 506);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111158, 121214, 12, 3, 202);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111159, 121214, 13, 4, 412);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111160, 121214, 14, 3, 161);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111161, 121214, 15, 4, 484);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111162, 121214, 16, 5, 572);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111163, 121214, 17, 3, 202);
INSERT INTO Holes (hole_id, tournament_id, hole_number, par_value, yardage) VALUES (1111164, 121214, 18, 4, 484);

 --This view shows winnners from each tournament. Therefore just shows winner of the tournament and what tournament they have won.
CREATE VIEW tournament_winners AS
	SELECT
    	tournament_name,
    	(SELECT player_name
     	FROM players
     	WHERE player_id = winner_id)AS winner_name
		FROM tournaments;

--This shows a table which shows each plaer and where they placed in each tournament.
CREATE VIEW player_rankings AS
	SELECT players.player_id,players.player_name,tournaments.tournament_name,rankings.position
	FROM players
	JOIN rankings ON players.player_id = rankings.player_id
	JOIN tournaments ON rankings.tournament_id = tournaments.tournament_id;


-- This funtion allows you to enter a tournament_id and see what officials worked them. 
CREATE OR REPLACE FUNCTION officials_of(p_tournament_id INTEGER)
		RETURNS TABLE(official_namee varchar(255))
		LANGUAGE plpgsql
		AS 
		$$
			BEGIN
				RETURN QUERY 
				SELECT officials.official_name
				FROM officials  
				WHERE officials.tournament_id = p_tournament_id;
			END;
		$$

--This funciton shows how much money each player has made in total from the tournament entered."Had to look up how to get this function to work had to use this COALESCE function".
CREATE OR REPLACE FUNCTION player_total_money(player_id INTEGER)
	RETURNS INTEGER 
	LANGUAGE plpgsql
	AS
	$$
		DECLARE total_money NUMERIC :=0;
		BEGIN
			SELECT COALESCE(SUM(prize_value),0)
			INTO total_money
			FROM prizes 
			WHERE tournament_id IN(
				SELECT tournament_id
				FROM tournaments
				WHERE winner_id = player_id);
			RETURN total_money;
			END;
	$$;

--This prodcedure inputs players into the players table
CREATE OR REPLACE PROCEDURE insertPlayer( p_player_id INTEGER,p_player_name VARCHAR(100),p_country VARCHAR(50),p_age INTEGER)
LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO players (player_id, player_name, country, age)
    VALUES (p_player_id, p_player_name, p_country, p_age); 
END;
$$;

--This updates players prize count 
CREATE OR REPLACE FUNCTION update_player_prize_count()
    RETURNS TRIGGER
    LANGUAGE plpgsql
AS 
$$
BEGIN
    UPDATE players
    SET prize_count = (SELECT COUNT(*)
        FROM prizes
        WHERE prizes.player_id = NEW.player_id
    )
    WHERE player_id = NEW.player_id;
    RETURN NEW;
END;
$$;

--The trigger for above
CREATE TRIGGER after_insert_update_player_prize_count
AFTER INSERT OR DELETE ON prizes
FOR EACH ROW
EXECUTE FUNCTION update_player_prize_count();


--Just update the prize value for the certain prize_id
UPDATE prizes 
SET prize_value = 12345678
WHERE prize_id = 1223367; 

--Deletes from offfical where set id is. 
DELETE FROM officials 
WHERE official_id = 100020;

--This finds player total average by using the player id to find it.
SELECT scores.player_id,player_name, AVG(total_score)
FROM scores, players
WHERE scores.player_id = players.player_id
GROUP BY scores.player_id,player_name;

--Shows all people who work at the tournament with the id of 121213
SELECT officials.tournament_id, official_name
FROM officials 
WHERE officials.tournament_id = 121213;

--This is a add on to the other function where it only will list people whos avg score was under 70
SELECT player_name
FROM (SELECT scores.player_id,player_name, AVG(total_score) AS avg_score
FROM scores, players
WHERE scores.player_id = players.player_id
GROUP BY scores.player_id,player_name)
WHERE avg_score < 70;

--Shows what players play for the specific tournament_id
SELECT DISTINCT player_id, 
			(SELECT player_name
    		FROM players
    		WHERE players.player_id = scores.player_id) AS player_name
FROM scores
WHERE tournament_id = 121213;

--Finds max hole on each course
SELECT t.host_course, MAX(h.yardage) AS longest_hole_yardage
	FROM tournaments t, Holes h
	WHERE t.tournament_id = h.tournament_id
GROUP BY t.host_course;

--Average age of each player in each country
SELECT country, AVG(age) AS avg_age
FROM players
GROUP BY country;

--Finds top 5 players with the higest total score 
SELECT players.player_name, SUM(scores.total_score) AS total_score
FROM players , scores 
WHERE players.player_id = scores.player_id
GROUP BY players.player_name
ORDER BY total_score DESC
LIMIT 5;

--Shows total purse of the tournament 
SELECT tournaments.tournament_name, SUM(prizes.prize_value) AS total_prize_money
FROM tournaments , prizes 
WHERE tournaments.tournament_id = prizes.tournament_id
GROUP BY tournaments.tournament_name;



					 