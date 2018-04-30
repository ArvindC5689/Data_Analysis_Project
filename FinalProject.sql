#Arvind Chandramouli
#Final Project SQL code


use retrosheet

SET SQL_SAFE_UPDATES = 0;


#Adding new columns to game table

#ALTER TABLE events
#ADD AtBatCT INT
#ADD HitCount INT
#ADD OBP_Numerator INT
#ADD OBP_Denominator INT


Alter Table events
ADD SitFactor FLOAT


UPDATE events
SET SitFactor = (INN_CT)/(abs(AWAY_SCORE_CT-HOME_SCORE_CT)+1) 



Alter Table events
ADD MaxRBI INT


UPDATE events
SET MaxRBI = 1 where START_BASES_CD = 0

Update events
SET MaxRBI = 2 where START_BASES_CD = 1

UPDATE events
SET MaxRBI = 2 where START_BASES_CD = 2

UPDATE events
SET MaxRBI = 3 where START_BASES_CD = 3

UPDATE events
SET MaxRBI = 2 where START_BASES_CD = 4

UPDATE events
SET MaxRBI = 3 where START_BASES_CD = 5

UPDATE events
SET MaxRBI = 3 where START_BASES_CD = 6

UPDATE events
SET MaxRBI = 4 where START_BASES_CD = 7



Alter Table events
ADD EventScore FLOAT


UPDATE events
SET EventScore = 0

UPDATE events
SET EventScore = (-0.2) where EVENT_CD = 2


UPDATE events
SET EventScore = (-0.5) where EVENT_CD = 3

UPDATE events
SET EventScore = 0.3 where EVENT_CD = 14


UPDATE events
SET EventScore = 0.3 where EVENT_CD = 15

UPDATE events
SET EventScore = 0.2 where EVENT_CD = 16

UPDATE events
SET EventScore = 1 where EVENT_CD = 20

UPDATE events
SET EventScore = 2 where EVENT_CD = 21

UPDATE events
SET EventScore = 3 where EVENT_CD = 22


UPDATE events
SET EventScore = 4 where EVENT_CD = 23



#These are all the update statements to enter data into new columns.
UPDATE events
SET AtBatCT = 1
WHERE AB_FL = 'T'

UPDATE events
SET AtBatCT = 0
WHERE AB_FL = 'F'


UPDATE events
SET HitCount = 0
WHERE H_CD= 0

UPDATE events
SET HitCount = 1
WHERE H_CD > 0

UPDATE events
SET OBP_Numerator = 1
WHERE  HitCount = 1

UPDATE events
SET OBP_Numerator = 0
WHERE HitCount = 0

UPDATE events
SET OBP_Numerator = 1
WHERE EVENT_CD = 14

UPDATE events
SET OBP_Numerator = 1
WHERE EVENT_CD = 15

UPDATE events
SET OBP_Numerator = 1
WHERE EVENT_CD = 16


UPDATE events
SET OBP_Denominator = 1
WHERE AB_FL = 'T'

UPDATE events
SET OBP_Denominator = 0
WHERE AB_FL = 'F'

UPDATE events
SET OBP_Denominator = 1
WHERE EVENT_CD = 14


UPDATE events
SET OBP_Denominator = 1
WHERE EVENT_CD = 15


UPDATE events
SET OBP_Denominator = 1
WHERE EVENT_CD = 16


UPDATE events
SET OBP_Denominator = 1
WHERE SF_FL = 'T'







#QUERY THAT GETS FULL CSV FILE
select j.first as 'First', j.last as 'Last', e.BAT_ID as 'BatterID', COUNT(BAT_ID) as 'PA',SUM(RBI_CT) as 'RBI', SUM(e.AtBatCT) as 'AB', SUM(e.H_CD) as 'TB', (SUM(e.H_CD)/SUM(e.AtBatCT)) as 'SLG', SUM(e.HitCount) as 'H', (SUM(e.HitCount)/SUM(e.AtBatCT)) as 'BA', (SUM(e.OBP_Numerator)/SUM(e.OBP_Denominator)) as 'OBP', ROUND(SUM(e.BES)/COUNT(e.BAT_ID),4) as 'BSES', ROUND(SUM(e.BES),4) as 'CumulativeBSES' from events e 
left join id j on j.id = e.BAT_ID

GROUP BY j.first, j.last, e.BAT_ID


