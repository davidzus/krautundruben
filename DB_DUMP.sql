-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql310.byetcluster.com
-- Erstellungszeit: 14. Jul 2024 um 21:41
-- Server-Version: 10.4.17-MariaDB
-- PHP-Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `if0_36861027_krautundruebenDB`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Adresse`
--

CREATE TABLE `Adresse` (
  `Adr_ID` int(11) NOT NULL,
  `Stadt_ID` int(11) NOT NULL,
  `Strasse` varchar(50) DEFAULT NULL,
  `HausNr` varchar(6) DEFAULT NULL,
  `PLZ` varchar(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Adresse`
--

INSERT INTO `Adresse` (`Adr_ID`, `Stadt_ID`, `Strasse`, `HausNr`, `PLZ`) VALUES
(1, 1, 'Eppendorfer Landstrasse', '104', '20249'),
(2, 1, 'Ohmstraße', '23', '22765'),
(3, 1, 'Bilser Berg', '6', '20459'),
(4, 1, 'Alter Teichweg', '95', '22049'),
(5, 2, 'Stübels', '10', '22835'),
(6, 1, 'Grotelertwiete', '4a', '21075'),
(7, 1, 'Küstersweg', '3', '21079'),
(8, 1, 'Neugrabener Bahnhofstraße', '30', '21149'),
(9, 1, 'Elbchaussee', '228', '22605');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Allergene`
--

CREATE TABLE `Allergene` (
  `Allerg_ID` int(11) NOT NULL,
  `Allerg_Bez` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Allergene`
--

INSERT INTO `Allergene` (`Allerg_ID`, `Allerg_Bez`) VALUES
(1, 'Laktose'),
(2, 'Gluten'),
(3, 'Schalenfrüchte'),
(5, 'Soja'),
(6, 'Fisch'),
(7, 'Krebstiere'),
(8, 'Sellerie'),
(9, 'Senf'),
(10, 'Sesamsamen');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Bestellung`
--

CREATE TABLE `Bestellung` (
  `Bes_Nr` int(11) NOT NULL,
  `Kund_Nr` int(11) DEFAULT NULL,
  `Bes_Datum` date DEFAULT NULL,
  `RechnungsBetrag` decimal(10,2) DEFAULT NULL,
  `Sum_Naehrstoff` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Bestellung`
--

INSERT INTO `Bestellung` (`Bes_Nr`, `Kund_Nr`, `Bes_Datum`, `RechnungsBetrag`, `Sum_Naehrstoff`) VALUES
(1, 2001, '2023-01-01', '20.50', NULL),
(2, 2002, '2023-02-15', '35.00', NULL),
(3, 2003, '2023-03-10', '12.75', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Bes_Rez`
--

CREATE TABLE `Bes_Rez` (
  `Bes_Nr` int(11) NOT NULL,
  `Rez_ID` int(11) NOT NULL,
  `Menge` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Bes_Rez`
--

INSERT INTO `Bes_Rez` (`Bes_Nr`, `Rez_ID`, `Menge`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Bes_Zutat`
--

CREATE TABLE `Bes_Zutat` (
  `Bes_Nr` int(11) NOT NULL,
  `Zutat_ID` int(11) NOT NULL,
  `Menge` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Bes_Zutat`
--

INSERT INTO `Bes_Zutat` (`Bes_Nr`, `Zutat_ID`, `Menge`) VALUES
(1, 1001, 3),
(2, 1002, 5),
(3, 3001, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Category`
--

CREATE TABLE `Category` (
  `Ctg_ID` int(11) NOT NULL,
  `Ctg_Bez` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Category`
--

INSERT INTO `Category` (`Ctg_ID`, `Ctg_Bez`) VALUES
(1, 'Vegetarisch'),
(2, 'Vegan'),
(3, 'Glutenfrei'),
(4, 'Fleischgerichte'),
(5, 'Fischgerichte'),
(6, 'Suppen und Eintöpfe');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Fett`
--

CREATE TABLE `Fett` (
  `Zutat_ID` int(11) NOT NULL,
  `Nat_Fett` decimal(10,2) DEFAULT NULL,
  `Ges_Fett` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Fett`
--

INSERT INTO `Fett` (`Zutat_ID`, `Nat_Fett`, `Ges_Fett`) VALUES
(1001, '0.40', NULL),
(1002, '0.10', NULL),
(1003, '0.20', NULL),
(1004, '0.10', NULL),
(1005, '0.20', NULL),
(1006, '0.10', NULL),
(1007, '0.40', NULL),
(1008, '0.50', NULL),
(1009, '0.60', NULL),
(1010, '0.70', NULL),
(1011, '0.10', NULL),
(1012, '0.80', NULL),
(2001, '0.50', NULL),
(3001, '3.60', NULL),
(3002, '17.30', NULL),
(3003, '82.00', NULL),
(4001, '9.90', NULL),
(5001, '27.90', NULL),
(9001, '11.90', NULL),
(6408, '0.30', NULL),
(7043, '0.00', NULL),
(6300, '1.60', NULL),
(1013, '1.00', NULL),
(1014, '0.40', NULL),
(1015, '9.00', NULL),
(1016, '1.00', NULL),
(1017, '3.50', NULL),
(1018, '0.00', NULL),
(1019, '0.00', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Knd_Adr`
--

CREATE TABLE `Knd_Adr` (
  `Kund_Nr` int(11) NOT NULL,
  `Adr_ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Knd_Adr`
--

INSERT INTO `Knd_Adr` (`Kund_Nr`, `Adr_ID`) VALUES
(2001, 1),
(2002, 2),
(2003, 3),
(2004, 4),
(2005, 5),
(2006, 6),
(2007, 7),
(2008, 8),
(2009, 9);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Knd_Kontakt`
--

CREATE TABLE `Knd_Kontakt` (
  `Kontakt_ID` int(11) NOT NULL,
  `Kund_Nr` int(11) DEFAULT NULL,
  `TEL` varchar(25) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Knd_Kontakt`
--

INSERT INTO `Knd_Kontakt` (`Kontakt_ID`, `Kund_Nr`, `TEL`, `EMAIL`) VALUES
(1, 2001, '040/443322', 'k.wellensteyn@yahoo.de'),
(2, 2002, '040/543822', 'd.foede@web.de'),
(3, 2003, '0175/1234588', 'sigrid@leberer.de'),
(4, 2004, '040/634578', 'h.soerensen@yahoo.de'),
(5, 2005, '0176/447587', 'schni_mart@gmail.com'),
(6, 2006, '040/332189', 'belinda1978@yahoo.de'),
(7, 2007, '040/67890', 'armin@gessert.de'),
(8, 2008, '0178-67013390', 'jm@haessig.de'),
(9, 2009, '0152-96701390', 'urocki@outlook.de'),
(19, 2028, '1321321321', 'mail@mail.com'),
(18, 2027, '132132113', 'melissa@mail.com'),
(17, 2026, '1321213213', 'david@email.com'),
(20, 2029, '1213131', 'rahma@email.net'),
(21, 2030, '1321321321', 'serhat@mail.com'),
(26, 2035, '099868576', 'jhfgc@gmail.com'),
(23, 2032, '132131321', 'nasil@gmail.com'),
(24, 2033, '13221132', 'akkus@ayhan.net'),
(25, 2034, '01786050209', 'tendaichirimuta16@gmail.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Kohlenhydrate`
--

CREATE TABLE `Kohlenhydrate` (
  `Zutat_ID` int(11) NOT NULL,
  `Kohlenhydrate` decimal(10,2) DEFAULT NULL,
  `Dvn_Zucker` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Kohlenhydrate`
--

INSERT INTO `Kohlenhydrate` (`Zutat_ID`, `Kohlenhydrate`, `Dvn_Zucker`) VALUES
(6300, '21.20', NULL),
(7043, '0.50', NULL),
(6408, '67.00', NULL),
(9001, '7.00', NULL),
(5001, '1.20', NULL),
(4001, '1.50', NULL),
(3003, '0.60', NULL),
(3002, '1.00', NULL),
(3001, '4.40', NULL),
(2001, '14.40', NULL),
(1012, '1.00', NULL),
(1011, '20.00', NULL),
(1010, '5.10', NULL),
(1009, '28.40', NULL),
(1008, '3.30', NULL),
(1007, '2.10', NULL),
(1006, '14.60', NULL),
(1005, '10.00', NULL),
(1004, '3.30', NULL),
(1003, '2.60', NULL),
(1002, '4.90', NULL),
(1001, '2.00', NULL),
(1013, '0.00', NULL),
(1014, '3.60', NULL),
(1015, '0.00', NULL),
(1016, '73.00', NULL),
(1017, '4.80', NULL),
(1018, '99.80', NULL),
(1019, '24.70', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Kunde`
--

CREATE TABLE `Kunde` (
  `Kund_Nr` int(11) NOT NULL,
  `Nachname` varchar(50) DEFAULT NULL,
  `Vorname` varchar(50) DEFAULT NULL,
  `Geb_Datum` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Kunde`
--

INSERT INTO `Kunde` (`Kund_Nr`, `Nachname`, `Vorname`, `Geb_Datum`) VALUES
(2001, 'Wellensteyn', 'Kira', '1990-05-05'),
(2002, 'Foede', 'Dorothea', '2000-03-24'),
(2003, 'Leberer', 'Sigrid', '1989-09-21'),
(2004, 'Soerensen', 'Hanna', '1974-04-03'),
(2005, 'Schnitter', 'Marten', '1964-04-17'),
(2006, 'Maurer', 'Belinda', '1978-09-09'),
(2007, 'Gessert', 'Armin', '1978-01-29'),
(2008, 'Haessig', 'Jean-Marc', '1982-08-30'),
(2009, 'Urocki', 'Eric', '1999-12-04'),
(2035, 'ııuıuy', 'lmoı', '2024-07-11'),
(2030, 'aldgar', 'Serhat', '2001-01-01'),
(2029, 'amasmm', 'rahm', '2001-01-01'),
(2028, 'nachname', 'Stephan', '2000-01-01'),
(2027, 'rademacher', 'melissa', '2000-01-01'),
(2026, 'Laskowski', 'David', '2003-12-18'),
(2032, 'yani', 'nasil', '2000-11-08'),
(2033, 'Akkus', 'Ayhan', '1979-11-25'),
(2034, 'chirimuta', 'gamu', '2002-11-10');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Kund_Login`
--

CREATE TABLE `Kund_Login` (
  `kund_Nr` int(11) NOT NULL,
  `kund_username` varchar(150) NOT NULL,
  `kund_pass` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Kund_Login`
--

INSERT INTO `Kund_Login` (`kund_Nr`, `kund_username`, `kund_pass`) VALUES
(2001, 'kunde_2001', '123456789'),
(2002, 'kunde_2002', '123456789'),
(2003, 'kunde_2003', '123456789'),
(2004, 'kunde_2004', '123456789'),
(2005, 'kunde_2005', '123456789'),
(2006, 'kunde_2006', '123456789'),
(2007, 'kunde_2007', '123456789'),
(2008, 'kunde_2008', '123456789'),
(2009, 'kunde_2009', '123456789'),
(2029, 'rahma', '123456'),
(2028, 'stepfan', '123456'),
(2026, 'david0', '123456'),
(2027, 'melissa', '123456'),
(2034, 'Gamu', 'Gamuchirai@45');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Lieferant`
--

CREATE TABLE `Lieferant` (
  `Lief_ID` int(11) NOT NULL,
  `Lief_Name` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Lieferant`
--

INSERT INTO `Lieferant` (`Lief_ID`, `Lief_Name`) VALUES
(101, 'Bio-Hof Müller'),
(102, 'Obst-Hof Altes Land'),
(103, 'Molkerei Henning');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Lief_Adresse`
--

CREATE TABLE `Lief_Adresse` (
  `Lief_ID` int(11) NOT NULL,
  `Stadt_ID` int(11) DEFAULT NULL,
  `Strasse` varchar(50) DEFAULT NULL,
  `HausNr` varchar(6) DEFAULT NULL,
  `PLZ` varchar(5) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Lief_Adresse`
--

INSERT INTO `Lief_Adresse` (`Lief_ID`, `Stadt_ID`, `Strasse`, `HausNr`, `PLZ`) VALUES
(101, 3, 'Dorfstraße', '74', '24354'),
(102, 4, 'Westerjork 74', '76', '21635'),
(103, 5, 'Molkereiweg', '13', '19217');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Lief_Kontakt`
--

CREATE TABLE `Lief_Kontakt` (
  `Kontakt_ID` int(11) NOT NULL,
  `Lief_ID` int(11) NOT NULL,
  `TEL` varchar(25) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Lief_Kontakt`
--

INSERT INTO `Lief_Kontakt` (`Kontakt_ID`, `Lief_ID`, `TEL`, `EMAIL`) VALUES
(1, 101, '04354-9080', 'mueller@biohof.de'),
(2, 102, '04162-4523', 'info@biohof-altesland.de'),
(3, 103, '038873-8976', 'info@molkerei-henning.de');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Naehrstoffangaben`
--

CREATE TABLE `Naehrstoffangaben` (
  `Zutat_ID` int(11) NOT NULL,
  `Kalorien` int(11) DEFAULT NULL,
  `Protein` decimal(10,2) DEFAULT NULL,
  `Natrium` decimal(10,2) DEFAULT NULL,
  `Ballaststoffe` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Naehrstoffangaben`
--

INSERT INTO `Naehrstoffangaben` (`Zutat_ID`, `Kalorien`, `Protein`, `Natrium`, `Ballaststoffe`) VALUES
(1001, 19, '1.60', NULL, NULL),
(1002, 28, '1.20', NULL, NULL),
(1003, 18, '1.00', NULL, NULL),
(1004, 25, '1.50', NULL, NULL),
(1005, 41, '0.90', NULL, NULL),
(1006, 71, '2.00', NULL, NULL),
(1007, 27, '2.60', NULL, NULL),
(1008, 29, '2.10', NULL, NULL),
(1009, 141, '6.10', NULL, NULL),
(1010, 41, '3.10', NULL, NULL),
(1011, 86, '1.60', NULL, NULL),
(1012, 28, '3.00', NULL, NULL),
(2001, 54, '0.30', NULL, NULL),
(3001, 65, '3.40', NULL, NULL),
(3002, 241, '18.10', NULL, NULL),
(3003, 741, '0.70', NULL, NULL),
(4001, 137, '11.90', NULL, NULL),
(5001, 304, '12.30', NULL, NULL),
(9001, 217, '14.50', NULL, NULL),
(6408, 109, '3.60', NULL, NULL),
(7043, 9, '0.40', NULL, NULL),
(6300, 67, '5.00', NULL, NULL),
(1013, 165, '31.00', '0.02', '2.00'),
(1014, 23, '2.90', '0.02', '2.00'),
(1015, 208, '20.00', '0.02', '2.00'),
(1016, 364, '10.30', '0.02', '2.00'),
(1017, 50, '3.30', '0.02', '2.00'),
(1018, 387, '0.00', '0.02', '2.00'),
(1019, 288, '0.10', '0.02', '2.00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Rezepte`
--

CREATE TABLE `Rezepte` (
  `Rez_ID` int(11) NOT NULL,
  `Rez_Bez` varchar(50) DEFAULT NULL,
  `Img_Link` varchar(250) DEFAULT NULL,
  `Rez_Preis` decimal(10,2) DEFAULT NULL,
  `Rez_Besch` varchar(150) DEFAULT NULL,
  `Zutat_Menge` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Rezepte`
--

INSERT INTO `Rezepte` (`Rez_ID`, `Rez_Bez`, `Img_Link`, `Rez_Preis`, `Rez_Besch`, `Zutat_Menge`) VALUES
(1, 'Gebackene Zucchini mit Tomatensauce', 'https://www.iowasource.com/wp-content/uploads/2022/08/lasagna-unsplash-740x560.jpg', '5.99', 'Leckere gebackene Zucchini mit Tomatensauce.', 3),
(2, 'Kartoffelsalat', 'https://plus.unsplash.com/premium_photo-1676313449554-e12b4754957b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cG90YXRvJTIwc2FsYWR8ZW58MHx8MHx8fDA%3D', '6.99', 'Frischer und leckerer Kartoffelsalat.', 5),
(3, 'Mozzarella mit Tomaten', 'https://images.unsplash.com/photo-1561363268-f17491a094bf?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fE1venphcmVsbGElMjB3aXRoJTIwdG9tYXRvZXN8ZW58MHx8MHx8fDA%3D', '5.45', 'Einfache, aber köstliche Vorspeise mit Mozzarella und Tomaten.', 6),
(4, 'Vegetarisches Chili', 'https://emmikochteinfach.de/wp-content/uploads/2023/01/oes-Chili-sin-Carne-schnell-und-einfach-1.jpg', '4.50', 'Gesundes und herzhaftes vegetarisches Chili.', 4),
(5, 'Gegrillte Hähnchenbrust mit Gemüse', 'https://www.lowcarbrezepte.org/images/17/gegrillte-haehnchenbrust-mit-gemuese.jpg', '9.99', 'Saftige gegrillte Hähnchenbrust mit einer Vielfalt an frischem Gemüse.', 4),
(6, 'Spinat-Lachs-Quiche', 'https://www.einfachkochen.de/sites/einfachkochen.de/files/styles/full_width_tablet_4_3/public/2023-03/quiche_mit_lachs_01.jpg?h=d3178815&itok=RtB31WX_', '7.50', 'Herzhafte Quiche mit frischem Spinat und Lachs, perfekt für ein gemütliches Abendessen.', 5),
(7, 'Ratatouille', 'https://www.allrecipes.com/thmb/F1rucOY3FQT5Ic0oyxdLoqU_yKc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/222006-disneys-ratatouille-DDMFS-4x3-36eb15843ab548a79e7aab761dac92e1.jpg', '6.75', 'Traditionelles französisches Gericht aus geschmortem Gemüse wie Zucchini, Paprika und Auberginen.', 6),
(8, 'Schwarzwälder Kirschtorte', 'https://eat.de/wp-content/uploads/2024/02/schwarzwaelder-kirschtorte-2018.jpg', '12.95', 'Berühmte Schwarzwälder Kirschtorte mit Schichten von Schokolade, Sahne und Kirschen.', 6),
(9, 'Wiener Schnitzel mit Kartoffelsalat', 'https://www.kuechengoetter.de/uploads/media/1800x1200/02/48942-wiener-schnitzel-kartoffelsalat-rezept.jpg?v=2-21', '10.50', 'Klassisches Wiener Schnitzel aus dünn geschnittenem Kalbfleisch mit knuspriger Panade und Beilage von Kartoffelsalat.', 3),
(10, 'Apfelstrudel mit Vanillesauce', 'https://www.gutekueche.ch/upload/rezept/15807/1600x1200_apfelstrudel-mit-vanillesauce.jpg', '5.25', 'Köstlicher Apfelstrudel mit einer süßen Vanillesauce, perfekt als Dessert oder zum Kaffee.', 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Rez_Ctg`
--

CREATE TABLE `Rez_Ctg` (
  `Rez_ID` int(11) NOT NULL,
  `Ctg_ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Rez_Ctg`
--

INSERT INTO `Rez_Ctg` (`Rez_ID`, `Ctg_ID`) VALUES
(1, 1),
(1, 3),
(2, 1),
(2, 3),
(3, 1),
(3, 2),
(4, 1),
(4, 3),
(5, 1),
(5, 2),
(6, 1),
(6, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Rez_Zutat`
--

CREATE TABLE `Rez_Zutat` (
  `Rez_ID` int(11) NOT NULL,
  `Zutat_ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Rez_Zutat`
--

INSERT INTO `Rez_Zutat` (`Rez_ID`, `Zutat_ID`) VALUES
(1, 1001),
(1, 1002),
(1, 1003),
(2, 1004),
(2, 1005),
(2, 1006),
(2, 1010),
(2, 4001),
(3, 1003),
(3, 1007),
(3, 1008),
(3, 1009),
(3, 1010),
(3, 3002),
(4, 1003),
(4, 1010),
(4, 1011),
(4, 1012),
(5, 1003),
(5, 1013),
(5, 1014),
(5, 1015),
(6, 1014),
(6, 1015),
(6, 1016),
(6, 1017),
(6, 1018),
(7, 1001),
(7, 1002),
(7, 1003),
(7, 1009),
(7, 1019),
(7, 9002),
(8, 1003),
(8, 1004),
(8, 1005),
(8, 1016),
(8, 1018),
(8, 4001),
(9, 1006),
(9, 1007),
(9, 1008),
(10, 1009),
(10, 1010),
(10, 1011),
(10, 1018),
(10, 1019),
(10, 2001);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Stadt`
--

CREATE TABLE `Stadt` (
  `Stadt_ID` int(11) NOT NULL,
  `Stadt` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Stadt`
--

INSERT INTO `Stadt` (`Stadt_ID`, `Stadt`) VALUES
(1, 'Hamburg'),
(2, 'Barsbüttel'),
(3, 'Weseby'),
(4, 'Jork'),
(5, 'Dechow');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Zutat`
--

CREATE TABLE `Zutat` (
  `Zutat_ID` int(11) NOT NULL,
  `Zutat_Bez` varchar(50) DEFAULT NULL,
  `Einheit` varchar(25) DEFAULT NULL,
  `Netto_Preis` decimal(10,2) DEFAULT NULL,
  `Bestand` int(11) DEFAULT NULL,
  `Img_Link` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Zutat`
--

INSERT INTO `Zutat` (`Zutat_ID`, `Zutat_Bez`, `Einheit`, `Netto_Preis`, `Bestand`, `Img_Link`) VALUES
(1001, 'Zucchini', 'Stück', '0.89', 100, 'https://www.lebensmittellexikon.de/bilder/zucchini.jpg'),
(1002, 'Zwiebel', 'Kilogramm', '0.15', 50, 'https://cdn03.ciceksepeti.com/cicek/kc801389-1/L/secil-kuru-sogan-orta-boy-20-kg-kc801389-1-4bf469141f914ee3b3d8c2c41b9b3994.jpg'),
(1003, 'Tomate', 'Kilogramm', '0.45', 50, 'https://farmfreshontario.com/wp-content/uploads/2019/12/p3.jpg'),
(1004, 'Schalotte', 'Stück', '0.20', 500, 'https://cdn.dsmcdn.com/mnresize/1200/1800/ty576/product/media/images/20221024/17/201593986/578675279/1/1_org_zoom.jpg'),
(1005, 'Karotte', 'Stück', '0.30', 500, 'https://www.gemuese.ch/media/3bup13mn/karotte_bund_010819.png?width=720&height=720&format=png&quality=80'),
(1006, 'Kartoffel', 'Stück', '0.15', 1500, 'https://static.gesundheitswissen.de/wp-content/uploads/2022/08/raw-potatoes-in-burlap-sack-768x434.jpg'),
(1007, 'Rucola', 'Bund', '0.90', 10, 'https://static.ticimax.cloud/cdn-cgi/image/width=350,quality=85/3140/uploads/urunresimleri/buyuk/organik-roka-demet-kurtdogmus-ciftligi-5dfd0a.jpg'),
(1008, 'Lauch', 'Stück', '1.20', 35, 'https://www.lebensmittellexikon.de/bilder/lauch.jpg'),
(1009, 'Knoblauch', 'Stück', '0.25', 250, 'https://static.ticimax.cloud/cdn-cgi/image/width=-,quality=85/48857/uploads/urunresimleri/buyuk/1008779-5-bd64.jpg'),
(1010, 'Basilikum', 'Bund', '1.30', 10, 'https://static.ticimax.cloud/3140/uploads/urunresimleri/buyuk/740f1b6e-d0a8-4ef4-8fa4-3f0a2554f75a.jpg'),
(1011, 'Süßkartoffel', 'Kilogramm', '2.00', 200, 'https://ludwigs.shop/wp-content/uploads/2022/10/Suesskartoffeln.png'),
(1012, 'Schnittlauch', 'Bund', '0.90', 10, 'https://static.feinkost-kaefer.de/media/image/15/32/c8/109596_Schnittlauch_Bund.jpg'),
(2001, 'Apfel', 'Stück', '1.20', 750, 'https://obst.de/media/85/c3/8d/1617201198/obstlexikon_apfel.jpg'),
(3001, 'Vollmilch. 3.5%', 'Liter', '1.50', 50, 'https://www.molkerei-weihenstephan.de/fileadmin/media/produkte/milch/frische_milch/fmilch_1l_35.png'),
(3002, 'Mozzarella', 'Packung', '3.50', 20, 'https://www.laves.niedersachsen.de/assets/image/736/190470'),
(3003, 'Butter', 'Stück', '3.00', 50, 'https://www.creedfoodservice.co.uk/media/catalog/product/cache/d781aa45b0623b3b1e7a18c482a05dd6/9/f/9f3021490ea6926c18d512c4b049a02a.jpg'),
(4001, 'Ei', 'Stück', '0.40', 300, 'https://www.wikifit.de/photos/kalorientabelle/301/ei-huehnerei.jpg'),
(5001, 'Wiener Würstchen', 'Paar', '1.80', 40, 'https://clickandgrill.de/media/catalog/product/cache/7732df489d1b255c6cf2478bd3f8692c/w/i/wiener-wuerstchen-kaufen.png'),
(9001, 'Tofu-Würstchen', 'Stück', '1.80', 20, 'https://vekoop.de/media/image/product/49420/lg/nagel-tofu-lange-tofu-wiener-4-stueck-280g-bio-vegan-vpe.jpg'),
(6408, 'Couscous', 'Packung', '1.90', 15, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQ53Rit0KRIpUh1KHhQg2fBNPzeB2JXMuAoj_HteboVwA_fJS18j_pvpNZAZR3sn49HbG3OxFQ4Ea030TVPaDpLBHOPa2znA1IqbiWkQ8amZArwuYq6sGIf'),
(7043, 'Gemüsebrühe', 'Würfel', '0.20', 4000, 'https://www.edeka24.de/out/pictures/generated/product/1/540_540_90/bio_edeka_gemamp252sebramp252he_famp252r_7l_140g(1).jpg'),
(6300, 'Kichererbsen', 'Dose', '1.00', 400, 'https://www.gourmet-versand.com/img_article_v3/122702-kichererbsen-in-salzlake-suntat.jpg'),
(1013, 'Hähnchenbrustfilet', 'Stück', '5.00', 30, 'https://m.media-amazon.com/images/I/51chrTN9RwL._AC_UF894,1000_QL80_.jpg'),
(1014, 'Spinat', 'Bündel', '1.50', 20, 'https://www.gemuese.ch/media/ikwphpz4/spinat_010919.png?width=720&height=720&format=png&quality=80'),
(1015, 'Lachsfilet', 'Stück', '7.00', 15, 'https://img.rewe-static.de/8437260/30793152_digital-image.png'),
(1016, 'Mehl', 'Kilogramm', '1.50', 100, 'https://cdn.metro-group.com/de/de_pim_245206001001_01.png?w=400&h=400&mode=pad'),
(1017, 'Milch', 'Liter', '1.20', 30, 'https://images.eatsmarter.de/sites/default/files/styles/576x432/public/warenkunde-milch-300x225.jpg'),
(1018, 'Zucker', 'Kilogramm', '2.50', 50, 'https://www.diamant-zucker.de/images/default-source/products/produkt-bilder/wei%C3%9Fer-zucker/desktop/diamantzuckerdesktop.tmb-thumb_sml.png?Culture=de'),
(1019, 'Vanilleextrakt', 'Flasche', '3.50', 10, 'https://www.genussland.de/media/image/59/fc/79/tylor-colledge-vanille-extraktJYUEkg5XNzHzI_600x600.jpg'),
(9002, 'Aubergine', 'Kilogramm', '0.65', 50, 'https://www.unsereheimat.de/files/_processed_/0/b/csm_419-detailimage_4effb83e00.png');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Zutat_Allerg`
--

CREATE TABLE `Zutat_Allerg` (
  `Zutat_ID` int(11) NOT NULL,
  `Allerg_ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Zutat_Allerg`
--

INSERT INTO `Zutat_Allerg` (`Zutat_ID`, `Allerg_ID`) VALUES
(1001, 2),
(1001, 3),
(1002, 2),
(1002, 3),
(1003, 2),
(1003, 3),
(1004, 1),
(1004, 2),
(1004, 3),
(1005, 2),
(1005, 3),
(1006, 2),
(1006, 3),
(1007, 2),
(1008, 1),
(1008, 2),
(1008, 3),
(1009, 1),
(1009, 2),
(1009, 3),
(1010, 2),
(1010, 3),
(1011, 2),
(1011, 3),
(1012, 2),
(1012, 3),
(2001, 2),
(2001, 3),
(3001, 1),
(3001, 2),
(3002, 1),
(3002, 2),
(3002, 3),
(3003, 1),
(3003, 2),
(3003, 3),
(4001, 2),
(5001, 2),
(6300, 2),
(6408, 2),
(7043, 2),
(9001, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Zutat_Lief`
--

CREATE TABLE `Zutat_Lief` (
  `Zutat_ID` int(11) NOT NULL,
  `Lief_ID` int(11) NOT NULL,
  `Menge` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `Zutat_Lief`
--

INSERT INTO `Zutat_Lief` (`Zutat_ID`, `Lief_ID`, `Menge`) VALUES
(1001, 101, NULL),
(1002, 101, NULL),
(1003, 102, NULL),
(1004, 101, NULL),
(1005, 101, NULL),
(1006, 101, NULL),
(1007, 102, NULL),
(1008, 101, NULL),
(1009, 101, NULL),
(1010, 102, NULL),
(1011, 101, NULL),
(1012, 102, NULL),
(2001, 102, NULL),
(3001, 103, NULL),
(3002, 103, NULL),
(3003, 103, NULL),
(4001, 101, NULL),
(5001, 101, NULL),
(9001, 101, NULL),
(6408, 101, NULL),
(7043, 101, NULL),
(6300, 101, NULL);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Adresse`
--
ALTER TABLE `Adresse`
  ADD PRIMARY KEY (`Adr_ID`),
  ADD KEY `fk_stadt_id` (`Stadt_ID`);

--
-- Indizes für die Tabelle `Allergene`
--
ALTER TABLE `Allergene`
  ADD PRIMARY KEY (`Allerg_ID`);

--
-- Indizes für die Tabelle `Bestellung`
--
ALTER TABLE `Bestellung`
  ADD PRIMARY KEY (`Bes_Nr`),
  ADD KEY `Kund_Nr` (`Kund_Nr`);

--
-- Indizes für die Tabelle `Bes_Rez`
--
ALTER TABLE `Bes_Rez`
  ADD PRIMARY KEY (`Bes_Nr`,`Rez_ID`),
  ADD KEY `Rez_ID` (`Rez_ID`);

--
-- Indizes für die Tabelle `Bes_Zutat`
--
ALTER TABLE `Bes_Zutat`
  ADD PRIMARY KEY (`Bes_Nr`,`Zutat_ID`),
  ADD KEY `fk_Bes_Nr_Zutat_ID` (`Zutat_ID`) USING BTREE;

--
-- Indizes für die Tabelle `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`Ctg_ID`);

--
-- Indizes für die Tabelle `Fett`
--
ALTER TABLE `Fett`
  ADD PRIMARY KEY (`Zutat_ID`);

--
-- Indizes für die Tabelle `Knd_Adr`
--
ALTER TABLE `Knd_Adr`
  ADD PRIMARY KEY (`Kund_Nr`,`Adr_ID`),
  ADD KEY `Adr_ID` (`Adr_ID`);

--
-- Indizes für die Tabelle `Knd_Kontakt`
--
ALTER TABLE `Knd_Kontakt`
  ADD PRIMARY KEY (`Kontakt_ID`),
  ADD KEY `Kund_Nr` (`Kund_Nr`);

--
-- Indizes für die Tabelle `Kohlenhydrate`
--
ALTER TABLE `Kohlenhydrate`
  ADD PRIMARY KEY (`Zutat_ID`);

--
-- Indizes für die Tabelle `Kunde`
--
ALTER TABLE `Kunde`
  ADD PRIMARY KEY (`Kund_Nr`);

--
-- Indizes für die Tabelle `Kund_Login`
--
ALTER TABLE `Kund_Login`
  ADD PRIMARY KEY (`kund_Nr`),
  ADD UNIQUE KEY `kund_username` (`kund_username`);

--
-- Indizes für die Tabelle `Lieferant`
--
ALTER TABLE `Lieferant`
  ADD PRIMARY KEY (`Lief_ID`);

--
-- Indizes für die Tabelle `Lief_Adresse`
--
ALTER TABLE `Lief_Adresse`
  ADD PRIMARY KEY (`Lief_ID`),
  ADD KEY `Stadt_ID` (`Stadt_ID`);

--
-- Indizes für die Tabelle `Lief_Kontakt`
--
ALTER TABLE `Lief_Kontakt`
  ADD PRIMARY KEY (`Kontakt_ID`) USING BTREE,
  ADD KEY `fk_Lief_ID` (`Lief_ID`) USING BTREE;

--
-- Indizes für die Tabelle `Naehrstoffangaben`
--
ALTER TABLE `Naehrstoffangaben`
  ADD PRIMARY KEY (`Zutat_ID`);

--
-- Indizes für die Tabelle `Rezepte`
--
ALTER TABLE `Rezepte`
  ADD PRIMARY KEY (`Rez_ID`),
  ADD KEY `Rez_Bez` (`Rez_Bez`);

--
-- Indizes für die Tabelle `Rez_Ctg`
--
ALTER TABLE `Rez_Ctg`
  ADD PRIMARY KEY (`Rez_ID`,`Ctg_ID`),
  ADD KEY `fk_Ctg_ID_Rez_ID` (`Ctg_ID`,`Rez_ID`) USING BTREE;

--
-- Indizes für die Tabelle `Rez_Zutat`
--
ALTER TABLE `Rez_Zutat`
  ADD PRIMARY KEY (`Rez_ID`,`Zutat_ID`),
  ADD KEY `fk_Rez_ID_Zutat_ID` (`Zutat_ID`,`Rez_ID`) USING BTREE;

--
-- Indizes für die Tabelle `Stadt`
--
ALTER TABLE `Stadt`
  ADD PRIMARY KEY (`Stadt_ID`);

--
-- Indizes für die Tabelle `Zutat`
--
ALTER TABLE `Zutat`
  ADD PRIMARY KEY (`Zutat_ID`),
  ADD KEY `Zutat_Bez` (`Zutat_Bez`);

--
-- Indizes für die Tabelle `Zutat_Allerg`
--
ALTER TABLE `Zutat_Allerg`
  ADD PRIMARY KEY (`Zutat_ID`,`Allerg_ID`),
  ADD KEY `fk_zutat_allerg_allerg_id` (`Allerg_ID`,`Zutat_ID`) USING BTREE;

--
-- Indizes für die Tabelle `Zutat_Lief`
--
ALTER TABLE `Zutat_Lief`
  ADD PRIMARY KEY (`Zutat_ID`,`Lief_ID`),
  ADD KEY `Lief_ID` (`Lief_ID`,`Zutat_ID`) USING BTREE;

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Adresse`
--
ALTER TABLE `Adresse`
  MODIFY `Adr_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `Allergene`
--
ALTER TABLE `Allergene`
  MODIFY `Allerg_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `Bestellung`
--
ALTER TABLE `Bestellung`
  MODIFY `Bes_Nr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `Category`
--
ALTER TABLE `Category`
  MODIFY `Ctg_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `Knd_Kontakt`
--
ALTER TABLE `Knd_Kontakt`
  MODIFY `Kontakt_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT für Tabelle `Kunde`
--
ALTER TABLE `Kunde`
  MODIFY `Kund_Nr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2036;

--
-- AUTO_INCREMENT für Tabelle `Lieferant`
--
ALTER TABLE `Lieferant`
  MODIFY `Lief_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT für Tabelle `Zutat`
--
ALTER TABLE `Zutat`
  MODIFY `Zutat_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9005;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
