-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Ápr 29. 22:41
-- Kiszolgáló verziója: 10.4.22-MariaDB
-- PHP verzió: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `clicktype`
--
CREATE DATABASE IF NOT EXISTS `clicktype` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `clicktype`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `forumok`
--

CREATE TABLE `forumok` (
  `id` int(11) NOT NULL,
  `forumcim` varchar(150) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `topik`
--

CREATE TABLE `topik` (
  `id` int(11) NOT NULL,
  `temak` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `topikaz` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `topikok`
--

CREATE TABLE `topikok` (
  `id` int(11) NOT NULL,
  `userid` int(150) NOT NULL,
  `szoveg` text COLLATE utf8_hungarian_ci NOT NULL,
  `topikaz` int(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `Id` int(10) NOT NULL,
  `Email` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `Nev` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `ido` int(100) DEFAULT NULL,
  `jelszo` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `jogosultsag` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`Id`, `Email`, `Nev`, `ido`, `jelszo`, `jogosultsag`) VALUES
(22, 'admin@admin.com', 'admin', 1, 'c57f22380409cf634863c0bc7283df2125ea8e9d', 1),
(23, 'asfasdf@asdfs.hu', 'ísdfsdg', 1, '2eb0ee36be44f6f3df2bcd782766176e50fc3fc3', 1),
(24, 'asd@asd.hu', 'asd', 90, '86f7e437faa5a7fce15d1ddcb9eaeaea377667b8', 2),
(25, 'tincidunt.nunc.ac@aol.ca', 'Murphy Knight', 52629, 'sodales', 2),
(26, 'sem.consequat@aol.org', 'Tad Bullock', 88109, 'pellentesque', 1),
(27, 'bibendum@protonmail.ca', 'Maggie Scott', 34265, 'Cras', 2),
(28, 'tristique.pellentesque@aol.net', 'Lucius Moody', 2989, 'magnis', 1),
(29, 'tellus.phasellus@yahoo.ca', 'Abbot Hill', 86463, 'auctor', 1),
(30, 'vehicula@icloud.com', 'Ronan Boyle', 57280, 'condimentum.', 2),
(31, 'nulla.ante@hotmail.net', 'Thomas Cruz', 89858, 'magna', 1),
(32, 'pellentesque.ultricies@yahoo.couk', 'Lance Baldwin', 39448, 'eget', 2),
(33, 'ligula.consectetuer.rhoncus@icloud.org', 'Keefe Velez', 63393, 'est.', 1),
(34, 'rutrum.eu.ultrices@hotmail.net', 'Gil Walters', 11703, 'est', 2),
(35, 'aliquet.nec.imperdiet@hotmail.couk', 'Walter Humphrey', 25098, 'nulla', 2),
(36, 'accumsan.convallis@aol.ca', 'Jaquelyn Stephenson', 93502, 'at,', 1),
(37, 'arcu.curabitur@icloud.ca', 'Marshall Lawson', 13024, 'porttitor', 2),
(38, 'faucibus.orci@protonmail.org', 'Pascale Bruce', 851, 'Sed', 1),
(39, 'phasellus@aol.couk', 'Stella Aguirre', 95932, 'aliquam,', 1),
(40, 'nonummy.ut@hotmail.edu', 'Eliana Mcfarland', 92421, 'ut,', 1),
(41, 'leo@protonmail.org', 'Lucius Meyer', 39319, 'orci,', 2),
(42, 'magna.et.ipsum@protonmail.net', 'Oprah Benton', 39499, 'ligula.', 1),
(43, 'arcu.vel@aol.ca', 'Rashad Robbins', 72497, 'Cras', 2),
(44, 'nibh.quisque@yahoo.com', 'Ariel Dudley', 33708, 'fermentum', 1),
(45, 'a.tortor.nunc@google.com', 'Aidan Richardson', 95676, 'vel', 1),
(46, 'amet.lorem@hotmail.com', 'Cathleen Hill', 72435, 'mus.', 1),
(47, 'luctus@protonmail.org', 'Emily Phillips', 47129, 'fermentum', 2),
(48, 'lacus.mauris.non@google.edu', 'Sade Sosa', 14043, 'Vestibulum', 1),
(49, 'sed.id@yahoo.ca', 'Venus Rosario', 92227, 'elit', 1),
(50, 'scelerisque.mollis@hotmail.org', 'Kellie Figueroa', 79641, 'rhoncus', 2),
(51, 'fringilla.est.mauris@google.net', 'Robert Key', 22296, 'parturient', 2),
(52, 'sed@protonmail.org', 'Angelica Olson', 77984, 'lorem', 1),
(53, 'euismod.et@outlook.org', 'Alfonso Chase', 19235, 'Fusce', 2),
(54, 'ac@icloud.net', 'Aristotle Reeves', 56017, 'tempus', 2),
(55, 'ultricies.adipiscing.enim@icloud.ca', 'Callie Livingston', 6118, 'et', 2),
(56, 'proin.dolor@aol.couk', 'Aileen Bentley', 64238, 'Fusce', 2),
(57, 'blandit@hotmail.net', 'Hyatt Compton', 18370, 'aliquet,', 2),
(58, 'felis@google.net', 'Halla Randall', 22012, 'lorem,', 1),
(59, 'proin@google.edu', 'Gray Wiggins', 82915, 'erat.', 1),
(60, 'nisi.magna@icloud.org', 'Ryan Jacobs', 59746, 'nunc,', 1),
(61, 'quis.arcu.vel@hotmail.ca', 'Ian Hahn', 88345, 'Mauris', 2),
(62, 'pede.praesent@outlook.org', 'Ray Walker', 10432, 'sed', 1),
(63, 'lorem.auctor.quis@outlook.org', 'Thaddeus Mueller', 98682, 'erat', 2);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `forumok`
--
ALTER TABLE `forumok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `topik`
--
ALTER TABLE `topik`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topikaz` (`topikaz`);

--
-- A tábla indexei `topikok`
--
ALTER TABLE `topikok`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`userid`),
  ADD KEY `forumaz` (`topikaz`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Email` (`Email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `forumok`
--
ALTER TABLE `forumok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `topik`
--
ALTER TABLE `topik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `topikok`
--
ALTER TABLE `topikok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `forumok`
--
ALTER TABLE `forumok`
  ADD CONSTRAINT `forumok_ibfk_1` FOREIGN KEY (`id`) REFERENCES `topik` (`topikaz`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `topik`
--
ALTER TABLE `topik`
  ADD CONSTRAINT `topik_ibfk_3` FOREIGN KEY (`id`) REFERENCES `topikok` (`topikaz`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `topikok`
--
ALTER TABLE `topikok`
  ADD CONSTRAINT `topikok_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
