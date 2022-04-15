-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Erstellungszeit: 15. Apr 2022 um 16:21
-- Server-Version: 5.7.34
-- PHP-Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `demo`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `blogpost`
--

CREATE TABLE `blogpost` (
  `postID` int(11) NOT NULL,
  `post_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_author` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `blogpost`
--

INSERT INTO `blogpost` (`postID`, `post_text`, `post_author`) VALUES
(1, 'Some Text of user 1', 1),
(2, 'Some Text of User 2', 2),
(3, 'This is another blogpost of user 2', 2),
(4, 'This is another blogpost of user 1', 1),
(5, 'Post of user 1', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`) VALUES
(1, 'Max', 'Muster', 'max@muster.com', '$2y$04$rXbI3Yipp2T3WccaAq92HOOxyMk.zRtfFHD2n2vKQScia1QJPgChu'),
(2, 'Jane', 'Doe', 'jane@doe.ch', '$2y$10$YIAABijQXhvxCTBPykhFHu0sXMw25Cp/zA3sbQ8w2rcccr7MM2Kyu');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `blogpost`
--
ALTER TABLE `blogpost`
  ADD PRIMARY KEY (`postID`),
  ADD KEY `post_author` (`post_author`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `blogpost`
--
ALTER TABLE `blogpost`
  MODIFY `postID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `blogpost`
--
ALTER TABLE `blogpost`
  ADD CONSTRAINT `blogpost_ibfk_1` FOREIGN KEY (`post_author`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
