-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 13 Décembre 2016 à 14:08
-- Version du serveur :  5.7.11
-- Version de PHP :  7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `videotheque`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`) VALUES
(1, 'Action', '2016-12-12 00:00:00'),
(2, 'Aventure', '2016-12-12 00:00:00'),
(3, 'Documentaire', '2016-12-12 00:00:00'),
(4, 'Musical', '2016-12-12 00:00:00'),
(5, 'Comédie', '2016-12-12 00:00:00'),
(6, 'Drame', '2016-12-12 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `categories_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `movies`
--

INSERT INTO `movies` (`id`, `title`, `description`, `image`, `created_at`, `categories_id`) VALUES
(1, 'Alliés', 'In 1942, an intelligence officer in North Africa encounters a female French Resistance fighter on a deadly mission behind enemy lines. When they reunite in London, their relationship is tested by the pressures of war.', 'http://t0.gstatic.com/images?q=tbn:ANd9GcSn_etAh22nK4xd5T5HBhzquEGK1MLs7pX8-sSuM8fQrFTOTy77', '2016-11-23 00:00:00', 1),
(2, 'Jack Reacher 2', 'Jack Reacher must uncover the truth behind a major government conspiracy in order to clear his name. On the run as a fugitive from the law, Reacher uncovers a potential secret from his past that could change his life forever.', 'http://t0.gstatic.com/images?q=tbn:ANd9GcQd2KOZ8CYCnbF_db0z-FnEIaCQISPmoL6nx97tMJzd2yRnc7k6', '2016-10-19 00:00:00', 1),
(3, 'Sully', 'Sully est un film biographique américain coproduit et réalisé par Clint Eastwood, sorti en 2016. Le film revient sur les événements liés au vol 1549 US Airways en janvier 2009.\r\nDescription fournie par', 'http://fr.web.img5.acsta.net/pictures/16/06/30/09/12/232341.jpg', '2016-12-12 14:53:54', 6),
(5, 'The Mask', 'The Mask est un film américain réalisé par Chuck Russell, sorti en 1994. Le film s\'inspire d\'une série de comics publiée par Dark Horse Comics. Une série d\'animation a été réalisée à partir du film et diffusée de 1995 à 1997', 'http://www.gstatic.com/tv/thumb/movieposters/15854/p15854_p_v8_ag.jpg', '2016-12-12 15:49:32', 5),
(6, 'Pirates des Caraïbes', 'Jack Sparrow and Barbossa embark on a quest to find the elusive fountain of youth, only to discover that Blackbeard and his daughter are after it too', 'http://fr.web.img3.acsta.net/medias/nmedia/18/79/98/60/19713505.jpg', '2016-12-12 15:51:51', 2),
(7, 'high school musical 3', 'High School Musical 3 : Nos années lycée, ou High School Musical 3 : La Dernière Année au Québec est un film américain de Kenny Ortega sorti en 2008 et qui est le troisième volet de la trilogie High School Musical', 'http://www.gstatic.com/tv/thumb/movieposters/177471/p177471_p_v8_aa.jpg', '2016-12-12 15:57:52', 4),
(8, 'Demain', 'Demain est un film documentaire français réalisé par Cyril Dion et Mélanie Laurent, sorti en 2015. Devant un futur que les scientifiques annoncent préoccupant, le film a la particularité de ne pas donner dans le catastrophisme', 'http://t1.gstatic.com/images?q=tbn:ANd9GcRSckZrqLaaXx4DNByOGky8dAl8Ab19HnzTKfuiSMXF2jCJFP2w', '2016-12-12 15:59:36', 3),
(9, 'Edge of Tomorrow', 'A soldier fighting aliens gets to relive the same day over and over again, the day restarting every time he dies.', 'http://fr.web.img3.acsta.net/medias/nmedia/18/35/47/65/18396799.jpg', '2016-12-12 16:03:51', 2),
(11, 'Premier Contact', 'Premier Contact ou L\'Arrivée au Québec est un film américain réalisé par Denis Villeneuve, sorti en 2016. Le scénario, écrit par Eric Heisserern, est adapté d\'une nouvelle de Ted Chiang, L\'Histoire de ta vie', 'http://t2.gstatic.com/images?q=tbn:ANd9GcT4y1ixNvKZ9zbsjceEFDgU7Q8iRPnK8LYW5NfJ-VR2BqKS6sZC', '2016-12-12 17:33:09', 6),
(12, 'Insaisissables 2', 'Un an après avoir déjoué le FBI et conquis le public avec leurs tours de magie à la Robin des Bois, les 4 Cavaliers refont surface avec une performance grâce à laquelle ils espèrent exposer au grand jour les pratiques malhonnêtes d\'un magnat de la technologie. © 2016 Lionsgate', 'http://t3.gstatic.com/images?q=tbn:ANd9GcQAvsJTRTalrl1eKPRtOpRfKlAp8jXM2R3dxToPrug0BdGh60rR', '2016-07-27 00:00:00', 1),
(13, 'Inferno (2016)', 'Inferno est un thriller américain réalisé par Ron Howard, sorti en 2016. Adapté du roman du même nom de l\'Américain Dan Brown, il compose le troisième volet de la franchise cinématographique de Robert Langdon.', 'http://t3.gstatic.com/images?q=tbn:ANd9GcS7meU42Nyc94khfxiyB1gUPfSz97DltqILKMqFbZO0AAVEvDK3', '2016-11-30 00:00:00', 1),
(14, 'Les animaux fantastiques', 'Les Animaux fantastiques est un film fantastique américano-britannique réalisé par David Yates, sorti en 2016. Il s\'agit d\'une série dérivée de la saga Harry Potter qui sera suivie par quatre autres films. J. K', 'http://t0.gstatic.com/images?q=tbn:ANd9GcQY_nyTKQBto6GbLW5kxDTVnh9eI_e3bp6nayGNnxUt4CHqchlf', '2016-11-16 00:00:00', 2),
(17, 'Papa ou maman 2', 'Papa ou Maman 2 est une comédie française réalisée par Martin Bourboulon, sortie en 2016. Il s\'agit de la suite de Papa ou Maman, sorti en 2015', 'http://t2.gstatic.com/images?q=tbn:ANd9GcQRRYF8YgRc6Mfp3dOsdpvGVobawr0cDV9H3UzeUQuYCdeKpyno', '2016-12-07 00:00:00', 5),
(18, 'Sausage Party', 'Sausage Party, ou Party de saucisses au Québec, est un film d\'animation américain réalisé par Conrad Vernon et Greg Tiernan, sorti en 2016. Le film fait polémique en France à cause de son contenu sexuellement explicite', 'http://t0.gstatic.com/images?q=tbn:ANd9GcSpbBTxHG6X59tPV520ZzmkWVt4wyMfeJOjbllri-DKTG-RwDNR', '2016-09-14 00:00:00', 2);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C61EED30A21214B7` (`categories_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `FK_C61EED30A21214B7` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
