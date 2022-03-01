-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Már 01. 09:12
-- Kiszolgáló verziója: 10.4.6-MariaDB
-- PHP verzió: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `clicktype`
--

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
  `jelszo` text COLLATE utf8_hungarian_ci NOT NULL,
  `jogosultsag` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

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
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `topik`
--
ALTER TABLE `topik`
  ADD CONSTRAINT `topik_ibfk_1` FOREIGN KEY (`id`) REFERENCES `topikok` (`topikaz`),
  ADD CONSTRAINT `topik_ibfk_2` FOREIGN KEY (`topikaz`) REFERENCES `forumok` (`id`);

--
-- Megkötések a táblához `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `topikok` (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
