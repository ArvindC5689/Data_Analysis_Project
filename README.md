# SabermerticsFinalProject

## BSES (Batter Situational Efficiency Stat)
The BSES stat is a stat that is designed to evaluate both performance while taking the situation into account. The stat sets out to create a way to compare players situational performance using only one stat. This stat is important because of the fact that it looks at the situation that the batter is in. Other stats like BA or SLG or OBP evaluate performance, but they do not take into account what the situation was when the batter was at bat. In some situations, RBIs and the ability to hit become much more important. For example if the score is 14-0 at the top of the 2nd or 3rd inning and a batter for the winning team hits a home run, that home run is not really that impactful, since the the score deficit was already so large. On the other hand if the score is tied and its the bottom of the 10th inning and a team hits a home run, that home run is much more important because it won the game. Both of these situations are very different, however stats like BA or SLG or OBP treat each of these scenarios exactly the same. This might miake for some misleading evaluations of players. This is the problem that BSES tries to eliminate. 
  
BSES is an event based stat. What this means is that every time a batter is at the plate, he is assigned a numerical value called the situation score at the end of that plate appearance. This value is calculated with 3 main parts: **Situation Factor**, **RBI Efficiency** and the **Event Score**. The formula for the value assigned to the plate appearance is as follows:

Situation Score = Situation Factor x (RBI Efficiency + Event Score)

Each of these components have their own specifications and will be described in the following paragraphs.

The first, and probably most important, component of BSES is the Situation Factor. The Situation Factor is calculated as:

**Inning/(|Home Score - Away Score|+1)**  (The inning count divided by the absolute value of the score difference, plus 1)

The Situation Factor is the main stat that takes into account the situation that the batter is in when he is at plate. The extra "+1" in the denominator is to account for the situation where the the home and away score are equal, so that we don't have to worry about division by zero. For example if it is the 3rd inning and the home team score is 4 and the away team score is 5, then the situation factor would be 1.5 since the difference between the home and away score is 2 and it is the third inning. This is the component that tries to account for situational differences. As the game goes on and the inning becomes larger, then positive plays become more valuable and the Situation Factor accounts for that. Also, if the score difference is high and it is early in the game, then the situational factor will be small. If the score difference is low and it is late in the game, then the Situational Factor will be much larger. 

The RBI Efficiency is the ratio between the total number of the RBIs that the batter actually gets and the maximum possible RBI's that he could get. For example if there are runners on 1st and 3rd base, then the maximum number of RBIs that a batter could recieve is 3 RBIs. If the batter gets a hit and scores both runners on base, then he will be credited 2 RBIs and his RBI Efficiency would be 2/3 or .667. If A batter is in the same situation and he strikes out, then he will not get any RBIs and his RBI efficiency will be 0. RBI Efficiency is included to account for the orientation of the bases, which is another very important situational factor to any event in a game. 

The final component is the Event Score. The Event score is the performance component of BSES. The Event Score is based on the outcome of the plate appearence. Here is the table for the each event score:

- Strikeout: (-0.5) points
- Generic Out: (-0.2) points
- Walk: 0.3 points
- Hit By Pitch: 0.2 points
- Single: 1 point
- Double: 2 points
- Triple: 3 points
- Home Run: 4 points
- Any Other Event: 0 points 

This scoring system is very similar to the total bases stat that is used to calculate SLG, but includes extra aspects. The events that have a non-zero event score are events that can be attributed to the skill of the player and events that can result in an RBI. Other stats like a passed ball or a wild pitch are not counted because they cannot be attributed to the batter or result in an RBI, which is why they have an event score of 0.

Each batter has a situation score assigned to his plate appearance and his cumulative situational score is the sum of the situational scores for all of his plate appearances. To calculate the actual BSES stat for a certain player you need to take the cumulative situational score of the player and divide it by the total number of plate appearances. As an example from 2010 to 2013, Mike Trout had 1525 plate appearances and a cumulative situation score of 1140.72. 1140.72/1525 yields a BSES score of .750.

In terms of the values of BSES, here are the value ranges and the evaluation of the ranges:

- 1.00 and greater: Legendary and guarenteed Hall of Fame player
- .900 to 1.00: Upper elite and most likely Hall of Fame player
- .800 to .900: Elite and possible candidate for Hall of Fame
- .700 to .800: Lower elite and reliable player
- .600 to .700: Above average, good player and starter
- .500 to .600: Pretty average player
- .400 to .500: Below average player
- .300 to .400: Pretty poor player, needs to improve
- .200 to .300: Way below average and might need to be benched
- .100 to .200: Very underwhelming player
- Anything Below .100: Player is seriously hurting the team and may need to be released or demoted

BSES can also be negative. If that is the case for a player then it means that they consistently stike out and don't get very many RBIs in key situations.

In terms of comparing BSES to other stats like BA or SLG or OBP, here are the correlation coefficients:

- BSES vs. PA = .512
- BSES vs. RBIs = .703
- BSES vs. AB = .506
- BSES vs. TB = .649
- BSES vs. SLG = .870
- BSES vs. BA = .584
- BSES vs. OBP = .603
- BSES vs. H = .555

So the strongest correlation is between BSES and SLG and this makes sense because BSES is slightly based off of the same formula used to calculate SLG. I'm surprised that the correlation for SLG is higher than that of TB though, because BSES and TB reward home runs greatly. This may be the situation factor's effect, however, since I said in the beginning that stats like TB don't take the actual situation into effect when the batter hits a home run. 

The data that I used to calculate all the major stats came from 2010-2013 Retrosheet Data. The Queries for the CSV files can be found in the repository. 




Link to Website: http://sites.simbla.com/a4d52192-959f-59fd-b922-64e17fb73b37/Home


