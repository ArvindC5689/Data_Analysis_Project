# SabermerticsFinalProject

## BSES (Batter Situational Efficiency Stat)
The BSES stat is a stat that is designed to evaluate both performance while taking the situation into account. The stat sets out to create a way to compare players situational performance using only one stat. This stat is important because of the fact that it looks at the situation that the batter is in. Other stats like BA or SLG or OBP evaluate performance, but they do not take into account what the situation was when the batter was at bat. In some situations, RBIs and the ability to hit become much more important. For example if the score is 14-0 at the top of the 2nd or 3rd inning and a batter for the winning team hits a home run, that home run is not really that impactful, since the the score deficit was already so large. On the other hand if the score is tied and its the bottom of the 10th inning and a team hits a home run, that home run is much more important because it won the game. Both of these situations are very different, however stats like BA or SLG or OBP treat each of these scenarios exactly the same. This might miake for some misleading evaluations of players. This is the problem that BSES tries to eliminate. 
  
BSES is an event based stat. What this means is that every time a batter is at the plate, he is assigned a numerical value at the end of that plate appearance. This value is calculated with 3 main parts: **Situation Factor**, **RBI Efficiency** and the **Event Score**. The formula for the value assigned to the plate appearance is as follows:

Situation Factor x (RBI Efficiency + Event Score)

Each of these components have their own specifications and will be described in the following paragraphs.

The first, and probably most important, component of BSES is the Situation Factor. The Situation Factor is calculated as:

**_Inning/(|Home Score - Away Score|+1)_**  (The inning count divided by the absolute value of the score difference, plus 1)

The Situation Factor is the main stat that takes into account the situation that the batter is in when he is at plate. The extra "+1" in the denominator is to account for the situation where the the home and away score are equal, so that we don't have to worry about division by zero. For example if it is the 3rd inning and the home team score is 4 and the away team score is 5, then the situation factor would be 1.5 since the difference between the home and away score is 2 and it is the third inning. This is the component that tries to account for situational differences. As the game goes on and the inning becomes larger, then positive plays become more valuable and the Situation Factor accounts for that. Also, if the score difference is high and it is early in the game, then the situational factor will be small. If the score difference is low and it is late in the game, then the Situational Factor will be much larger. 

The RBI Efficiency is the ratio between the total number of the RBIs that the batter actually gets and the maximum possible RBI's that he could get. For example if there are runners on 1st and 3rd base, then the maximum number of RBIs that a batter could recieve is 3 RBIs. If the batter gets a hit and scores both runners on base, then he will be credited 2 RBIs and his RBI Efficiency would be 2/3 or .667. If A batter is in the same situation and he strikes out, then he will not get any RBIs and his RBI efficiency will be 0. RBI Efficiency is included to account for the orientation of the bases, which is another very important situational factor to any event in a game. 

The final component is the Event Score. The Event score is the performance component of BSES. The Event Score is based on the outcome of the plate appearence. Here is the table for the each event score:



Link to Website: http://sites.simbla.com/a4d52192-959f-59fd-b922-64e17fb73b37/Home


