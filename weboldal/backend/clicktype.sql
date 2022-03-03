-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Már 03. 12:01
-- Kiszolgáló verziója: 10.4.22-MariaDB
-- PHP verzió: 8.1.1

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
(22, 'admin@admin.com', 'admin', 0, 'c57f22380409cf634863c0bc7283df2125ea8e9d', 1);

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
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
