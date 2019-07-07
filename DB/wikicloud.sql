-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Jul 2019 um 11:19
-- Server-Version: 10.1.40-MariaDB
-- PHP-Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `wikicloud`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reference`
--

CREATE TABLE `reference` (
  `PK` int(99) NOT NULL,
  `pageName` varchar(99) COLLATE latin1_bin NOT NULL,
  `pageID` int(99) NOT NULL,
  `linkTo_pageName` varchar(99) COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Daten für Tabelle `reference`
--

INSERT INTO `reference` (`PK`, `pageName`, `pageID`, `linkTo_pageName`) VALUES
(3, 'Bill Gates', 3747, '.NET Foundation'),
(4, 'Bill Gates', 3747, '86-DOS'),
(5, 'Bill Gates', 3747, 'A&E Television Networks'),
(6, 'Bill Gates', 3747, 'A. R. Rahman'),
(7, 'Bill Gates', 3747, 'A. Sivathanu Pillai'),
(8, 'Bill Gates', 3747, 'A. V. Rama Rao'),
(9, 'Bill Gates', 3747, 'AQuantive'),
(10, 'Bill Gates', 3747, 'Aamir Khan'),
(11, 'Bill Gates', 3747, 'Abdul Rashid Khan'),
(12, 'Bill Gates', 3747, 'Abhijit Sen'),
(13, 'Bill Gates', 3747, 'Abiogenesis'),
(14, 'Bill Gates', 3747, 'Acme Boots'),
(15, 'Bill Gates', 3747, 'Acme Brick'),
(16, 'Bill Gates', 3747, 'Adam Braun'),
(17, 'Bill Gates', 3747, 'Addie L. Wyatt'),
(18, 'Bill Gates', 3747, 'Adi Godrej'),
(19, 'Bill Gates', 3747, 'Adolf Hitler'),
(20, 'Bill Gates', 3747, 'Ajai Chowdhry'),
(21, 'Bill Gates', 3747, 'Ajit Jain'),
(22, 'Bill Gates', 3747, 'Akbar Padamsee'),
(23, 'Bill Gates', 3747, 'Al Arabiya'),
(24, 'Bill Gates', 3747, 'Alan Greenspan'),
(25, 'Bill Gates', 3747, 'Alan Khazei'),
(26, 'Bill Gates', 3747, 'Albuquerque, New Mexico'),
(27, 'Bill Gates', 3747, 'Alcatel-Lucent v. Microsoft Corp.'),
(28, 'Bill Gates', 3747, 'Alexander Kadakin'),
(29, 'Bill Gates', 3747, 'Algorithm'),
(30, 'Bill Gates', 3747, 'Alicia Garza'),
(31, 'Bill Gates', 3747, 'Alison Cheek'),
(32, 'Bill Gates', 3747, 'All Things Digital'),
(33, 'Bill Gates', 3747, 'Allard Lowenstein'),
(34, 'Bill Gates', 3747, 'Altair 8800'),
(35, 'Bill Gates', 3747, 'Altair BASIC'),
(36, 'Bill Gates', 3747, 'Altamira Software'),
(37, 'Bill Gates', 3747, 'AltspaceVR'),
(38, 'Bill Gates', 3747, 'Amancio Ortega'),
(39, 'Bill Gates', 3747, 'Amazon.com'),
(40, 'Bill Gates', 3747, 'Amazon (company)'),
(41, 'Bill Gates', 3747, 'Amber Lynn Coffman'),
(42, 'Bill Gates', 3747, 'Ambrish Mithal'),
(43, 'Bill Gates', 3747, 'American Genius'),
(44, 'Bill Gates', 3747, 'Amy Hood'),
(45, 'Bill Gates', 3747, 'Amyotrophic lateral sclerosis'),
(46, 'Bill Gates', 3747, 'Analjit Singh'),
(47, 'Bill Gates', 3747, 'Andrea Jaeger'),
(48, 'Bill Gates', 3747, 'Andrew Carnegie'),
(49, 'Bill Gates', 3747, 'Andrew Grove'),
(50, 'Bill Gates', 3747, 'Andrew Shue'),
(51, 'Bill Gates', 3747, 'Angela Merkel'),
(52, 'Bill Gates', 3747, 'Anil Bordia'),
(53, 'Bill Gates', 3747, 'Anish Kapoor'),
(54, 'Bill Gates', 3747, 'Anisuzzaman'),
(55, 'Bill Gates', 3747, 'Anita Desai'),
(56, 'Bill Gates', 3747, 'Anne Buydens'),
(57, 'Bill Gates', 3747, 'Anne Donahue'),
(58, 'Bill Gates', 3747, 'Anthony Michael Hall'),
(59, 'Bill Gates', 3747, 'Anthony Shriver'),
(60, 'Bill Gates', 3747, 'Anti-competitive practices'),
(61, 'Bill Gates', 3747, 'Anumolu Ramakrishna'),
(62, 'Bill Gates', 3747, 'Anupam Kher'),
(63, 'Bill Gates', 3747, 'Anwar Sadat'),
(64, 'Bill Gates', 3747, 'Apollo 8'),
(65, 'Bill Gates', 3747, 'Apple Computer, Inc. v. Microsoft Corp.'),
(66, 'Bill Gates', 3747, 'Apple Inc.'),
(67, 'Bill Gates', 3747, 'Applied Underwriters Inc.'),
(68, 'Bill Gates', 3747, 'Arne Duncan'),
(69, 'Bill Gates', 3747, 'Arne Sorenson'),
(70, 'Bill Gates', 3747, 'Arogyaswami Paulraj'),
(71, 'Bill Gates', 3747, 'Arpita Singh'),
(72, 'Bill Gates', 3747, 'Art Buchwald'),
(73, 'Bill Gates', 3747, 'Arthur Ashe'),
(74, 'Bill Gates', 3747, 'Arthur F. Burns'),
(75, 'Bill Gates', 3747, 'Arvind Panagariya'),
(76, 'Bill Gates', 3747, 'Arvind Parikh'),
(77, 'Bill Gates', 3747, 'Ashok Laxmanrao Kukade'),
(78, 'Bill Gates', 3747, 'Ashok Seth'),
(79, 'Bill Gates', 3747, 'Ashoke Sen'),
(80, 'Bill Gates', 3747, 'B. K. Chaturvedi'),
(81, 'Bill Gates', 3747, 'B. Muthuraman'),
(82, 'Bill Gates', 3747, 'B. N. Suresh'),
(83, 'Bill Gates', 3747, 'BASIC'),
(84, 'Bill Gates', 3747, 'BASIC programming language'),
(85, 'Bill Gates', 3747, 'BBC'),
(86, 'Bill Gates', 3747, 'BBC Radio 4'),
(87, 'Bill Gates', 3747, 'BH Media'),
(88, 'Bill Gates', 3747, 'Baby boomers'),
(89, 'Bill Gates', 3747, 'Bachendri Pal'),
(90, 'Bill Gates', 3747, 'Baidu'),
(91, 'Bill Gates', 3747, 'Balagangadharanatha Swamiji'),
(92, 'Bill Gates', 3747, 'Balasaheb Vikhe Patil'),
(93, 'Bill Gates', 3747, 'Barack Obama'),
(94, 'Bill Gates', 3747, 'Barbara Bush'),
(95, 'Bill Gates', 3747, 'Barbara Jordan'),
(96, 'Bill Gates', 3747, 'Barjinder Singh Hamdard'),
(97, 'Bill Gates', 3747, 'Belle Monappa Hegde'),
(98, 'Bill Gates', 3747, 'Bellevue, Washington'),
(99, 'Bill Gates', 3747, 'Ben Bernanke'),
(100, 'Bill Gates', 3747, 'Ben Bridge Jeweler'),
(101, 'Bill Gates', 3747, 'Benjamin Carson'),
(102, 'Bill Gates', 3747, 'Benjamin Moore & Co.'),
(103, 'Bill Gates', 3747, 'Benjamin Shuldiner'),
(104, 'Bill Gates', 3747, 'Berkshire Hathaway'),
(105, 'Bill Gates', 3747, 'Berkshire Hathaway Assurance'),
(106, 'Bill Gates', 3747, 'Berkshire Hathaway Energy'),
(107, 'Bill Gates', 3747, 'Berkshire Hathaway GUARD Insurance Companies'),
(108, 'Bill Gates', 3747, 'Berkshire Hathaway Insurance'),
(109, 'Bill Gates', 3747, 'Berkshire Hathaway Media'),
(110, 'Bill Gates', 3747, 'Bernard Arnault'),
(111, 'Bill Gates', 3747, 'Bernard Powell'),
(112, 'Bill Gates', 3747, 'Betty Ford'),
(113, 'Bill Gates', 3747, 'BgC3'),
(114, 'Bill Gates', 3747, 'Biblioteca Nacional de EspaÃ±a'),
(115, 'Bill Gates', 3747, 'BibliothÃ¨que nationale de France'),
(116, 'Bill Gates', 3747, 'Big Bang'),
(117, 'Bill Gates', 3747, 'Big History'),
(118, 'Bill Gates', 3747, 'Big History (TV series)'),
(119, 'Bill Gates', 3747, 'Big History Project'),
(120, 'Bill Gates', 3747, 'Bikash Sinha'),
(121, 'Bill Gates', 3747, 'Bill & Melinda Gates Foundation'),
(122, 'Bill Gates', 3747, 'Bill Clinton'),
(123, 'Bill Gates', 3747, 'Bill Gates (disambiguation)'),
(124, 'Bill Gates', 3747, 'Bill Gates Sr.'),
(125, 'Bill Gates', 3747, 'Bill Shore'),
(126, 'Bill Gates', 3747, 'Bill Wurtz'),
(127, 'Bill Gates', 3747, 'Billie Jean King'),
(128, 'Bill Gates', 3747, 'Bing (search engine)'),
(129, 'Bill Gates', 3747, 'Bipan Chandra'),
(130, 'Bill Gates', 3747, 'Blue Chip Stamps'),
(131, 'Bill Gates', 3747, 'Blue Skies (Irving Berlin song)'),
(132, 'Bill Gates', 3747, 'Board of directors'),
(133, 'Bill Gates', 3747, 'BoatUS'),
(134, 'Bill Gates', 3747, 'Bob Hope'),
(135, 'Bill Gates', 3747, 'Bob Michel'),
(136, 'Bill Gates', 3747, 'Bobby Jindal'),
(137, 'Bill Gates', 3747, 'Bono'),
(138, 'Bill Gates', 3747, 'Bower Award for Business Leadership'),
(139, 'Bill Gates', 3747, 'Boy Scouts of America'),
(140, 'Bill Gates', 3747, 'Brad Davis (soccer)'),
(141, 'Bill Gates', 3747, 'Branded Entertainment Network'),
(142, 'Bill Gates', 3747, 'Branford Marsalis'),
(143, 'Bill Gates', 3747, 'Brian Kreiter'),
(144, 'Bill Gates', 3747, 'Brian Lamb'),
(145, 'Bill Gates', 3747, 'Brian Westbrook'),
(146, 'Bill Gates', 3747, 'Bristol Herald Courier'),
(147, 'Bill Gates', 3747, 'Brittany Bergquist'),
(148, 'Bill Gates', 3747, 'Brooks Sports'),
(149, 'Bill Gates', 3747, 'Bruce Ritter'),
(150, 'Bill Gates', 3747, 'Buddhadev Das Gupta'),
(151, 'Bill Gates', 3747, 'Budhaditya Mukherjee'),
(152, 'Bill Gates', 3747, 'Build (developer conference)'),
(153, 'Bill Gates', 3747, 'Bundling of Microsoft Windows'),
(154, 'Bill Gates', 3747, 'Bungie'),
(155, 'Bill Gates', 3747, 'Burlington Northern Santa Fe Corporation'),
(156, 'Bill Gates', 3747, 'Business @ the Speed of Thought'),
(157, 'Bill Gates', 3747, 'Business Wire'),
(158, 'Bill Gates', 3747, 'Business magnate'),
(159, 'Bill Gates', 3747, 'C. Everett Koop'),
(160, 'Bill Gates', 3747, 'C. P. Krishnan Nair'),
(161, 'Bill Gates', 3747, 'C. V. Chandrasekhar'),
(162, 'Bill Gates', 3747, 'CC Sabathia'),
(163, 'Bill Gates', 3747, 'CNET'),
(164, 'Bill Gates', 3747, 'COBOL'),
(165, 'Bill Gates', 3747, 'CP/M'),
(166, 'Bill Gates', 3747, 'Calista Technologies'),
(167, 'Bill Gates', 3747, 'Campbell Hausfeld'),
(168, 'Bill Gates', 3747, 'Capital Gazette shooting'),
(169, 'Bill Gates', 3747, 'Carl Sagan'),
(170, 'Bill Gates', 3747, 'Carla Anderson Hills'),
(171, 'Bill Gates', 3747, 'Carla Hills'),
(172, 'Bill Gates', 3747, 'Carlos Slim'),
(173, 'Bill Gates', 3747, 'Carlton Forge Works'),
(174, 'Bill Gates', 3747, 'Carnegie Mellon University'),
(175, 'Bill Gates', 3747, 'Carol Sutton'),
(176, 'Bill Gates', 3747, 'Cascade Investment'),
(177, 'Bill Gates', 3747, 'Central States Indemnity'),
(178, 'Bill Gates', 3747, 'Cesar Chavez'),
(179, 'Bill Gates', 3747, 'Chad Pregracke'),
(180, 'Bill Gates', 3747, 'Chairman'),
(181, 'Bill Gates', 3747, 'Champagne (advertisement)'),
(182, 'Bill Gates', 3747, 'Chanda Kochhar'),
(183, 'Bill Gates', 3747, 'Channel 9 (Microsoft)'),
(184, 'Bill Gates', 3747, 'Charles Best (businessman)'),
(185, 'Bill Gates', 3747, 'Charles H. Townes'),
(186, 'Bill Gates', 3747, 'Charles Koch'),
(187, 'Bill Gates', 3747, 'Charles Lindbergh'),
(188, 'Bill Gates', 3747, 'Charles Noski'),
(189, 'Bill Gates', 3747, 'Charles Scharf'),
(190, 'Bill Gates', 3747, 'Charles Stark Draper'),
(191, 'Bill Gates', 3747, 'Charles de Gaulle'),
(192, 'Bill Gates', 3747, 'Charlie Kimball'),
(193, 'Bill Gates', 3747, 'Charlie Munger'),
(194, 'Bill Gates', 3747, 'Chemical element'),
(195, 'Bill Gates', 3747, 'Chhannulal Mishra'),
(196, 'Bill Gates', 3747, 'Chiang Kai-shek'),
(197, 'Bill Gates', 3747, 'Chief executive officer'),
(198, 'Bill Gates', 3747, 'Chinese Academy of Engineering'),
(199, 'Bill Gates', 3747, 'Cho Ramaswamy'),
(200, 'Bill Gates', 3747, 'Christos Papadimitriou'),
(201, 'Bill Gates', 3747, 'ChronoZoom'),
(202, 'Bill Gates', 3747, 'Chronology of the universe'),
(203, 'Bill Gates', 3747, 'CiNii'),
(204, 'Bill Gates', 3747, 'Circumcision'),
(205, 'Bill Gates', 3747, 'Claude Pepper'),
(206, 'Bill Gates', 3747, 'Clayton Homes'),
(207, 'Bill Gates', 3747, 'Coach class'),
(208, 'Bill Gates', 3747, 'CodePlex'),
(209, 'Bill Gates', 3747, 'Codex Leicester'),
(210, 'Bill Gates', 3747, 'Coleen Rowley'),
(211, 'Bill Gates', 3747, 'Coleman A. Young'),
(212, 'Bill Gates', 3747, 'Colin Powell'),
(213, 'Bill Gates', 3747, 'Colloquis'),
(214, 'Bill Gates', 3747, 'Columbia University Press'),
(215, 'Bill Gates', 3747, 'Combinatorics'),
(216, 'Bill Gates', 3747, 'Commercial aircraft'),
(217, 'Bill Gates', 3747, 'Computer Center Corporation'),
(218, 'Bill Gates', 3747, 'Condoleezza Rice'),
(219, 'Bill Gates', 3747, 'Congregational Christian Churches'),
(220, 'Bill Gates', 3747, 'Connectix'),
(221, 'Bill Gates', 3747, 'Consumers Software'),
(222, 'Bill Gates', 3747, 'Copyright'),
(223, 'Bill Gates', 3747, 'Corazon Aquino'),
(224, 'Bill Gates', 3747, 'Corinne Hindes'),
(225, 'Bill Gates', 3747, 'Cory A. Booker'),
(226, 'Bill Gates', 3747, 'Cosmogony'),
(227, 'Bill Gates', 3747, 'Craig Hatkoff'),
(228, 'Bill Gates', 3747, 'Craig Mundie'),
(229, 'Bill Gates', 3747, 'Crash Course (YouTube)'),
(230, 'Bill Gates', 3747, 'Criticism of Microsoft'),
(231, 'Bill Gates', 3747, 'Criticism of Microsoft Windows'),
(232, 'Bill Gates', 3747, 'Criticism of Windows 10'),
(233, 'Bill Gates', 3747, 'Criticism of Windows Vista'),
(234, 'Bill Gates', 3747, 'Criticism of Windows XP'),
(235, 'Bill Gates', 3747, 'Culpeper Star-Exponent'),
(236, 'Bill Gates', 3747, 'Currier House (Harvard College)'),
(237, 'Bill Gates', 3747, 'Curtis Granderson'),
(238, 'Bill Gates', 3747, 'Cynthia Cooper (accountant)'),
(239, 'Bill Gates', 3747, 'Cynthia Stokes Brown'),
(240, 'Bill Gates', 3747, 'Cyrus R. Vance'),
(241, 'Bill Gates', 3747, 'CÃ©sar Cernuda'),
(242, 'Bill Gates', 3747, 'D. Nageshwar Reddy'),
(243, 'Bill Gates', 3747, 'D. Ramanaidu'),
(244, 'Bill Gates', 3747, 'DBLP'),
(245, 'Bill Gates', 3747, 'Daily News (Eden)'),
(246, 'Bill Gates', 3747, 'Dairy Queen'),
(247, 'Bill Gates', 3747, 'Dallas Jessup'),
(248, 'Bill Gates', 3747, 'Dalveer Bhandari'),
(249, 'Bill Gates', 3747, 'Danger Inc.'),
(250, 'Bill Gates', 3747, 'Daniel Patrick Moynihan'),
(251, 'Bill Gates', 3747, 'Danville Register & Bee'),
(252, 'Bill Gates', 3747, 'Darell Hammond'),
(253, 'Bill Gates', 3747, 'Darshan Lal Jain'),
(254, 'Bill Gates', 3747, 'Dashrath Patel'),
(255, 'Bill Gates', 3747, 'Dave Pelzer'),
(256, 'Bill Gates', 3747, 'David Boies'),
(257, 'Bill Gates', 3747, 'David Christian (historian)'),
(258, 'Bill Gates', 3747, 'David Frawley'),
(259, 'Bill Gates', 3747, 'David Gottesman'),
(260, 'Bill Gates', 3747, 'David H. Petraeus'),
(261, 'Bill Gates', 3747, 'David Ho'),
(262, 'Bill Gates', 3747, 'David Koch'),
(263, 'Bill Gates', 3747, 'David Rockefeller'),
(264, 'Bill Gates', 3747, 'David Stockman'),
(265, 'Bill Gates', 3747, 'Dayananda Saraswati (Arsha Vidya)'),
(266, 'Bill Gates', 3747, 'Deep time'),
(267, 'Bill Gates', 3747, 'Deng Xiaoping'),
(268, 'Bill Gates', 3747, 'Denis Hayes'),
(269, 'Bill Gates', 3747, 'Deposition (law)'),
(270, 'Bill Gates', 3747, 'Dereck Faulkner'),
(271, 'Bill Gates', 3747, 'Desert Island Discs'),
(272, 'Bill Gates', 3747, 'Deval Patrick'),
(273, 'Bill Gates', 3747, 'Developing countries'),
(274, 'Bill Gates', 3747, 'Devi Shetty'),
(275, 'Bill Gates', 3747, 'Deviprasad Dwivedi'),
(276, 'Bill Gates', 3747, 'Dharmendra'),
(277, 'Bill Gates', 3747, 'Dhirubhai Thaker'),
(278, 'Bill Gates', 3747, 'Diario Oficial de la FederaciÃ³n'),
(279, 'Bill Gates', 3747, 'Dick Cheney'),
(280, 'Bill Gates', 3747, 'Digital Equipment Corporation'),
(281, 'Bill Gates', 3747, 'Digital Research'),
(282, 'Bill Gates', 3747, 'Digital object identifier'),
(283, 'Bill Gates', 3747, 'Dirk Nowitzki'),
(284, 'Bill Gates', 3747, 'Discrete Mathematics (journal)'),
(285, 'Bill Gates', 3747, 'Distinguished Fellow of the British Computer Society'),
(286, 'Bill Gates', 3747, 'Dolores Huerta'),
(287, 'Bill Gates', 3747, 'Donald A. Glaser'),
(288, 'Bill Gates', 3747, 'Donald Trump'),
(289, 'Bill Gates', 3747, 'Dorothy Height'),
(290, 'Bill Gates', 3747, 'Dot-com bubble'),
(291, 'Bill Gates', 3747, 'Dothan Eagle'),
(292, 'Bill Gates', 3747, 'Double-H Boots'),
(293, 'Bill Gates', 3747, 'Drew Brees'),
(294, 'Bill Gates', 3747, 'Duracell'),
(295, 'Bill Gates', 3747, 'Dwight D. Eisenhower'),
(296, 'Bill Gates', 3747, 'Dwight Howard'),
(297, 'Bill Gates', 3747, 'Dwijen Mukhopadhyay'),
(298, 'Bill Gates', 3747, 'Earth sheltering'),
(299, 'Bill Gates', 3747, 'Eclipse Aviation'),
(300, 'Bill Gates', 3747, 'Ed Roberts (computers)'),
(301, 'Bill Gates', 3747, 'Edward D. Berkowitz'),
(302, 'Bill Gates', 3747, 'Edward Jagen'),
(303, 'Bill Gates', 3747, 'Edward Kennedy'),
(304, 'Bill Gates', 3747, 'Edward Mills Purcell'),
(305, 'Bill Gates', 3747, 'Edward Teller'),
(306, 'Bill Gates', 3747, 'Elayne Bennett'),
(307, 'Bill Gates', 3747, 'Eledath Thaikkattu Narayanan Mooss'),
(308, 'Bill Gates', 3747, 'Elie Wiesel'),
(309, 'Bill Gates', 3747, 'Elizabeth Dole'),
(310, 'Bill Gates', 3747, 'Elizabeth II'),
(311, 'Bill Gates', 3747, 'Ella Grasso'),
(312, 'Bill Gates', 3747, 'Ellie Duke'),
(313, 'Bill Gates', 3747, 'Elliot Richardson'),
(314, 'Bill Gates', 3747, 'Elon Musk'),
(315, 'Bill Gates', 3747, 'Embassy of France, Washington, D.C.'),
(316, 'Bill Gates', 3747, 'Emilio SegrÃ¨'),
(317, 'Bill Gates', 3747, 'Emma Lindle'),
(318, 'Bill Gates', 3747, 'Emmett Tyrrell'),
(319, 'Bill Gates', 3747, 'Emmy Award'),
(320, 'Bill Gates', 3747, 'Employee stock option'),
(321, 'Bill Gates', 3747, 'Emulator'),
(322, 'Bill Gates', 3747, 'Entomology'),
(323, 'Bill Gates', 3747, 'Environmentalism'),
(324, 'Bill Gates', 3747, 'Eric Chaisson'),
(325, 'Bill Gates', 3747, 'Eric Decker'),
(326, 'Bill Gates', 3747, 'Ernest W. Lefever'),
(327, 'Bill Gates', 3747, 'Ernie Els'),
(328, 'Bill Gates', 3747, 'Eugene Lang'),
(329, 'Bill Gates', 3747, 'Eunice Shriver'),
(330, 'Bill Gates', 3747, 'European Union Microsoft competition case'),
(331, 'Bill Gates', 3747, 'Evolution'),
(332, 'Bill Gates', 3747, 'Exquisite Form'),
(333, 'Bill Gates', 3747, 'F. W. de Klerk'),
(334, 'Bill Gates', 3747, 'FASA Studio'),
(335, 'Bill Gates', 3747, 'Faisal of Saudi Arabia'),
(336, 'Bill Gates', 3747, 'Faith Hill'),
(337, 'Bill Gates', 3747, 'Fareed Zakaria'),
(338, 'Bill Gates', 3747, 'Faye Wattleton'),
(339, 'Bill Gates', 3747, 'Firefly (website)'),
(340, 'Bill Gates', 3747, 'First Interstate BancSystem'),
(341, 'Bill Gates', 3747, 'FlightSafety International'),
(342, 'Bill Gates', 3747, 'Flux (software)'),
(343, 'Bill Gates', 3747, 'Forbes'),
(344, 'Bill Gates', 3747, 'Forbes 400'),
(345, 'Bill Gates', 3747, 'Forest River (company)'),
(346, 'Bill Gates', 3747, 'Forethought, Inc.'),
(347, 'Bill Gates', 3747, 'Form 4'),
(348, 'Bill Gates', 3747, 'Fortran'),
(349, 'Bill Gates', 3747, 'France'),
(350, 'Bill Gates', 3747, 'Frank Borman'),
(351, 'Bill Gates', 3747, 'Frank Gehry'),
(352, 'Bill Gates', 3747, 'Franklin D. Roosevelt'),
(353, 'Bill Gates', 3747, 'FranÃ§ois Hollande'),
(354, 'Bill Gates', 3747, 'Fred Jackson (American football)'),
(355, 'Bill Gates', 3747, 'Fred L. Shuttlesworth'),
(356, 'Bill Gates', 3747, 'Fruit of the Loom'),
(357, 'Bill Gates', 3747, 'G. P. Chopra'),
(358, 'Bill Gates', 3747, 'GE'),
(359, 'Bill Gates', 3747, 'GEICO'),
(360, 'Bill Gates', 3747, 'Gabrielle Giffords'),
(361, 'Bill Gates', 3747, 'Garanimals'),
(362, 'Bill Gates', 3747, 'Gary Kildall'),
(363, 'Bill Gates', 3747, 'Gayatri Chakravorty Spivak'),
(364, 'Bill Gates', 3747, 'Gen Re'),
(365, 'Bill Gates', 3747, 'General Electric'),
(366, 'Bill Gates', 3747, 'Genetically modified organism'),
(367, 'Bill Gates', 3747, 'Geoffrey Canada'),
(368, 'Bill Gates', 3747, 'Geologic time scale'),
(369, 'Bill Gates', 3747, 'George Beadle'),
(370, 'Bill Gates', 3747, 'George H. W. Bush'),
(371, 'Bill Gates', 3747, 'George J. Mitchell'),
(372, 'Bill Gates', 3747, 'George Marshall'),
(373, 'Bill Gates', 3747, 'George P. Shultz'),
(374, 'Bill Gates', 3747, 'George W. Bush'),
(375, 'Bill Gates', 3747, 'George Yeo'),
(376, 'Bill Gates', 3747, 'Ghulam Mohammed Sheikh'),
(377, 'Bill Gates', 3747, 'Ginetta Sagan'),
(378, 'Bill Gates', 3747, 'Ginsu'),
(379, 'Bill Gates', 3747, 'GitHub'),
(380, 'Bill Gates', 3747, 'Giving Pledge'),
(381, 'Bill Gates', 3747, 'Gokulotsavji Maharaj'),
(382, 'Bill Gates', 3747, 'Golden Rice'),
(383, 'Bill Gates', 3747, 'Goldilocks principle'),
(384, 'Bill Gates', 3747, 'Gordon Brown'),
(385, 'Bill Gates', 3747, 'Graeme Snooks'),
(386, 'Bill Gates', 3747, 'Grand Island Independent'),
(387, 'Bill Gates', 3747, 'GreenButton'),
(388, 'Bill Gates', 3747, 'Greg Abel'),
(389, 'Bill Gates', 3747, 'Greg Mortenson'),
(390, 'Bill Gates', 3747, 'Greg Nance'),
(391, 'Bill Gates', 3747, 'Groove Networks'),
(392, 'Bill Gates', 3747, 'Gunupati Venkata Krishna Reddy'),
(393, 'Bill Gates', 3747, 'H. Ross Perot'),
(394, 'Bill Gates', 3747, 'Hack (programmer subculture)'),
(395, 'Bill Gates', 3747, 'Hafeez Contractor'),
(396, 'Bill Gates', 3747, 'Haile Selassie'),
(397, 'Bill Gates', 3747, 'Hannibal Naives'),
(398, 'Bill Gates', 3747, 'Harish Salve'),
(399, 'Bill Gates', 3747, 'Harlow Curtice'),
(400, 'Bill Gates', 3747, 'Harry Belafonte'),
(401, 'Bill Gates', 3747, 'Harry Blackmun'),
(402, 'Bill Gates', 3747, 'Harry Connick, Jr.'),
(403, 'Bill Gates', 3747, 'Harry R. Lewis'),
(404, 'Bill Gates', 3747, 'Harry S. Truman'),
(405, 'Bill Gates', 3747, 'Harry Shum'),
(406, 'Bill Gates', 3747, 'Harvard College'),
(407, 'Bill Gates', 3747, 'Harvard John A. Paulson School of Engineering and Applied Sciences'),
(408, 'Bill Gates', 3747, 'Hassanal Bolkiah'),
(409, 'Bill Gates', 3747, 'Havok (company)'),
(410, 'Bill Gates', 3747, 'Hearts (card game)'),
(411, 'Bill Gates', 3747, 'Heisnam Kanhailal'),
(412, 'Bill Gates', 3747, 'Helen Hayes'),
(413, 'Bill Gates', 3747, 'Helmut Panke'),
(414, 'Bill Gates', 3747, 'Helzberg Diamonds'),
(415, 'Bill Gates', 3747, 'Hemendra Singh Panwar'),
(416, 'Bill Gates', 3747, 'Henry A. Kissinger'),
(417, 'Bill Gates', 3747, 'Henry Cisneros'),
(418, 'Bill Gates', 3747, 'Henry Kissinger'),
(419, 'Bill Gates', 3747, 'Hickory Daily Record'),
(420, 'Bill Gates', 3747, 'High Heat Major League Baseball'),
(421, 'Bill Gates', 3747, 'HistoryLink'),
(422, 'Bill Gates', 3747, 'History of Microsoft'),
(423, 'Bill Gates', 3747, 'HomeServices of America'),
(424, 'Bill Gates', 3747, 'Home computer'),
(425, 'Bill Gates', 3747, 'Homi K. Bhabha'),
(426, 'Bill Gates', 3747, 'Homo sapiens'),
(427, 'Bill Gates', 3747, 'Honeywell'),
(428, 'Bill Gates', 3747, 'Howard Graham Buffett'),
(429, 'Bill Gates', 3747, 'Howard H. Baker'),
(430, 'Bill Gates', 3747, 'Howard Jarvis'),
(431, 'Bill Gates', 3747, 'Howard Rusk'),
(432, 'Bill Gates', 3747, 'Hubert H. Humphrey'),
(433, 'Bill Gates', 3747, 'Hugh S. Johnson'),
(434, 'Bill Gates', 3747, 'Hukmdev Narayan Yadav'),
(435, 'Bill Gates', 3747, 'Hungarian Revolution of 1956'),
(436, 'Bill Gates', 3747, 'I. King Jordan'),
(437, 'Bill Gates', 3747, 'IBM'),
(438, 'Bill Gates', 3747, 'IBM PC'),
(439, 'Bill Gates', 3747, 'IGN'),
(440, 'Bill Gates', 3747, 'ILoo'),
(441, 'Bill Gates', 3747, 'Ice Bucket Challenge'),
(442, 'Bill Gates', 3747, 'Ilaiyaraaja'),
(443, 'Bill Gates', 3747, 'Independent Tribune'),
(444, 'Bill Gates', 3747, 'Indu Jain'),
(445, 'Bill Gates', 3747, 'InfoWorld'),
(446, 'Bill Gates', 3747, 'Information superhighway'),
(447, 'Bill Gates', 3747, 'Inn Din massacre'),
(448, 'Bill Gates', 3747, 'Integrated Authority File'),
(449, 'Bill Gates', 3747, 'Intel 8008'),
(450, 'Bill Gates', 3747, 'Intel 8080 CPU'),
(451, 'Bill Gates', 3747, 'International Metalworking Companies'),
(452, 'Bill Gates', 3747, 'International Rice Research Institute'),
(453, 'Bill Gates', 3747, 'International Standard Book Number'),
(454, 'Bill Gates', 3747, 'International Standard Name Identifier'),
(455, 'Bill Gates', 3747, 'International Standard Serial Number'),
(456, 'Bill Gates', 3747, 'Internet Explorer'),
(457, 'Bill Gates', 3747, 'Iraq War'),
(458, 'Bill Gates', 3747, 'Irish American'),
(459, 'Bill Gates', 3747, 'Irving Brown'),
(460, 'Bill Gates', 3747, 'Isidor Isaac Rabi'),
(461, 'Bill Gates', 3747, 'Ivan Hageman'),
(462, 'Bill Gates', 3747, 'J. Peter Grace'),
(463, 'Bill Gates', 3747, 'J. S. Verma'),
(464, 'Bill Gates', 3747, 'Jack Andraka'),
(465, 'Bill Gates', 3747, 'Jack Sock'),
(466, 'Bill Gates', 3747, 'Jagdish Chandra Kapur'),
(467, 'Bill Gates', 3747, 'Jahnu Barua'),
(468, 'Bill Gates', 3747, 'Jaime Escalante'),
(469, 'Bill Gates', 3747, 'Jamal Khashoggi'),
(470, 'Bill Gates', 3747, 'James A. Baker, III'),
(471, 'Bill Gates', 3747, 'James Brady'),
(472, 'Bill Gates', 3747, 'James E. Burke'),
(473, 'Bill Gates', 3747, 'James F. Byrnes'),
(474, 'Bill Gates', 3747, 'James Mattis'),
(475, 'Bill Gates', 3747, 'James Thrash'),
(476, 'Bill Gates', 3747, 'James Van Allen'),
(477, 'Bill Gates', 3747, 'James W. Rouse'),
(478, 'Bill Gates', 3747, 'Jan Scruggs'),
(479, 'Bill Gates', 3747, 'Jane Rosenthal'),
(480, 'Bill Gates', 3747, 'Jaspal Bhatti'),
(481, 'Bill Gates', 3747, 'Jatin Das (painter)'),
(482, 'Bill Gates', 3747, 'Jeff Bezos'),
(483, 'Bill Gates', 3747, 'Jeff Karstens'),
(484, 'Bill Gates', 3747, 'Jeff Saturday'),
(485, 'Bill Gates', 3747, 'Jeff Skoll'),
(486, 'Bill Gates', 3747, 'Jefferson Award for Public Service'),
(487, 'Bill Gates', 3747, 'Jefferson Awards for Public Service'),
(488, 'Bill Gates', 3747, 'Jeffrey Sachs'),
(489, 'Bill Gates', 3747, 'Jellyfish.com'),
(490, 'Bill Gates', 3747, 'Jennifer Staple'),
(491, 'Bill Gates', 3747, 'Jeremy Affeldt'),
(492, 'Bill Gates', 3747, 'Jerry Lewis'),
(493, 'Bill Gates', 3747, 'Jerry Pournelle'),
(494, 'Bill Gates', 3747, 'Jerry Reinsdorf'),
(495, 'Bill Gates', 3747, 'Jerry Seinfeld'),
(496, 'Bill Gates', 3747, 'Jesse Jackson'),
(497, 'Bill Gates', 3747, 'Jessica Singer');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wikiartikel`
--

CREATE TABLE `wikiartikel` (
  `PK` int(99) NOT NULL,
  `pageName` varchar(99) COLLATE latin1_bin NOT NULL,
  `pageID` int(99) NOT NULL,
  `pageViews` int(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Daten für Tabelle `wikiartikel`
--

INSERT INTO `wikiartikel` (`PK`, `pageName`, `pageID`, `pageViews`) VALUES
(14, 'Bill Gates', 3747, 22954468);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `reference`
--
ALTER TABLE `reference`
  ADD PRIMARY KEY (`PK`);

--
-- Indizes für die Tabelle `wikiartikel`
--
ALTER TABLE `wikiartikel`
  ADD PRIMARY KEY (`PK`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `reference`
--
ALTER TABLE `reference`
  MODIFY `PK` int(99) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=498;

--
-- AUTO_INCREMENT für Tabelle `wikiartikel`
--
ALTER TABLE `wikiartikel`
  MODIFY `PK` int(99) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
