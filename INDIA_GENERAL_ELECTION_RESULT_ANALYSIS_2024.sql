-- Q1. Total Seats 
SELECT
DISTINCT COUNT(parliament_constituency) AS Total_Seats
FROM constituencywise_results;

-- Q2. What are the total number of seats available for elections in each state

SELECT
    s.state AS State_name,
    COUNT(cr.parliament_constituency) AS Total_Seats
FROM
    constituencywise_results cr
INNER JOIN statewise_results sr ON cr.parliament_constituency = sr.parliament_constituency
INNER JOIN states s ON sr.State_ID = s.State_ID
GROUP BY s.state;

-- Q3 Total seats won by NDA Alliance
SELECT 
   SUM(CASE 
      WHEN party IN (
        'Bharatiya Janata Party - BJP', 
        'Telugu Desam - TDP', 
		'Janata Dal  (United) - JD(U)',
        'Shiv Sena - SHS', 
        'AJSU Party - AJSUP', 
        'Apna Dal (Soneylal) - ADAL', 
        'Asom Gana Parishad - AGP',
        'Hindustani Awam Morcha (Secular) - HAMS', 
		'Janasena Party - JnP', 
		'Janata Dal  (Secular) - JD(S)',
        'Lok Janshakti Party(Ram Vilas) - LJPRV', 
        'Nationalist Congress Party - NCP',
        'Rashtriya Lok Dal - RLD', 
        'Sikkim Krantikari Morcha - SKM'
     ) THEN [Won]
       ELSE 0 
     END) AS NDA_Total_Seats_Won
FROM 
    partywise_results;


-- Q4. Seats Won by NDA Allianz Parties

SELECT 
   party as Party_Name,
   won as Seats_Won
FROM 
   partywise_results
WHERE 
   party IN (
    'Bharatiya Janata Party - BJP', 
    'Telugu Desam - TDP', 
	'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS', 
    'AJSU Party - AJSUP', 
    'Apna Dal (Soneylal) - ADAL', 
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS', 
    'Janasena Party - JnP', 
	'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV', 
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD', 
    'Sikkim Krantikari Morcha - SKM'
)
ORDER BY Seats_Won DESC


-- Q5 Total Seats Won by I.N.D.I.A. Allianz

SELECT 
 SUM(CASE 
     WHEN party IN (
        'Indian National Congress - INC',
        'Aam Aadmi Party - AAAP',
        'All India Trinamool Congress - AITC',
        'Bharat Adivasi Party - BHRTADVSIP',
        'Communist Party of India  (Marxist) - CPI(M)',
        'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
        'Communist Party of India - CPI',
        'Dravida Munnetra Kazhagam - DMK',
        'Indian Union Muslim League - IUML',
        'Nat`Jammu & Kashmir National Conference - JKN',
        'Jharkhand Mukti Morcha - JMM',
        'Jammu & Kashmir National Conference - JKN',
        'Kerala Congress - KEC',
        'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
        'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
        'Rashtriya Janata Dal - RJD',
        'Rashtriya Loktantrik Party - RLTP',
        'Revolutionary Socialist Party - RSP',
        'Samajwadi Party - SP',
        'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
        'Viduthalai Chiruthaigal Katchi - VCK'
		) THEN [Won]
		ELSE 0 
	END) AS INDIA_Total_Seats_Won
	FROM 
	partywise_results;


-- Q6 Seats Won by I.N.D.I.A. Allianz Parties

SELECT 
    party as Party_Name,
    won as Seats_Won
FROM 
    partywise_results
WHERE 
    party IN (
        'Indian National Congress - INC',
        'Aam Aadmi Party - AAAP',
        'All India Trinamool Congress - AITC',
        'Bharat Adivasi Party - BHRTADVSIP',
        'Communist Party of India  (Marxist) - CPI(M)',
        'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
        'Communist Party of India - CPI',
        'Dravida Munnetra Kazhagam - DMK',
        'Indian Union Muslim League - IUML',
        'Nat`Jammu & Kashmir National Conference - JKN',
        'Jharkhand Mukti Morcha - JMM',
        'Jammu & Kashmir National Conference - JKN',
        'Kerala Congress - KEC',
        'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
        'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
        'Rashtriya Janata Dal - RJD',
        'Rashtriya Loktantrik Party - RLTP',
		'Revolutionary Socialist Party - RSP',
		'Samajwadi Party - SP',
		'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
		'Viduthalai Chiruthaigal Katchi - VCK'
    )
ORDER BY Seats_Won DESC;

-- Q7 Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER

-- Add new column
ALTER TABLE partywise_results
ADD party_alliance VARCHAR(50);

-- I.N.D.I.A Alliance
UPDATE partywise_results
SET party_alliance = 'I.N.D.I.A'
WHERE party IN (
    'Indian National Congress - INC',
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India  (Marxist) - CPI(M)',
    'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK'
);

-- NDA Alliance
UPDATE partywise_results
SET party_alliance = 'NDA'
WHERE party IN (
    'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM'
);

-- OTHER
UPDATE partywise_results
SET party_alliance = 'OTHER'
WHERE party_alliance IS NULL;

SELECT * FROM partywise_results;


-- Q8. Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?

SELECT 
 p.party_alliance,
 COUNT(cr.Constituency_ID) AS Seats_Won
FROM 
 constituencywise_results cr
JOIN 
 partywise_results p ON cr.Party_ID = p.Party_ID
WHERE 
 p.party_alliance IN ('NDA', 'I.N.D.I.A', 'OTHER')
GROUP BY 
 p.party_alliance
ORDER BY 
 Seats_Won DESC;


-- Q9. Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?

SELECT cr.Winning_Candidate, p.Party, p.party_alliance, cr.Total_Votes, cr.Margin, cr.Constituency_Name, s.State
FROM constituencywise_results cr
JOIN partywise_results p ON cr.Party_ID = p.Party_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
WHERE s.State = 'Uttar Pradesh' AND cr.Constituency_Name = 'AMETHI';

-- Q10. What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?

SELECT 
    cd.Candidate,
    cd.Party,
    cd.EVM_Votes,
    cd.Postal_Votes,
    cd.Total_Votes,
    cr.Constituency_Name
FROM 
    constituencywise_details cd
JOIN 
    constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
WHERE 
    cr.Constituency_Name = 'AMBEDKARNAGAR'
ORDER BY cd.Total_Votes DESC;


-- Q11. Which party won the most seats in a State, and how many seats did each party win?

SELECT 
    pr.party, 
    COUNT(cr.Constituency_ID) AS Seats_Won
FROM
    constituencywise_results cr
JOIN 
    partywise_results pr ON cr.Party_ID = pr.Party_ID
JOIN
    statewise_results sr ON cr.Parliament_constituency = sr.Parliament_Constituency
JOIN
    states s ON sr.State_ID = s.State_ID
WHERE
    s.state = 'Andhra Pradesh'
GROUP BY
    pr.party
ORDER BY
    Seats_Won DESC;


--Q12.  What is the total number of eats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024

SELECT
 s.state,
 SUM(CASE WHEN pr.party_alliance = 'NDA' THEN 1 ELSE 0 END) AS NDA_Seats_Won, 
 SUM(CASE WHEN pr.party_alliance = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS INDIA_Seats_Won,
 SUM(CASE WHEN pr.party_alliance = 'OTHERS' THEN 1 ELSE 0 END) AS OTHER_Seats_Won
FROM
 constituencywise_results cr
JOIN
 partywise_results pr ON cr.Party_ID = pr.Party_ID
JOIN
 statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN
 states s ON sr.State_ID = s.State_ID
GROUP BY s.State