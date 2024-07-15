Auswahl aller Zutaten eines Rezeptes nach Rezeptname:

SELECT Z.Zutat_Bez 
FROM Rezepte R
INNER JOIN Rez_Zutat RZ ON R.Rez_ID = RZ.Rez_ID
INNER JOIN Zutat Z ON RZ.Zutat_ID = Z.Zutat_ID
WHERE R.Rez_Bez = 'Rezeptname';

Auswahl aller Rezepte einer bestimmten Ernährungskategorie:

SELECT R.Rez_Bez
FROM Rezepte R
INNER JOIN Rez_Ctg RC ON R.Rez_ID = RC.Rez_ID
INNER JOIN Category C ON RC.Ctg_ID = C.Ctg_ID
WHERE C.Ctg_Bez = 'Ernährungskategorie';

Auswahl aller Rezepte, die eine gewisse Zutat enthalten:
    
SELECT R.Rez_Bez
FROM Rezepte R
INNER JOIN Rez_Zutat RZ ON R.Rez_ID = RZ.Rez_ID
INNER JOIN Zutat Z ON RZ.Zutat_ID = Z.Zutat_ID
WHERE Z.Zutat_Bez = 'Zutat';

Berechnung der durchschnittlichen Nährwerte aller Bestellungen eines Kunden:


SELECT AVG(B.Sum_Naehrstoff) AS Durchschnittliche_Naehrwerte
FROM Bestellung B
WHERE B.Kund_Nr = 'KundenID';
Auswahl aller Zutaten, die bisher keinem Rezept zugeordnet sind:


SELECT Z.Zutat_Bez
FROM Zutat Z
LEFT JOIN Rez_Zutat RZ ON Z.Zutat_ID = RZ.Zutat_ID
WHERE RZ.Rez_ID IS NULL;
Auswahl aller Rezepte, die eine bestimmte Kalorienmenge nicht überschreiten:


SELECT R.Rez_Bez
FROM Rezepte R
INNER JOIN Naehrstoffangaben N ON R.Rez_ID = N.Zutat_ID
WHERE N.Kalorien <= 'Kalorienmenge';
Auswahl aller Rezepte, die weniger als fünf Zutaten enthalten:


SELECT R.Rez_Bez
FROM Rezepte R
WHERE (SELECT COUNT(*) FROM Rez_Zutat RZ WHERE RZ.Rez_ID = R.Rez_ID) < 5;

Auswahl aller Rezepte, die weniger als fünf Zutaten enthalten und eine bestimmte Ernährungskategorie erfüllen:


SELECT R.Rez_Bez
FROM Rezepte R
INNER JOIN Rez_Ctg RC ON R.Rez_ID = RC.Rez_ID
INNER JOIN Category C ON RC.Ctg_ID = C.Ctg_ID
WHERE (SELECT COUNT(*) FROM Rez_Zutat RZ WHERE RZ.Rez_ID = R.Rez_ID) < 5
AND C.Ctg_Bez = 'Ernährungskategorie';
Weitere Abfragen:
Auswahl aller Kunden, die mehr als fünf Bestellungen aufgegeben haben:


SELECT K.Nachname, K.Vorname
FROM Kunde K
INNER JOIN Bestellung B ON K.Kund_Nr = B.Kund_Nr
GROUP BY K.Kund_Nr
HAVING COUNT(B.Bes_Nr) > 5;
Berechnung der Gesamtzahl der Bestellungen pro Rezept:


SELECT R.Rez_Bez, COUNT(BR.Bes_Nr) AS Anzahl_Bestellungen
FROM Rezepte R
INNER JOIN Bes_Rez BR ON R.Rez_ID = BR.Rez_ID
GROUP BY R.Rez_ID;
Auswahl der Stadt mit den meisten Kunden:


SELECT S.Stadt, COUNT(K.Kund_Nr) AS Anzahl_Kunden
FROM Kunde K
INNER JOIN Knd_Adr KA ON K.Kund_Nr = KA.Kund_Nr
INNER JOIN Adresse A ON KA.Adr_ID = A.Adr_ID
INNER JOIN Stadt S ON A.Stadt_ID = S.Stadt_ID
GROUP BY S.Stadt_ID
ORDER BY Anzahl_Kunden DESC
LIMIT 1;
Verwendung von Joins und Aggregatfunktionen:
Inner Join: Wird in den meisten Abfragen verwendet, um Daten aus mehreren Tabellen zu kombinieren.
Left Join: Wird in Abfrage 5 verwendet, um Zutaten zu finden, die keinem Rezept zugeordnet sind.
Subselects: Wird in Abfragen 7 und 8 verwendet, um die Anzahl der Zutaten für ein Rezept zu zählen.
Aggregatfunktionen: Werden in den Abfragen 4, 9, 10 und 11 verwendet, um Durchschnittswerte zu berechnen und Daten zu gruppieren.
Stored Procedures:
Stored Procedure zur Auswahl aller Zutaten eines Rezeptes nach Rezeptname:


DELIMITER $$
CREATE PROCEDURE GetZutatenByRezeptname(IN rezeptname VARCHAR(255))
BEGIN
    SELECT Z.Zutat_Bez 
    FROM Rezepte R
    INNER JOIN Rez_Zutat RZ ON R.Rez_ID = RZ.Rez_ID
    INNER JOIN Zutat Z ON RZ.Zutat_ID = Z.Zutat_ID
    WHERE R.Rez_Bez = rezeptname;
END$$
DELIMITER ;
Stored Procedure zur Auswahl aller Rezepte einer bestimmten Ernährungskategorie:


DELIMITER $$
CREATE PROCEDURE GetRezepteByErnaehrungskategorie(IN ernaehrungskategorie VARCHAR(255))
BEGIN
    SELECT R.Rez_Bez
    FROM Rezepte R
    INNER JOIN Rez_Ctg RC ON R.Rez_ID = RC.Rez_ID
    INNER JOIN Category C ON RC.Ctg_ID = C.Ctg_ID
    WHERE C.Ctg_Bez = ernaehrungskategorie;
END$$
DELIMITER ;
Stored Procedure zur Berechnung der durchschnittlichen Nährwerte aller Bestellungen eines Kunden:


DELIMITER $$
CREATE PROCEDURE GetAvgNaehrwerteByKunde(IN kundenID INT)
BEGIN
    SELECT AVG(B.Sum_Naehrstoff) AS Durchschnittliche_Naehrwerte
    FROM Bestellung B
    WHERE B.Kund_Nr = kundenID;
END$$
DELIMITER ;
Diese Abfragen und Stored Procedures sollten nun korrekt die in der ERD-Diagramm beschriebenen Tabellen und deren Struktur berücksichtigen.