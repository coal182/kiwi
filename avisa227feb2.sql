-- phpMyAdmin SQL Dump
-- version 3.3.2deb1ubuntu1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 27-02-2012 a las 20:02:18
-- Versión del servidor: 5.1.41
-- Versión de PHP: 5.3.2-1ubuntu4.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `avisa2`
--
CREATE DATABASE `avisa2` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `avisa2`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `idcomment` int(11) NOT NULL AUTO_INCREMENT,
  `content` mediumtext COLLATE utf8_spanish_ci NOT NULL,
  `identry` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `created` date NOT NULL,
  PRIMARY KEY (`idcomment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `comment`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entry`
--

CREATE TABLE IF NOT EXISTS `entry` (
  `identry` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_spanish_ci NOT NULL,
  `content` longtext COLLATE utf8_spanish_ci NOT NULL,
  `created` datetime NOT NULL,
  `iduser` int(11) NOT NULL,
  PRIMARY KEY (`identry`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=25 ;

--
-- Volcar la base de datos para la tabla `entry`
--

INSERT INTO `entry` (`identry`, `title`, `content`, `created`, `iduser`) VALUES
(1, 'Avisa2 se renueva', '<h2>Avisa2 se renueva</h2>\r\n<p>Hemos migrado avisa2 a un servidor con JSP y mysql diseñado por el principal autor, Cristian Martín.</p>', '2012-02-14 00:00:00', 1),
(18, 'Colmenarejo Biker MOD', '<p>Bicis Colmenarejo <span style="font-size: medium;">MODI</span></p>', '2012-02-16 10:30:26', 1),
(19, 'Redecost Orientadores', '<h1><img style="display: block; margin-left: auto; margin-right: auto;" src="http://redecost.com/images/logo.png" alt="" width="155" height="131" /></h1>\r\n<h1>Redecost Orientadores&nbsp;</h1>\r\n<p><br /> Redecost es una empresa dedicada a la <strong>RE</strong>ducci&oacute;n <strong>DE</strong> <strong>COST</strong>es y gastos de las comunidades y empresas. <br /> Fue fundada en 2012 gracias a la ayuda del CADE de Benalm&aacute;dena a la que estamos muy agradecido, est&aacute; situada en Benalm&aacute;dena y la forman tres socios, Gonzalo David Fern&aacute;ndez Moreno principal creador de la empresa junto a Joaqu&iacute;n Rodr&iacute;guez Reyes art&iacute;fice de la idea y por ultimo a Mario Podadera Berm&uacute;dez, sin su apoyo esto no podr&iacute;a haberse llevado a cabo.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="http://redecost.com/images/ahorrar-jardines.jpg" alt="" width="200" height="150" /></p>\r\n<h3>QUE HACEMOS</h3>\r\n<p>Mes a mes velamos por que tenga contratada la mejor opci&oacute;n para su comunidad. Nos encargamos de negociar el mejor contrato para sus servicios, de manera que solo pague lo que necesita y al mejor precio, ahorrando mucho esfuerzo, dinero y preocupaciones innecesarias</p>\r\n<h3>COMO LO HACEMOS</h3>\r\n<p>Nuestra forma de trabajar es darle comodidad, rapidez y eficacia gracias a la gran cantidad de empresas con la que contamos y a nuestra total disponibilidad para ver en situ cualquier problema que pueda surgir en una comunidad o empresa.</p>\r\n<h3>CUANTO CUESTA</h3>\r\n<p>En el momento en que se pueden determinar los ahorros a obtener, los honorarios se calculan proporcionalmente sobre la cantidad de los ahorros conseguidos, por lo que nuestros honorarios se autofinancian, nuestra filosof&iacute;a es muy sencilla si no hay ahorro , no cobramos.<br /> <br /> <br /> Ser nombrado presidente es una carga para cualquier propietario. Te ayudamos a ejercer tu funci&oacute;n de una manera mas facil . <br /> - Te ahorramos tiempo<br /> - Te asesoramos.<br /> - Te conseguimos resultados<br /> La mayor&iacute;a de los propietarios percibe la comunidad como algo complejo y problem&aacute;tico.<br /> - Te sacamos el m&aacute;ximo partido a los presupuestos de tu comunidad.<br /> - Te mantenemos informado de lo que esta ocurriendo en tu comunidad.<br /> - Estamos cerca de ti visitando la Comunidad cada 15 d&iacute;as .</p>\r\n<div style="text-align: center;"><a href="http://redecost.com/" target="_blank">http://redecost.com</a></div>', '2012-02-16 10:43:27', 1),
(5, 'Articulo4', '<p>This is some example text that you can edit inside the <strong>TinyMCE editor</strong>.</p>\r\n<p>Nam nisi elit, cursus in rhoncus sit amet, pulvinar laoreet leo. Nam sed lectus quam, ut sagittis tellus. Quisque dignissim mauris a augue rutrum tempor. Donec vitae purus nec massa vestibulum ornare sit amet id tellus. Nunc quam mauris, fermentum nec lacinia eget, sollicitudin nec ante. Aliquam molestie volutpat dapibus. Nunc interdum viverra sodales. Morbi laoreet pulvinar gravida. Quisque ut turpis sagittis nunc accumsan vehicula. Duis elementum congue ultrices. Cras faucibus feugiat arcu quis lacinia. In hac habitasse platea dictumst. Pellentesque fermentum magna sit amet tellus varius ullamcorper. Vestibulum at urna augue, eget varius neque. Fusce facilisis venenatis dapibus. Integer non sem at arcu euismod tempor nec sed nisl. Morbi ultricies, mauris ut ultricies adipiscing, felis odio condimentum massa, et luctus est nunc nec eros.</p>', '2012-02-15 00:00:00', 1),
(6, 'Hola Caracola!!!!', '<p><strong><span style="font-size: large;">Noveeeeee</span></strong> que wapooo</p>\r\n<p><img title="Redecost" src="http://redecost.com/images/logo.png" alt="" width="100" height="85" /></p>', '2012-02-15 00:00:00', 1),
(8, 'TABLA', '<p>OTRA MAAAS</p>\r\n<table border="0">\r\n<tbody>\r\n<tr>\r\n<td>a</td>\r\n<td>&nbsp;</td>\r\n<td>a</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>a</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>a</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>a</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>a</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>a</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>a</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>a</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>a</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>a</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>', '2012-02-15 00:00:00', 1),
(20, 'Debian y Toy Story2', '<p>efwefwe2</p>', '2012-02-22 13:51:25', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `module`
--

CREATE TABLE IF NOT EXISTS `module` (
  `idmodule` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_spanish_ci NOT NULL,
  `description` text COLLATE utf8_spanish_ci NOT NULL,
  `code` text COLLATE utf8_spanish_ci NOT NULL,
  `position` text COLLATE utf8_spanish_ci NOT NULL,
  `activity` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`idmodule`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `module`
--

INSERT INTO `module` (`idmodule`, `name`, `description`, `code`, `position`, `activity`, `order`) VALUES
(1, 'I like', 'I like of Facebook', '<div style="text-align:center;margin-left:45px;margin-bottom:-35px;margin-top:-10px;width:30px">\r\n<iframe src="//www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.facebook.com%2Fpages%2FAvisa2-Inform%25C3%25A1tica-y-Videojuegos%2F298375076850444&amp;send=false&amp;layout=box_count&amp;width=80&amp;show_faces=true&amp;action=like&amp;colorscheme=light&amp;font&amp;height=90" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:80px; height:90px;" allowtransparency="true"></iframe>\r\n</div>', 'left', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_spanish_ci NOT NULL,
  `usertype` text COLLATE utf8_spanish_ci NOT NULL,
  `password` text COLLATE utf8_spanish_ci NOT NULL,
  `alias` text COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `user`
--

INSERT INTO `user` (`iduser`, `name`, `usertype`, `password`, `alias`) VALUES
(1, 'Cristian Martín', 'Admin', 'CR060391', 'coal182'),
(2, 'Adrián', 'Author', '123456', 'adrian'),
(3, 'Jose Luis', 'Author', '123456', 'pepe');
