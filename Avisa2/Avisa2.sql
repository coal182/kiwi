-- phpMyAdmin SQL Dump
-- version 3.3.7deb5build0.10.10.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 14-02-2012 a las 14:28:43
-- Versión del servidor: 5.1.49
-- Versión de PHP: 5.3.3-1ubuntu9.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `avisa2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entry`
--

CREATE TABLE IF NOT EXISTS `entry` (
  `identry` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_spanish_ci NOT NULL,
  `content` longtext COLLATE utf8_spanish_ci NOT NULL,
  `created` date NOT NULL,
  `iduser` int(11) NOT NULL,
  PRIMARY KEY (`identry`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `entry`
--

INSERT INTO `entry` (`identry`, `title`, `content`, `created`, `iduser`) VALUES
(1, 'Avisa2 se renueva', '<h2>Avisa2 se renueva</h2>\r\n<p>Hemos migrado avisa2 a un servidor con JSP y mysql diseñado por el principal autor, Cristian Martín.</p>', '2012-02-14', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `alias` text COLLATE utf8_spanish_ci NOT NULL,
  `name` text COLLATE utf8_spanish_ci NOT NULL,
  `usertype` text COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `user`
--

INSERT INTO `user` (`iduser`, `alias`, `name`, `usertype`) VALUES
(1, 'coal182', 'Cristian Martín', 'admin');
