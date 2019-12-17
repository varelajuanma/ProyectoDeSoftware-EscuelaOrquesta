-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-12-2019 a las 01:27:31
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia_estudiante_taller`
--

CREATE TABLE `asistencia_estudiante_taller` (
  `id` int(11) NOT NULL,
  `estudiante_id` int(11) NOT NULL,
  `ciclo_lectivo_id` int(11) NOT NULL,
  `taller_id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barrio`
--

CREATE TABLE `barrio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `barrio`
--

INSERT INTO `barrio` (`id`, `nombre`) VALUES
(1, 'Barrio Náutico'),
(2, 'Barrio Obrero'),
(3, 'Berisso'),
(4, 'Barrio Solidaridad'),
(5, 'Barrio Obrero'),
(6, 'Barrio Bco. Pcia.'),
(7, 'Barrio J.B. Justo'),
(8, 'Barrio Obrero'),
(9, 'El Carmen'),
(10, 'El Labrador'),
(11, 'Ensenada'),
(12, 'La Hermosura'),
(13, 'La PLata'),
(14, 'Los Talas'),
(15, 'Ringuelet'),
(16, 'Tolosa'),
(17, 'Villa Alba'),
(18, 'Villa Arguello'),
(19, 'Villa B. C'),
(20, 'Villa Elvira'),
(21, 'Villa Nueva'),
(22, 'Villa Paula'),
(23, 'Villa Progreso'),
(24, 'Villa San Carlos'),
(25, 'Villa Zula');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciclo_lectivo`
--

CREATE TABLE `ciclo_lectivo` (
  `id` int(11) NOT NULL,
  `fecha_ini` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `semestre` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ciclo_lectivo`
--

INSERT INTO `ciclo_lectivo` (`id`, `fecha_ini`, `fecha_fin`, `semestre`) VALUES
(3, '1999-10-28', '2000-10-10', 1),
(6, '2020-08-01', '2020-12-30', 2),
(9, '2019-11-30', '2019-12-12', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciclo_lectivo_taller`
--

CREATE TABLE `ciclo_lectivo_taller` (
  `taller_id` int(11) NOT NULL,
  `ciclo_lectivo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ciclo_lectivo_taller`
--

INSERT INTO `ciclo_lectivo_taller` (`taller_id`, `ciclo_lectivo_id`) VALUES
(1, 6),
(2, 3),
(2, 6),
(3, 3),
(7, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(6000) COLLATE utf8_bin NOT NULL,
  `mailcontacto` varchar(255) COLLATE utf8_bin NOT NULL,
  `paginacion` int(255) NOT NULL,
  `habilitacion` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `titulo`, `descripcion`, `mailcontacto`, `paginacion`, `habilitacion`) VALUES
(1, 'Orquesta Escuela de Berisso', 'La Orquesta Escuela de Berisso comenzó a funcionar en septiembre del 2005 en el barrio de El Carmen de la localidad de Berisso bajo la dirección del Mtro. Juan Carlos Herrero, orientada especialmente a la atención de chicos en situación de vulnerabilidad socio-cultural. Desde sus 20 alumnos iniciales fue creciendo hasta atender actualmente una matrícula de aproximadamente 530 chicos, distribuidos en los 15 núcleos que la conforman y dirigida a una franja etaria de 5 a 23 años, cubriendo en su accionar a la casi totalidad de los barrios de Berisso más los espacios cedidos por el Club Español y el Teatro Argentino En 2012 marcó la apertura de sesión en la Honorable Cámara de Diputados de la Nación durante el tratamiento de la Ley para la recuperación de YPF, realizando la grabación del Himno Nacional Argentino en el mismo lugar. Sus alumnos se han presentado en escenarios de la categoría del Salón Dorado de la Municipalidad de La Plata, las Catedrales de La Plata y Buenos Aires , Senado de la Provincia, el Coliseo Podestá, el Teatro Argentino, Centro Cultural Néstor Kirchner y el Luna Park en nuestro país; en el exterior han participado en forma grupal e individual en experiencias musicales realizadas en Venezuela, Francia, EEUU y Brasil. A partir de su formación, alumnos de la Orquesta Escuela pudieron acceder a estudios universitarios en la Facultad de Bellas Artes de La Plata y la Universidad de Lanús. Sus alumnos de nivel superior cumplen tareas docentes como agentes multiplicadores dentro de su misma estructura, además de lograr la inserción en los circuitos semiprofesionales de trabajo ocupando cargos en la Orquesta Municipal de Tango de Berisso, la Orquesta Sinfónica Municipal de Berisso a los que se sumaron posteriormente desempeños en la Camerata Académica del Teatro Argentino. Es responsable también de la formación musical de la primer alumna del Sistema de Orquestas en ingresar por concurso a la Orquesta Estable del Teatro Argentino. Asimismo en la actualidad ofrece una capacitación única en el país en Música de Cámara a cargo del Mtro. José Bondar. En 2015, enmarcado en el festejo por sus 10 años, brindó una serie de conciertos entre los que se incluyó la invitación del Teatro Argentino para formar parte del Ciclo de la Sala A. Piazzolla, una presentación en el CCK de Bs. As, un concierto en el Teatro Mitre de San Salvador de Jujuy para presentarse junto al Sistema de Orquestas Juveniles de Jujuy bajo la dirección del Mtro. Sergio Jurado y el estreno de la Misa Mestiza, escrita en honor de SS el papa Francisco, junto al Vocal de Cámara Platense, el coro de Cámara de la facultad de Bellas Artes y el Ensamble de Percusión de Pehuajó, con la dirección del Mtro. Fernando Tomé. Sus formaciones se han presentado bajo la dirección de los Mtros Ruben Cabanes, José Bondar, Sergio Jurado y Mario Benzecry, entre otros. Fue distinguida en su labor educativa por la Fundación Florencio Pérez, con el Premio Daniel Román de la Dirección de Cultura de Berisso ; en 2014 la Federación de Entidades de Bien Público de Berisso hizo entrega de una distinción por Servicio Comunitario y en 2015 nuevamente con el Premio de Cultura Daniel Román por su Camerata.', 'berisso@berisso.gob.ar', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nac` date NOT NULL,
  `localidad_id` int(11) NOT NULL,
  `domicilio` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `genero_id` int(11) NOT NULL,
  `tipo_doc_id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `tel` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`id`, `nombre`, `apellido`, `fecha_nac`, `localidad_id`, `domicilio`, `genero_id`, `tipo_doc_id`, `numero`, `tel`) VALUES
(1, 'Federico', 'Guzman', '2009-11-04', 12, 'calle falsa 123', 1, 1, 12345, '234324'),
(3, 'Luis', 'Suarez', '1987-10-01', 1, '1 y 530', 1, 1, 123, '111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente_responsable_taller`
--

CREATE TABLE `docente_responsable_taller` (
  `docente_id` int(11) NOT NULL,
  `ciclo_lectivo_id` int(11) NOT NULL,
  `taller_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `docente_responsable_taller`
--

INSERT INTO `docente_responsable_taller` (`docente_id`, `ciclo_lectivo_id`, `taller_id`) VALUES
(1, 3, 2),
(1, 3, 3),
(1, 6, 1),
(3, 3, 3),
(3, 6, 1),
(3, 6, 2),
(3, 9, 7),
(17, 3, 1),
(17, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuela`
--

CREATE TABLE `escuela` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `escuela`
--

INSERT INTO `escuela` (`id`, `nombre`, `direccion`, `telefono`) VALUES
(1, '502', NULL, NULL),
(2, 'Albert Thomas', NULL, NULL),
(3, 'Anexa', NULL, NULL),
(4, 'Anexo T. Speroni', NULL, NULL),
(5, 'Basiliana', NULL, NULL),
(6, 'Basiliano', NULL, NULL),
(7, 'Bellas Artes', NULL, NULL),
(8, 'Canossiano', NULL, NULL),
(9, 'Castañeda', NULL, NULL),
(10, 'Col. Nacional', NULL, NULL),
(11, 'Conquista Cristiana', NULL, NULL),
(12, 'Dardo Rocha N° 24', NULL, NULL),
(13, 'E.E.M.N° 2', NULL, NULL),
(14, 'E.M. N°26', NULL, NULL),
(15, 'E.P. Municipal N° 2', NULL, NULL),
(16, 'EE N° 2', NULL, NULL),
(17, 'EEE N° 501', NULL, NULL),
(18, 'EEE N°501', NULL, NULL),
(19, 'EEM N° 1', NULL, NULL),
(20, 'EEM N° 26 L.P', NULL, NULL),
(21, 'EEM N°128', NULL, NULL),
(22, 'EEM N°2', NULL, NULL),
(23, 'EES N° 10', NULL, NULL),
(24, 'EES N° 14', NULL, NULL),
(25, 'EES N° 4', NULL, NULL),
(26, 'EES N° 4 Berisso', NULL, NULL),
(27, 'EES N° 4 El Pino', NULL, NULL),
(28, 'EEST N° 1 bsso', NULL, NULL),
(29, 'EET Nº 1', NULL, NULL),
(30, 'EET Nº1', NULL, NULL),
(31, 'EGB N°25', NULL, NULL),
(32, 'EM N° 2', NULL, NULL),
(33, 'EMM N° 3', NULL, NULL),
(34, 'EP N° 1 L.P-', NULL, NULL),
(35, 'EP N° 11', NULL, NULL),
(36, 'EP N° 129', NULL, NULL),
(37, 'EP N° 14', NULL, NULL),
(38, 'EP N° 15', NULL, NULL),
(39, 'EP N° 17', NULL, NULL),
(40, 'EP N° 18', NULL, NULL),
(41, 'EP N° 19', NULL, NULL),
(42, 'EP N° 2', NULL, NULL),
(43, 'EP N° 20', NULL, NULL),
(44, 'EP N° 22', NULL, NULL),
(45, 'EP N° 25', NULL, NULL),
(46, 'EP N° 27', NULL, NULL),
(47, 'EP N° 3', NULL, NULL),
(48, 'EP N° 37 LP', NULL, NULL),
(49, 'EP N° 43', NULL, NULL),
(50, 'EP N° 45', NULL, NULL),
(51, 'EP N° 5', NULL, NULL),
(52, 'EP N° 6', NULL, NULL),
(53, 'EP N° 65 La Plata', NULL, NULL),
(54, 'EP N° 7', NULL, NULL),
(55, 'EPB N° 10', NULL, NULL),
(56, 'EPB N° 14', NULL, NULL),
(57, 'EPB N° 15', NULL, NULL),
(58, 'EPB N° 19', NULL, NULL),
(59, 'EPB N° 2', NULL, NULL),
(60, 'EPB N° 20', NULL, NULL),
(61, 'EPB N° 24', NULL, NULL),
(62, 'EPB N° 25', NULL, NULL),
(63, 'EPB N° 45', NULL, NULL),
(64, 'EPB N° 5', NULL, NULL),
(65, 'EPB N° 55', NULL, NULL),
(66, 'EPB N° 6', NULL, NULL),
(67, 'EPB N° 65', NULL, NULL),
(68, 'EPB N° 8', NULL, NULL),
(69, 'ESB N° 10', NULL, NULL),
(70, 'ESB N° 11', NULL, NULL),
(71, 'ESB N° 14', NULL, NULL),
(72, 'ESB N° 3', NULL, NULL),
(73, 'ESB N° 61', NULL, NULL),
(74, 'ESB N° 66', NULL, NULL),
(75, 'ESB N° 8', NULL, NULL),
(76, 'ESB N° 9', NULL, NULL),
(77, 'ESC N° 10', NULL, NULL),
(78, 'ESC N° 13', NULL, NULL),
(79, 'ESC N° 19', NULL, NULL),
(80, 'ESC N° 2', NULL, NULL),
(81, 'ESC N° 20', NULL, NULL),
(82, 'ESC N° 22', NULL, NULL),
(83, 'ESC N° 23', NULL, NULL),
(84, 'ESC N° 24', NULL, NULL),
(85, 'ESC N° 25', NULL, NULL),
(86, 'ESC N° 27', NULL, NULL),
(87, 'ESC N° 3', NULL, NULL),
(88, 'ESC N° 43', NULL, NULL),
(89, 'ESC N° 45', NULL, NULL),
(90, 'ESC N° 5', NULL, NULL),
(91, 'ESC N° 501', NULL, NULL),
(92, 'ESC N° 6', NULL, NULL),
(93, 'ESC N° 66', NULL, NULL),
(94, 'ESC N° 7', NULL, NULL),
(95, 'ESC N° 8', NULL, NULL),
(96, 'ESC N°11', NULL, NULL),
(97, 'ESC N°17', NULL, NULL),
(98, 'ESC N°19', NULL, NULL),
(99, 'ESC N°3', NULL, NULL),
(100, 'ESC N°7', NULL, NULL),
(101, 'ESC de Arte', NULL, NULL),
(102, 'ESS N° 4', NULL, NULL),
(103, 'Enseñanza Media', NULL, NULL),
(104, 'Especial N° 502', NULL, NULL),
(105, 'Estrada', NULL, NULL),
(106, 'FACULTAD', NULL, NULL),
(107, 'INDUSTRIAL', NULL, NULL),
(108, 'Italiana', NULL, NULL),
(109, 'J 904', NULL, NULL),
(110, 'J. Manuel Strada', NULL, NULL),
(111, 'Jacarandá', NULL, NULL),
(112, 'Jardín Euforion', NULL, NULL),
(113, 'Jardín N° 903', NULL, NULL),
(114, 'Jardín N° 907', NULL, NULL),
(115, 'JoaquinV.Gonzalez', NULL, NULL),
(116, 'Lola Mora sec', NULL, NULL),
(117, 'Lujan Sierra', NULL, NULL),
(118, 'MUNICIOAL 11', NULL, NULL),
(119, 'María Auxiliadora', NULL, NULL),
(120, 'María Reina', NULL, NULL),
(121, 'Media 2 España', NULL, NULL),
(122, 'Media N 1', NULL, NULL),
(123, 'Mercedita de S.Martin', NULL, NULL),
(124, 'Monseñor Alberti', NULL, NULL),
(125, 'Mtro Luis MKEY', NULL, NULL),
(126, 'Mñor. Rasore', NULL, NULL),
(127, 'N1 Francisco', NULL, NULL),
(128, 'Normal 2', NULL, NULL),
(129, 'Normal 3 LP', NULL, NULL),
(130, 'Normal n 2', NULL, NULL),
(131, 'Ntra Sra Lourdes', NULL, NULL),
(132, 'Ntra. Sra. del Valle', NULL, NULL),
(133, 'PSICOLOGIA', NULL, NULL),
(134, 'Parroquial', NULL, NULL),
(135, 'Pasos del Libertedor', NULL, NULL),
(136, 'Ped 61', NULL, NULL),
(137, 'Pedagogica', NULL, NULL),
(138, 'SEC N° 8', NULL, NULL),
(139, 'SEC N°17', NULL, NULL),
(140, 'San Simón', NULL, NULL),
(141, 'Santa Rosa', NULL, NULL),
(142, 'Sra de Fátima', NULL, NULL),
(143, 'Sta Margarita', NULL, NULL),
(144, 'Sta Ro. de Lima', NULL, NULL),
(145, 'Sta Rosa', NULL, NULL),
(146, 'Sta Rosa Lima', NULL, NULL),
(147, 'Sta. R. de Lima', NULL, NULL),
(148, 'Sta. Rosa de lima', NULL, NULL),
(149, 'Técnica N° 1', NULL, NULL),
(150, 'Técnica N° 1 Berisso', NULL, NULL),
(151, 'Técnica N° 5', NULL, NULL),
(152, 'Técnica N° 7', NULL, NULL),
(153, 'UCALP', NULL, NULL),
(154, 'UNLP', NULL, NULL),
(155, 'UTN', NULL, NULL),
(156, 'Universitas', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id` int(11) NOT NULL,
  `apellido` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nac` date NOT NULL,
  `lugarnac` text COLLATE utf8_unicode_ci NOT NULL,
  `localidad_id` int(11) NOT NULL,
  `nivel_id` int(11) NOT NULL,
  `domicilio` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `genero_id` int(11) NOT NULL,
  `escuela_id` int(11) NOT NULL,
  `tipo_doc_id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `tel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mailresponsable` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numeroresponsable` int(255) NOT NULL,
  `barrio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id`, `apellido`, `nombre`, `fecha_nac`, `lugarnac`, `localidad_id`, `nivel_id`, `domicilio`, `genero_id`, `escuela_id`, `tipo_doc_id`, `numero`, `tel`, `mailresponsable`, `numeroresponsable`, `barrio_id`) VALUES
(6, 'Gomez', 'Oscar', '1980-11-01', 'china', 8, 1, 'calle falsa 123', 1, 1, 1, 123456, '121212', 'ricardo@gmail.com', 222211111, 1),
(7, 'Maria', 'Sanchez', '1990-11-01', 'Jujuy', 4, 8, 'calle falsa 123', 2, 17, 2, 1234, '131231', 'mariamarta@gmail.com', 1, 2),
(9, 'Simpson', 'Homero', '2010-11-11', 'Springfield', 2, 1, 'calle falsa 123', 2, 1, 1, 123456789, '21221', 'marcelo@hotmail.com', 222223333, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_taller`
--

CREATE TABLE `estudiante_taller` (
  `estudiante_id` int(11) NOT NULL,
  `ciclo_lectivo_id` int(11) NOT NULL,
  `taller_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `estudiante_taller`
--

INSERT INTO `estudiante_taller` (`estudiante_id`, `ciclo_lectivo_id`, `taller_id`) VALUES
(6, 1, 1),
(6, 1, 2),
(6, 3, 2),
(6, 3, 3),
(7, 1, 1),
(7, 1, 2),
(9, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id`, `nombre`) VALUES
(1, 'Masculino'),
(2, 'Femenino'),
(3, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instrumento`
--

CREATE TABLE `instrumento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_id` int(11) NOT NULL,
  `num_inventario` int(11) NOT NULL,
  `foto` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `instrumento`
--

INSERT INTO `instrumento` (`id`, `nombre`, `tipo_id`, `num_inventario`, `foto`) VALUES
(2, 'saxo', 1, 1316, 0xffd8ffe000104a46494600010100000100010000fffe003b43524541544f523a2067642d6a7065672076312e3020287573696e6720494a47204a50454720763632292c207175616c697479203d2039300affdb0043000302020302020303030304030304050805050404050a070706080c0a0c0c0b0a0b0b0d0e12100d0e110e0b0b1016101113141515150c0f171816141812141514ffdb00430103040405040509050509140d0b0d1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414ffc20011080320032003012200021101031101ffc4001d000100030101010101010000000000000000010607050403020809ffc4001a010100030101010000000000000000000000030405020601ffda000c03010002100310000001fea9000000000000000000000209409011222421200f3cd56acbdef863b7ca566d1faa1fd3e2c5f7e071fefcd3bddfcdbb0d98ee2fc7eef568900000112000000000000000000000000000000000000000000000040980971fe3b089fa10481122241c8eb56e3eb0dbff00eacfe735aa5defd79abf3eef2f9a4f2f26e1e48bbc3f62ead3ae7cb368d9a5835a85b46956000000000000000000000000000000000000000000000000000020a4177ca70df5d59761d07f9672787bff00423a5fe7ede742b7f64bf9037de24d0957f1c7d5d3c34b5297e5eaeb57b32c74b3db15fa7e2b571f5cec54fcf97d69e3a773344aae65aad78fbd4ef3f7ad3f6a8dc74abdf27cde8f439f287d4a04a04a04a04a04800000000000000000000000000000000000000000f2e5176cc0cb737da6b5f1dcccf79f26758f27f3aff5a7f2e77cfcfebf0e95f86e7b97f367f4767dff00c5feafd1cf97a9c4b77667af9bdb2c2bd04256e2022423f1f4833ae0f6f2ff0021af6dfd7c2cb371a4fe93ea72e122122250122092091130004c09890000000000000000000000000000000000000044c1f2a5dea39fb59ac69af9f736d1bf6eb9f9fd0fa9008250240022608add92ad525a5793cbeef2dabe6b7d1aefa35742987a3cf9409409809404c09400098260131200000000000000000000000000000000000000448001098240000000001e5e5f2ead976a3cdd2e6e25dfaf62b3edebe762d955e86dd3bbc4b4aaa2444a02442422422602602444800000000000000000000000000000000000008241120409008261244a04c04c4802029dc7b058b2ed65de3b1d5f22dfe6e34eb74d1df47a5ce9404c09209448404c09802602604800000000000000000000000000000000000000448204a0902240004480044889146e57579fe7f4785e0ec70f3ad58fb7cdee5bab7027d36711244c48044c480082626000981312000000000000000000000000000000000000082482482404491282512424011200082a3f29f6635ce252edf45cdb567b1f13e7347aacd22ede82848978894120824890022504c04c04a24000000000000000000000000000000000000000011200000000890101233bed71785e7f4be747d0339ceb5a655ed5c3b30f8b7bc2f6fd2adf74b5a92244484242244026000012000000000000000000000000000000000000004480824000824020944840902246736da651fce69da29170aae7d9d1fa55ee8d9adf7b9526e5ad57de352b20260262410120800261244c4800000000000000000000000000000000000000825120044840984913124241120812833ba05fe95e5b5baf9f6974bad269de6f5f0ac57fbe87fce7fd17a71f4251af4650250250260260250000131200000000000000000000000000000000000000044c4802122242244120112002260cdfc9f5b079cd0afe7fa0e774e6d5681a0d1fafbecd573cd0efd6e944c6f51009089104909109826026025120000000000000000000000000000000000000001009809826260482244240044889832eb3d4ed9e7342bf9b69998d4975ce47a6b9f3ed86f196ea37e0e90f414001244c00001220262609448000000000000000000000000000000000000044800898128004841244a024424427f264d6ba4db7cd69f3f2cd5b2aab2def8be4d83eb26d969bd59e3baa63d3e5802489800092130004c09000000000000000000000000000000000000044844822444c0248488989109113009008fc7efe7f18f5b2b9e4f25af62c8364c6f9793fa1781cdebef7fc34dbbfcf9a2cfc7ebebb226263e849000002600004c48000000000000000000000000000000000000000010130260049098260098261247cbebf2e7ee51cefaf1fc66ddfb1cd5b22963dba9be8ba4d1e49a2fb2c3f3efa3ab916bbbf402e4200000001304c0262400000000000000000000000000000000000044822400802484c12402484c1281208f8fdbcd1fdc4ea364e578af43a4d52c39b4b0ec5c9e9f6aed4e5d938dddd1ad48d0aa36d95f71a35c49130000260260260131200000000000000000000000000000000000000011200022444821201120890f17b7971758ffc7d7e4f15bd6dc376dc56ed6e86f159fb3aedf1ba33a94eefe8e277356a44c4c9ca2442441241242609809804c48000000000000000000000000000000000000890008260009204c48202609000e2f67830779cfe5f3f33ad195eb340e3abff004bc172f9c71df9b86ad5aae83c5eb6857f44c2e422489892260012890804c1289000000000000000000000000000000000000008941312101312201202048226026248af586af5a4cc3e3d4e6f96d9e9e51a9e5efbbc71fafdeb15337d47c5f0b5c773a5c9ed6e5109390130000000004c48000000000000000000000000000000000000042400898049098240890898261201f2a5de2939b630de97afabe5773b185ee789e8d3bb697d8a5c6befcaafd0dca56efdd1395dfcd53a39fe8172b899398000000000989000000000000000000000000000000000000000008980981280001300981281354b553a94d9e762bf60f2bafe2c6f6bcd6cf1ded9783faf9c57bdf9e5a62b3d0e679fcb2c5cff00e8ff00e5ddebd0e65bc8bd5e5f1fb7c07d260092242120000000000000000000000000000000000000000002130122004c00004c0488a4dde839f3e7f65e159bcc6ae7d956c9449fad6b9d995ff3a6a3df7edec9fef2be1e3d16cd7c2bfa1732dcbd2657d683def341df17d9cdf6e6d8b0f7ea3fab705ed52b269d6f4cc4d8e0000000000000000000000000000000000000000000002130122004c0000000cff40ce736cd3fd1cfe8f95d8ae54aeb41b1cddfdf3dccb9f45cef38b3eb41e7ddf06de2cd6e9c9ea726a344d8b18c5d176ea56ff3ba165ea783a5ab9be2e6d8ff001f7e79fb9549d18ed6f9fd352a87d0000000000000000000000000000000000000000002013013013026025026026260671a3e69976a9cfd73bccec74f99e3f1fdfb7ee3d37d7953732d353b35e7cffa03f9ebfa0f6f33b530f4b92ad5931ccfb38f776e58e793f4da76b586e834eadd7e95cf0ebe7df7c75aefcbcfe6d756f85f86eef3fa372907d00000000000000000000000000000000000000000404c04c04c00250004c0679a1e7799669fc7ef50bcced7ee8ba455acf1faebf579f5a6fcf6fb55eee3f86ff80ef9a34bbb311e972ab980767e9e3f7fc3efd26b707dc5edbf6ace46de8f55e05db8a18e5c745e4fa2cbbef5f34d9a58b8972a67a3460b8227669800000000000000000000000000000000000000011302502600000000066fa4665936b814bbad43cdecf5e9171ccae4170e27679d99a5aafa69dc6d5a1d4dcf10b0f316d958b3e03e833e9bbd5135bf3d7ff5e5eb7c2fd0cba95b352b2f4b14b87be9191e835ff7645a8e652e9dd735e8facc7bdd4fadc3b905cbbb9a691b553f62e4400000000000000000000000000000000000000100260000000000659a8e57916f934bba553cfebd8f2ab2d066e6f9e6b2d531f43bda8633bf6ce7640f17328d8d9f24582cc3a4d839ff002bd9bdce4f8f9dd73fbae737038a6d0bebeafa50d1f2f92c9ebaf6f97d7ab73eb7dd73ed5fb37a1c4e7e8d9f5b2fd6b90daa60000000000000000000000000000000000000010024400980000003f194ea993e35cf2d3edf51f37b1fba968f9fddabf2ee777919da15fddf93e4decfa8dc2a9b453fb997ae87ae412db2af69e65dcee071bb39671de69a064ffd576f8fdf22dbf1cdb1917c749fd5afb61ad6bffbd8a387f7744f345dd42e1ecf65cae16a2000000000000000000000000000000000000000404a00131302604a001301f1c8744c8f0747d19f5df33c7d4d02b563b74b5a89c6b7f8695aef72ae1c2dba357d8328bb674f9defb817f44f3c7daa16eaadea34bfe77dd31693bd8b4ee4f7abfd8e7f5b83175e0d0e9fa66ed591a9540000000000000000000000000000000000000000000404a02600004c013013054f2cb9543ca6c7c728d63208adea3b9e33af4f4734e4f46a98f7758f0f03d3ad56b5ddaf7ab2af793fa0f1cd9b4b33c951b3d3268f16f55237593ab87639dd9a7d73eb7dae1c8bc593e7f4f539a1dfc00000000000000000000000000000000000000000002092009809800009813f8fd70a2ea8140ed70fc77a05137aceacc7dcd6336a2fdafa9d1bf7e0cabfbc70ae79efacc6a2f8fa1c2f1fbf7bd8b2cd1b671b9f46b567bf183ff4bff3a7f494ff002c3d4f2fa2afdac7ab8972d0e2d3313e8280000000000000000000000000000000000000000000004026000000000787dde28bac773fb9533c6fa0efd37b96899cfac69d6792a643efb1d5b2af5e6a355ec6bc2abd82db956fc9f1d0ebd352e1702d19177d47f45e21bc5ba764e5f66afc7caf6ad96ec1b55e662756a800000000000000000000000000000000000000000000412426000000001cde97820ef13cdf41cabcc6e5d2fd59ba43f795e6b0e4b1fcb852aa7cee6edb7a5e5d1a5868db37ceff002d2ae51754f24b5ff94b87bf627069deb5fcc35451efd6acd55923f369b9f683e8a989b90800000000000000000000000000000000000000000000400000000001cde97820eb0fe7f4ecde6b6385defa72eaf7e7f9d2746bb064557dbb2e8aff00c7d1f9ba4916c5d3fbf238cea6f5ea5d3f93596ad6dcf2197a379e2d83e47d4a75c2953c7deb9d5ed1e9e8a62678c0000000000000000000000000000000000000000000010128004c00004c04f2fa7e487ac3ed744fb798dabd782c99443cd7fe7dfe44b274f3cd2e8b4edfc7dbf1e06845fd8bd1cab51fb99e49e8f3e48b894cb7e7146edcacd4eb9fce3d745bc67f3f1a2f6f95d5f559c989ef900000000000000000000000000000000000000000000044c128920910921301221303c7ede5c5d533c966fde5dcf964ba1d33cee8757e9d8fc6856ae64dfd078a7163a19769545cfbf73bde7dc6923fea1f9f82c577228dc9b9d1a29fa569a7cd7ead75cb3d66e43a5fbfcde9f5b96987d4800000000000000000000000000000000000000000000848824824824801220135db0d7ebc9c8f270ea787a5a7e2baed533a5e973ab7e9f927b714d068125ab6d4fbdf67ce8d4ac96f8fe6a5d6cf6b9350d3f39d0792f9cee87e2e30f5f9a65b697662d7fedf3fa7adcb4c48000000000000000000000000000000000000000000001049091098000000071f8fbd8ace65d4cabd71fa63feec7b366e57cfd1a55f20e7d868991b5a5f3fd16feebdbefdc2eecd9de9a8db785621ca3d376e2d3b9f3bad2aeb0a73ebfd0ed47b17ea27d666262400000000000000000000000000000000000000000000080000000000385dde4c1de57abff3ce6b936bfb0ff99b4dc8ab4dddecd929b46f572afa25120bda6f1ed1d4b542e7d9e577d47f3cfa6d0ecf3b4f07f7f3a93fd2d157b673f3e145bcd1edc7b10f559a24000000000000000000000000000000000000000000000804c000000000afd83815a4f0e5d6fbd62dac1bcdb571a8dbf767ba5d67e7ca5d72c352aba1dbf470ac1077a15c308d7b5b2bad50b4547e71eeaa75b02f9dff0043dda9775e39f1536e554b7c6ac3d3e7262400000000000000000000000000000000000000000000084c120804c4c024848802bf61add6938ffbf4f8332df93dde1e963d8f25bf01d7ad4563c7346c4b8efebd9e575e1b79a74ed15a925dfea33c68a957f30d4f2bb3f3fa52e94cb9c11f86b365addce3511e9b3d3024000000000000000000000000000000000000000000004260244122000260015af351b3ecdab928c5bb1edf57a2b308e85575eb5f2a95db8e7191aba45bbf9e36adccadcff9ff00fa0308bd0dd3a5cef1e14d4fc8759c7e6fbfd1f71a75d23e3c554b456adf1aa8f4d9e98900000000000000000000000000000000000000000000020921301220001304c4c142cf362fe78c3d3b07d793facad3d17ddf1ea7ccefe7fbc512ff0027da94767e38baf7fa6ea7ccf5b85defb567ad0f360aef7bcb07dfe65aeff4b6110ded9ae156ba71578bcaea786f45a213e8e8c4c48000000000000000000000000000000000000000000000011200000890072314df311c0d0af7b73cb0e4eb5d6c1e7fcd7af9d74bd19b6856ba7c6d795656bff45e8782ea5eb3cff6b95ccefd5fb9fdabd358ce9fa544b95239ead373a65bfef1c378fa9a50dd87a0a400000000000000000000000000000000000000000000002260900824000004649ae7f3c665bf5d5b63cdf2efdcbb95db6d3e322a5eff0045efacdf50d4ba3245fc97e6feb1c7a0bd45dff83c88a3d1fcde3a84d5b9748a96912f5a6d8f81ec878e0dcb3ed7362bf4213b74c890000000000000000000000000000000000000000000000000000010481123e3cfeacf3f687e2d032ec1bfdff7522ff43bf3767f15ab3158aaf61e3c5dff0026fabc976eb4767a57cf2cab5ab5fd1b4bd17be7b1c7f4f03e7cb3ea3c4edfa7cd922d472890000000000000000000000000000000000000000000002120000000000001c2eeb8fb9fd0b68c9fcceadc3974ff00c47f2f5eac6349f9270395facfa1ebe5dcf668b271fbf579fe1524f1db3efa17a2cf993669c4800000000000000000000000000000000000000000000000000000000000044a0fcd52dd15e4cef97a172726d6739deb35ca77787eaf27af3ed7b7d5d1bb5ba948d02cbf6ddce49a558084c098900000000000000000000000ffc4003610000104010303010605030403010000000401020305060011121314602115223132333407232425351016262030364217435044ffda0008010100010502ff00e5cf3c6333bf89ccee65935c0876ba33ebbf2daa3dbf51a39b095e3924cd8f5612f72d15feccb3972b6a697233a4d36f2c749919b1689c8c22e52327948241b9de26b91edf18b49a41c31ac4f92c0cb322e183639a8e98666bd963ae9f4ccd3a220353ea47bf6c75446336135dfb466a9b4744ad72393c2e7b614627fdbb3bb88058ab243c96a321d4f6700fa53e4934b391aef268f5158b25d1806832d85c5141fdab740c319c65590e1e7f0bca0395c7ae445013036d0982416229527fa8a3210a322d4cb370755104d30c8c6889349b29aae8a48e38c48a2d6c9a789149a329d534194b13ec87ede4b1292702a2760c75d33a3689ea9e1191e5c063b0266f7977619764048135a249478ef74ae5afb99298cffca375a133dc8ed88a6ba2980befe0627f72b1cd7585899a869d39a708508b7858e8aa09b4980ab82be3ff004dc85c9b13d0d06162f589df4616cb2ae1fedfc148262122b6fc4cad0f56f9e5b5b6963472fe1c53b273ace543ec32f199698b1ac46ab216f1e8b3584a3187abb86a57272468f1ea6b08476bae1665f63585a6abe8c5ae67fae46248cadfca2ad8a6570b4c4fb56ac663a2731bc5be0b778c57e43a2bf09447e8afc27b18d66fc3bbc8b587d79d4a017538f05aa85aa940b609e1942b24275ecf2b55ae2698da6826bb01f8d96f4adc788d43481c2ad8dacff6ed17b436ee394eaec73f8c02245bff000a9626cd1dc62705c81578d814e05f60f05c8b4581575137a6dd74dabaf87fbaabc51f67248931723a5b90905abc27f3031f68effc795374b5ab8e682a206b26c98974626185b5018a4ea5ff008f4c4c63eac0d83b4a3179c9922f484ab11b0d790d730c8b2b93b6aab053e2f1cc919fa62e8e482b71f7af5f2a4dc1ab9e522b66ae775c8a25121c75dd45f1cbf6b9184575bcb558ec240e4655f658427edc5ff31e3d7ff6f07d08646b2eb2976e1e16bc4021e8fbaf1ebf915b2c37f2c6d75dfee06d8c765280eed1b03964b8f1eb9e5dd53388b08db0a926a2f48f8dedd834fcff001eba5fcfc559c6bab5bfbbdd70087a49db6d1469c6e7c7aed7f518eb78d5d7cec88fc99ddc536249b047944332bc78e98883c772757f2c724592ba2956775b58c64b70be4b59906efcb7186f046af26f8e644fd88207b21e1464d1a0a63ee52be570c97b5d3d8dfd20c480f83e8f8e645ea4024c2e14747b8605ad6968ac82317ea5b7a5b8abb8fe39912fea0781d336be08c71ec6cbd8aca7fdc5a636461b335c44a0fda78e5b2723fb6d9628ff006ec9c1eceb31ff00a571d2eea66c2d2c0fb4f1cb4fbc788e9641d8a83e6dfc7d07d2ca78f1c2e4ea2d7fd9f8e59afea037c7c93e19bfd950fd3ccca7ada520500d157fd9f8e5a2ecee9b5b51acdfed68be9e502389beaa85f0095ff69e396ba9fd29d3e7cdbe851fd3b195b05f893b481abfed3c72d7e533d2a7ff007667f2826c600d712c5624d17e5075ff006be396aba317f697ee92641230ed3eb24b113d993444d50a4309ab76e378dafc2d3d5f3271a476fd63b1fb32a226ac830c1ca1c687246348068cae7e38ff0092c19c9e5ab5b5ce6a3a6c8d54636629b4d675dda9e2dc4ed89b511f6ebe3727d327de70693753ff00d5957a9c2558b651d97b8f9f88b6536f1ac4feac5e352fd393d5d5914acd3bd0ac9577b3af2e11596ccb02272483269426ca7d60123121f1a97e9cf2a31b5e5a8af9484e775c8bb2c7ea5093afaea3c7ab8273adf4fda161b3a5719e3537d32b82c2104b0805c31cb2895708d1d6910862ddc636531d4005810443f4e5bb1237190bb945e3247d239ed60659c8821646cdefe42e4c7dcc9813e5ec83143631b17bafc8217bb5037843e3262ec396cfc8edff00513b793ada163afe92f08c76da69e2b7af06d2373321b870f08f2a11078d592f108cf56f37579b34ed894e7f52fcb4163a99d585475c046568a0f55bc05aef1ab7f4af62c6b6390c90456564444aad1da969613412d7bc52145ab26505e49ed6cd3c84c81c6bbb3c66ed76ad6469ed6b986332c6d0086c2286805826c64312b1b3dcb5cdad82494d2a164919113621c7f583c66f7f8f32796331e5cfc6ec85143ac509f6305a38516d2e25386a1a93a896095c5e8f45e844ce9c7e3377347da85b3ee6f408c92ed5909ed763a60e4d6de0d18adba11da32c1ea30ef965d44d51dde3327a32f12340ac5a83c0f74af00e6a6c344d9ade8eaad690d43e056414e9d695ccaa392564ce32ca1094333ba4f18bf0207b0ba766850d1edb05fc8af4ff0022af7b58dc8677c33bbda83e1c3937130d3d9d854b06b161960d31609bc62f97f2cb76c7d7fded82eed01fc6ff001aac96feccd292ac687354dd7237bdbdfcf6311138952d12ee596de077387c5f225e3199e8757393da52c5d7d7f6cc9ed3a8246006b8b01890e6006828e6af89586b20266307eb2cad6037d8949cf1ed2aedaeb46be2b92aed11bf7b5c9fbb64443a11608ca74f5538095d61285336266da8ca58e9f68256fb222463016844e0dff1bb035001a792695c9b6a295f1ea1b5959a80d8a7f12c9d7dd9d88e96bb64b156b653415ee2e8694dc74e98c8261eaf1520c22e07642e9589ca1a0ea542e1d24f05542b00d902fe71a32edbeda8d77d363df4b0ea03a5835090c213c3f2577174bf33577c85ef4ef2a7d72bc82e8563866387103ba0cb7de2ee4cbaacfe3d5117fa6463ac831c6bd668a773f502efa8135d145d48369d13a370d61bf87dff00d777274833bfc946dbbc024921b8c66b1ad8eea2468d1c891973ccaa34abaabf5aff00e93c493c574239905659c0ed3648b90dea9beda491174f623b52c1a18c70cac7a48df0cc817f5b13f9685977c8e2ac9e29caa848d8d27b64bbb28a700f58bd9e526e33ddeb4feb57fd6d2062bae405a4b408b99620b212eb641ec232e35974c275cd1fa923df50cce15f14cd999e1777fc80bb2e816b66bf89ad72ca4c64492cf2076a731a95e642d8e9e75de2f8ad2ff15fd15764ca2e95ae220665351175049c23ba8dad485cd925745a53da9a1ecdae564e8f47ecba8a670b2433367678559a72b70a34e556c97db4610b5cf88469b2c6532d03b295becab16a422714e9fc3549fc57f4bdb16d7865757a154c9855baad8eda38776eaa26df5dfac0b91d6112c3145651b85cb0eaed56d936c07726fa1e770b246f4919e127fadb87a9dcacb2baae8c8d42725710ec951aadc8443753fb3261e79dd20ae4f5a3fe2b4abb6b30b7424aa1ad90a4417dc241706fb301a7421af18d0f915d5a6b99a9ebe37b48a988a8b1e8a4ac7f41248e78d63504ae83fc24c5fdcc4f83d9b591ebdb0f5cb2db643686c70d8043727d5e2a09ecb7c77846f626f47fc56b21b04afae8205b034111218d90fa4e3ee86d72c12d907df422c2e6bc021a8e0096f56789067a8e8baaf9f9446311cd55d96b09ea33c20b77eb05f44f8dada7ac024f230a1816d6d63deb1854d6a456cf4e61b79692a7ad1594a25aeb32b469866335ef48608f64f869eed1288ba244673259118d2479c59e12a56383b2ef201cc41dedb5643377bd5610bba8a4f4dec723dbe0e5fd587d191bd56ecb1619441026c5315669d9090473d7ba3485182c3063d3bb6535ed19eb95b5c0430f5dc147d089b3ab5ae9515249f5391a2276a34a8fbfb214a724255548142358bd24b9152c07a5e73c51c8ba73b7d35dc24a79ba837832fc0af847f486739f7b69628d5af8fb53720b8861aa855e4023f5092ac6040e94b9765fcfb12c982585951024f3c2dd94897a6893aa6a69b6d58583626d9db1790995387a000588e8e8e845b1af532981b695e39b4cb4e7742684b5974d8b9b2462b758eaaede0cff0090cfa4d4d992730088c4eec5a51e1b420a16681c0227493214a930aba12e2a486272c56813da7931dfbbe32dea31ec5e064defc4b2b9c691c5329ba5964c3e95011d18bb1f5519ec9b168d9a0412c6b20c49a68cec68273db54e19b563cd1c4fd5607da41e0d2fd3317f219ea873b76d67f1186fad99ce4f6dd4b9aa151baae7167c66beb659be7c7576a621d2581b4a3f6e2fbd1a4c52f52699ae4c92c9021b1da975dd8842a46ce3a93d1254d095fdf12c6246dd4800f2afb206d422423f844df489722c22b9cacfa3a0e259ab292e6be059cf8a622a1dc62afc64d362929e4adb69d115e04fdbe275aa934813366c8d4dc95744c35e918f939af2c9c56a5000a36ec9c7532e9daa90fb51fc32de76c5195d5967a88961614feabaa1cbfdb58f6303810e6c0c400c24339ceacc7da78c55436bad0867bf3cdd3c2b1f7349b019366ccbee92ed5e9091438f8ded1b80a1e9c6c4d3fd12777ad68fdd19e1b6b2032984ccc496aa749a264bce7c49ce2626a6c9f886cea53522ed0d51291df5d7f2a4fcc6bb963785c7d4b08936690be853b59919c21c1c1e02449a637d275d9245dd68c7e98be1abc5d941abb02010d24789dc27c39a8c64d02cccca2a9e1075317b4200a8bb8b72ea12b0f25a8e71aaafaac2c979f037e5297463f64caa5ee2c690641c5853d513d0b7698c59e563518cf0c739188391cae0b5ea138fc12c35f3072ba3ac72874505a8d20d999e3be9b18fb0a11766e47e874deb2584bd3aec0a2e151ff529dab17eccfbec9826f18c66e9de8d2ddeb491750bf0db6e4d85c548192eb06c811c53678612da0d526cb43854e5901def12543b08071aa5e92d5df38292ca5fa85b525830cfe2e42e2634a9757336d0e2d1f7174327ba3b7d275e0c2a55e5411ec3f86989bc5731a36ecc4482b47e10524b04f2410731ebf17c72c090aedb1514608b1bc7a7cc211422cf96cade677bc6aab85167e84087fb5a29b2064536413f0170666ef15ba85346c8ab314bd47011f443f0d2f7e8dc9f1a5a9ad6c75f8c9af48f02964229c91564942160b00331a1123ada077e9b261e14b3e90ccb299e8b3622140707302d83429d551484b473e2b9297d8f83c1b022b75127a149efc2cebcff000f0e39a9233287fe6b4b6126d206f2cac40440db8fc1246c8926203b732ddc32299068deb1d683d7b849010893cba3c65b5038a02b45b3af57433348c66cf277276f8847d3ac1534cf94f44dea9bc8ff000e2be3927bc6bf712c30f8f6968936d071b469437ccbab129619412ba37192f4623ee6002f24c684ec474d71e83a78d088cfab6195b9654ca3058d3760454d7fd4f77ad03799be1c72a74ae86926232ba985f5b8fc5d2b2a593945724f66cede2b15b7c7189a8c4ef0eba922387c195b3594b12b34315ba5a64d155922daf5085444b6ade9942060f6120a9a5f469abef638cd93c388fab6adea1af2eb62d538d14adbf1d89a472ae29484445d6943ac89dc08d896baa3543563d75c27bcd2465899738fc3918e056c834a4271b119dc2e9feaa2a6a4f94b5f7b1f4fd278714f48e52f7994c981209a07720af95add397fc37139e01690525a5dd941cb3bd790a3847c12962ccd9e14d7b307ee1b145029fe84206acb547f5241be137c85aef25326c07871488e86c67e9d6cf7624baaf45ec32887da87da07b50371f16babc4c7e7b40ea8a9d96b7534a0d763e4f0b1c3ec3f40d5d269ea8c28e95b34790d8c825c83f28ff023e49f973ab4d80f0e2fe8d3540b635d698c8713614e03d8bbf76604d224346649715d667d53895ff2ac8c6eea8ab95ca50ef7474b5d9a3626c3671cec9e3758091c0e16972103b8341f95c5c410c2ba4f67cdf5004e21f8758bb8898c7f0f64bee472cfb4aa2f76126f3b17a864ad6aea7ec1b665cc7ad7307484987d71f209eda1c73d6b9efe125cfdad8d976f954b2a734ae739612e3518a4da419361fc3ae9cad1a9a6516bac6ca2935ffaef0a92a2de9ec5afd5e9ce0ef22bf71721f70ef6ea1e449435b1f2b7199fe3d68bf938e26d5c6272d5d6edafbb1de4667d84724c60eb0428a91873faba1fa5e1d740c8708cc3a748ad314981d7598c8ecfa66166f700d759ccb6ee426564a7b8591ad30d22aa4abf6358d63a535c9f87a498cec2da801c1e6b0b3b6b622226b2d51a3180fab616a3d883f680cf26cf8fe4f10bcf58ebf8bda631ac4786d9a482068e65ef385f5ee90dd50810cac2c697db58bd1329806ff42478e905a199e5e2b9790ac241f906f819f4f6fcd6fcbe1d6a52882ff74da4e4dc545e13036ccc0a4cf4feb47536cb650cf3b062e49186921ccd88949c792babac219c68255874dd26ae217ce258715a3b8ae8ec1434d905f81bf4ddeec89f0f0eb762a8d42f05f6714d190c34188e87368a2ad33188dbd99e236b6b6c0750c416580f3a83140edaa0cae96b41a86b64ac8e451f451f107125c42bab75dc035fc55136945f81df239bce6f0fb4fb22da95956c37d9c4e279891684dea95657f8ad44438f7a134db5b26729a3e907615862d76b2c7365b1a745657ec8fd64a3cfda51da97634d34bca80c6727b5dce51be53be462fea7c3ee9e9d9455b0155775f866392b4d8a1d4111a29109b4b0b620990b4ac9400642eef32ab1449c3b20e02a79da4d4e387b4eaf6aea7190949a9b796ed8d82b2caea14b60f43fca7fc83c6885787de227b3a8ad27e4aba3b67eae464224aa5dc29a9ca6d8dbd7490156301314caf800711c07aaaec961ae101b284d88995ac64bd4b2b9b1352736be77119685f01fe07fc82fa9be1f7de9558cc7b3ace4730f6eeeb9b14df5484ee89adb5f889235610eb9b686e455d104e82bd2522c7829091443ead6f524474ee7b68bdec942f841f2d87ca17a9fe1f7ff00c663fab3f5b08bf9b3f567789426d75c8e6b6cee86a88af6cbdb96d06325ddb24a878233b0e3195860aa03c3a84b2852a8d09928aa38f8dfae461fc07f96c3e5017f71f0fc83f8daa258344e474d2c3249de985aeb3bae93b5acc9026c26df40f96039f013459ac03b1e721e76b338d26c868eb478213a26a34f8188da37a7f71869e9033d0f627083eefc3b24bc7518a2dd997b563d7486442c9d4131efa466bf10be5a2f41f279116ccf746c4a59608e28244711acd59d0bba7b08d60b0c8abd8e38b866650aa2e461fc075444b0999c414eb1fe1d998bdcd463d6cc2a86e2d67ae929560b69ab45edec678248db99a0cd8eb3b8922b96166dcd4318e929a8013e39a478d709908893beba12495d5956c1630d9d04d452d03d52f8389aba8068b63d8d6369d3f72f0ebe7232a3136fbf66f45bca677659985237dbe6eb3e4fd2d03f90b2ff00cb2b1bc571a5fd3dae2b25998363b2574711ce8179239afd5946d564758b599485f087e5b15f4a44dec3c3ad9a8fafac51389b105212d0909be6b16c2f023d4b8b3787a95b8893d6acc96650ef690d6cc5e3b3a326d48bf9e586d235358c9472444b0a8c84e6c2d8924417c22f96c5daa06ee57874d1a4d10302891ddb12700074d25a88746f92d075927b0e16a06207ad715721c27c0f4ecd81583ba83d9eed5be8653d575335b2b46a86d729b3a423cd2a7503d317dc3dfbbb194e4cf0fb49e269c4e3c48b5d507945a44d60fa2866ab6d239ab0ab9a54b165564e6c2f271f7d8856811f4291d998c78d5e6d848198e744aed3dfb6b25c8230a0c5a798c883d2bf661afe6b8f3361bc3f2daa3df7f0da9d1d7a5e5a1e10cee6ad77364cc6ab64a4940300ad82be35d4ac491a68c95374591574baa3cca2bab1247487463debacb4a46eb1b0fb6086f4d4d2ecd85ddc281076c27884913666075628096a120cf1e6d3bd5011b932127a0f47a48d5d5cc3ce1bf3252d989f265f1246fab0238b51b25ede8317063178a5910e48a944494af139e169114cc7093cb751412531519b5840ec2124316b246c8d95966f460c70f21c4015d206d115610f27b874b2639449582c29c51d26c9cfab35405d909e296b5ddf45d98e6d74e01b54d6dc489058584b209476aa7845cb11215ca7e749cb8de64fc1317c6dc2a471eda54f76791ee763b56b2af8b12c46b9ec78f3e5ad3505a02c82a9cb3e62f277cec6487d94bc8e1af6db58fe2a3d5aa3b48ba74aae75553f591138a78b39a8f69c37161a2426e83ad8c4d22875c93591a514c9b746cba64baeba375041318fafa36409e353550d32cb8d0b2a4f86144b48c5ada2d2d3da375151db3d45c4cf9341e2e38fa8a1640dff00e3ff00ffc4003311000201030205030204050500000000000102000311122131042232415010135133f04261718114234052a1203091c1d1ffda0008010301013f01fe9513231a814365179ecd4fca7b4df8963d065d7c6aefb472a486b4cd8cc9a07847b9db512a28dc7864baf34ad8e961e81188bda7b4e7b4143fb8c002e8b19d5233b37a53a9d9a298579eff003e16d31ba8d6541dfd29bae0018ce96de1acbda35463fe94175ccc2d88bf86bcb9ff00669e37e68da7288db1f214e9a900931bae11a9bc754c6ebe3c5428825f26bc6f20817dbbb42a9f863ec7c81fa336ff0010f35c08ea50e27c785ce8858b6d620b31bfc4e280cf4f1e290a9496e6d077847e195059478f4e81acbeff00bc417a969c42e1cbe3dbe9ac1b4a3f52713af8f6e848363298e624ed38918f8f7e948801061634c7ccae7dda79f8f2b7507e22315bda31f76c3bcb00a141dfc709ae16814d8cbfb6da6a63b8b0004a8b6d7c68de274894c1223755bbc67bc7d514f8d5de29d2d074c6e7e78b8671858f8d4ea10f5fed06a9684b2f2a8950aa3c7371e369f50971963f7de2745ad08c4f44adfcc19b0b4274b78da279a3329d6062aba407dc363006717267b3dfb422de3297588dd1fb40b7168d77a8011a4a9468e96130b0b812a78ca1f5047e9fbfca3728129a0bde55aa8ec104aa42012a0004a6001784434c18c857c470ff00504b6ffa7fe4a80b5808bccbedf69fc28e1dc15338ce81e9c310dca655a36da35e06ec63d2eebe1f86eb9f3fa4d6f12c447376138be81e9c3a33bd9652fe60c5b712b70f6de14b4b5a3d3cb51e1a87545e6b8fca37631491ada160f6b769c5f40f4e1d450a573b98b5b9ae3794d96b8d256a10d3c631c7795132d4785e1faa53ea86fca07de929a72ef1e955572c5b495d0d44d3b4e1a9fb95009c4d4d6c20637946ab29b8de53acb5463de57a12a5263a41a692a2d8f84e1f789b9fbf983948bc53751da71ba1452605ef29d35a4a5963731816d2f84560ebae862717718d5ff995692b0c93bc75c0cabaaf84e1e52d5edf7de55243d841f4af2aba557e6d089c5315a7a4a83dba41629f45d4e46068580178388607486be5bc67be83c270ab7de53b67a476d4de2b064d27bbce572ff13885cc28fcc4e2cc58da8b7ad66ede1e8ae161f94a5a5495b569440b6f2aaa7bb7beb185cafebff4657de2cefe9b426e6fe194646d157f108a49378c016b194e9e297116f52a926017958735a0117e7d2a9b2f875de53baa1fbed1b96ed0b5b9a5239243492935c0de3360a499903aac7031c8768bd220de573b0f0e9d529eb4ccac7461fa441939222814f495182b0067115cdf11b45a872bc7aaaf45be6768255eaf0ebbcdac65c547c3e654634490253a85d6e631b8de6fa19694f631a0953a8f875de60c6c44a433afa4c7dca8498b600aacbdfaa554c18ac04994b48d046dfc3aef337f708bce1796adf785cadda70f53dc274d636dbc64570728795b494c92d78ca3e7d0f874b642f1568b3df29c392b522a2666fb44a412e563365710b2aa10d0a5f2a80e9293626163e240b9b44e1f1619309ec92f6bcbbe584bf2c0586a654b937329f55a0e66bc69dbc42750958f3ca45f138ca64b3cea84325429d8c6dcde05594c6a23cede229f508c9cd6328be1a4a4c065731798e77ed2aee25542a49b6916e60e5023cfc3e229f5087eb18fb8fd232fc4a14daf95b48d54354b868aeae74302aa9b132a1b911a1e9f114e9b68fda58666d1cf3da5e535bd2980b93382fab0ab1731bb4687a7c450195237ec632ae1a6f6bff98e4dc40dac3f474f894ea05760f305de998ba6d1aa7b882fb88d1ba7c470ec30221d45c46e6e432d8b6b299ce9e32b5237b88aacb6bcde08d2a74f88e1ac5b58956a30d4432f9e8d16b95e994ebe7b89518d517036805e0ded0cac6c2de26e76945b2189950155bc1cdac5b830f7bc3648ab61aefe951b26f14095371283e578b883b4a896371de3136b5a2a13ccd0cab52dca3c6239430565b5a23d2feed617a7f31f88a6bde54ae5b6fe93ffc40038110002020103010506050205050000000001020003110412213113224150510532336171f010144281b1239120344052d1304362a1c1ffda0008010201013f01ff004b75e2a538e4c4d48b5773b6d9f98d3ffb8ffee1d4055cd6f9facab548fc1e0f9392075ff1598da72713b5600a2749b04ecfe50ae225d8e1cf74cd3dac30add0f4f26b82d98afc669379c963c7e05d41c130df5af568fae51ee0ccb2c6b4e5e55a67b79e82574257d04201eb351a518dc91878416634e478a91fcf92e6769b2e6c8ccd33754fc2c46de488fa7b1dba45d0b7ea32bd3575ff0086ee2decc7acad37b6c1e3e4db41399b4673ff004753bf665222e4ef94f170faf985f7d80ba2af41171b4442c718eb2bb2d1604b3cbcd22dbdf24f878c2bb3bbf395fbe3ebe616b59f982b59e7efe7035a092fccd31cd8be609ceb4fdfa461b9ff00bff32aeeb027d65760b1770f2fed0d5aa77c64460c799bb7f4eb3424f781f2ff00cc1a350f81999dd8f9c43821be62699c3dce47979c9d43e0660f797f68485404cd260dac40c797d3fe62c3f287e20fda39ee09eceebe5f47c5b4fca7fdc5fbf58e7ba31d67b34e58feff00cf97e9fdeb4c270eb02ad9c6713464d1a8d8c7af97194dbb19d7d6150ce018315f7b1373f69b9d7a7f13af96b743131da12602378fbf03157b4c18aa58927c669acdeb83e1e5afee999e5808c46656485c9e92ad3ed21a53c5ee3cb6df86d0a163be2fbffdff0089bbf4cb1ae157cbd656db941f2dbbe1b44f81fbc0ca1fac02a639ddcca12dba9ef1c4a57636dcf8796ea0e2a68062bdff003ff8995dc72d88a723dfe268dcd6e6a04b08073bbcb75ca4d6488a1946d27c62e0e73f38e48c342129215179ebd21d4f451d4c56078f2cd67c0683978ae067319b159653cc4d4dca08df05fb8e19b994633c78f966bbe0345ea0fdf8ca5bde13566d52157a44a6c4436b8c09a60d6336df012972cdccd4316240f09b88e91354ebd7995dc96f4f28d79c52667ddfbf59410031fbeb2ed45545ddce5a5bae6d5d5b597189ec9f88df4fc35a0a1dc3c62eafbd878a41131e2251abfd36793fb47e0cc67107ca59a70b76e6eb2b18a8e3d67b2fe21fa7e1ad744a8ef96aef5cac5d51ace312bb95c65667334fa9ecfbadd2039f25d7fb83eb0f7654782047afb46047844a5e91b1c75ccf667c53f4fc35ceda9b86df74435b24d556769953d9a621bc657ab4bc67102eee934b7ec3b1ba792fb43dc12cce3efe52a00863f7d635c37915895d94594709de9a0b96ab7bde3c4d65dd8d47d4cd3a67930a8c4b5147265f476bce788ad6691836651a94c6ecc6e79134d6ef5c1f0f24f68741fbff0010f87dfa4552c8d8388a3193b7c67b3d3b96b631c4a8fdff0069a8becb9955fac4ee88cf98b59b8fca3651f6af2b2cd2a3cd3a5b4a9acfe9e92a3bc4d2f1663c93da1fa7f7fe25c485e3efa4a3e196fbeb19cb5a44aeb7a293b0707acf6580d773e9ff00133daded6469827812fc228a57f7847329dee76c6d15647ce2e9190f12aa761dc7c93da2dc802303839f9c4418db1c8ad89733b15ec37aa7875ccf67bec2edff008ffc4d32f2634a3bb9b0f842d9e4fe1a2ab037f93ea6c36b31f431b9468935a320e78e66899ff2180323d652d847fa7ff44a33ce7efc2343dda80f59d622ee388abb571e4d631442c267c0faff0030b609039fb3109da584d49edfb9eb19134fa415a748a7031f7e12b3c42d99a838217d209a35dd667c9ede50c6c1b17efc62e41c453c607de26af3577c758ba87d56983132a4ce31103e76bf1281970b2f6cda61e9342bc13e4f77c333682d8fbf08bc3a8facb9bb9cc34768bb87a7d669c33d1bd7a4d3a2b0cc6a976e257fe62bcc6e5c9fc34a315793dc7159959e48cc6cd75f6be9994d0ba8f7e5a3b36da9e9fdbc261517628e2152877a4c8c0f596d7bc7d2273ccf1948c563c9ee1b9088bb707f697ed5d390e789da2a26273bfb73e90aa94dd59c8c446dc330e04b4330c2c583ac4e14793dbee186b4142b6de66b983d0c3a4aeaed1824d5d1f971c1c8c19a00456ca7981983777efa40770ef4b077712b76f1117ac1d3c9ef04d642c76d40ac2ede26a76f64db8661760b94e0f58b7b5c476a3391f2888947bbe3fcc553dae7e72b195d92c19c880662fbde50ec1177196eb15d30a0ced78e44ec69ec77e39f5958cf07a8c4b02e72bd652e1c7ce59ee64476091627bfe517fc3694525ebce632aa5a03c7c1fde507fa64f8f84edd6fa05bfa94e0c55055597ac0588ccb88da4989d657ef8f28d47c2689632ae57897ff0050ef32d0414603314eceee3c650b85665e9c45c0023607d66d166ef94ae55f107946a3e1341fe49657d1beb10f1ccb9c63020a0d5a6dacbc931d5d10e411c42c5c640eb295da8ff495ca7e20f28d4dcbb5abf19b9ff2eb9e92b5cd7bb3d671d9ae636dedb812e76c2a784f69e7f2fc4423b30253eebfd2566559360f28d6f76ce3c44a4b1af07a4ac654fd4c61fd3533b43db053f7ccb6967a50d439976a5c1d9708f861cc538dc0fa4ae69be28f28d7d67b5167cb106517ae229d9df83fa949c787319149f9fd99a3d40d9b5a5eeaced839806de0748dd257349cda3ca35e32823e9f4eadd7c263101d9de48f42bf24625a9b5622baf266ec460053b8f531668572c5bca768ce66ba9d8dda2f495619a7bbc78470197066e0b5ed12b436b604bed1636d5e82289a6afb2af1e54ca1c6d33529d8b884332eecfca03818694a0ce770025b7a2af6757f7899266974ff00adbcb2ea56e1830e8ac0788d45c07b93f2b6ff00b657ecfb5ba8946892aebcff00a4ffc4004e10000201020304030c060803070403010001020300110412211322314151617110142332425260728191a1b10562b2c1c2d12024336373a2e1f08292f1303443536474d24450a3b3158393c3ffda0008010100063f02ff00daf3c8c117aeb346c241d2a6b707b857123db5e3fc69c0c3ca721b6f271ecb51cf0b061c5578fbabc1c8188e2bcc7b3d1c198ea780a5206e06b756ba5262199da34bc6f07dff002af018663d6e72d6eac09ec26bff004e7b548fbeaf37d1db44f3b0f25cfb8d6d6236c885a556dd90745aa2912db11c64550e7a78837e149b5d57cfa0ca6e0f3f465e4890c85752abc48a8a7c539c3e0564d7373ea039d6c70b0ec70fe73f1abc8c493ecaf147babc51eeaf066dd95e70a1aac3303c4adef514989872229d25233c27b7a2b0d0e170e2427494a9f1691581b38b95e8a041b83e86261e4972cafc05bfda6c906df15ca25e5dbd15df78c21a4e5e6af60ab20af092807a2b723603a5b4af16b794dba6acfc0d6d61a6c3e214303a156e740440b61a71b838dba56a684ab6c9e32eac34b6f51c1ca75f20fa198478e267bc9e48bf2ad949e32f8cae3852cc58437e2ae4694521c4c52b8e2a8e09fd3cf3481075f3ad9e194e161f3ffe21fcaae756e345e46c882b631ab8fdca1b1ff1b72eca1b765bf420b01d95a20f6d70ad50768d28b45bdd55b37f1786bcab6a949371685c37b381a8e3636ceb917b6b0d25b74ef03e6b2fe63d0a632c824c4f918753bc7f2a4862c5342656b2a442c169301062a6dd5cd2b97de27a2a3da4acf8ac6f97cd45ae47dd403b9cbdb5b6c21d578135e3c5ff00f31430f879e3473e56cc68282fd25925c48e2f07035728f5b98694b741d2ad181875faa2e7df5b49d8bbf4b1b9ab20b51446da3fd5d684b2de15e47caf679bf3ac91205fd2dba71f2bf3aeb152e1fc91bdaf45061c41b83582c42f960b7e751faa3d06324d2ac518e2ce6c28ae1436364e95d13df457be3bd223e461f77e3c6892d72799ac462dfc5813283d67fa5627104fed1c91d9cabe8dfa422f112d9adcae2df31496a1dcc5f0bd940abf3a4cff00b3ceb9bb2f5a28abb3aa0eb36ab61a093107a40b2fbcd7eb32f7b43ff2e13f7d011c63fd8156e074ac442dd353cfa6551727eea4c465c8185ec6a2c22fecd33b0eacc469f3a03a3d065efd84bb20b2b2b90451ef7c74d175380d5e071504c3aeea6bfddc3faae2b1587c7611a1477b863c0dc5ad476f8268947976972ff9b854981c1c825c335f3445ee6c7b6a6c3b839a272b7fbeac8a5987215fb17ff2d0c43c126c8eebeed6da18e48a23a0db0c85bac558e5b7319b8d32e39f328f14ab9bfb6ae215cdd26b7540ff006734cb790b80ab147c58d7d20f29d02e5451c05b53f1f9560a14e0caa3d96b9a17f349f42ca38cca7957793e2311161cb662b1b71aef4c343963e64eac7aef4f1ac8b0ccc478731067b745ea3299e59d7c6958f8decaf147babc51eeff006c49e55e0e06209b0fceb0f221cf2caad6d2dade9a0e27666e7a4d61dbcd86a35ea6f47ed57662329e46b0cf1b190e52753a0d7954b23add40d4271a568d1d631ba369cfaf4a86ea071b7bbd1ff08c168da552585d6c78d5c3e5ca3a2b10cd696ca746e7eeafa3d51026d230e5579524f0b46597365b9f65472c987003a86cc0e83b689650ae0f2f47738b5ee38fac2bbe04f9ac998a6bf9d3e6b78a2d96b143ea1adae1d8bbac1e0428beb97f3ac346e77e601650065bf4f0a6937a444e1127454ed972a93a69e8ee627329dd553c8df8d6c63c4452131e99d6a48f12144aa2c72f0ac4faa6b0bea0ac27ade8fa7ae3e62a3f54562431b1278562343e29e5587e3e28e5586b1bd9bd1f8558ee332ad88e5ccf6d1decc14d8075b5c7fa6b4f2658e5275362da0f75361d63db2b0bef1d02f5fc695625540bc02ad8540e47107e5e8fc6574bb05de5bf23525b13aaf1cd1ff5a9f0cb1615a489ac5f65a7ce9e2187814aaafeceea08e03e55fb2b7f8ab0feb1b7bbd1fc37aff85a9beb485ab1cdd2f4b8a02c62cc6fd57d695d1244075df5b5409c941f97a3f87ed27f91aa3ac59636df353a460b92878541ea0ac2438650c766f2480f4701f1a56c4cc1e462ca57a083e8f47978ef5add95623c462b71ceafa0c98b62b98753562636866c362447b9d0da561b3f8d9071a281990b61858a9b73a67b9bed4af1eb340fa3b1f4057bf658567c2073118d76790d0da78f99812f1db300a4fbaa02e9a90cc472084d875f2a511d801c80afa2f1107836399198745a930d898f66e0ed6c79f1d693b3d1db7ee9ff000d222b82510023d951ed496276bcf965a2902e926411f45b2ff435b28f5f39fa6b0d7e3b436f7503fb91f3349d9e8ec9cad137cd691313ded97296179403727852a46085bcd7bb66f2473a2215f02bbee79ef1e14182ba0faeb6a8d627c85798a12bdf3e5cba547d9e8ebf547f8a90c72448dde57c8e06a4b7ce9141b130cdafb0549791a577cb999fb452f65169a66c3c4a2ed221b15a5ef69de489a20ffb5279d47e8ee23aa2fbcd42da655c2424dcf5d420f1d949f869fb57ed52f654b9c02872820f0b66158a0a498d4d933725a8fd1dc61fdd0fc752a5f7c60a316fefb697f84ff35a3eba7daa5eca8f05bbb39977ae3aff00a54e52211c86c588d2f51fb7e7e8ee3cfeec7e2a66ca33650b7a5fe137da5a1fc44f9d2f6542156fb97fefde2a70fe3193fbf9527b7e7e8efd21ea8fb347b7efa4fe11fb6b518fdf27ce97b29657f1638ae7fcdfd29e45e0c6f49e8ee3bb57ecad7b7efa4fe17e315871fbf4a5790dafa0a8d6297c26222752a743c34b0eda581d81758866d79f3a5f47715fc41f24a8facd0b0b91170ff1d47e19734732922df0a8f632eca4406dd75847867c44d2d984b24c9729f95478a673637bc7d156e83e8e1a9bf89f7a56097eaafcab46c87642cdd1bf4e0c91c96903abed41a8d9ce6c3c406454945afd34ab72001e6d0c6615c931382e233e30e60d29e4e3d1c6eca7fad3dbf9ab07103aaa2e9eca901171b21a1ed6a4ca776595532f4695b1996f87701d5db5e5f9d23ec5351aa95e15160f0b1dd8b6f08c0dd14b0e6ce636c97fefabd1c6eca4ebc4fe36a9da5bd99d727654bfc21f37ac20ff00a81f2a8fbe6059b26a3356299774ddb51cb85261c3e78d5d5b5e45b975ff005adaaf2b5e91fce17f46daa0fe3fe37a6db3dd98dc2f9a3954ff00c21f8eb043fea3f08a4db4a9166d06636bd38c3615a68f56b8e6753f955f1b849a2c46e116b79274b74f3d2bc2931bb9bf0e1fd69620c2ebc073b7a366a2627c5727ed1ac449890f7927396c2fa0d3e77a9a41c1a35f8e7ac34b021991262dbbd829f1b3e67906833704ea15b731ed58b08e38c794c698e20e6d9be52b6dc047455905dce8b5f45e26f62276c3bf583e8d9a4cde2d8dff00fe759b13a9998cab7eb5ac5c6f9421555de361c1aa6fd670cc368ccabb5d13a2954b076e37437a6fa3334b0ce2d2c7285b85228c73c901918962ca4eb7a0ec73bf0ecade5ba0f0814f0cdd34a7abd1a340b0bd90ff00f50a856604ec6351603ea9ac54d6b0390ef72dd34c91629608b3bee64b927db4a19173af116a792255129b2ae9ccd091943cce379db5269472e551ba026fba4d203c6de8d3501fb96ffeb5a453ccfe1358b5e575fb22b0a9946569a5aef5c6e911d3372239114c30f346cc6cc9bdcc6b5b39fc04c9c518d24b091b8c0ebcea3957c5750c3d1b94fd53f2a551c4c4ea3b6c052a62cea8e7502f7197fad62246242665d47aa2be8f604106598e9da6a59f13878e7112dd448b7d6b0ace8115e31751cb4e143125766596c1534b0fbcd146deeb3512ea11065d7d1b9bd46f91ac1823cbb0edcffd2bbe664cf0a5f76fc6dc4da9b0f241b63312c17a9512f582d1a2646722261ca9b08583ced95842bab1d456172432131a8be96eda3856b4d12f89266b1ec20d48f3308d2e154f2a4ef7de8cc807c75a53d5e8d4dea9f956086ba497ff00e43587b349b39272a56f616cc011f3a9a3924d8b1764597cdbaa0f8d4197e9885e58af945bfad34a18e2e793c7c4653bd46289d6199b4569b41413132acecb724a35c1ac8ca190e856a308328bde93b3d1a93b2a06854b4b736b6be5b56172c0ef892d99739005f373f754ef1a6d641891923f3b54a59f10c70f2a25a3455e249e351a478590aa8b0f06df751c337d18f32cbbb601ae3af55ac8b87d2f9ac3caf6d7eca48edc738b50c82e78014abd03d1a2b9d6f702d7eb1580f7fc18d41867770335ee3d76a78bbe9519a42c56fc8ffa561a75c5e148893292f278daf58a449a78f3a8b68e0d6930357c22b48e4daf9780e9a587332802f21f2af5a3315e618dfd1a3d94a0db2b358f65aa4789d9585b66c0d89f6560c8c46590041b504ebbcdedd695adff00ae1f6eb0d8761e0e68999c0e9b9a289871f48609b407774edbd267fa394e7e1942da848477badbf630b900f6d5deeb04de59e4dd75951835fa282b1bc87508bc68ee18c8e47d198cb461b7d743c38d4d1c2ab1b88c1bdafcb5ac2c253681618cf1b7226f5175e347db6ac0ff0001be6686660b7e93489844da04b8754e2b587ef7da36341deb6ad6b9a19702ad11e53bef1a5da6170983898db39934f80a9256c424ccd6b64e5f1a4d9b0d4ef73d3d198fd714fea9ff00eba4ff00b71f66b0dff74cdeeda9a81db82616e69be90c6be68d3f671725acd1c41b95b87227eea0ed8554b8562637e9a59f6b911a391b2ff8acb4cb8ad8bc6b6be7008bf4d62da28136d12877555c82be91c3cb6d9a01242aabadae08f9d21eae5e8c276fe16a93a91fec81f7d64e7def7fe54a5505010cedbc6dce41f7d34cd8882db358c65945efceb64cc15afc33034630d98e61c4542b9077c192edf0a8e2896d17dfa7df430b1e58d9422e7bd86e9bd48228e3b3c4e92e4e2de69a8712731c4be1d51615b78f6b5cf573f6560f7b3e45c99ba6da777c75f7fa2a9edfb2d58af51ff053f408bee8eb344fe16c46cec37812d7a2873457406e0f896a4db4714cc3773141ad654c042b7f2c47edabe55b8289d7caa3667f09be731e3c689cb1c6d9d2c1f88cb5896e33cb25d2c77625ece7d95277fe2b6589950b190f92bc34f9561c79aceb7b5afbc75a321198f055e9357c435dba390ee6e395ec35be0483dc6b4366f34fa249edf9563db98047f30ac493d43ecd6565470f0f071d07fad3e0e4b6cbbdf90e9aef7c6c724b853e23a6bed14d973093c51bbc6e2a49a55d844cdc586b6eca78946e056b0ff3549a7969f3a478afb6b5f25eca68a77ceccbb892459537f4e57e8ad5429662d65ac0a1f14bfe559bf46cde117af8d5d0fb3d108cdaf6b9b7babe90edfc751a90c46d0f0ed14a38becc65eda97aa05aef62f9a5dddd417b56da589d558e6048ad9a4c3683c9352761f9bd4bda9f3a83d4ae1dc8a55d0c4f7f7e94642e45f87556baf5fe8dd743d35965d0f9de87c61f517fc49589f374bf6e7ab7d66ffeca998f938407e158e9553c9540ec6c3850c4b22676d574d3d6ebf6d3cac6ed95b78faa6b10de202437c78fcea1676b9318b93fe2a9ff00c1f3ac3fabdd78db830b5335b543ad023515a69fa595b7a3f950653707d0d8074b01fccb528e974fb4d52117395db35b96f56273af8d875881537d6d519ef669e6dd19ca9dcab1dc03a74a9536885b23102fcec6df1a194a9658f803d9fd6b0aa45fc0a9fbeb11ea8ac37a9fa009f2f46fb8d4911056293791974d3a2b2432097cd129b1f7d7eb70e54e657976d0646bdff474d579ad665371e8661c7d707f9bfa55b999a2fc55202b7058dfe35f4848d18764855816d75b544a648e32a46eeaa08e8bd4909ba83bf158f9353c8336654241cc6a2717cef87bb1bf6561b5e1047f66a7fe1d617d4fd0d944778d6ce4dcc6c5a82c2daf4d323de3910e5653595f5b723a835951f2372adeae356cdddccbc398e9a0cbc3d0b8fa85fedd46dcce2631fdfbea7916d654ce6e796b52ee24db70801e8197b2b16cb9cb20ce16f7b9e758500e6c661c5d72f949cc53a86176ddf88ac1c2fcb0f76f62ff004a6b8be5c343f656a4fe1561bd5eeb35f5ada8b77d620eedfc84e669310097e3af1fef852e2f0ffb51a11f84fdd4795647b95e4798adf39a3e9aefac04af97cb894fc456656901eb6a0b89873f5ded4922f0617ee5c70e628329b83e857647ff009d617fee01fe45a22166591d506e73baeb58bd90924c9e200c7cef8e96a30f7ac5853138fd625d73827a291a0c361e503ca096b7c29b6d061e2b5ef9f0d7d7dd4f29fa43073911e88d05afd5c6a5631ec4654b6edafbcbf2a97d5fbeb0deaf75978c317103caeaa12e298c879dfe5d82b2db4e8a33429994fed21f3ebbe70673e6f7bf57adf3a2ed59412bd078d0d2c7a391a33c23c1f949e6ff004acacb706861dcdd41dd3d23bb94f887e1e854a7a22fb8d613f8a4ff0020a2cba3de2171d82b1cd116468bc4b1e1bed58e49e690ac442ad8dac3a2bbdf0e3bec26fcb93c93db4ed88c43586b9722d85e9d84d25836845b5a96597100c923e9956dfdf0a97ad2ff006aa0ecfbfb8ed7b33682a3e7ae61d67fa52a2f01dd69601a37ed61e4fd7d46b69873bedc2fa67ea3d0df3a3981523883594e87957833fe1ace07806e23ccfe940fb41ab1e3dcb56ccf8cbc3b3d09c59fdd9f90ac2f6ca7f96adff5112fc057d21d7907ff0021afa5da06c934d38851cf93d27dd5388f5f24bdac5aa375d4656bfbc7e753345660774237026da54f8dc5316d9eedb92e86a4fe1ffe74a8d2b1824d0477dd1dc58577e25d2c39daa3926b165b85d385ff0045dd478fe3a5b47a39df66dca66e5d4fd5f5bdf5b2954a30d7b7b295d4f6d657169472ad931f067c5bf2a2a2f71cb8503c2ae295c711418703e8463cfd43f24a83d59cd499b7235c4e6b91d1caa43df88998a36f29e46f6a99d71314ea66ce54749e54622994331bb6bf952c5b6096ddbb7683f752da457bb701ecfcaa378902997c231b713634fea11f6ebe88c4aaddce70d6e60134f208f26eeeddb7ab3917b1c887e1f9fba947ceae476d5c1b8ee925b281cfa283c38910ed3fe22b68587e75b1c5c7df185b919478d16bc50fdd5b685bbe70675da2f15f5855d86a38914b2c73946e617835049c869d07839bcf1d07afbbd46ade69f41cd7d21edf92547fc19fe66b763663df8cd61d02a3c2956da31460f7196c2d734f389771b10bbc741af034d0be7bc9bc8cbc35e151c6a0b9d9dff98fe42a08917798b7dc2a187cc017e152f55c7dba3874656d9928a9cf5bfe75967c3bc73aae4b30e22f7d3e151e4d628b9f5da80af1b211c0b2dd6963fa80f71893602bbd70d98c64d9635f2bacd1579b3e21b7bea29eca31164591b5c9982e5abb629190f91e37c68ec9c6031c38a790deca68b1501d99e120d56a588484006e2fad66bdcf3a0c843035a8b54c3d07358f3d647c450ffb793e2c68e22162b277d4ab7e3a694933492664dc0aa9a5857d2384652b16887a6fd349f4763a2ef95898389231ff000f9dfa2a58e190ecd1157364d1b7ff00ad09228f6e436fb1d2dd948f0ccacf7b94bea343cab11ea93f07a9be9361c542afb29dcea21dd1dbfd9a92522d99ad4197952ba90dbd7d965d6a49a61959b82f40a3470c874f2e84cc2f88945c9f3474772d28bdb81abc534b11e956ac3be225ef84cf6cedf2a3b3b18bfe5cbaad17930bde9279cbe29f68af0236c3eab0a95b11950b1dd8835f28aca3789e55af8eda9f41dbb2b1beb7e3343fedff001d275e2e4fbabfc46be943fbeac57560f5a9403ad974f6a54916226c290e154c65c5f4028e330b3e67b15c99afe49a9ff867f1d447d6fb46a72dc1cb39fefb2a316b28dea41c331ff5a6465371cc6a2aeac187553bf3e8acf2eb129ccfd67a28003f4228fc956123760a0aba01dcb9896fd234af10ff0098d78340bd7e8437656256fab3ff00fe8f5094c8f6c3a83987d6b7ceb0fb7b4d9ddf2852c2c7a78d09a0c90c6d7f06731fbeb104e163c338932966766121ea15880208919a3fdbecd959b4f175ac5c8b1096e56d63a25cf8bd7fd29678b11858a17f150c2188f6d1579d65318e496be657ff00c6b17727fbbd3cbe6a487e26a4bb6a6c9c28506e8ac4bdb7d8922dd9614141cdc16ebd54b08bb0e2076f0a8d2dbdc58f5fe8dd87847d4fa1b1aed551e4608aa4db31a593c1c36650e8ae4e6de3f7de9467ce36717c594d6045edb8cdef63505b8b5fe759de359276d73b0d453cc8ba68d900b65eca62b32c113db2aa46bf1d2acd8fc4abc6d919132ad8fb054d926964ca9ff10df8a3fe5537d65bfdaa403cb7cbfcf4b184caf1b02ffa0cc7951722eabad0fd0507c55de3e8761e299564c4c6c1d35d54f2ac992d21b1da13a78c74f8d48551932ac0bbdcff00bb561743fb2b6bdadfd6b0f876d56219bde4fddf3ee3e5d7779545d94620c2d345f11feb58cfe1a7d8969fd43f8ebe8e8bcf91cfc4d6366b68666b7cbba6b660ead46623591afecfd1da1f1a4d7d9e874c6d73938fba8f6fdc6b1132dc2592d7faaadff8d41fc23f8ab0cdff003101bfbc7f7db442c8633d3607e74716711b7740747893f2a8e57201917920d2970fdf120411972caaa187b6d53da79a5021d3687a55ff00f1a907d53f8ab02a0e53b3975e8de3425650ba6550bd17ee9a58ea241c1540fd0541c58da828e034f436e4dab14de2eb62fd1cea206565c3bc66ebe61b7c6b1a260c252dae6fe1bd42d1adfc0ebfcd5f47cfc0c4b73d97a136d54265cdeca28b2066914b2dba2d587f506b52e2d86b3789ea72a3d7873f00df9d49d8df8aa03d1137cdaa1f547caff7f74d28e5b41f0a1fa19fcc17f4383a74d88a9f1445da17b4d18f3395bdf7ac2c70e69cc7320dcd2fbd534ca0db33687d46a2d2c2499704235616e3cfb2a2e8d9d3209f751ca80eb7d28611628a278933996326c40e56a656ba46960140e358461c0c4a7e1536467efd489f38b1b5b251f51bf154684f8d64a8bb6b595072d4f71aa493a2e68772e6b51a53c9e71d3d0e1eb0a9b2f978492fece1f3a1243b9212cc5879daeb5e0f13acbb46e17ca6d6e1cef4238fbe5e191103a28d2fd1a71ac54251864e47ce22e68b2e33ff00c7e1331667e0c6a348f13df9914e60589d0f1b1a6386e2f6366e27b2930d888a633c5bbb9169d54f8a930fdef7c348806baee9a6ec6fbe9cc77da0bdadd3cbe3585533184b5f68bad974bf0eda8f2feb1651a28b64edfef9d08e56bf58d47b0d39bf2a99fac0a1dc03c91ad651c2fa9a857eafa1d71c8de9a5bde318774908f22f6b52a2b6d017b86b5afaa8a653e333eee9dba7bafeea9933e558d85ac35d46b4986c3b8519bc21e2dfdf5d6464fd52f951069980e66a4c5c3108a555c9b9a0b543d8284ae848f19b29b1b73a53809a59b04702ee368f9acc437bb8548be50cd7f8d627688b2307e0c2f57550ac3816d7e3caa5efa54c2e2c1b32cc2c0f58e558a2a239d7316461af11ca995bc65dca0fe731343b84b282e3974520e936f43d1585d4b8b8ac5c47f64238f7574d4c95ded90ab47244a0937d3682f51a24b922967956c07d56d7e35f48c37cc1670b7b5b954f2c9bd2caef3661c38695f452459f4859b71b2eb9a9a29e0c3344da6476cf7f75156921c2dbc5108053df512cd22c97ddb2d9753589658930b3a2150093661639b4e9a555df94821ba398fbea55db33b4ab95ba2b2c729575dd21f796f48f320d91dd910f05fe9f2e3565cdb17e19bca1d07ae815e12643f3ac38fabdd6279f2a8bdfe87c3ebfdd58b1d7861ffc86a79ad622453f36fbabe8dbf1cf237f20afa4cffd47dd5b10c77d9c807966a11335ca4ac8bd4b9bfd68a78f22f8cddb58491b5825b5d08d3a38561b411a8259994701a0a487078a1262c45b48a407f683a09e9a02616c449abf6f4771ce6166e469c32f1e3d06a789c03361581b9f29397e5eca89d54bc0a6d9bcde3a1a847d51fa121f313d0f1a316beee5e37ac4d9336236b09ca0df714937ac3cd032abac604d736e561f68d6117cdda7d95ac7ccc163479f4d74e15b7bdb67bd7143191e68da55da2db86bc4d4b8a32b48a357541bc2b04abbab193248c7c95d3f2a38c8e4dabb4a63310f21470f7eb5b3fdd303fe65ad7c5e4dd1db455fc71f1a27152f7bc24951205b92dcc7654795c344ea1b4e60f03db7d3db480f8b3c4c8dfdfbea5c2ce3398d9b0ee0f9407f4a308f1578767e84efd26de87c5ed358e6faf10f837e750e1a5c328c410a63245c1eba9a5740efb46009e5aff4a851542a66cc540eda98924fed6d7a85a33756823cbfe5b7cea5503575280749a921906255435ff56b65f6e9734b377dcc213a785c1f3f585a95d272a4aae54910a96dee57ab1d455d2e57ecd366ce467ce8f16a636f2811ecac34794a848d23553c6c0dcb7c00ac09fae47f29afa5d7f7a1aa36e76ee9a736e2fe87a16d0588afa436633bf7c2e9d89585292479910dc5f51521fdeb7ccd2b31b01978f69a66e9590fc4d4324f88ef71aef5faeb072262ce2631b51ab7658d4c628d48da81edd684d2607240ce63b89ceac396b7a8255831178cdff6c1b870b69c292453756171dcdb04c8e78e43607b6b4014b1f69ac19fdf8ac7c874124a2dd7602b4e034fd04ebbfa1e6e2e2b2ecf3679effca2f4830f8038691fc437ebe36a80b68eeb9daa4c348eeb124265b2748b81f7fbea2c1c43568c20a81f12b9f10da4684eea8e9ac41553032caab19eab6bf754d839ed9381d385be749f464a09976ef8913f92ea74d2a18cab0d4eb6d2a38646d6ec13d9febdd05b8046b7c2b092a78a66423df5b055fda795d035a1dd3a5ea1ecf43cd2b6222da5a424517850ab822d63e2eb50a8e01057d227cdc3dbf98d61cb5f4e03d9a9a713c59e0ef6017ab5ac93c4d3616fe31b5d7dd4795d58ff00350900bbc4dcfa2b0a82c0bb11a8e141d5b2b8790dd74b1bad65c6adac6db55edb5068c3b83d086a54923688f93aeb5865762ecb229b916f2e9651e32122853cf33648d05c9a469c9da4976b372b9e1dc847d51e87c87a8fcaa33f59fed1a93d6ab1d100194dae6a6f1b1123dc4c4eedadadad4bea69effe95266e39cfc34fefb68dc5190999f1b6b596dc2f538d90186b0ccc40bfceb04d0c81d9b5419871d38f455fa4b9fb352b2aa96bdaedcb7ad517650e8347d65fb42a6c1b8f072a0707a0da8847c8c00be5e57e14989c4caf8931ea9b4b0553d2052af13d035a36a8fd51e879b9cb110733f46951ac436f0dc912588beb44178d1ba0b527aa2a661134ab3a9202f658d607368d245c0d2ec7472174be8c4ff7f0ac62140870b199180d43006c453e2f2595daf97aaa6122bb09250739e197a3de2b0e3aff0010a893a431fb34476fdba83d5ab0e269efa916adcd2d0ab13d02988d2f9411d9c2b6d6da44bfb4bf21d349940f17951a4ecf43de38f2162a577e802d0fa849b2f556d344b9f265bafbad481a4516503536e550889848e15f54d6dba7f315861144649d08dcf6d61712abb39e3dd962906b6e91d3c6b13118944b888b7f7bc71a69d548cd03923ca6365aef311c0612e24da6d17368341c785418869d1f2b0b8e5ad4f808612562ccb15b5bebc4d032e2638cdbc502fcef58a314cb3315dd2fe2a54d362e79de2897ca6dd663fd9ac4b44e1c2dd4db91153e27ca68d13fbf7d0a2a45c1d08a8e1cd9f66a1731ab713d54bd9e88c43eb5324a8332f10daf65595428eaacad7bdb523c9bd141bf1df50c3e35b45737591b77db58a8a3740246f29735f8f0a386c6c4c8fb4ba6200b2dfcd3f9d491e330e4244368d18e045f97c2905bc3b80646ebeee2e4c24433c87308ef619ad58e9de3d9b48ee48ebb6b5808c7091ee7d8b43b8689a1e87b3df2e875f652e1b0dbe490aac63bdfe3cb5f756e635247f37c5f7561b0f8f568e57f064b73d458fcea38b0b881b45f081a37e06b35b672c84311d1a567c4308ee79d40d13ab31690861adb8d460bccab739cc1e3da9e24c6fd2124121ccd1ca14ebf3ac3c18cb98d432c58b235d38e6075b70a11c9fe16e9eebecff68bbcbda2a4289b30d116cb6b6a75a8588f0d1a8643eca1ddd799f4419afbaa0dd3a6b1138c3f7b0c32e7695a4dde7f9b5078dd6453cd4dc518e540ebd7caa37ef5cb037827923e2ae39fbb95234acc52ef94adf5e8afd6e56927945c464fc5bf2adbc1943119ed6e55b3187b31f156f6f95629e38638fe92cd78cb313b9cbef17a9966cd1485245d993a2dac6e2a25bed23e44e9a559b7a3f3ba2b3bbaaaf9c6b78db9ef2952074d8d4fea1ac39fddad1eea8ebf4425f54fc8d0c5e21e4d9636428f878f42e9aff5acff0044e3a58fea3f837f68f15a9b03f4861f658944cf9ed96e3ac567817be20c4be4688f8a7b7f3a44519845a173ae635f48b4e368d09dcbf9233a0f91ac161f2f8e634b1e5ada94850a438b91db524ca7fdd666f6c79ac57eff0065427428d9b5ea28b50ab1ccca32f7275800330864318ebd3e36bd472e397c2acea91696ce381d3aee456626fe04eb5841fba5a2470eea7ae3d1074d73b03603b2b0f0e260495446376417e545b01377b7eea4de5fcea49b1336d19182e1f0f1b5d5babaae6a4dbc2222eeaa163f107f76a8c28b0e358bc3bf8b8813477fefb2b0cf2958760de1559b9aeb71edac31c34eb292f9980234d7aab1ab2ce811d9ac7cebdeb078906fb343cafc322d2b0f1c68fdbd3dceba5b9caa383bb8ddec039f59a3020b5c089476e94d848daf32a807ea8a1dc3517ac3e7e884cd6d554907a34aef7951a440d659472de2003eeee403cadaa91efa8ae6d96406a1f54534d1451ba9666cc6d7d7b6a18e5876f24ada2644d6fd95260c2ec80e0192d7eaa95a4c2eda256dcb793da7dd587526e725dba6f6426b6453f5a8a4ff00321e549246da30b8078d440b58337c06b51b247fa9a0b6d3a799fb8567ff008386d7b5f97bab10edc5ae7e543bb17ac3d10c47a87e5589bff7bcf5bac4682a0b9bdad6f7351a9213e321bfb0f7608bcb665f6ef0a92262515f1479db754ebf3b5623bdae8a2ec1070bd97ff23533cc5836d0e651d0bcef5f476c09441098a3d75f18d46ce43648c26feb6a2b0b1b79e3527d5e9a65c85234d175b8a9fdbf750eec3eb7a2137aa7e553f6fded47d949ecfb268d433329cacd958ad0cae331f24e8683cec75d00517a13221183c21babb7967a7b2b3b41609bbbb8acb7f852e09a32e496dcda66bdf273d2addef35f5f0693df5e46d583c3ce3633457d0f1b16246beda669e69656f2731d3dd4cc205122c85918b5cdadc38d6ff8fd1d1589f6fcc50eec3eb7a212765626edbdc47c69e50d979db88a5c4c7136200b66d98f1776a3cd0489b4eabe5ede8a865cd105cfe7eb4a8f062a4ecc316a5683018a55e1bf015cd52671deeaee5e4da2f8828a28cd763d5a0e75869ad96f291f63b8aadaa98b291db5b91e5f6d1f1bfcc69b7a43dad532a46aabaebccf0a1a9ae27df5d3db517ac3e7e87ac91c22691cd8066b0a9e79e11143e2adb99b8ac4cb14a4308f2888796788d69db4cfb33980e46da8ac47f83ec8ee61fd7fbaa3eca8d657032c7e0fdbc6a6c972821282feb1a5cf123317b95fa9ceb0363a1c537e0ee433137cc837476d6a1d3b50d649263013c36a8541f6d1c9346feab035358df8fdd42b8d78c2a255f3afe87df9a383f754983b5a4818376ab30a816195d030b955e758c697c24c25b19355245bfd6a7c3c734cb19e96bf21d3db5633b49d6c0546d8885e6ded32c997eea430ca910b0d1a3cdf7d089a556963b20611db4e7f3a9c1446c9ba2ebdb4d2cd875670d51c18850e70f366cd1dadcad61eead848cd14bc83adb37652e27111abcaa2c81b50bdc649501bd1950edf0ca77811aad62221a476b8005ba28695e20add50bd82a3f6fcbd0fc4b117b2ded58f397203b3007ffb2be8c078668be62be93c29e0eccc3e7532df7ac74f62f710f43d447ea8a6cdc337e1158b1cc4cd527ad41fbe42402fbb975d78d24271071b1a6f20986f2761acb2dd93a79ad5c1b83cfb99d94328d1c1e6bce9d2c726cb46e9d68777b14fa1f303c2d534c8184c4461d5574d1b76dedac3cb37d21b278b2b00cb6e8b537d28b881b55363085b5c70a7b07c2ce549427d51f0a68e5d278ce561527d5d6b0e7eadaa096c723656247bab157ff896717a9623eb7ddf9773fc35981c9274fe75e196d09e7e4d678dae2981e06b0729f1f2f1f60a1dd90f42fa1ee87830b56270f242db5494784bdae336efb8d61f2666964ccf972eb6e1f75418a316d7f57d9b2466e6a37f1194d90bfcabbef0fe0f1406fc7e78e9eba7b731665e8a9701368436ed43348ad22c5e304e396a19d75963f1f4b1284e9584c444b98326f1e8ae46a382c51b55b9ee1571997a0d7eaa76715ef92dc3a453b9e42f5143ff002d403db43bb349d26c3b3d109a0e33b4aba03ae5a4798045b6aa1cfb01e54445b5c3e095823323f0278560228c6826fc2d5cf2f2cbc53d5fca84d9032c9a129e2cfd9d0fd5498dc13eff001561ce861a5c23cd370caa38d0222685bfe53269ece8a099a511839958036069d4caa7a0dc9d3d94ae59a2881bed986503b07334a26b83e4b9f2fbacc3c265e0be737e546699b3bb31d7bb941f1aa46e45b4f44259f0f8795f304cae83a297bf6019f8348a848f75632111ac48a432e4832fbfddf1a8a63c72e83a2fdc747412c4fa3c6dc0d09306db4c0ccde115fc8eb3f9d7825198f17e67b9622f418c5fa9482eccbe41e9ada626653271ca4e66f751c2b42b1c2fe206d4b76d1314b227d5bdc51cd2b30e8e029635e2c6a25e76ee993cf365f56a38f981af6fa2251c5d4d4820855369e3fd6a0f1ae58cf21caaddc77bd8f01d14d1e5232ea623c40e91d228329ba9e63b99ada8fbeb0e6d7cbb8add2397cab061810cb30b83475a2686419a246173d543b9953f68fbab48a0782887fa7a28c8dc0d346dc4508b5925f3072a8278fc5717a19b465d55c715a03119511cd83f0573f71a57537561714c4e9c2a5c3e161665da9ca795af58795598c8bba6622c41e6bfd6867f1db79afc6bbcb0fbd23e872fca806d666d5cf74c9c86ea7e74037ed1b56f457774957c53f752f7d401f66082186a2d51627e8294c902e8f866e3c6a2ef88b638961730a6f9af0251c9e293457f611599e0d804d2ebe21ecabae595652114f1075b51d9ab819ac1221c45c7e544cafad869d7460c29cf2702fc850c5e2d7f596e0a7c8febdcdde35b25be6e7d543132a658d7f66a79f5fa2f9bc96d0d646cf090fa32e9ceb1cf8062b8b5756dcf1f27d5ac1c98c7da629835db9e5e57f6e5a970d2ccef8189bfddd4d8369c2ddb51c6aa238b0ab72abc3391a0fefaa895c3cb31e416d4536498484f2320b9a59a723118ae5e6a76777245ab733c96833df63c4df8c9561a0f45c83a8359265da41c9ba2830f187021ac6b8044be6b66cd7e7afe42b10d83b29725a5c5486f6f6fdd489848b26097fe78b67e9626afddb5f5e81c6b2aa9f5578fb7a28196cc47041c07e7e8ddf6794f4a1b51b9918f2cef71eea21f16bbad993774eaaf1167eb43fd6bfdce4ff25698471dabf99af0cc221d19bf2adf62e7a06e8acb1a045e851ffb47ffc4002a10010002010303030501010101010000000100112131415161718191a1b11060c1d1f0e1f1203050ffda0008010100013f21ff00f2d48c6ea1d3a815eb2cecf377bb0cc7bcafc129dffded1526b1457525923dd7eb23d4a6591d2a3bda8fb728c277063df83b69c0eae60a7bd1d99d09ce366d08a17618f42e29e13f665cf66034d16c3d8be63aa125af314343d5bc541f4e1be4656015d1eb0d192145bf58780d60dfed93fbbec52612e5ad0eba8d55d2e08cfc42a75a2569fd9806f81ce5e99f782eab08bf0238f76a9624f1c3ba91a43bae55c40cefe1af7df89e21b617057a8b1572adcbcdf101902c4dfecc2e7ac957ae9ffd16d88b5fa9ecfe2e3842c80a1e3f339611a8e632595a2d6af14412f6c7e1b9f689d95c8bfa866f42167b42031dc8417d6f8829f6b6c1c315ee9adff02a9e84cb50878302cefa4bdfd959d793fbafd99bc439f5333c684ceb6934768366dd4b8fabc072a69efd35e07ff7c317b67a0378a9530a30f4d8fabda541b5b5b6af2ae57ab05be377760377a11d1c74c75dcb4f467becba6d958f0213ace72662aa54d203dd4c6be5a1ff007fb59913670dce1881a6671c4f78cda68f466514783757b4b7ed79b0fe1227fd8a84d1fb26973b06af5e1d5941d1c01e96d19f1181134cab4b6d8cb5c913118b79a3b0ef93c994f9585e10d0f6b46319c75aebe6712f5668543b28d53db115d01ae98882aae1f74cc89ff698f681b53ab3d466279e6190d3adce31abd0f6956330b5538d9e17d5038c338dde7abd7ff4151468aee6de1f0cbcb9e79691614d9963dcf68f248606c991f58b10d0746bfd476aebf8bec6d3ddaa1e594bc7a1796be09557545575ff0028cd9d94b59e97d1ebbe87d65883d7cc3d2a00162b804bd08f3360eb98d75cd4ea4b2119279fccc20df469a6f2e077634c37ed11727acea84c22d1be9fc23a5ca1579aa853aebf4831e98ba8005051ff00b1facd442ecab7aebef71d65858ab0d077fcccc67a95b8c7e26d8efe82782c51fa00fb1afbe0631698fae0c69f11171aa7e54b7a3f593047c5d361576f785e011f8c7e533d8ec16af2afcc65cea0038f229f32c75c2373fefa28b961583673b90fe661da06e6d7334284d15a00d07dd07b259fb856cf6b13ff00999938cbe29eb0cd3aba5a77da05c11fdd043d07d61e68047513f7f658ef1d2a3d1a4f98ecd8e21206a2ac72e530cad2e1d866b5a1456f61e3e8a4d4b8ed000a0a3ffa9e8816cb05c416bcba40340014150574332c751d4832c0eaf84eed7fb084417178bfb7c99647102132a684cd313b951bcffea635d7b668b9e206f6cd169ec4b9b3570dde7f6f8465050dd0d6206899674543cbd462eeb74def995641c9518764791dd0ab5632ac6a7fc051613cc7693aad4bb1ad768ee843b12da7eddc3c4e8b84214ba1680baba384a21bdbb355d759763563ed385d4a0e1570db8969bd37794a022647a345a0e230aac0601d3eddd322a54303bb51f131368c2bc69e988218c1b5b455fc589548cfb5fa557dba6e6dfc0e269984a6595732eb33f10c69866127ac0d259036fb7f5d8b2a59c15b2b12de015948d6434aa5b7ba8785b048175693271e2c3f1a32da001cd5af2c51c0101c54aff78ff6f8142f6c051d0bedeb3127514d11bad3a3496ed02651e4afb4d5780793d1ae9623cfac5ff10845cb9fad5eff001f6ff80b7bf09e58535f34c2a0652de664c3af3781e4d1f1ea4200cbf4bbc4beb3c3edf55d088ee9588b86b575880f715d595e4a4f820c2682175f9106d8c0d54fc7dbd4ab8456679fcb298ca4d2ebf7af1025cf26691af5e9123c4a38cc94d3add44c5b55ba1b2a45bc5dc91c75cca9d21d502fedd6b42580db25f7666ffa915dcbc73e665287476735e1a9296aea69c0e2958b7397a964650308b6aa1f7563fb3c9320cf6a15f927b67dbba935fe38f265784ec84b7eedb39eabc334a604d8239e8db35e3dc32bf07495378f02f7f89e014ac3f6ead4685a5d849626e99b56ae19cee7a4b7234064db819d663ea85efd01b0e1d6f26ba4d05ecdff0038c903822c37ab1d660e537d156bf98dcbafedf6e859c8bf0fd46a60dc89aabeccf488a8395d451bf7944b38abb99a9a8c6a541ce8ca63f0d15564cc57da7e5fb7566e0fefc41e9752aa2fb407eac2713a0e8fb3e84806e0548d1f58746f9d56587bcf60fcbf6ef697cb1ac470ce1ff1318baa2e43e8c15e0ab638b63d12b164ad4772dad27f4757dbbd260f6fde03c0d15ca15895a65ac5c9fd3976983bc16c82b22a71b1801ebf94feeeafb75e1f47ddfb987ec818a4e5ca3fa634888dd28b1a4ea1656e93e67cfdb9b477d42fe3bc54f5fcd02a0f3e47cccd8961cb30902fb4b53a0a5de4fa773d171df9fe7edc7480eaca351d0db2dbe72cb85489cb0fd4689a2619bf446d4c32d360c0ece26a068030dab9630a3ae61ea545b1d623cecf8854770fb71d76a3d499aff1da66cbde8c9a8512b2b56bda5ac12686739bc1d26294a00d6ba6d6f1da5040337af8942b62b566864c5c01a5a6ebb7f75fb71d7790de9f83ff0030b56e3c869f886cb4a2cfe8946d63a60ee3d62a71ccb9747d9da52d60500aea4cf848a153aec5b8ccafea7c2d52277f87db9ef509fc4ff946eee43b4487a3117f038439da8b4ff3a4d86c0c4811fb9734d416d653ecc8f64460d63d58fcfac30341fb6deda2c9ded069d56d739e8f0d6628df5925d2d689dbc1ccdbb238110329bc044ba63516ed2ca8a598d1a0df52da1a732bb091dc83575f6e52da08f4ff00b4e4647c32d7d91409c18a0e1fb44f80ce9aaaefc3297cc377b9476a972abc6ac505ec432f2d446a54d5a7778d2567bc57e25c2f56cb7ece7edb55e08f07b64f97e65bf181b46a33d4f79d487cc7ee95e17910970cc70a15082af7875a3a9a2dc3ecd4c98a210ad6931966624bb563b094e2a390d4f54e6e7eda3aee1f329487257f3a9089b9fcd60ef9cc3100b05a1766b4d758af068a3594ba606e1856340a5e4f99c75c016517eb0e7f117a860cad6685df88e120445d6ffb8981017f6d59782e5dcef84989c22089ae395e060d74ff0048fb0bf03c5cc74259e3f80e35974265a2e05fa408952b6a3444d6138045739ede932f1d804bfb6fa209ee8dd279f2ce7ac69e465190a707317fa9a178bf3d2a014207454280d815764ac684b4b90f783d4429d0dbc156bc43ce3168351e666d14779f6dbb70b1935857103eb0dd6869c8978883ebc44b1801c25ab7cd454c15936ff2bd18b9471003686d88adb88cf57987a6880234b0bda04a2806d8d9df335ea038283978cceb60fb6bfa3ea972205198d9248f90e440c670d439b01a97b2a609a697bb3055f4990c2064f74d3a41d54a89be4cf69647a1318e747390e23fc9346125d0d48eac763eda68797310794daedd37962b6a39b141b656fb4cc1b0357283da5ca013a687bb35e6179ae084ae86677efc9db3063b9333c2f2bc8a5d97a6bc472b21c17ee1c94901e93a0b1f6d386d7145e640334baf9fca977c0b19411bdb623e366d080889a96a8aa97bfc97637f521f9d8a73d759a1274ccd07c0db9a8eb1ace6cdcdae195efe5f9d3eda4acd6d0231a475b97e0892582360cf2a392bde01aa8a6b973f273986a8e4f22642479975570f80d970ddd8c88febea2566b7a62d39a2e13bd28bed2c5846750365d6e056796778e62162ea0881737163f1f6c862358751bc69a473a47a839e0b59e65f9c41d4344eacf24bfaed3c0cadaf21516f10175a0e4d4f46d8f6639eb374a9a29d0703a8de38bda2e63e801ed9260974d2a8560b46b1a191a98ae96c325fdb141ff397f12b1cfb0bf70e1feebfb941e15e5f8216203f337f98c3195e841dba43774505802092d1717d4ae930f3514c201f78b2ebe076cc8d5edbd4a4ee0eb685638b22148510b606ae07899f46c5ecbfb62d7c5fdc9e4a7a4ca5db3e147e629b155be0fbc047a47a001a1ed8ef098fa53438df808551151741b7dae28c70a6d45ae7b0fbc03fa463757d68c6c1d54a68b46d5e9b4b5422bb44b1c73ae362516a47a0327418eab4aae757d7b6f6fa00b503ac19433c5608f5fb550b3febc888e9e0c18030767771d263617b5930b5ae146bbed1c967722b397cfa44e66f84550eac3b710d69dc182aa5cf39236ad4680198f4c788dd86a7aa9cf5fc4004084ae861e4be55030f3c6cbea39c34222be77015211b594cdb988f013b0877d2274089dc2280e610ad3c62fda580e9f3fee21f4479fd11285016f551f889734168c8e3d536b8caa9377ccbd65a15b5c27e1e521d96582cba9a6dafb4723b5066e83cb780fc313bfe916f5d4d230caeba7274c6f5cc543d74427357bb1588b4bb218cf825bbc37c3fb415260c3327d2528c6d282ce1d0f333d29aad4fb42fca3b87f58afae4bf3fd4cdc1dbb5610b5b5f331736fd1a8fcf820bbb07d8963a48eea6ebc4a32550dd1b41cceabd0a7e8d43e858f629aa86b9fa3394b6e9fb126d60cbf4436f0f09708684033a301327a082caf6f63fafb3ceb0eaeb86013b6c8e0a75f0cb1f0f8dfa8a802d85690480ba175654eee4d25d85527a8bcae1ea952c02fce4358bcc96982923e8611f2e5e55ff00733f48a15ae9faeaf1146c6cd3935f5d6648ee32b159e44d195146e13c230595dd1025bee764181a64fb3720fe4be2163b797b44cf5bb819e6538e306f81d25ab65714356b435dbacac3a618c683c87b4e275c25ed1b771352304d031decfe52ceebef1d9e8ffc69306ae3f8a990af23d4f0fd4ed2f48f1b18686b6ac2f6a19e02ca654eb2bc2cad0b44b764793fd84af1edf6606f5af55ce2e70af170051c1e456dfa104b7a3c9b8c59b49722f2d2cc09b3382ff2692b69a7a9ac6fcb296c3b06d73c796206d7aaea7f72bb80fbcf6cfa822e022dd8094bd8a35edfca1c4f2470ec7460bcd1f08ca31da5a97476ed39d8afa3d1eb124dbbcced604a2e6bcb8066b4176610bb5b70f1f65e4fa7b7ff0013016a8e817f940e7146831e8eccdf6fa26d16faa61d35ecdc9dea3a0b832e4771cd9dbb4be8008bd2ff0018cc226a9b16bef09d62a9d20967c83dd9ecff00543011825a17abf4e57ab83cc74b5db7b429318e150e037ae54f7396e6358f0aeb8cc0b56b4219433d5ec75892b06f840aeac46abb89c90a7690b94349aa27e79ab810fd959aeeefb7ed1e07fc491d665137fec4412f834dc77c187425852d916532c506f9950ef0c5e871fdd23a9ca053cb3984a1116915ced5e22973176d128b0e8805b9c7c653f93abf400ae84c8cef834077710a8229ad5e30200212806214a038303f7095ddb15486a8d8f1f29a11e92a241ca53b2712b152325b0e92f07a88cf590a847c27c8cb6b477481cd6daca5beb32ee7cf573f655dcfbf8f3057f28fd706c0476a4bba562bdb5cd2d3c4ca7957647223c5e026f6a94ed463ab085294a179c2998a1ae1b41ce93248ad5719bcbb53cb35c265fafe91df75f2fa63404aeabb514d7c0f61eeb02cc75036404c41f9ab4785c3b300c2ebb51fcbb7740462a0d27460640329d1890d77aaf898304be7f27cb89505598104b4115cb57a932ee0f2fb25d805fd7783b0f480fc7d002c3e7eb4cfe6820d7e8da068676ee3e7177def820fa5c766ac085910acc5bcb5da393ca345e541b4f59fcc017bb22ca335b6efd2d110facbc5e262d4e9a0b3e9a7aca19a215431610014dc770e7ac12c0519be1b8fa87aa27d5b361cadceb2d140d5351d99a56195ac1c71292d7c76978ac4bcaf8a653289069d49b40c7d56e4f98a4d858fd8ee08bb41febbcb2b8f9c458266d155944355a977d69df43dcdc72175dbdca274c798fb06696e576eef686ba16865ff0091131cc1af75fdf798e668a289f4dcb7be7383fcb314e329d9a7346d66b305126e2ffdb22d4d0acbd566900169c07994d49a24cce6606d949c16debbae256468ef1b6e1e9cc7f51761ae9d173e9e22cd311fe83be90e3870e1ecca364a6e0ea73057c7dd9f8c6cc0e1d488225dde993b6d5e3ec7f6d1e7e9f13f115f49e26e85bd6dcfb661c89f9b2019cef5075ff39028ed99712b10c5b36e977e91a58bab36363fc6b067080d69a5f1012e0979a640575be4fdc998c2560172fba04a3cf60ae2c8daaa32d47fa6588588620258b4e00bac45591ac0c673fa999980dc56ab0617f38a57b12e178c324d03777959c4170ba5a5929b19ced7f8e998dda8c397e1dc9a208657e49af5d2d45dc954edeae62789499ae1dd108d04afb1fd8b17f6183f100e7341ac8b9dcd1982d634170014c7ac12e2e1a3369d9a963ddbaaee5ea35cf7855819a098ebd34cac079a92f20f5888a50e71a9aa687def7ff08c65573d2d375e7e2575800eff009b9f12c590598232dd55ad4030c0d5c3bd3a40ada55be0feeac3ce95f73947c41ec5ea2dc87f3fe7d305efc0c2798ed0ba53489c685ebc5390f3a4b39dc276dc8f71753bfe0de590763f6aa2822e82a1ba62de9d222cd986bb8cc105a8dba7d8f877d3c93fe7c47fd3ac8f5d237e23aafef0c2fe843e4946d93fa664a114b137c364b2845471855cfcbe902be82e14b35438a2dfca62492f5db48525101e82a94a822f74baebb447c80ae5c6b051c9da5746e16415001404a98a80802c53b0926da0796bd185450a095165b362ded2d7f83d66b2deaf5fb21d5fca69ab40f72568d66b37d4e57e26bc4a68d9cd95acb8064eb3be6bf1283cc9037d5bf59af9c31bc19462229f01b2e58aee8159afa13b41b1eb336b4ba96c65aae1cc13a5f0d54f8f594f6a677c33179a6db7fc84336c152e2bb2879992801cb14f820a3c83135ff0c7540ef16d8fa45e0c7a85acd02605caae335654d4f1fc1e3f7f66bb4bcfb0e8434abe08ded2690d445f3b613e63dab573f8e9000b1d6fad0973c2ad49b1c40c4638052c55adb76bda2fc07849be4f3c452bb523d2341d4ef2bf60c650ce36ad7986f54f47f988e32be165f618c8914aa185af40f695b28535a52c5851e2292dbd3bae3f3003c12ffa5c895b2fdbf43d7e1fb3b91607965ecfa4d921ea50f9f6e8660d0310ac2aded174103100e4df9f64a8d370c6b01e6841f112f2ae3c64c1b4d63ac610b283c35eca2c5c342845216ea9e3f6c76b523908a095cd046f81af135c243b304a40255f546db064a7669fbf3f67258ed0134addef079577de846a077b01f75337d2ff0045ca9da6f65a7b10b079540fa098cab821a2eb1d104558a6b46d89c41f89001dd9b392fbbdd0387ab185a28f8937e0a22f22bef8865b361070f898c5232e71c26dad3be2117407c12f8a269b9a2183e60ab4603ecd50206eccc49ad0d15967ad12f46b277455d654e9aca79f0147146198ea0b4bbab6e3b1709969105dd8a7c3e259b817bddfee20dde8ceecfef586f38032b40ad66012b2da87f2cbe4fa2f30ff000b13d54feefe65deb2c4691adf4ff583e865041d260bfa0ca97ab44f2707e7eced5a394d119aa362ecab6d9543a9be20d898a5ae90f2138ccab78eae358b038e41746e70b6ae13c29bc7acd12bfc94dbf4d9a704b53a6eb80d239eb509dc964617977f89a6122fb22d2005a366ee36db5f1117f57da52f944a742dfdb1aa255aaad2b42ba5135a8b5a4cf102dccc3dda5d79f98ffd9404a04354a0de02f4df9cc6a6c56b90c7cdfd9c45747e79584291e6dfb23e1751a5053a19ca133547a94b5a0ef28b01b959abc1ae9e25443577b040f4c7582c409da77cec1a6bcc522ece175e67662abaf6500d1768046122283495d2888a2e4e8196d0bd6525c1fb49c5553d48bc7c89a8472ea24599e8dea6bb3bd942a2f0aa1dbb2124b62ff26e470f0bb72ee35f94fe65cce380baa727994a991a3898569059d5cbf6715406aaad5d337aa06e7b53aac66f6aac2b14b77526badece586de842f14c51cb70f68c215aed5eae8b79d5c6900621b084560e51c42a3ac79099ae71af5650c32c66196b0317b24bf8154a4133ab47887b747e8937a13a219aae3783d62a0d2b8dd0762ee80fbd7acc279ec2f75dc96fbf0b6f66636fdc57e255f41374426c1cb379032f76a0500d3ece3b85134758150e136841f626f0270930f5ccd63370a7f1602b828c9d9187bff51b1ce2e2476adc8c59669ee91b76bb15dea1b554001def8f7958e8c7d30c52de9bba54a3b5f37a02728f6834024301c8af184c8efdd07509ab6416077c83aebbceb112e5a3dadbf637176a9976b73a6e7b3bcdb47fcbc13b687d73342610812ed7c3ccae3b2fa0fb3f49fdca3ea9ea5bf1033aa57d287d2501b9ff00beb19e85dbdb15a46d03b0e97f3026f6e54353de2f4547555b6fcc5ac2461395e5d4b9604cdbbd4b1d460783dd436bb87ccdc144ecf5812c29a0f0b5528c21a1af509d3da337578bb74c1ea5af57b1db5c3a3d274ebe39a50c4664e04f717f47d9e4d21d641eb909d0091b66fde6e970097d6dee095d837f0301719d8e59658941625a1abfdd221c0148d0ca70ba798fd5455e8dc372f5806d5ab8bd0bded4439ab6b26b49d4aed2abb176a4b92395aff37edfce9cc6fb2395a442eb61a17c6cded2ad81531e8d02c18c21bd64fcd524565e4fe69afd1e48198607ec9a51c6d739587ecf68787d899e30777921961a0213036d9f484f61edd157eb4f481d1cd00569a4a49284af16c0158d36008f0125f216ad58692a9b97229587327795ad7d5a9a6a6bbd210c90d572c37461c4250085231b507cbfe21de589dbd72834cf59c46092cfe0505cfe073070b01e52305f6acfd662260e6619ad40daf63ecf75ad13d65fb30160c01bf562a38c805ac1eb00efe9be12568b05aa20349b0a7996d6298dd5a466e6546ce26334f11316d6d3610674bafeb819c8b8456e0861f4930537421a6e7128146c6e2470beeb59bda8c314631aeabdf787a78fa89f99a4799c3f2ae16e3021c22a5010d89dde5eff006798958613acd75cd235609f2841e2555b105a955da55ba00d6976f1a4cb18a354b1e903a083faa65f759aad74d1f035fcaf10f31cda52af7d6f0e919fd6c46ca8bf575e125acec9b268272b19ac4735ace65e13d1f4b3e854a67184ecddbda3156cdd31993218f5146bc9339e9454f1733564b33ed5bfd9ea9f883815c14d28fc46c63e0832c74e90f44013a0d4f98bbab10fa7f83cdcc60a210bef2f46c88d3b15d5ebd1e26442c89de10c06a45e5fdef321976c2959af329e06ef031c4b2438a58e859e9a4d1ae9acf68ec1598366b8d3899a686ec8dbccdd528e8e4f73de398bbb67fdacc96874cb44f11af11e5de2a9a9f67dd2c6f74cf91f112a3e8f8211a692a9af531a4db92da95358be75bde038319f63fe110f4afbaa7b410c0bf786c5c53a64e6643255517b4a045ce52d6097aab5a89358756e585bf03514560739d63b268dbde05ae08f270fe90bd8767e406fa27c4a3360aba94abbc541362e18717d60b74a980b4c35ae2507f8afb3c6808eb3936ed7e91c806a886bceea421d48dbfd4b1529bd3ed091a157957b09e91db313d4c3ec89e60f17266c8f80cc38eb2129038ad601b97c696d88372e514d20f27a4d8d7839ff008416f2e596709bca9f4ca1698b1a9a851058a859e69208327aa23ed326ead686f70298c8a33c5e4372120b07844bdcac15dafc7d9e1a838d02ef1ec70e925e0743b4a200d990035c841ccd60f207300f27530274a7585a5901c3796bb26b02f04a56a60e36b0949d42505c2a3b3e0733041ac54e00caf9da3762e4230514c0dab986f011868837e03373299d7c082ceb4372c90e5a22ee40a6f67502ad75ce2f11ea1d06b0a2b67b3a4bd02fee44c47aff008bc7a8f48ac39582c85637265ef251a2a0633c1b261da7da2072bba56e54290a751de23e1035108580ee83cd1ef1c456a334ff0033eb2deb2f3bbc831d20f444ab196856c6f8a8197df6151d1a2eb107c525b66bbf4ce8895cf36b869d8fa4d2026bb38e9742d9d70d3000bd49a233ea0bf963fa228365e6d8283a7d9e06644aeb8481de1414716c45cb4340d37cb556f663cf09a4c67f02e9d317234d673104ad37ab999161556a7ea002e5e1ce36c5778dba32b76fc44a6f13066f9c9bc15d141d2a9c06c34811a158d0a602886f8be23092ab0b60ef1452b2dd25ce84041dab816b39b5863bcbfa2798c67e8ea4452a8c1343ecfca1a49a62bf17eb39f32a8d7c51ea4d020464f24d5cfcaddb93aca4f0a8b65c9aca1b6da542dbb0554a0d19abcc48ea99d46f1b1b0df794dc6aaaaf9a3fb794c07a7a5e97bb619a7369f506c5d6761b432b3536745d4e389a26d89968138f899bdd8dddf1118e6dc74d357a1332a6add50363aedbcfeefa4735a6ef682637cfac33ab38a6bf3f68664ef196aaaeadb42efabccadbabf8af807c4408e92c121974726987a4aa51d253bb29d0d064a975e0a180e33c6fe495e88b3c582a0630ba107517ea010184de95e7487a9774e65ec81d6084a61d9537e8c49f645dab6ec687494338798061b8bab96af08eecebe4535adee0d9ad226b4666f84b8dde4f485bf988684d79755b87bfda05b191da56c7e4847194a4754c8d268be36e9ef2c679cde755d210c1c47dd25fc5288b59650e8e9ed31d0b16cd090794aeb2d3b8147acbeaa13d0fe5c3175d960b31ceb30887b750a61ed1facd4734af507cfd02b608d335efb4cdf62556d7690b76f06b294d1fdac13de5612c1a7eccccc8319d4d625046759ecfb430239b4af9229b99906ff0999e28722e8de4b7c0c4dafd21cefe6a1bcfe88101a2bec115387c202c3a7a1ef121d1d20bf5e16ab997d9603b7851a794626656b765b75961bad068467414984efde5f8e9c5534baf133c2b5bade7c1eb157ccf04381cdd781f374b6abed61e0df748b45d97d07466b41479f9bed05fc1d73056e55c9cee35315e26f0ba5ddf8f498d7470c1c4a88bea1f93c7d3551414d1ad268ec22fc0f663ac42e8142fb7b9da577d43e763be7e0943d46a752946f470710835326dd8df798f7eb81bdbcefda30e2d9ec07cb43da39b160166eaeee7e667b83e5f41d29ab0d3e9fb41ff0066e9bb13f0e343c13eb87f0dd1075373128fdff04667bce485824b9210a68e80accac4a34375d0f981ed8d6158dff48134c682ceacd21add3798d96d31a409d175953c111e7bd8dd9a620a0c89759ee6faf48a5774ecff0071781f584d48459b7e0fda0f0f2a5ad0b055de74458aaacb62288a535531357377a1199fed45957558beebb426d8762562d2a8a7b4a7dbb22aad1bd66a2c4b156b47536c4cff0064a72e2787da002a24ecfd35136b4ca50d7d61dad64c2302d7d38d730b8b7f1021316c9cdbae07e465c66b4bbee2c250006df67d9e9601a222f86173d99e33d5bd1cc72b20430e5d557b4bcac3fcbf298363712d4cd072be52c7b7077e9003982ddb4a0fef6805670cb859714c6b4a3346ba725dc69a451317c3e86b82916719542975ad6f1e4c4d30cbc3c4545bc67fc462880ac8ef0c8652083666e8ce8516e867f1f67e31a03ce1ee9033b20c221ef6a40b46d0d515eec012fc25306cd9930b99ab26b0eaba85e9873cfa5460114c40d39d572f63ea07ad2542340bd056af84bd9bbcb4bd9a4c1a20856dc129c85a8bbbcec107d66ad7f6254550547f7d63a28c1c10c1a2aebfae7065155d1ea758b91854ddc3bc12d6f2ca157ee5c4205da967487eefb3e895adc91c7bd472d9286c553beb32975bd6288abd69afb2cc6fc9fe7d26e9d163f0c03b453da012d4a7bff88545a97acbcf8fc499c54871def2bce66f9df4675fd99c4a38fa9288d9c0de2954448586d1f9f1305664181a73be0af1f52e64ac791f1f679917a87987d3b8196d1d6c44f0c1a4d2ad9e846153a9c677b775dee63840ab1c375ad861597cbd44c2787daa5c2b51e96158e68bb9898302ab4a2ff241854b12f0fb9ef196a68274d5f1eafa514fee63180983a3d06f078cfceb1d6f6efeb50699fda1e8a2999d4a8791f4039b167f4adbfe7d9faa50502a0a719988ec45b750255ba1ed66573946c6dde40d62d0b95ef29955e652c7e2c07b2f7260cc333575922537adf17c9f98834de74393a91ae1e700139347b933e2d9ea8d7e488391ac0bf98b266c4c5ec7d302a9ac2ae20ced1d0787d99806be28145f1a03f1f42a8b09636a3ea2bf7f685e4cfabefe3addd75619a54fe70627409919c1e75e20549b8cae6565380daeda6e57fc32cc9a868ba36b9ebb712af14d27cb848dba6e4f8c7c101b74eeddd3465069342a6bc62fc9199b7fb035053d12bae6cf51f7873a701aa73d1e92c8072ca90597a71d8e57a573110225ef9834fa13618e17c1bb3145511d03ed017521b4395f364a773c0215aaccbb798fd6d156b7592061943d10c43a8dc45c180b6ba1b1fdf5987e5adb7c9cfbb7e6678cf4fdde228e043acea9ca3a5d8425a8296736a8c25991d87569a4681390f7b3ef0be8eebd89e250973981befbc142626373874835ef4be93abc7b997ed1de310659cd5ee7bae78b4114a754ac944b6e4ca37b378d4ff727f2de2053cc20e01e45aae4c2be221811c9c807c082b6a8292b2cc36a3582f340464e9900baf9951fa6b15c9da5dfc16f8989907c1a3ed436f0fa7598f95c3c9ccabba854b15bdbbe0eeca8dd3ef4ce933991634dc8c6e288729a1fd8cccc80e910a00e4ed9210174c5ab38be60941e265439c0e175f19fc2aceecf3ed005ae35ce7675603c607e78ec7d529691aa5cbbfe07fb1427cff1e3ed51b69e51d500af6463e0ea35326f8db03b875abee4124770bd3af43bc7e2105211d2c6f5874884cda8509d7a56e6d0e3eb820fc19f498dc46c321d8c6a82e777851055fcfab382e467b3cb3044ef5a1ddeaf682732fe06dcca981eb0c9fdcb0f5acec34ede3ed7c607b8ecfe3d20d7056154614ee57b4c222b2e934f97865f0ec9b3ef53c9e6284f0e02c08abb5f32be5a1a180f615f31b5191d03ba929cd4010754560a619c3d23abd5f103e8bca0757dcebd250909b351d7a430000a036fb5cc3a548c045f99efe3bc26b215441c5e71d11259d8575e9de4a802d5a02e031574af7cb5ae1e620d42ddd6e54d176f88241c3f4ec82856db9978870f37c9e6d204fcc7bbb94d3ed94b33172b7aabe331503504f76188522836d58a749769d23cfa865589f64fc424596e07c1295e58fefde1a3bc86cfcbeb0293700fff0023ffda000c03010002000300000010f3cf3cf3cf3cf3cf3c00010c008418000cea584020000010000014010f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c12c948100420241cbaad9840000000000030814f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c038cae9ca31f0a42ad78fecf30c30c30c000010f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cd3e0d5a0d6dc0d0020920c58c30930e3853cd28f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c01451c3ec0043000140644ec30c70cb0cf34728f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c008000d00000000000bcd180410930c10534c20f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c10080c004624b2801c66376c32c10832c734d20f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c008124010000800210b762f822802800453cd28f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c104100224230020004f802a602403880091c708f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c000010000000020130f02e5ec1083043c73cf20f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c02010000400420c010d704b801c71032073c628f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c00420020c628c0812404c94290c30c71c33cf28f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c000a006104380200143f6d8753cc10e30d1c708f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c000334d14810c002147419cff003ce2cf3ce1c508f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c02001493c838930c2031f7a3d3ce2cf38d3cd20f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c410214e30a1853802d4e5b5c9d4e3cf3cd3cf28f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c00000cb1ce3473463864687c7bcf3cf3cf34728f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c40800ce34138d0c02eac9b5bbbce2cf3c71c728f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c000200010818020400358f1dc28430e38d1c728f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c40011cf04a04d0001e955e8e42ce28b3c20cd08f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c02441c43c00c02ca2c44ea5897cf2cf3cf3cf28f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c030014e3401051802a1d5c4b7f2e3cf3cf3cf28f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c20022cb0cf3c72c30c14c074ae5f3af2ce20c00f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c000234c3cd3cf34c230ccaaf425bde4bba00000f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c800134c3cd3cf3cf2a884787a5cf1dd61d0a000f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3ca0001cb2cb1c31c52c51722282caf2f147af240f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c20000cb2cb3c33cb28593a3096c48c3eb2af608f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c20082c31cf3cf3cf3a53889df30568221ac68e1f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c00003cd3cf3cf3cf2881dc4bb859316cd05b8dbf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c80423cc3cd3cf3cf2d0d7d3eefc417b16ac4c89f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c80011c33c52c33c714e6d8978cbcae72e380004f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3ca0001c32cf3c734d1f2e082aaf510028cac0000f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c200038f2cb3cf2c348861693535ea72dea00000f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c80083c73cf3cf3cb3830f09eddbd6e0cfa00000f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c800038d3cf3cf3cf0d48cfa052c81697de00000f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c80083cf3cf3cf3cfd958be97fcadb3cfea00000f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c20081c33c73cf1c24cc789b46f8a0cd34a00000f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c200414238634c34d25cb48b985b8c7ebdb00000f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c800030e38e3cc3c69b43b8647a2bf83bca00000f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c800238c34f3cf3ce7afcfbc680228e2fca00000f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c80003cf3cf3cf3cf15fcdec6cdce12a9ce00000f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c20003c73cf3cf3cfa043b4da6dade0f3ca00000f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c21083403c538c3cd90c8de7642a0564bcb00000f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c200434c3873cd3c9122c2ad5ab88bce3ca00010f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c800038d30f3cd14e11924bf132af184f8a00000f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c0000002000004005cdc19af040f5a7740000000f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c000014004000000ddf89856e2c90db898200000f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c00000000000010043839618ec687c8f44200000f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c0000300000000000000f843e251f33820000000f3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3cf3c000000000000000000900482eab360034a00000f3cf3cf3cf3cf3cf3cffc4002a1101000201020407010101010101000000010011213141505161917181a1b1c1d1f0e110f1204030ffda0008010301013f10ff00e5731c10c6537dbc2747d12e6a8399fcc426859c1c174ffd15356e928e4434343edeb1dc4399186f465c5d1285e1ff009afcc75e04d4f9e0cecdba4a29535999942610d14319abd584535ef354cb15b5829a3157d69905d48955a047b31c3c0eaf7ff186a045c5effc12155f732a1c40685985d0e9ff009bcd0aeecb059a1f6ae0c20a34811578ff00f1b890c5659fa8f285f2b8851395891100b164423e1ee203975062eeee1ed37783c42bc043c77f01d6300c10357b420dd3882a2734f982ad2ff885781858af50e1e2da0ae2e336d4fdde15c50af4cfc402558f2e1e8540801273d34e71d5dd4fb4733c3d01b42c97c4d184a9ab88c04dd3af970fa00f33e26b79fc4a5d762252ade787facf827bcf89b508ab9a63a7b70f01e37c4b0dcc1d5ab6af7d660e526dcb871accf9f6bc4012ac7c90eaa8378df9035ebf9894d70dd4406c1ad78cc40e5ee44d46ced14004e5a7b4be070dfbf0dd0857f1b6d29a3462106072afd8d26683e915a3cf86e8f8c52bd51c6f0235e9ef2b50237aed67480e37d4dbacb10d2f86fa8828d737ef487fea85e48376f8576986976653dcfc4034377868b29808daee0d1c8af6998b5f3b63c51698f7a981c344118200fd52cceb27ccb70cf3c9df3e1281a9c55d7bc1d2f20db37da2514abe1b311141d47cc084cf4cd54c8576a73d3c79ed1b94046abe7c616956e9f7ff009c30dc168363f3d631074f5804efa36d46ced1b6bc34b96b29684a59ce1a5ab05d669d89a9e9c205c1a1e27b4546ce3d981058e6dd99d01d9d7459eb7e3fc70d8f9fec5d280346b134603ec707d16355fada02c9d2b43a1d652a5c369c9f9fb9eb3e3fc370abe3d6fb9a9ee89824b410dc888d3c17593930df9bf2a8ac233e1d3d216ac3c7e25ab0d191354e93d47c7f8a3085be1b10518c69c939303e94d4e5291c626946052086f70516bc262af97cb2f519fe23d57c1da60a32c717e1e91ef8de92d8d0cb03923dff009190256bddd198fe8ea3f1cc942e312d2b70a2d33468f04d7f2f796f2df78a53ddfa63a4ba0c26e056fca06a682efb3341c7ade08352682540efb438e2ef7a79c000be8f93e4ec422c26186623680b3826b7cbde11568fd42b6c0b515ddd3d730251d06e3d3a66543721e8c1dfe88977ac135635bca8c46ca367443356fde72aec70410aabf90a62c63b530c778b7c5f3959e9dd8a51cf8fb4ea1fb506c079fd7c4c4989cf00d0d084bd0f07119150f85dc57155a7b44286095756c72ebfd873b2d2b5f3968e5683280fe73f306d357d23825d2d8ccb8318a758d606283b0ff3bcb9ca5dbb7fdf28d398fbc7aa5d622a717b69583c0da6b397d311ab6c768f058f3316d963d783e062b2da1a3ac3ddf8962c6be757d39b06b169d7c7cbc62345973b18b7c20fecddc4552b70c82b0bf32c60a866b84060197c9ce3d7111d97d99e7c0f0a6641577a057cbca63186fad69fbbc6afe887c9e72c72ab4f5a8e01355c775e0fa72ea62976874af4de28bc282fcd7e6267914be97198da266b315d72ceddbb79cb0cd1a51551f647d6be662d7f857c1e5465003be95b9598d68defb42daab5c1bdb7d8de5cdb4c7eef5041ad3687eeb179031245b8ecd9b7b3354d315b7af07c8ca8ae874bc42933c9fda3d60bd0f780ca162d2f3fbd662000bd7cfee2cec59540e4942f57c6d3ee6a9f75cce6e64bc1d8da461acbfb7f88013788d6647d77fdb41e88639e9d75dff118d19bf48b852dfadc3a2a3d625dbd27a908e730d1ae10e437895a77fac79c091aafc307ccadaed2d81d7e7ea5be8695b8733ebb4684bb8eac70eb1b89cfe2698708a4a20e8fdf9b96f6e2bde2a2f4abee157cb3e729064376f95ba4b73ae9d1dfe1fcc6d5916cc2d6d8d578c588708d33738c2cb3079c62068530bce3474761beb9d79c20e9abe9599868b62107344b339e3bc516978708f5532fdec4c2be49bd0abf41cedcbe601c2315e7aeb0a80b7cef673edde660920d5d2fe26998bf0e10eea26555b65f620969a01e97f3016e330b269501255f4f094c798c66058110f38660978474804fde7098eb5c6fff00108cee0c6160db622040ac23534275c4398bf69a7ed235de0cc879bb8fd31c74f845cfa88c14a5e136f33ce0b014515d1fa7d2280dd8f38781b57c7d42380a85468db87de1cff9c1bc20a45588c4073ade3c8cc68dc00b3c3f73e512cfce5e4cdefe5eb1062e57a768390c599d0266ca9e1308a389cfc262cd580c5afefdfae20d6b1203715182bb7ac467532c75b9609a70a31a8441470ece4ed28ebafa787e6109d6a0343a673042c50ac46bb272fec38cc2b2e77e196022ac5239b7f5e3295d7bcd0ade130f81ff00c9ffc4002a11010001030205050101010101010000000111002131415150617191f081a1b1c1d1e1f110204030ffda0008010201013f10ff00e560b1263f762ac82d82ff006c74a45baf39a7a13b28f586953ccf31c1ee2a3ff485a919daa4a5ce62e95266f49e4a6e63dca126202c12737f71b039c81905ccd1eb938328b95fa522650a139435d2acd6642b15156e65d8a9633cb42a21753f3cf5a0f5b7a120525942695088d68c4c81ea07e5a190781cc69ff0cc2a8022f6a32da4324e61f3dffe3c099fca169df4dc274bfe55c225e7e47fe334c17ead89bfac62a5ec08ec23f5c199017a5c46e6b51ffe1749816d02fab4a4885083a82badd79d8b54027104c009167026daeb43022f195b163da8976cbd469a0bbcb4bdf1e6dc3c6096c113336744e4daa52302f9abbcb9e213922da2f04ea319ab82a5c6f375c19a4c8c99e20156c3400bebee1e73a8ff009e141b0f0f815010c13fe629c95a19dbce66b8ad0ccfbb8f7b53a1226fcadc3e777da4c627ce74ab1805f9b1a6effb431563d846b024f0f986a30c6a93e9440f6f9b461c822f729402260f4e1f349bbe5a1dff009b514dbfd31ef4e574fce1fde1f34fb8523ca0cc6b6e55e0da387b646d46a7139ee7dd288937fa2e55cb8c1e568e1d60d5819c6768bd06b24fd2d41b28e9f78ff7955cc05901e36176a1049c354372a86d112e60dbcf5a952e268512407bcd2552754b3eaf9b559ebc0f6e1ae1b934a3588ed3fd2ad098f3cda86b10270cfce69e2f5189c7b0508f2c43dee70df68fc542058b4f5ff29898dbe4a89685cc7df2f7a1d30d90329a3ca7c8a937283df86dbd2698c5d4fc1fb4f2c1064d6e3fb148d62883399eed0b200d8762d0c73eba53b2959e1cb86939da9c136611b6e39dfd8ab46a22f9b63cde98066b221db44a4c62f78b2e83dd7301e957eb2c1db86e8b46bceafb0fe8f3ea82c136f855c4216120bdcdf94fac73a4890b125caf1d7a14440840648837bdfa53a96533c31c50557767efea91e53dd8a31c236c5b629e4a0bed9274db5e74e52844cbf1ccd9e75104440d3533f3ff00278538a9c330f8f8a908072f3b31516abb5827d75ed11aef536120272b6d1d27bcd4731518899c58e6e95d2ce9b799a4fad0f89fba137455bed7bf7a32fbedaf086a57e184f9a229d1f7142c92e6704e3eadef4a6410c986e5badf7ed53bde2dff0034cd9753f9f14232837fda2c97298b2dea54effefed0ce3832c374a242e89f75231f25a0b71323a5da090c23d64fca11e6d3fe6f131d68c9ae6f71fbe4c54e91750c3ccdbe3d4a04d51ab21e7e1fca0126382c237650909823e06a0509c6749eef6a2975d8ceb85d3d6af88c922261e7ce9f8b73fe092bb11ba7d6fcadad18ab2398d3a55f595b3af2a9027c1399f98e5a92679e89e7bd4c67349e86e4fe70571d67d8a0806b1f1484c783ebda9a1330ceae7d3d21ed5d1a189b4ebacd99e50cd17dbee61a990e81e7229c7a4749cfae68d431090bc74d4a72bb984f3da85b230fe3fb5056a74a63a37b3821dbe54321ef1f14f4a0466fcff97b531465fae5bdf1ed42860b37bdff00290902543e6883d9ca217c3d26984160a8134e0c0cae228c8f431e3efa73a7188bf9e7a669c3914a8d3f9b7c524e90d279e1e0990e5502747d22af6660ef488b00fa6b78d31a7e52b022e5739f6dbb52ad92f7a454d57b60a1602d524ccd499e7cde7e509234a8394cd0a8b727e7e454910f73e9f9aba37e08e1981f7a7e0eaeb40b57b6bf3bfacd443098ec0e84eb56c46425cdaf49b6aa20c9b7c4fdd1a8a05be54c9ccd44b413b5c7075080205b3104d09996ff002d18162f51ab576f90fa27daa3a233128b4ed1a75a9bce63de9170c32919c7f14eb9fd4f6aca9846b44474e0c694a15299332ee3f67d2a507ebc01eb5d0d59e655c04144ba04477f275ab61000973abd5d68e46183dd7d5109775eecd1585720051b4d462d2fc1c2309b3514de3a5045b8b4ef69a795fc771fdacf6d7a8990bede69439008935dbd7da91eb9bf20a033845930f9ceae54cbaf58f6ab5778ed6ab01507a5e0fede8b22e0a7525fb59169ec88f9a10b3bd98b5e49a45bc5c4ccad317fca3b660085b5743cb9539e711b694eb10edf66cf48f6a706ee6bb9fb21252e6cbf34de0a8ee7c1e6353470810b33bda0ce9d284a5c2a356c19d314f863331ce37cd38bc32b4c81c833d399e949ed201cb117ebe95ac6d4dffbe6f42b0b9ced1a77a2330a51d9b5248b5a30a88f2e0f75b4f8bd242a4ae5952f6fb9a30ca10a139e5ebbd3025c8f4023ee95b4b4166f615b2596f8fd8a29380ccf2fa68c2822402a62c4b77946956d8abaa2172383a87e4fc543f4a2f17c562288bb8812712e0da80b625f829c06500b59de6d68ed56b20adaf1261daf7a8be4b1ed463559a819639ed067da9936d3989e8cfd1d29888a100e0e5e4b1a536500320f2d093d569b18a0db78bc5af768b240c3cf5f2f530960c597d4b9b468db7a9c15cab1b880ed1d73582cc4bd8a82564ccff684a62dda1a2b0b51b0e10ab094f569e56f99ec3509d8b84f5617a14108acbeae93d6d151e2b0befebade83ee4413b67b358840c9a8d660b98a295c58df362b3abc7080336cd48308de7cdb16a8ec247b46f4525c262db0b316bfc52d8add2ed9dfc2a102041a2428fa9f74e0c008796cef4b6610846b7ae9928cd049733844ad6cd0e743dbded526c8279e7dd34202c85ed1430170aec903a6368faa21acae64458701aef3e94031d07f9d692e3c799a2f5a27b6285e84f58e11edda7e1cdad7effaa506338e74e2d288c74b87ab07aed453244e74803cbd3511c91b41f36cdaaccc5d41732e4faf9f559519eb9c20a4d150898831ceef3e94c1694a9ce63ae9bd204122b1edcaf576df50d7462d83ce540ba25ac68e914247427dd420de3d693768b39a8b17b9c214cad07bff0028024870f6fba2b9c01d2a002e5d5e5a53d2b7bafcf7a9b604743cbfed45306fcf9ddefa6b4605c5364072e64793feb7509eaf088b9b2bb19fba031d4b7c77a809bb2cf33f465f89a66455d8d9a329aedde1ef6a58684a8ba1fcacb7a36e9e76d6c54abdebe38424235d29b5d7943333d4fcd1bd641a34594c993fc7db5d1a5c3acdb4796d50185e76e9787a73abed6c405aee5c7978cd38928d05db742ad2b9607cf0956509df5a580bb3d68bf913f54aad5f0fe7868530c0d06e4bc1adeff7473d6e54036739f3f5a9aa1165bbc29e8c8d43a31aebb4f65a6b6ef66b8ceded506936bcd09c819ba7c66996373a9e5d3cea2c29d8180c1bf3e9b793c2f095d1a78a1f5f3e6b5a477bfb157625d9fca7f01cedfdf6a106f7b7f7d7ff0093ffc4002b100101000202000503040301010100000001110021314110205161718191a13050b1c160d1f0e140f1ffda0008010100013f10ff00e870f273e672efc4f5cbe2a6ca6b57d03b7d8c0a87aa0596350766b9de5e13dc7f887e334e47a0fc30d4427dabf9c5b52e76b1da37721cd39314b8c639a6beb3d0f1877320347a24fa865f071f0efc9ce5f1338f21fbbbe7f6fd2e315a0e536856187c5c6c48505f48eb5ac340c47c7055d005d92746cf501740f582fa33359b784a3eb3fc66defcf6fa8b280369023d609f8161038b0fc1b29a240166abcedd671a786ca5e99830dbe2d128d6f7f7f9c362c5683d47c8f8f7861973bf275e071fe0935e3f18b951c7a1a7bf8e372cde21c8a80594c4805f283d28f22dcad0876d8ba98df765f4a795363f2b045f5c42fddc9c46faff00a310a8fa17f0e3f1972c7b217e9c3f8f8c0637ad81d9051fef93114d84ba89aadd053066fb50f22e2213402086c40dd5805104a7bb6601462f40f09e571e7c0cefce7eeee77e2e21ac94a650490cdc5c1be17f42e2e182510f1be7beede986dcbc15a59c680788eb4074b1cb36e16447d7a728afb065013d3bff008f3846a1cffd913f39a1e1cc0fcb53eb9abac56c737ab36fe8fa9fc636e09073483a4471ad28cd235b9f53d0278c5c2934319308a6c1d96e4053b4535f9657e9d260d3cbdff80b9c78dc317452510a090f2269f672d80fb15d06d73a3db37959c43dfc96c4ec4d267e699f1284f1b7c3bcfae3ae0a1b2f45b5ec0b8e3ee19f68dabd5f8564a36aa37cdc5768b8c1b02a2acc1aa8e8057a30eab9ecb176a76d5f7e09660a72399c07abb797d888c1d5f91cee0f44d616d1f47e4306121b80ff00309f201fc339b850ec39f70d7dc4d394d0faf734fa73f7cd4500f513ea97ec674d4c270dbdd14f8cdc7557a5344eca1f4f761ee40279bf9f2fbe4fde9e7c2eb2bd774c5d4976f3f4ab0c274f61c6bbd2052b62c0594251a8f7a028e2d04766c4da64d17b4a00817783e93b4d76c2d37d5ce37aef1040be31235175320a2f550e1da6b160a392f20b65895c12584c63540a02b77ff3ace1ac0c67cd3fde3ae82743f0c7d16760200fda8a1ec43db2087ebd58504accfc702fad49de17615453798534d2d869389ee948da7296a9da55f5c93c0cb7c264cab4d9f79317d4f431d820742226913f19180541441bf88619c719cb817c01c2804cf448fa3189cd0adf59cb8e5df85cbe172ef1f0ebc1cbacb972e5cb96fee250b2fc9a2066cdf002cf72bf547be45fb8191e8aa9f847b658801c4faabb5f7703d20640b20fa87f8cbf4de4f091f408fa61b23bba51e75f01c12a7901f7e3218585303eee23186b551541f78d76cc14c030e50ff42bf43093628bea3ebb4d69c724052c38843ba07d2cc66828bfd490e0a5f6e55cc57b80302080a753dd769ecb86801a00878be133bca0cf2ec48e3540a7b74dbecc38e2fe943dc54e8f73d941b4a0144a0e92adfa4c6c2a13dc8cf4fc0fa6000d14f609e4e73af07c8797af29fb8dfc804c5bc21dbd8e5930fd06296fdf1f7d76c1ee317eb8fa3ef2ebf4530735ee04a898932cd6b86d630b9b2445721eed73837f56834934d6cf456d723a068de82f6fa00c48ce2dfd64ff008c1bfe7fc66b58716ca7129b2c1fb6366b5e828bb3e81698ccd3cb71909e97453eae1d541a479084d38b37abdb878ebff53ce1b00e350e5f0fa79b8c7398ecc1e50a12c2a8176e35603bb301f50bd0265072d4e41f72fa818a3bbe3a5107e14e1ac3c3e9e47c5f3f5e43f717c12f87568023ff00bef81e3016b86d5da7141da19b2fb469ca8df038868d6258d5e98a48090e7824c661d48275551a772740abce046bed31aeb1282386c004008079fbf07c3af06aa313d0321730f1050bae8a9a2add718760888b0b5776cbeef39b54bfa88fde7215500be91fbc07d70f0644c62787d0f00f275e33c3bf25cebcc7ee2f87cf93ac9e73ccf8758e01a0d47a8e333cde22017848f66b9cb5461d4d51c6cba766685705ca805476aeb81c0f9452253610a52a6d3ef4797301ea43abebc3fac7875e63f7173bce3279e7e96b3bf164ab2540a80ac0e5c016c0a8bb40e6e403d3e42a40b41471d19675b918546947d9c4d20bb60a6c05395e321aa2584e09e0a2da2996400ba2e86c2edaf592a056716ea015668f57f3e1cf84be0e4f2718783e5ef0e7f717c78fd4dfe8f3209064bb00885765d9865994c2bb90720d7a62d65a16dab6aaaa8bdce30123749795d67080b0d1498b41a4c4e72cc849826d5adfa60902f4ec436f680586b37e420116807d0d7d30fd39e7bef87ee2f3975e79e59e4eb278278cc8aa170a8001e5b1b384e70600450d8892a6cd5e63884898100635d9bae58ffdd67fc2383349ff0071c980e10f2758f1e13c931f07c9d781cfee2fff002f1e0ef247b13f27f5860ffc464fc86e21be00b92e3289fc3cac1f5cedd94468e011fa3813daf204769d61bf29e7e7c38f37787ee2e75e1ce7d338cefc265f3f5e1c782790cc681323b9d0db8e86b8fce889c4c2a6d3f6038519d9490309482ed1ce7bc99629b1c4621800c0b26a802036d7cabef904099169159e9d6bdfc4f23e1f6f2f7e3c794fdc5f2f7fad7c4f0764f0ee379a0214251e993e1204b80e0edc35af5ca422cad1424d9ea47d31dc6c422a06d14f74898210fdc3f38be2e088d2525fa3d3ca78759ed93cdde75e49e07ee2f9ef8f5e1735e17c1f17c0f0407a48f8fe8608c10490dc97ddc8422c07214bf6d628c8c36a51a959c9468ecc6840f011f535f22e6bec4b82a57e57bca65ce30fd0d639dfe81fb8be6e738f1be37c1f25f1ef3d3397ff0045fefc098963f487f58b39295482fbbce8afb66d36ce09746f15301a26c63583db0a1a35526879eb0db5b0357935114f839be1ac98719d7e8d9935e1c9977e0e1fb8bcf84f0efc0f0ebcdcfe90006a028b17dbe960926b4a0228f48aed87b8854e4d629ae1ac05aad0a6aa0506223d639edd1cfad2fbc98b7fa468a020f159ed90e826d8918b2ddaf2bcdc20f418fa97cce6bc8df2f5c677e27ee2f875fa0feb2233112c132ee0d3b986915a65ef400444caaaeb899cf90e0428520216ad71f10802cdca440e22910c0bd34a8d010321144adee8f546bc5b12bbf112bdc52549cecf5c56add5f8f2759d7e8be1d677e1de1fb8b93c9c7e87d33af218e7d3c8c1806ef4bfecc66d794312a8c434f0f582b66a35a3cba2183b9238de8c0ebda88d97066c5254dd7b1d0fabeabb04573a1f9b8040db767ddf4e73e1d675fa575e36f85f7c3f71707f479fd6a50299ae823a171ed4ab280a56808102f6b80abb0c089103a6afce41d2988ae23ef1a5330615ee04207b1dbe4a60e78ae2aa002f0a8e97d0cb238501802939aaff0018868294fab2f8f5e5b972f96ebc2ef2e1fb8be17cb72f8f5e1bc1f23e47c26da84786847d4c6a156d4dd754300ba1857dc691f1f71afa64a9eae1867f1ff4c93f43fc182660941942877e8e091d545089d1035c7b66a380675e1d675e37c3bf1de3c783c790e7f7173dfcbf9f2f1e7e3c378f8d02ba1f76cf3a4b945f86daeb78cd0dd72968fa598fe47de7fa30cf81fc65482fa2b07426cfa601cb395c9afa94fcaf85637e3327877faa7ee2f978f2df1be77c6e57b1fcc3fac390a8ae8668c9afcbed8a7f47fb8f83c833e361268a6d20687d744decef2b32025407282bff00265bec4789d675e47c9c787197c2f89cfee9df92ccb97c86f0f0eb2e73e4be1d81fcb78079d223004f2857ef85bff4a79ff692f0cf859d86b488504ddbf8b1c555ba8d47714cd74f160f17f42e3e639fdc5e727e9f7878f5e47c5c8d9c87eee7fe31d7facbff00d5ff00cb16ebfdc304f819aca3d153f8c61857759a58c626c74e506edbfcff00a1cf979f39fb8bf39df96797af3719d783e2e967bcbef79608f4ff00ebe30be68fbffa711e917202111fccafd8397e3b4c1be41a3b25ca058b466f8ce4d3687779b7b21f47060e93f97ea6f1cbe3c66bc0fdc5f0faf97bf11f2f3e3f4cb8f8718b6f8c6049ee801dfbbf9c3d0cb0e02d9a76822aaf2777a77801886541cd954f4f0ba673841ea44ddc3ae8523c30570090d92c10d17a3d4081c9905b84949ee0b1b1d6e80bc67a3b3c2e197c3bf17cbd784f0be07ee2ff00f31960f49fc6014245de4d5f6feb8eb046970ebb30186e022a2e07239c01da1302c8b4b69c078c5f604f4116e0022419374448a873a898b710d3e58042debc75806e3b7b06d0fc3f58f25f0e338cef1e3cef1e13c0e7f717c6797bcef3bf1f4f277e43c2c3d3f832bb006fae89f9e6d19e1518af9afb6077d4026e28e3708c730162c17d9d18e146f68058ac4d70f6d62a9e4f88d8a53edb37c62180e1cb96ee9726ad3272c9dea49d88efd5fa60f81e1bf0efc8f8f5e3df89fb8be1ef8f83e5a7e94f151bfea67b64df8c06fed964d38bf27b6c0e3201ff008ffa33435a7f6ff7e15498f75e9413750bc1f4c85f606ea352200687bce7227fd13821e0520a52b2e68c4e43dcbe4e25730f766f241cf707f4a7966b3bf13f717cf7cbf4f0be372e5f1b8a7c930ec695df64feb1ba5d2ee07ec88e765de7c2bf956072a813e13fbcbfea5b1600ad5f195694869e2a26c3d8c12b066801ad1fac21cf18adb911398ba411b7d85c9ad04c583759a9f4cb97c39f2dc5cbe5efc4fdc5c7c8f9bd72f92f85f29a73927e715933af4e5fa07eb8a8c53e5224816016b167787d75b48516b2fcbe2e4863ccc778d1b0e792738bc12529006d08a9e4af6a8345653765f50b1c238a0c01577680bdb0859082145a21c039d4218f1001d173ec47cb824f0ebcbcfe99fb8bce4f19e171f1fcf92f99cd78508f7fc8c504105ee5fd3f7c20fe19552cf649d72fa9c6acc4428429c6ba624b1d02809d188b775c5bf3a7c34796a1f4c6ba09a90a28771d8eb6644a6743a42429aacb2e59b9470497d8e39e701bb07410197d9cfb18c9b44abdebc3af27d7cb73af24f03f717c8fc79ae1e2671e36f839c78567fc4648a335574fcef0d28cdb4b39d884fb3e8e3b09e3974be836d82e11e5a3a73e4b430e26b38cd66e06e9b202fb380928b0a15e0d8353db3752d3e810d8870c21780ca91536c0088f5237da38c446b46c68dab41ef831430f4665cb97c2f85f0be1af39fb8b935e40ce72f9ee5cbe3735e1707ffc71bc39f6c6fb60552540400f9107eff3867651cd1c09e93863a608387201c521f6c5226184def10beabd1a70319240824720b0eb870e24293125102014c46e16ba2b5a6b877cd91c5d0697b21fce19d67597c3bf0fae7d7cb3c2784c39fdc5f0e3c8f90f1fae1e64f1dc5bfb127f588b9eb58a2f75066e67c3ecc292c71ae3acb6100a0b906e2961d625131ead26fb91c475b2222114a6de0e71edf120309364104f4d63a5d66c8248a0021de90c6a0290404448e14d29d833acd22710a030187565f43d30e33acebcee4df83e3df89cfee57c2fe919af0ebc0cfa784f0ebe98404ee9e23f28ae38aa101302419116a34b3818a17cc44d247bb83e11f85d251e44f94fa0639960d53549745cca5c3dac6e06913660e9379c5ce1b7a0aa00297779badf6a362e087a9bd6fac1bb122c25ba241af3ad759b72a85f7993c9f4c7cbf9c7cc73fb8acf25f1efcb324f26bc263e133e525f72fef0c0c19d96fbf6d7e0c7577548882099712afbe0b8b463436403bb6a619b6b56f42091150f7358a86a56d2b202ac0cf9849d4c2cfd23167a39cb1b3c808a2367c00f5739146599edd4e6938c24a422b46aab55af785d34f8be1338f273e6be07ee2f85f373e1ac9acd7e83c7818d4bd3fbc3fbc19d9cfeb25a5ae3069173fb5a08b384d389832778a2bf5393663713a221b216a75f6f1964efa4222760f6c31ed0a8b80c2a3bf9b0bca2ad402ae00342ce20e2033bf42bf4423eb8625a15aba7c1be7ac009bb1f5861bf2cf2cceb1cbe43f7172e1c78f3e33c24f0fbe68f2393c9d644c16b04112f32ebd9c4f9d2976c2fc5614972e0cea90a0ae815eb2cf27c1d89e7740bdcc19cae08bc116822f00910700e7831840276035865f5258fc5c5e25531c810ad40f56f061e6d7aed5bad21a9ea3e933990da0f83b2fc7b61e77c6791ce3c4fdc57c2e5cb9735e17c97c0f1f6f0e71f05150209cf182ebe113737aca0f366f78d90433fd58281585c19c32865c28a04745f93289d4c8297fa18bb09008c47338e0d7b66e7584b408880bc29b65b324bd452d83c4da112981fbc4e477c0680436d72781876142a9b12f2e447b69cf653827afb64c565b6d2ce85817bce53f96b3d6a4fa78b9ce77e5b9d785a78dc39fdc5f31e3de4f3193c3f3e3311b81a1023be8a6ebf830111ee44b040c7462d8cc7fd70c099a8d94831bde2a6259dde99cdc1ff00dd8321a8de3702bb7d8c4b2c04be29e8d01f6f6c09036809aa3b70fdf0c160f4c074a2d8d68ba5ce27e622ddd8a0e8fb980b06801701a4dabad373814efca0344a847d9d63006c4baceb1f3cf2778f81cfee2f8be7faf9feb9f5f2fcb87db2a9ab00cca68baafd33a87c7c4bf9038f972ec39e77aac624ef06bbe581b02d1b5b7d5e851834b141b74fadcd2a0111847228822f7c98dbbdb2cf49ca077cf3c6359392f5d08cdb053a1c69671c5010c844dca6f6e383fa3c3d459015dfb9cda66e2b0231eca3e5e3cfd790fdd9d7e89af33e1d62d7ff0057fa59ab5db6e10753a17b3f94b216d1d17d60f0ee703f191837ac22982c606f7d2641710a5c0a359f698a4c7800b14e1d5ee29de2d3b2c1190292a0346ddb8f6ea8dacdd2f2a96cdaf1acbe860e2ddb626a87b44cdc2c514ea855b002123589cae89425dd13d446c4caeb6008aa92bcedf5f05c35da867b47523fce01463d4f3cff0001ebc4fd13dc9b77e3fdb889ddc27cff0043064e4a4dd4a9f6ca7152b28c6d5b01d9b754334e28b5e02d0a936dd0d65a9294ca9234dccdbd0710152568737104670378baf52c45f50001275ce9707e981d9210ab66cdbcb5c07d1230814d1b3c45b4b3587bc6890220120c41eb7c889aeedb44c91180028006cadf9de67342820ef789fa82116d7dcc58cbd5104a1c1df3ce1bfeb304233d40fb719eac247f411fb19b35ff00f07a7e9e43f79ebcb7c9d65df85f17c2f93855db1ef5e423bec84aff001c0f05ebd067d538e99e51e09ea5dc7a1724ed2c6621b7b1a75ac1cc551df5677d851a5c0dd27100242a1a45652291429792e4d514673890e78c3e6b50901dfab6afaef1e5545ac387f061bfd4b8148800a88a63ce1e98416805341013ad9b72a3a064901cf24bc66b45177963d7d4fd319a90a4eb9fc7f782f41eee10079c9486083f2c4223a5747b76f87ef8e7d80df39970df81e4eff77ef3af0be3df85f2f5e418054f4299f5c71875038d84c1226188045408f70f6cd741bb6222138e13ee743933de8df2e6cffc45b23d0d89cfb66b9838c070500bb0e2dd62e9f44c9c1a7877d0d3b32c49b2d7fd7582aecdd7d7860ce07f18a0b3c2066719f0c9124abed4fd0c726224884b21e9b1fae061f58f67c9de02468f0e518a67073051984ebb53132e3ad0ebe7f57e3e304411a3e07f80f7972e5f1efca14a045b4803e8cc0ea4e1d83a77afcfeb8497fe90fe304131905b2a9e9a53ef88740e66f7110a4fa935946c5a1dbbdcdb8851a24c6ee75758c0b8ac03e0326da8cd17fd349f62f78a4773aa735daa8e7061dfd8966fce5fc7ec14d5393dce7170ac3deac7b0d3e5c188100da23dfd316247f32b196027234c51a759c13712a039bc04f4cd8169393fe47b7dbd302805569cbfe073267d3c79f0e7c0553411eb7fdec40eafaf0525f5f6cb6a20354b53a3a6ae50f04441003583dcca6e2b22e9c6d570b1db586a0635100e286aabf5c1d800d18b9bd8fbcc7ba7a80bb16f4d0f4b97e615e8ccbde92fd312e6d05f659ee878f306b3e6c1fc0edf2743968dc9d53a134d33670aef14ebd42f5ef01e951bce4a3fd61bda59ee7e704e5f7147b31286199419c0a2b82a831f6f759d7b8f4f77df03d68276bb13a7c873fbdf1e4d79b57c565026368ecfb7d0632982026ebfdf8c4c2233521c8eefa65432ed928ad8af2e48255d188f4c3486e9881cf4ad109795abecf789d5eefc65187466a1fe90f6a617ac39c74a53555afeb8e5f71fe458ad3feee6ae778c9c0aaf466fd300f926cf53c179d098d65db5088821d71e14705e2a4a518877ecfd4c1a747cb8df6fddade135368513b2e87ae08fbe677ff7ce7a52f7c0c7b0b8661af7c54933af106607f4fa39c7542b9ee47a997f767c9d797bf2fd3cc415d11ca8607d4e5ef6cd3b8e7ddbeb8aed84552ee269607618ed5481ae8e8105e41d7be0522fd8835f720ee6bac8fcdc5933ae04c91d1494215b3342153a0460f809aa72f1f09f2980045b7968a9ef14fae02cc3ea53feb1dff8b6e3e1224444dbd7fdedef896a856bb06bd205160a0a807bcd916bc833615be1980d51387f087b3d46862cdab50257b11fb61aa02af838fb75ed819a3af22fe18f6d64017d0e4f52fb9800330e97eeb8a95bab89ea825fb7c645b0a452967c9c603543e8e6c3ebd38fa9ee758398907ef278f7e27875fa13210d82f67110222b3fe4ef2583ba2a18734187aed3cb1622a002061c187691cbba207144a029bc6a4e30b983b5600969eb14ca25924079eedbf23902a4392b64092417c38b5368b602ca0349c71ac0c4c824e5a4fc5fae3d5e93e023501572eb06ed2a837acbdc5f4c0d36a6ef13a264396fab230c8401e81c6763a2678bbe6128f23b3d141ae47e005147a4a7215a62083d2bfd66d1403bfaddb7f47d1eb07602f407ade4e91d9f9c22edcb9fb2e5f506ce4a6b2f7b91d35a070f626352eb18f433a4a89fd2649eae8393149eaea39c71e1eae13f87afdf044a34c3f7ceb0fd342bdcfa63341cbf69f0f43c594684e299638f3fa415158aa3662a7bddc8c0362f6d7df24e325e64b835442a6d9d2a7c144a03134a89e8d9dbec2321ba42f74e1ea7ae1728065540342304013d2011e3232240f8d7eee0f7e1fdbc081eb2dd9a55fa1fd64c837122169e919eeba1c6220caf2faafbad5f9ce4ab2611832b4541922918b4f2f3bde3842e38edeaa52b10eb5565d1e24e41d8fb6289bed43fd9a72c1baa763dfbbfb3eb86f5191cbc99d9d8f91aa673a51b40f447d131168111f5c74ef134dfcc65ebc54f3ff971f6c3fc222f67f39e681d18b076a69aff00018fd1ba7abfeee2f14aa046ef412bd31e7258f00b42aba60a556baea65cd142a8a3d117be4def0bdda9231a388347b3a316b4bc6cae18bad6ef3c66a3d7f1ff00a3142c1806e9455ad483ba372d28d1ca8338ad53afa809f4f9db802c41010bde93edeec1b0de09e84c4a14c2205c75d21f9949f91eea11e4086833424e8047094622ff00426bf61749a41ac4724369cbf74784fae256cbe73d75dccd7ebe419d5f49e2f0b38986c3c99a7d20b7d4305e1193d858fb99b0a2d13acd5f427df43ea380a0e27625fdcfaf17c2784f0ebc8f953c151f4caa4d0afb9fee6249a99f493f8cb690a6cd1a8140e54f50c98dbd16da26eb012ef85c26f4bf654a2a469af9639793274559e6cb758023f18db10bc6bcbbf69878990aa82fb009ff00cee6c9016cb273cbcfabeb90dff6afe9c92c3280d86e14217ef8669148d873a08532b0571f49066c8127ad617f9e19a1e1d0a723eb7d7238864004e5503d77846c6ae8c669fa64b00e413b61bac6fd89cdc0d7f196089bca8faa2ef8bb0f75c89dab4a9ad3126356bbcbcd9dbf17d4718a5ea7df4d3c93be7d7def32768c6de83edce736e6f0762bd1af43584a88911e47d1cd9f7954604f6bd3ff007ae22dc85f76cfe53e9fbd77e537fa0e37a2fe31bd890fce010fb76fb97f5814bbcc50545435ea71904b2c9f02c71d028cc11901219a25ed5e37ed858b04901c97820cfbb0d6a90f068f1061eb01bc4b15a2aee8faa163bcbc06e3cbf2c9816bbc6771e5b39478b4dd6c74dd5031c545d12480e583b9138e7e5bf4888bddaeded4766522884cad671be7d3db14b6c2d0e083119ae50b4de066d44b091c7a3fc1c315188c5538005573817fe166d7f405db02b8dc1600ed8847697559a0ef9daf8a15406962313a1a6397f130afb755da9c6b60da391bae46f8776614a8a0a1e93571eb1c76661de977ecdda58f3cf3acda320dfb9ebef86cf342c9ec4754f9c59a1ecca993fecbfdfee8f83c79379c79e66fc8e7fcdac20b6bf418a2271f503fef14253202348d1d2996ed35a2454472acaddb95ba4c208270211f1ef8a4934ab811d00a244ca6822c3304564d202fa9f6caec6753694413870375a2b1412a0e689a047938ce336fbb08bf87db1e964dec0f5302bd41eb8770df805077d4513931a9320f335efca8fd7ac5e3ba37f70f54de2c947256a1a054b5e17bd62b0744e0855f407debb2cc50661886e15b9bb3eddbf4c0150990043ea28e5870323facf4c2fe540f773947d32d5bd711eba973619aeb39aacda251756c3135212093d1eff287a61a2f8eff000b3e87db0011939a3e58fce3f4b59181594ed4a001726aaa2367a4efe98e4d3c25f1f47ef9d799f2aa3d3f8b29e91bee59673a110f9cfef27e949bf463aceeedcefc63af6ca3a023ec437f17066fff0041214f4505f670930c5240dc4756e896f187e76f45e18ed016cb07e709a8d98bc71e231b77c0b8ed2ad08a57e89f3306ad4d011a23d6cfb7be1759a0deb6276f1f6c720f5a91a8b00ed4486b7bc6403818fc62eec2ae5d0fbe251fc26334f8bcbedaecc0bae0200100319070310098af5ce58eed0c553ecbdbd0c37a3031acef05a93eb0e371f8f5e2a2a4882b3dd6f027efbdfe8f782f40723f19020ec8823f9260fa966ef8701a1e16ead4491162172c69acbc0eb970c6921532a79fdbeec618578836c84bd2b6171a5e39530877b057e9ce1517fd6587a48a2dba0c31a90b3c26401115127595135e4e7878a12045c4ca790161b270f652be59b6d2d397587bac3045136442b66bb07b4fc8a02007b1ac5300807522ebe863fabc2d80745d6ceb55f9cb3f8c6a42d4790ec39c7fe5b36013d517e7db28f0806f715f9d1ec180209ac295ce4232e520157d0ce356d4d9feb7e55df81e0f877fbc75e13f55f740e0894dad9c0cfce4c9089475f52296ed4f7c622a107392f61fcf00abf6c72fed901008fd4bfd5ac5825191adbb79ae9b57783d98b530c06c90d50706011e9c34dec3930f2d5c7b4bb078b029a33c9d1b83faec7630bb6dea01d9b8d2ab48f4627f0c980e732a37028d696a94d0d9d3ef65be0fe798a0c71700e1e74dc728b845e089fa547c6144e02b90938c037c6502e7af2878447dc8fa601a3fc09cef37af0df8cf209709817c1b77e848b2883a2153539dc7b1db8ce506f02309ea527b238c4db092eee9505b314e05c5249f3c81d391dfafac30970072e8c214da5a446431100b1a0eb21a12f6b2487b5fa18352083bf52feb3766767bdcc4f230e613f9cad82b070433dad33e92cb018e8c6d638b7eafc626e0013fe08bf5c11d847ac3731da6d58607323138d47e1de1d798e7f7e3f463e41344495f873b5e2ef84afedb22131f9a114161a3ec0f78680e999ada7e2e5d989a694d8f65bff190673186f9b05c658a49a50bdce59a12a30a917a6f784400171a92a2bd3d18210fa2e00c36b4fa765d1b2a017b4cfe0c70930829129a0d1ba63d64dd1d11c1cb95d97d5c32f8ce5595c781716d0201d2c1fde1e1387b01fd643d59e1d003acad1ae392a2fd0afd30d2125c0040fc61fbf75e2f92f8c7c9baa1290caeb4a4ef50888abf1700df6424c8d480fb81ed89b97b6b34026a75be7bc5301daa3d235a4a9c0f57027a5c5af14ecfb08dc2830892881602b154b1f931d3aa92c42ce2dd5f4f43875a77608aa5e00dafb63b93c860bccf56fc20f19e800cf97f827e5801ebf604cd8143274bfd261aa8323ee3fe3db09f4b384384fb007236d289ce9afc8e1a890650460bbed9aa1e7278bf0ca7e0ccfde8c7cbcf93bfd0e71ba47a73ff00221f771c92a8d6223b241f42ba83f00254010f0884785df7879276426e105f03b31b63ec3b03502c17e13099c03dc174feb0e845fca0094d031a402140ea1dde47a4101610924c5d58e8465ab8b35aa38d69cb598a3143298e53218810c1a5d16c44e8455f8ffac3e74695d943a673fa7b648aa1d28c4ade84f6981ae0ec47d2bb724d870970df7841a092faccfc6261dcc8f09ac1b06daffb9cdf4c0dd91ed38fce2a22f1c876f8f03aff00033f4447a027d3841e81844b4f663f2e56221c0f4dc051248466f1a859cae9c6e061ad94b870bf07a0494996f6455ac119bc8a06b36357ee6f785e394f425c1015a534d4c3b71974db60b04d4b785c72ee87371d5154d9ee566296fd57a28f4519c8e27b0c7490a7500c214f5c45ac57dd3fd8e0a13fc8191eb480394c605bb3ae40094e2b872345008f725e26f4ec81b827e6e0cec93877138e3d3014a421a245131f83259cc13f864674640c3ac1cc6fad6c8b3d668f95c3a1589a86a0f7a1b9ce0a7a01fc8bfa07ef17c2e19d67a7875e750c5e0c014aeae0eb6d9243d069055021ba82f2489d69083537d70612e4d13b599c77a4f52e13d8ab451a0f7a51c789fd94b16a6cec5174da6f73a73dc651038007787a4842850753a472036e5da9a9ef8c889f48c20e01d05e1f9715987bc831e82886fbe38c883836a7e13071e59eb16edd3c898ed1f3a0b6863c472a7accb21412c292542335ddb1c27847c44d8f0886bfacaf2bdabb54bfb27d31f912cfb11c125f190f4d39caba7ac09dbdfb73ec778e1a4be83248740287d70c400207e81fbd5f33e5b82f8eba3144ef8c0982ec02ec636775d0eb790d4ce08d8c25554eb530e818d068d77261ef82ce14261e9a39e0c1f738d5d47d490d25e2f4e48cdb450a00412bc5d625061aca68123b681de1e3f50d9a2436d41c696bc0d190e7a251d00b30417462e233226a35c60404e779c4114a7c0634e28a181915a576bbdeb79be784fc4d384413860bbaa53bc15aed31ba10320bd80b00c875b647a86a1a5e100f5d5fc17d3063456fca7fb67a1c72f8ca82c1ec687d4c0e74603d0623dd5fe6675e06fc2790fdd1f275e4ebf490fae0fdb16f62bf6532c8853dcfa520fc39441683cd77fe784fd883f1825f4d43695fd13f0cfa63b03676d1b4de8fa9e98f1dbb009230ec048bd1706dd66410f60463f37bc40e6129c082a917be6d28ca809f4003504ea9724448597734e80578d2d7bceac385eb2c381bd81d7581a36242a4a774d221c194682c5590974853b28dc58378aa14741c07b0d899a1a45f8e5703ede5087bcb0eff001b4fc9f7f13f7c75fa26bcce16a8681c2c768496d78c6f04bcc22e49836b6285c191d3a0cce12935e0d7a65d007123787f91c76693b28088bcf4f0d3ac614929876077a2ced1e99ab41488034083a395ae130d0befd88394a08e42c3395f6c618cd30f629eb91166489732a79e200d8e697e422a2fc8e9fc383acf89b53c7adeddb877bc73bbc2f5174faeb13d4432ae170109b288e4c743205f0c14a045534e059434d6b6fd1fbf00b7e5a09bbb53bee638f59ebbff00199ab163e31897bc358dc9f6053f9f24ff0001ebc4f3a1e77e0a7fbc3510a4223d0479254f8c7629a9f5710dd2c4565b7dc78b25f91f0c32bc555ab1a1dda6f29450241995e8de2109c2afcb8a23a47367c8829007d6575e8bd600e5ee4a9089f56fb4cb6bacbc0376a5e1a335d494378094194ed3a1c59008e89d8989708a2d17a2f2fbf69374d93b58282992da86c027a2df8a038c2a083a05ab97bedbff003ec313c440e8497f064f10ff00620fe32098fe8f0c6002aae4ed263aa8071d6c7c4fde7af2df275977e17c5f0be16982a6ac107e41fb619552455f9505b68de9f4c03876326c3c3b71dae77e2aeef22dff00c1c50ae44a3a15f61c11a11380889f6c02c699cebc11bb6e8c5c71b06a31009f70a5c36bde17703a052226d06c659ae595542286ec9bd3883b4c9461a20c18ae9980c3889008fd9cd66043f04b292a843a5299a4b30182caaaa0f3c03e11510011427228fa5fdb86aa214ec3bfab5fae4f0fa07142eca9eaf5ff007c65d42aff0079fd789bf03c9dfeefde75e17c7bf0be5ebc12a6ad43a6216dc0eba415085f77bc7068e842ebbc869459cec3bb5c117ab003015372f783083608228742bebb7a18af9176b1d3d5a8f57250eab43deb6aa36f26f0c211625f1125af483a9a6af96d42698f55a6b0b64c0b2ca60a910bcdd93bc2303d711eb8707ae5efed0b576bee267b7c603379a4f5c6095261b07cedf4b95cb52454387d7125cf365411eb1afa3aef02a76a0e19fd195e25383376e21103f9c6e0aa96caaff7e53fc07bcb972f8f7e340e10fdb7915c1a8216c4e747d430e9ac046489c00983d1dacd606abde3bcbf611aff00aca0028200149cc107a3dc19bf6f4a548aa710fb1cf1880d0406e89aa8e905489c6020c9ee6ba5f7c800bb506d0a3367e59b4b143458095dfbeb1ce1b9e2049c0640e218a45fb6c757d8af2a2bc1820aab4981aa72369c763b2b0f5c98ad82d157be92b34858836cd3e81f7e38089a39cf430370e003b4c00daa064ea58688d7da13df83b3afed8ee5e008719ebe071fe0b3267d3c79f0da33f009fd60f5273f4fe867bb59c7085501ca8ea1abdd7d375306e064621d57c0e9c8a42b5702feb02142fb7703edca7cdef024251b396a7bdc5236593654e5bee9c9eb88ae022a380f633ae315f784ae6c12260573c9bc90b4d2b493a0ece310a2aa68878b85ae26a61be15846895bca8c36d7a5e3f3fce41ebfcd8feb214e023f2f841ec8f57015ed6085ad9b475bb85b53c2010c46c10ceb78e422e425abc0d9bc9e2838356c85f8789c798e7f7be3c9af36ae4463400a0ec9d9d2ec6b3d13f0bbb489f40c58d50c750df57e72c0040aa3af0e3b92c0ac8ce016bd0f1390e7a16247ba23d9eb817e975bf98f140d1c2f187acb832848bdd152c9ce55cd8535dfa024f73d323b0775ef61b2c4e17a394cac7708bb1f5c776a025456df9c4590970d4d1bfa669e8809adeffbc186a023d5e337b27f54a5fc5cba74cf4a27d2fbd43bc1540e8043eee442b9a9f29ee70e393c92a2c8d361000e1ceb9c53e86b927e87f8675e07ef4f93af2f7e5fa791392870d09d250138edde71e2cb792b0482176e79ce2e88dc04a150a6f9c7b0fc000488ec73b49719eeb0741e69895043235b0240ece89ba5314174ce1d2082045397590fcb2166c0a3553756d958d84a0badbbdcb117331c1167384ab621bac55d868368b2c155428e7535bb438c3182f5a4e800c38c08eabb029d38d1c7582189169998c86441db00c4cc157a061900ba5304de90da01fdc7fac7796c3cc6cf82cca2ce42bdb8d69e0d10889ee38008c4082414f83135b35018f57784111084f8cfa67d33afdf4f1efc4f0ebf42604caa48a0cd387d45480d49b071a1a24a645e4a9cfd8c7f0b4764807b055d10472f98681100eb7680df3123582a4686df1521debd4c6a321cbc055adb515c9ace5c6e342253b13775e8348287d16340c16da9f260ab77509852ee253ddaf7860758061d8eb0b298af5417482b215f7c5baab0f611ef1c1c6f75c4f2475e461f61fa65bd0863a7245ed89c850be9ed84668007db0f03cc7ef9d61fa2c1d04b6a084144147ee9828296a681c54e4dab34990a405306f053ee6648a2480885d8ba950dfbe3db1c2800af5b05eafae3b6f514402fcbf47bcc508b1d8b0b2bb2bb41cb86a4683a42fa58771c9ad4bb800349c950e835837206ddc0d0763a08e0aa6380bf0928a2c90a2d710fa022761d47efef2032c4b81093b15a113bdf5df1de26b222cce93921bbab9b721944742ec1f90c35913499c7f18a7c38f49792c36ecbf9c800e213c4f31cff008368c132c86544780f4c1fb05243128a1415e0f6904955f8d04471710622ba59e07a984d31b6da91149e868485c12c1a6446c5680fa9c4d43caa4142ed1a04654ada53a4feac860a30451a8b7adc64d202a55ee5320134b7782959b9c5928549cb6d898a010d447181a9ba26cb7104998c22767d835d8f66e41bdc71f88f330dba0909bc02968c056382c90d5e2100654a295c30936df7fbe5f33f3b4c372089f481fef34734f8f13940a9eaf0ff00be30e3f44fdcfaf17c2784f0ebc8f9530082035c912ba8402a00003ad4ce5c80758f54d397e745f4e3c8acf7a765b535b35841a8fcc5038a5891a2771e5b2b6751a9080d7ba3470b86a3008c236df7c6da0958044bcd385ef0490f5a9dc79ad3ae5e71df3dd372f600ba0f5716fbaf6d57bcdb90eb158a68921fc00cd4ad324fc3ea7b63564d448a26f694ec38b9b0e3f12f23c88101e88a8c43d82a427d403f5c3cc21b5ee21ff7a63d154fc0d1fc67d359c5f671c5b493de430e32781e07efddf94df9ec2827236d9c1437ade4e34a11845b1abb3797d2dcdeef961f6d09a0cefafc8b90822c8894720ec404709be909bd81c39ef4b66251f483e99e9e880aa1f12fd30dfee3c9fa040ab4f57384a56d69f91c3ead0e29a6c5ee92306afb8e22323196c006a1a6b9990946ab600474038d53dd964c017314a7ab106d158ef9444708f7f445a6d6b69cd05081cbd38c0be23ed903baa60025e281ae87df0a97203e32c54547999ba9276aff0047d3c87ef4f83c79379c79e66fc44b49674544e9107e99c52e96392f1f69a480bbd114691d2602813a6a9f63d363d017ac411497b001ecede9c17a139e9019ba44177a028270bf330250b8c8752446057b23d96b0614b1486c025b79ef0be7391459eec30b4f3c4511a3948489562880ba75ac1d6c28268c34059d99c8c9b2864cd76772a2f1a705714e9c1abe8a0fac1de240bedb6153aa825d2283309e995d3c0fad0bd3b238cf3ee8f0fa68fa61bf4307dac53e1cff009352ff0059d7f82f5e67c9ca768e34028bc3b367e738aa2a81e793bc7078a15bd9e965fc301dd360a69d3c62423119acf17a2ffeff0001cbe9817d51eb340c0b05a80f5410322dcb5bc85e56a0e51d2c8e4e94641423d997d92192ff0016890b1b4dc085d8e3ee60552270d2571e83ad405a1dca9ec272a2b951bcbd8334006c62a82e8c955957604e838db5576e76a55749e9f6fe8609f430fd8c53e0cf9d2fe5feb3af13c0ff0001eff4645793fb87f781b2841f9ffbc31fa17e318d61c1f86fef37c3b2eba295f826b9209763075bb119d00bf4c0471d5c6d10e2b0afafce14ccce60a105f151b0745967134bebab6b757b5976b1a0cef5ce5b3b0a02cbde497716b66a209aa0121a7662ae26b2a02a4dadc64d5861d6b205c8e205f2a5c8f63107055a000c5ac351373d54dbed0d737f6cca2fd032a0f6cad45d6343851f6d07e5307c4f03c1f0eff78ebc27e9b93f40bef0fef13428ac93323baf1ee60c228fd01563bbf098fbacb3a152c804a7d307e25023985a7a2ecbab8f3689433c44baed61805f35aa5ce91f931bb7dce0545a10847bc3d53a4f4161e836d890d54628f811143873020c06d72e619ddbcf7d282cf08c518041006c23c37bc7ed295a0088f326fbc24d84f5e7c55c669e7447e6b2eed1c809b51b5bc75956559a9d7e31b523d34fe306857d04fb2e0b8828cf207f8139de6f5e1bf19e0f632a03454459c1af9c153bc28890940c53cb034c0b532cdaba8b2272ef11a3236c150b5508ec9bc61d824fa7fbb148b3e31926ba5de0cb903823a62fb0375248754134e57d95058ed8ee3d28efd3342c681a8b421425226c716af2a40a3e0a49efe1bbda18d2f615034cc8436b3a088414fa975de1a79592bd037f7c2b5a93fbc31d617a89f218cde18252276e5a5c34a4caeaaa3a1b7f3afcbc3d7c3af31cfefc79bd7177c3885887e841f5c4c22139223d0d1f0f6e2a450a0c6e6d50d5ebdf0b8a65301b028abece31b9081b6fa059b69ba0f4c60cc746575646be31d57a2bfb80835c532f8b4208853ea3aef0eed016fbfc19c5746dca1f14b025d238e0039c1378224800d00074072fab9b5d8353de14b88ad506368eff0017a3c1476d7ce8b924e80d25a0e9777f41eaae93ab4062e6428544efa1ecdc0102840ba37abb01c26e6150c81db41a05d2efbc7f6d0e7fdd8a47873fdcc6fc3a0bf99949ff00e019c789fbf4c9931f26fc638f801aa1ac112cea30a0701dac0611017b9817c7ef03fc190305de1a7fef738a4c5ea5193f97d9c153f38a70915fa1fde301477d4654e1c5e39317dc59a6c268dcb9fcb847f69f9ffbca1bcc0a89c00a2978e378c0ba71800ec247f810d3ad0186be87943d79301b82ad07a8e72e6db18a4318f621f73eb8778918e027b0058df6746183e3341ed9ab3ff19fdf90fdddce3cd739f0be1df8ff003e5a2ec68b48bf8ca1eec25c150a29b56f447022261b05460c0d687bc97e6228c828025d2347386b023c52366940722fbe7686ad9fcaf53b4bbcb194f8382bf6b818b1edc15fc6056dde10938de38f7ac52a1016c6ff0075f7580c5176b6fe15b1a728ab109e9ceff5809f28747ae839de92b1e458b59ddeec0d5bd61d7551d0c2822d14b3d4e134f4e0bd565eceb0883d4f52dfd57ef8e0fc647e9c90b9aaf52fb38b9f7fdeae75fa77cff6d16a9312292887051a274e92f35328bb6a57c4b744de1d70e09f45f15f510ad175eab842c67a5f7ebb034deaa7a4e8129b00926a0e0e49c819c77dbc2613ef47b11c466f5d5e93e427d972091ba2c66bd889b231a4a3136eeee1c389a66ae69b897b171f62aef927a1f02d9c8b44fc0c7a2605b821a2d4226b67a99a1de7051d147ff7df013ea3cc288ed9504b0475328a681da8503341eaed01f98c1d4fb66faf59203ac58d887b367d44fabf48fdc5f0be7be5ebc78f178c37f0325a945287a6e8d6f2ecccb29b47c035d8bf380931b91c98101010f21ef0a5dd9a8159dabdbef82825313bcb347baf83121aae0bcadeb9f7f6aa0e3c2f3ade3b229bd8d1335e46a83c3a0d3d529beb2e8554087135f58711439ca7680cb2d69bd1b5142a4718b0b15a823127dc06a8f18dac48b0d2113a0d73e8c6e072a4b88eded73c9a74034dc688060648c2e81dcf5177a05583166103f11c6efdb279ece132e439276cafd22cf74c4e1bf3a19f8d9f4f27197c3bf0b87ef9ce77fa0e2e731ea0586801af6b84d017255a0d108196b826489c6f46fac006d709826c40b02830f5605bc1ae5a0b7759f536c80c743a1b2181c48ba7e80c07a210e53144064c3fd0f418cf3893089053d1c8939148a2023ca2cd11e094ad82716f57a1d4503df01cd4da363d1d81c37cf38845f51fc051f047b61b4c26f5f315f859ed9231629c909ff863429cd7b17f25cbecb01df0601536c7b30fd5ee4f6e196682bcbb0fbaf93ae7c0fdf8fd49854470da7bc3698302c042d2bcbae36e122ac84a6a0743687ce482e1d62ab588f6142070ea2b3d49acdcceadbf9539bdb75104985132a5133538071bc8a02d1d8da3db223861e7acee6d3dade72951248c823c40701007803b2fafa60f941ab8ad1c321b6edcd0c0dbf470e2c0030037d6467816fbacc9790a878d027cc3ece4c5fdf2ff00f13e4b84929cae87b8e175d29aea1ece3ad026fb21839402a898a4861215aaaf71d390471c54cf45ee344d2266a5111e445d37a2d786b304b185ed14f87db37b9228690af5bca12c2d02018416128fc19b5bbc21267d0f50d389834ace08b7776b01ec01d622874687021eb1f07ce4404ee0d745f4187bd7bc102499a4bbc508b02559847ba1ed0e0511baf45c7c46be6f9a7eefce7593c53ce7e84f1985c8354d0797d87d7a7eb914d826ff0004d0244eb0333425805d0a7bd06c50b8365418104c869b57b6e2e47e8dbe2f0029ca9269cb18d70f4a211088444bd0389a084faf557d0af4c24803c82e96101b3014e50c4c9564907761ca8015378402255a784fb3d687d78c70eaabbcc57ab9f433959c187b1856005379ff00eb1b0f07687b3ddb9f57831fcb4f1d2d1e8f75e5c3f4a61fb8be1d65f277e17ce796f8fd31de59022934714f93670cc440c8d5c0a011a291e703b9e1d6561b1f51b821bcd0d2ef404a349a7b80cac428f1a0853a10dd4290c01f511180806efee9de690cc53a0271f4b81e9cbb100e07b007ce6e4b614fea4becdae8738f7407be0bde0edec1fed5dfa3ee862fdc600cff009a4087257c41c01c01fa3c78f7fe027e907f4b8e47ac5de9a23ed0cda389e7bc5a1bb7639121482a877978b9debe12089b156b25f1d474563934cd62ec63035887da114d8079f808d0e8749ea3ef83446e6806d71b93f07e906febc63721eac1ec58fd6fbf58ba800b7f3573f26bdbbc080341d1fa3c7f83f7e43c6f802028f23de7306882fcd860b5ea3a38a9a3d13265b130011024dd9edad649a8dbf8831f6c796af017de8fce530ad193e58bed8f770003f60dcf33bdf56517eb6de99c74a89f68c9af29df84fd83ffd9);
INSERT INTO `instrumento` (`id`, `nombre`, `tipo_id`, `num_inventario`, `foto`) VALUES
(3, 'violin', 2, 1317, 0xffd8ffe000104a46494600010001001a00140000ffdb004300150e0f120f0d15121112171615191f34221f1d1d1f402e3026344c43504f4b434948545f79665459725b4849698f6a727d818789875165959f93849e79858782ffdb0043011617171f1b1f3e22223e825749578282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282ffc000110801b3028003011100021101031101ffc4001b00010002030101000000000000000000000003040102050607ffc400451000020201020305040804060200040700000102030405111221311341516171062232811423425291a1b1d16272c1f01524334353e134826392c2f125447383a2d2e2ffc400190101000301010000000000000000000000000102030405ffc400291101000202020104030101010100030000000102031121311204324151132261427152a1147281ffda000c03010002110311003f00f62000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030000c37b7781900000c80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030070b56f68638d274e26d3b1759f747f76656c9a777a7f493939b74f2f7645b7cb8adb2737e6cc7732f5231d2bd42ce0eb3998325c1639d7df09bdd7cbc0bc5e61cf97d3d2ef53a6ebb89a86d052ecaefb927d7d3c4da2d12f2f261b63edd32cc590000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018031292845ca4d2496edf80239795c9d56ed4ae928d8e9c55ca304f694fcdf979185efb7a383d3c4732ab760c64b78a317a117f85358564a6d3da308f3949f448945af10ab7d90e27c09a8ae9bf565a214b5f508ab9be24d369ae8cb4c699d67c9f46d32f793a7e3dd27bca704dfaf79bc4f0f27257c6d30b64a80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600e07b63992c7d3e18f06d3c8934dafbabaff42b696b86bbb3c9d76b86db339e61ec44c42f63ea2e3b2915d1330d353cee3da98f28f597a968aab3315edcc7194defb97de994d66d2de1071ea44ceda52935edf43d1a0ebd23162d6cfb34cde3a7939677695e259800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600a7aa6a10d3b11db25bc9f2847c591b4c3c3e5ebba8d9639472ed527d145ec97c88d91133d2fe9bed4ea354a2b3142eafbdedb4d7e1c889bc3a6be92f2ea43dafc6e2da78f6c63e29a644645ade92d1f2ea60eaf87a82fa8b9397dc7ca5f8168989735b1dabdae9651e23db3cced35486327eed30dfe6f9fe9b14b3a30ea1c38cb9194c3bab66f07ef2f2e6256aca3567d6eef996d309b6ece9515517d4dc1f0cd2ef329765388db4860645d625b757b75e85a215b6f9997d0eb82ae118ae915b23a63a78933cedb8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f31ab7b4b9da4ea12aedc08bc7dfeae5bb5c4bd7a016707daed372d256ce58d3f0b172fc501d4a751c2bded4e5d137e11b1303cbfb539b5e565550c7b94e10873717c936cced7d3af17a5b5fb705ca10e9b6e65ccbbe3f1e2f6b495b2979168ac4296cb6969b92c76da0a6a4a50dd35d1a7b11b85e2b6b74f49a57b4f9146d5e72edabff917c4bd7c4b464657f493f0e3fb4d642fd5accaa2c56556c62d35ddcb6d9fe05e276e59ada9db990b0acc35a654b07ba6565d149da396f19efdc5fe185b7167534ac6ab35caa94d46d7fe9a93f764fc1994c3abcf54dbb5a169f657a838ca9b2a8c3de9a93dd6fdc5ab1ca99b25631f1f2f566cf359000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600015b3f0a8d431678f9115284bf14fc503a781cdf66b52c393fa953ae2ff00d4535b3f93644cc57b5a2267a49f46c5c3faecb70536b7e08a693f34babfc979984dad7f6ba29318bb1666465478a8a6aa31a1d6db62b65e5d3f25cc7e388ef993f3de53d75d37d7c70a938efb71ca88c54bd39a29699ace9b567cb98476e1d718b94a9a925dfbce3fba1169994f7d2a2a6129aeceb69f86fb93367562c311da49c235f293f7bc17715edd5fad5059635c9722d10e6c9967e1aa4dc7dee64ab15dc7286cc65d61cbc8d2b772e4f4b1dd5a55c509f0cbbcb5b9638b74b6a53b837b348cb6ed9a4cf309f1e125647b34d4db5c2978959e5ad222b1b7d074fc578b8d184e4e763e7393ef91d158d3c7c97f29dad1666c800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000300696dd5d3073b24a315ded959b69311b71b51f68e8c68a55b4b7e6a53e4be4bab33f3b5bdad22915f73cde46ad99a8ca4f1a129a8f5b6cd928fcba2fcd91e111cd96f29ff2af8d8b09cdbaa12d4323aca4f755c7d5be6c9b5bef857511fd59b563e3ed6ea57ac8ba2bddaa3f043cb64446e7da4cc476a9997656a118df3aa51a23ca32db9227f5af0be38b5a76db0f194fa4e318f7ca4fa19da76f5695ad237096cc8855175e3af59f7b2ba5e6551bdf9b2ca6d1c5f137269b8f8a5ba34f171c67a4db52deb92b25c30ddb2935d3a299696e93e562d956c9ecd6dbbdbb8b78e9957d4572ce95a6970edb1112d2f58d688b9edb6e25359b69eafd9ad1a75c966e4c3696df5717d57997a55c7ea336e3c61e98d5c401900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600000359ce35c78a72514bbd91331098899e9c5cff68aaa20dd2e2a3ff24f945fa2eafe4653799e2ad231c47b9e632b5ac9cfbd431a365d63e9292df6f48f45eaf72231fcdd3e7af6abc71a9aed6f224f3325ff00b75cbdd4ff008a5dfe8bf12db99e95d47cafbc393ae366a76aa698f38e3d6b64be5fb94debdbda7ffd95ecd4efca7f45d369e0878417e6cb78c539b1b9b7155bc3d0eaa57d2350b15925cda6fdd5ebe273dfd45adc51bd3044732afab6af0c9afe8d8eb6a93e6f6ebb16c587c7995fca2542bf87932f675e38e19e2f7f850d27cff6f125cb9085adc70aebb5c692b289ca2fc51b45b6f2f2e19af30e9e9b5d7287d2a553ae51e5f16ea5e64e9cfe56af0bb545ca4e72eacacc91c74e76a58ee172743d9c939707a75115db68cd78e9571337e8b9d5dd6d71b23096eeb6f9345bc516cf6b3e93a7e7e3ea38cafc69f145f55de9f832cc5680000349ce355729cda8c62b76df7203c866fb6f671ca3838b170df94ed6f9fc97ee0450f6df322beb70e96ff85b5fb81be9bed46a3a96b38d43eceaaa73f7a308f55eac0f6800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600d6cb235c5ca72514bbdb2267498871f3bda2a28a5ce9da4ba29c9f0c5fa77bf9194e4df156918f5dbcc67ebd6e5d8a15f1644dbd96ebdd5e91eff009fe022933ee26f11ed53962395fc5a95f2767fc707c53f4f08ff007c8b44f1fa2263ff004e8538591652d28c30713ed73f7a5eafabfd0a4da23fea637f0d27a9e26047b2d3abe3b3a71b5cfe43c2679b1e511c55ad5a5676a162b73672ae0f9ecfafe1fb95b67ad38ab4a60b5b9b2fe4656268b5aa61535271e2514be2f36cc3f1df2f366f16ad3a7073751bf365f592da1dd05d11d54c715e995af33dab2dcd36ac2d55f0185bb7a38a384b183949249b937b249752ad7511ccbbfa77b2b3ba3c79d29569f4845f3f9b368a3cecbeaa278aa5c9f6420a3be2e4cf97d9b127bfcd6c4cd19d7d55a2352e659071b9e3b8b83af938b5cc9e9cd33369dca572508bdda5cbbfb8aa5bbf676cd4f11e5dd73a631837547839cb96fbbf0dcd2a8793b5ef36c943b9eccebb3d36f8634a11755b6252977adf901f4300061b514db69240792d5b52b35bc88e0e045ce86df34f6ed5af3ee82f1ef033a9fb397d78f43d3b1aaed231fac5bae6fcb71a43912d2ec860df939d5aaa505eec23d5bdfbcc7f247978b6fc7faedd7f62b4ae153d4ac8edc4b8694fc3bdff0043664f5a00000000000000000000000000000000000000000000000000000000000000000000000000000000000006000003129462b793491133106a7e1c7cdf6829aa0fe8db4d27b3b24f860be7dfe88ca727c4358c7af73caea3ed04af93da4ef978c96d05e91eff009fe0231ccf3626fae2aa8f0eeb9ac8d46f75465d38f9ce5e91ff00ec8b794471557533ccafe1635d6ae0c0a5e356fadadef397cfbbd115b71cd9689f8aa69dda7e8f1da095f7f8f7264445ee8e28a51ff12d7adf7378d49ece4f9450b5a9888acddddd3b47c6c2925541dd7fde6b9afd8e49c97cdc43a22b5c7cbb746025b4aed9bfbaba7fd9d38fd3c5799657cd33c435d5f48c7d5b1fb3b570ce3f0589738ffd1d12c6274f0ba968d97a64dabeb6ebdf95915bc5fec565d359895248aedaf5dade3553b5c615c5ca527b24bbcce79766398ad772f69a36875e9e95b7253c87dfdd1f246d5ae9e6e7f513938760bb999020c8c5a3263c37d519f86eb9a02a57a160d76a9bae566cf74ac9b925f202fce0a75ca0fa496cc0f2591ec2a6b7c7cd7bf8590fea80834ef6373219f5cf2aca95309293707bb96dddd00f6e000f29ed06af2ccb5e9d85bce1c5c16383e764bee2feac891d7d0f498e9b8fbcf69644d2e3925c92ee8af24489b372b817675f393ea7365cbfe61d18b1ef99631f0212a9fd26119f1ad9c64b75b16c58bc79572e5f2e23a5caab8535c6bae2a3082da314b9246ec5b8000000000000000000000000000000000000000000000000000000000000000000000000000000000000180312928c7793492ef644ce87272b5fc7ae32ec5769c3d6c6f860be7fb197e4fa6918fede5f51f68e591ba949dcfba0bddad7f597e43c26ddade515e9ce951999b05919362ae95f0cac7b2f48a5d7e48bc4c578852776ed7707139a58143b2cefbee5ca3fcb1feacadb73ee23f8bcf170b4e6eed42e775ef9b5beed95f2df155b5ae6ca791ac656a12fa3e054e30f08a114ad39b1bb5b8aac607b3d5d7256ea33ed27bf2ae3cf7f531bfa899e28d6b83e65e8e8c1b6718c54551525c925cf6f4ee2b4f4f36e6e99cb5af10e95345744786b8a4bf53ba2b15e9cd3699ed212a8062518ce2e3249a6b9a688d0e365fb2ba764b72842544bff0086f97e0c69a464985ad3346c5d321f551e2b36e764babfd84560be4b5b8740966019000000000000f3ded16bbf4753c2c497f986bdf9aff6d3ff00ea7dc8093d9ed0fe8115919118abdada315cfb38f87abef6074b2f2d549c62f797e861972f8f0db162f2698788e0fb5b79cbb978118b178f329cb977c42e9d0c190000000000000000000000000000000000000000000000000000000000060000004013a0004000240000032000c0186d25bb7b21b3972f335ca6ae28e3aeda71f89a7b463eafa2319c9f4d631fdbcbea7ed03b5b8ca7dbbfb916e35afeb2fc908a4dbb4cda2bd3951866ea93726dca30eb293e18417e88d3f5a29cd96b1b168ae6a38f5fd32ffbf25f571f45f6be7c8aee6c715766ad22306f2b54bf8a497da7d3cbfe919f9c47154ea67b55cef686105f47d36bdbb934bf427f1ccf363cb5d20c6d0afc8976da8d8e3bf3ecd3de4ff62993d456bc55ae3c136eddec2c1e18767894aaa0babfdd9cfe36cbccb799ae3e1d9c6c1ab1f9a5c53fbcceda628a74e3c996d7593566c800000000000000000000000389ed0eb4b4eafe8f8ed3cab172f0ad7de640a3ecd68ae6e3a8652935bf1d5197593fbefcfc00ef66652a63b47e2fd0c72e4f18d436c78e6d28b0f15c9f6d6f5ee4570e2d7ed2be5c9afd6ae81d2e60000000000000000000000000000000000000000000000000000000000000300416e5d3527bcd72ebb77195b2d2bdaf5c76973327da6c2c7e5c5c52f08bdcac65b4f50bc62fea9bf6a2eb7ff1b0ee9f9f0f22266f3f3a6918a1abd5359b1fb98b182fe2b114ddbe6dff00c5bf1ff1877eb93ff731a1ff00b3275fd3c3f87ff8dbff00f378abe6ff00623554787f1b47fc7174cbc57f37fb0d5559aff12c6fd7eb5f0e2d9e93ebf8a2dcfc58d57e9b2d6355a56f7e99392f1ae4a5fa1316b7da9348fa6f5fb5787c5c1915db8f2f0b23b17f3b7d2b348f8974f1f51c5c95bd57425f31196bf289a596cd5461b515bb692039795ae5154a50a62ee9c7e2d9ed18fab7c918ce5fa6b18e7e5e6b52f693b694a32b1d8974854f862fd65d5fcb6f522296b769f28af4e2f1e6ea962aa11728c7a420b8610fe8bd4d355a29bb59351834576f0d8de559f72a7eeefe72eff97e24794cf46a23b7769d132726319e7591aa98f38d505b463f229e55aa79b3391ac69da4c1d58905659b755fb91e36b9c55ccfa36a7ad4bb5ba4eaabb9cba7c9116c94c4bc52d67674ed2e8c1e154d7c56bfb725bc9fa781cb6c97cb2e8ae3ad3b7668d3bbee7ffaa7d7d59be3f4daed8df3ccf10bf08c611e18a492ee475c44474e6e67b6490032000000000000000000000073759d5ead2a85bae3bece55d6bab7e3e8070343d1ecd4ef79f9cdcea94b89f17fbcd7ff004afcc81ea3272638f1d97c5dc8cf2e5f0698f1cd95f17165392baef55133c78be6cd7265d478d5d03a1ccc92000000000000000000000000000000000000000000000000000000000060814f2b51a71d35c49c979f24637cd11c476d698a66373d3cfe66bf6dd270a139be9cba2fefe665316b7be5d34c3bf6c39d6f6b7f3cac896df762f64844d6bed875d7d2ff00e9885d8d47fa54af5684da65bc61ac332d4ade91d910b4d2a8659d7bff0071fc89d13158452caba5fee4bf1274aed8edacff00925f88d02bed4ffd497e2346dbc73b263d2e9fe234aea2562ad6332bdbeb37f5415fc5595a8ebdda2e1c9a6338fa6e3965382b2286959534e952c7b5f475be1fcba13369f9653834b5465e669f73ade57d2525cab51f7d7af725e6c889d7b585ab1f2a5a9fb42e5bc6cb78dffc54cbdd5eb2fdbf12f149b76ca6d15e9c1bf2f273651adeee3bfb9541725e891b4562acf7364f5e9b5d0d7d366f8fba8adef3f9be91fd489b4cf498ac476ece2693979f5a8ca31c6c5ff8e0b64fd7c7e652751d9b99e9d0b2cd3341ab96d2b76f9b2bfb5fa4ea23b706fd4352d72d70c78ca35f7ecf64bd596fd71f3298f2b710e869da0d18fb5976d75be2d7babe472e4f516b71574530c57b76a9aa57d9c30e6975977233c58a6f2bdefe11cba9463d7447682e6fab7d59e8d2914e21c36b4da794c5d500000000000000000000000000286afaa55a5e376935c564b9575aeb264111b797d3703275dd42cc8ca93e0df6ba6ba7ff00a71fea07aebad862d4a31496cb68c52e88cf2e48a434a526f2ad8b8f2c89f6d6efc3dcbc4c3163f2fdacdb25e2b1e35748ec72800000000000000000000000000000000000000000000000000000000000d2738d717293492eac8991c4d53598d50e14dc53e915d59c96bdb2f5c43af1e2d4f3dbcee465599327c6dc61f753fd4444578877d307cd9076bc2b68a1df6eae23a4729b93e7cc944dbedab97888566cc36d92aee58d8234cf4213d1b926cd8259dc1b612726924db7d02bb5a860cb8d46c6f8fbeb82e2925e7dcbe6c473d31be6882dcdc5c26e15be697354bde4fc9cfa2ffd516ad267b71dfd44b9d919f76447b28f0d557fc75ad93f5ef6fd4dab58ab9a6f36e9bc74c9d7053cb9aa13e90db79cbd23ddf3d88f3df1078fdbb181a764deb83029fa354d7bd637bce5eafbbd1159fe9bfa7569d334fd1ebed7267194978f8949bffe5315df6e4ea9ed64ed4ebc383ae3f79968c5f6796ba7230e78d7dd2b35095d66dcd463f6bd596c9b88d5538ebe73cbb10d568de305f5752e90847648e49c769edd95afd3a9879556758a9a26a52dba6cd197e1b4caf7fd2372f434531a2b508fcfccf4a948ac6a1e6dad369dca4255649000000000000000000000000053d4b51a34cc577dedf8462bac9f8203ca62e2e67b43a8d975b3e0e17c339ae952fb91fe2f17dc07ac8c68d3b1614d30518416d18a297bf8af4a4da55e8a25973ed6df83b9789cd8f1cde7cacdef78c71e30e92492d91d9a72ed900000000000000000000000000000000000000000000000000000000000476591aa0e73694575644ceb994c46e750f3fab6adc2b9f57f056bf57fdf238a6df967f8ecc78a7a8ede765294a4ecb25c527de5e65e9e3c55a2294f7f244442f32d388b699cd9af10576ca4088676d82c6fb8366c13a3720d9cf708995a8613528abdca12974aa2b8ac97cbbbe618db2c437b72b1f0538f17672dbe0aa4a563fe69f48fa22f14db8af9f6e56467dd7c3b28ed553ff1d6b64fd7c7e66d14d39ad7db38da75b7c3b59b54d0bfdcb3927e9e2fd05ada44576ea616349c9434da251977df35bcfe5dd1fd4a4f3da7cb5d3bb85ecfd18bf5d993e3b1f369bdf72b3688222655b55f6a28c68ba711294972e5f0afdc8ad267b4ee2af27979d919b639dd3727e1dc8de2b1556666c8145f783c653570941b6d72f1ee2b696d862625247aa292eb8eded3d92d3fb2c679962f7ede51f28ffd97a55cfeab2794e9e88bb9000000000000000000000000000ad9f9b4e9f8b3c8c8970c23f8b7e080f1dfe73da0d5136b867b7bb1eec7878bfe27dc40f5d5578fa661c29a62a1082da2bc7ccadef1485ab49b4abd55cf32d739eeab5f99cd4a4e49dcbaaf68c51a8edd34b65b247638d9000000000000000000000000000000000000000000000000000000000006ada8a6dbd9203cf6afaaa8ecf66fee437fcd9c36b7e5eba7761c3f1f2f3939b94e53b1f14a4f9b2dfc7ab4a45235f28672e7cc98856d3a4529f32d10c66ec2e61111b6e96c4348867709d803706cddb7b2ea0dad470a51695d2709cbe1aa2b8a72f9777cc8ed85f34436b7228c08ec9a85bdea0d4ecfc7a47e5bb2f5a4cb9327a8973afd4adb232ae94a8aa5d541f397f34bab35ad34e5b5f6d31302ec94e504a35c7e2b24f68c7e64cde2a88aedd0c3c4a94f871a97956f74ec5b4179a8f7fcff0002b3b9ed3c474eee37b3d65b2591a8dedb4ba3eef2f229b88e91bdac66eb583a3d7d9d714a7dd18f5ffa2b1bb74b78c476f29a9ebf959edc62fb2adfd98be6fd59ad71c47689b4cf10e746972e6cb4d9a570cca555a8ae853c9d118a219e0dfb88dade0b38d1945fd5b5e7192e522b327e3984f0c18e45d18d2fb39b6b7ae6fa2f14fbd15f2d769de9f42c7aa34510aa0b68c22a2be475472f3ad3b9da5080000000000000000000000001065e555878f3bef9a8d705bb6078fbadccf68752ad706db2e2aaa97c3547efcbc5f9103d3e0e1d1a461f041b949be29cdf59cbc595b5a2b09ad7c91c213ceb38a5baad339ab59cb3b975ccc628d7cba508c611518ad92e88eb88d3926666772d8940000000000000000000000000000000000000000000000000000001800000e36b3a842aae51dfeae3f17f13f038f35fce7c2aeaf4f8fe5e56c9cedb1db6bf79fe4bc087b38f1f842bce7cf9168856d6d21948be9cf6b3096e36ac46dba2ada190967a006132b11c392519644bb18cbe18edbce5e91ea185f2c4269dd4e02d9ff977e1ca773fe90fd4b4576e4be7736ed4adb232ae88ac7aa5f1283f7a5fcd2eacd62baedcd6befa418f8d66458a14c1ce5e097426675da911be9d0a70f1e9924d2cbbbeec5ed5c7d5fdaf914999b74bf1576b0f43cacf71b3325c35c7e1825b463e88889d74accedd795b83a4d0dc38229759b7fdeff229b99e9315fb799d57da9b6f6e188dc57fc8fafc977178c7bf727ca2bd380a33b24db6db7decd6674529364d0a947b8ce6ceca618aa448a378865448daf156ca246d78aa48c5c5a69ec4792f18d6e328df14a5ba92e8d754444a2f8b6ee687ad494d6265c937f667e25ab7f0ff008f3336197a43a7fe38c2464000000000000000000004575d5e3d52b6e9a85705bca4df44078cd433eed7732b50adba78b6c6a3fe47f7e5e4bfbef22652f51a7e0d3a4e235c4e7649f15963eb3911698ac6cac4db8845efe75db7482eace3e72dbf8ebdc62aff005d2841422a31492476c439265b12864000000000000000000000000000000000000000000000000000000057ccc8fa3625b7a8f170478b6dfa95b4f8c6d358dce9c1caf6ba38d912a67893de3dea5c999d2f6b576d271ea74ab6fb5775f171af1a7cfcf62978b4c732da98b73c43996dd65d62b321add7c305d226711158d55e9e2c7e1cd95ecb1c9f3e45a1adae8253ddec5e21c96bf2d12254886e8ab586e910bc41b84acc70e51519644fb152e91db79cbd23d431b65884b29d3811de695367771253b7ff0097a47e7ccb4576e5c99e542cd52d7c4b1e3d8b97c566fc564bd65fb6c6b14d3966fb54ae99db628c22e73974496ed96de94d6d7e381552d2be6ecb77ff004a97d3d65d17cb729e533d2de311dbb387a4e566c156a0b1b1bee4175f57d591d136dbb58f8383a5c79253b12efeefd8adac888db93aafb595d6dd78fb5afbf67eeaf9f788a5addadc55e572b2f233ade3ba6e4fb9772f435888af4af36621478959b3a6983ed3463e051d55afd3651236d22add47c0aedac55ba87891b6914491895db68a8f65e64267861b69efbec59496d2b38d2e7b493dd3f0263e9cd96bb7adf67f56fa6d3d95bb2b61cbd4bd2de33e32f2b2e3d72ec9d0e76400000000000000000023b6d85154acb64a1082de526fa203c6ea5a8dfae5b54235cbe8f29fd463a7b4ae7f7a5e1122652f41a56970d3213bef92b3266bde96db28afbb1f04267c488db66ecceb765ca0bab38f9cb6fe3af8c51fd742aaa34c1420b923aeb58ac6a1c96b4da772dcb20032000000000000000000000000000000000000000000000000000000023baa8df4cea9af7671717b783235b3a780d6edb349d52cc4ae6edaa2a2d2b5293e6bc4ce70d65bd73debd34c7bebcd5c34ef5ddf71be4fd0c2d49a732f470facf2e251c9f0f511cbaa662236af396e690e6b5b6d0964ca0b4374b62ad616a1892e0565f38d153e929f57e8bab237f4adb2442c37561478b658eb6e565ab8ad97f2c3bbd59315db92f9dcfb7539ef2589174f17c5637c564bd65ddf235f0d76e69befa5350ddef26db65f6ce57ebd3bb34a599374a6b95696f64be5ddf32937fa5fc75dba387879192bb2c3a7e8f53f89a7ef4bd65fd111affd226dae9e830b46c4d3ab53b9a6d789132ac46d1ea7afd1855f0a7c1cb9452f79fcbb8ac6e7dabc44476f1ba86b1939edc5beceadfe08bebebe26b5a4551379953854e5d49995e98a6c9e315133dbb6b4886e915db58ab74885e21bc60576da28922bc0aedb4433c979b216e20dfc4936c392434acda21a36d966532c2e4c9da930b5a764bc5ceaec4f64deccada370e6cb57bfaa6adae335d248eaa5bcabe4f2ad5d4e9216400000000000000006964e3541cec928c62b76dbe4901e3357d565ac4d460a6b0633e18423f164cfc3d084bbfa3e951d3ab96464c94f2a6bdf925ca2beec7c84eaa472dec9cf32eece1ca3fa238e6672db4eb888c55dcba15551a60a115c91d75ae9c96b6e5b9643200000000000000000000000000000000000000000000000000000000000c01f3cf6d16dafcdf8d71fd00e5e9d09cf3e98d4da971ae7e0532cc784eda638fdb874750e1fa65dc0b65c5ffdce6a7b61ebc74a5266b0c6d2d7a92a76bb560cf85597c9515be8e6b9cbd1756526cbc4ae2aa8c38f6934aa5d632b9714dfa43bbe64732adafa732dd5a519ca58f06ac7fef58f8acf93e8be46f18dc16c932a12b2539b9cdb949be6dbe6cbc6a14974b1f4f94aa8dd7c963d2fa392f7a5e8bbcce6ff004b457ed7f071a52b36c1a1a7bf2b6c5c525e8ba222627fd1b88e9ddc2f676aa7eb72a6e52eaf77fd46fe955ac8d4f1b0696ea508d71e5c6fa7cbc59499ff00cad15dbc9ea3ed35f7ce4b1f78aeeb25f12f45d1178a6fdc4dbe9c47c7749ca527293eadf79a7104566c96152899cd9d74c3109522ade21b2446da44378c1bee2bb6b5aed2463b15db7ad1bec975217d686f7441b6ae4913a566da6389b274af94c890346c364c356f6255996b27dfd0b474e7bc6def342c8edb0d26f9a4a5f8ff006c9f4f3c4d7e9e6678fdb6e99d0c000000000000001a4e71ae129cda518addb7dc80f1bab6ad66b1bc22a71c273e1ae11f8f225dcbd0891dbd2347587c39797c2f214768c57c14c7c23fb91d253db6d9976aaeb5b2392d69c93a875d6b18a372bb4510a21c315eafc4eaa522b0e5bde6d3ca52ea806400000000000000000000000000000000000000000000000000000000001803c07b69094f5f51826e52aa3b25dfd489d426237d35a2a868f43dda966d8b6d93df817ee71da672cff1dd8b1c57bed4ac934b9bddf79a43ae6750de9c1b6dad5b638d34ff00c963d93f4ef7f22dbd39a6657a9a2ac6ad5b08a847bb2321737fc902bb9946e55add4d426de2c5f68fadf6be29bf4ee5f2262a284e729c9ca727293eadbea5f5a436a34db72939d6942b8fc564ded18fcc9f388ed85b147c25edb0f039634164debfddb17b8bf963dff3fc06a6ddb29fd55eaceb3e9b1c8c872bb9fbdbbe6d7817f1d470aedf42a72f0b1f1eb962a53ed23c51515cdaf3f03199d26236e06aded2422dc2328df67dd8bfab8fcfed08acdbb5b8abcce565df9b6f1dd3737dcbb97a2ee36888aabb9b310a7bd959b3a2987ed328edd0a6dd315d74d9448db48ab651f22bb691549186dd4aedb569aed228fc8aedb4433bf8109db0dec4a37a6ae5b93a6736db096e10cfa05ce9d41b61bdc292c6df3255d312e84c2b77aff6624fb38c7c694ff06c61f75bff00e3cbf51f0ef9d4e5000000000000359494536da49757bf403c7eb3abff008a39d554e50d3aa96d39c7e2be5dd18ff7e644c8eb689a43c6ff003b9918ac86b68417c34c7c179f8b11c2567272257d9d95499c97b79cea1d54a4523cacbb8f8f1a21c31ebdefc4e9a522b0e6bde6d294baac800000000000000000000000000000000000000000000000000000000000000ab959b56345b935ba5d3732c99629c7cb4a639b3c86a5aaac9cf76e2d6a591c3c1da6df0af2fc7a98ead78fdfa75531c47b55618338c1dd6cd5716fdebace8fd17564efe21d1bae3e3e52c31e9a946e5151affe6c95f17f2c175fcc431b5e667957bf514ae73a60e73db95b7fbd25e8ba22d10444a95d65b7cdd96ce5393eadb2dc27c659c6c5bb2a4e34c1bdbe26f928fabee133a556251c2c45b37f4ab9783dab5fd65f911cca15b2b36ec96bb59fbb1f86115b463e88b4562149b6955fbcf64b76fa6c8bc32b4c4aeac0a70e3c7a8d8e32eea20fdff9fddfd4af94dbdaaf8ebb6976a974e8fa3d295142fb10eafd5f564c53e5136fa54854e5d499b697ae2994f1828f719ccedd75a455ba4435886c910bc4248c372bb6b5a248c3c115db7ad1b6c974ea42d1c31ea099fb61c8953c9af564abdb296c42d100d2766fb92aecd8074213a6192acb5974259ddec3d9e8f05f2aff00e3a21bfab6ff00627d3f3b9797ea3e1de3a5ca0000000000356d4536da49756078fd63597aa2b215ce5569b07c32925ef5f2fbb1226474744d13823565e6d6a1382fa9a17c352f17e32f31102fe4e4cee9f6551c97c9379d43ab1e38ac79596b171a38f1f193eace8c78e290c6f926f29cd1980640000000000000000000000000000000000000000000015edcba29938d96462d754fb8ced92b5e257ad2d6e91d5a9635f72aaab14a5e5dc4465acdb499c5688dcad9ab30000000008ecb6157c5249f87794b5e2bda62b36e9c8d475dae88be1925e7bff7f96e61392f7f670dab8e23b702ebb272d39d927453f7a5d5fa2ee1158a74ebae29b47ecdab8538557282e392de30975fe697f444d6b379e55cd96291aaa58db66256a56d9395b25eed727ba8af16bf446beee1c31fac6e556fecb364e5929c6ddb6ed61fd577fcb62de11d42f5cd31da959817d5746aecdce53f81c56ea6bc5194f1dbba96acc6d37d1b1f139e64f8ecff0086b7d3f99f77c8aefe933699e21064e65b93155f28549f2ae0b68af9779311a478c2a4a0d742fb673494b8da7db7c1db36a9a175b67ca3f2f17e84cda1cfa48f369c38f0e9d07c7b73c8b17bdffaafb3fa8f199f7237ae9cff007a72ddb6dbeacb222b3296156dcd959b37ae1fb489156f10ca446d7886f186fc92226578aa68d7b14997456a91436e6cab688fb3af25c8837f4c37b2274899d346f7f22cce6448274cec42586f6e84a36c6db84699fc8858f4031bec4a00858c0c7fa465c53f821ef49f822992de3563925e87d95b7e9193a85fdd29452f45bec74618f1ae9e67a88d6a5e8cd9cc00000000186f65e00792d6f59ff1195b8b8d6f678357fe45ebed7f0c7c77fcfd08917342d1db9579b9752af817f97c7eea978bfe27fdf92074b2f29c9f65573dce5cb937c55d58b1ebf6b27c4c658f1ddf39beacdb1e3f1639324da560d59b20000000000000000000000000000000000000000000000186f8536df203c9ead38e55f384f7fad7c5b6fb3518f4383cfcafe51d3d2c386b35d59caae72d2f2237e2ae9f145bdf746beeed7c982b5afeaf5381ed2e0e5c52958aa9f7a91ac64d7b9e7ce29ff2ea42eaec5bc2c8c97932f16acf4ce6b31da46d2ef27708472beb82f7ac8af99137ac27c66552fd670e84f7b62fe66539eb3ede5a7e29f97272fdaa8437552e27dcbfbe7fa15de49fe2f18e214672d4b321c774962d2facaceb2f97ee57c2b1db5ad2654ecbb0f1a5bd4a59372e939f45e88b732e8ad62bdb191912c6da790d5997d541fc357aaef7e5dc2236adaf33d338ebe8d376e549cf2ed5c51ae5f657de97f44695dcf10e5c968273739394db6dbddb7de6ba8f872ccf3ca6fa1dcafeca69436829b937eec62fbf72be511c2de13dca4597082744232fa3bf8b696d2979efdde8478efb4c5fc7dae5e6e13c4b5252e3aa6b8ab9a5f12fdca4c69e8e2b45e1ad18d6e44f82a83935d7c179b7dc536d27555871c4c55b72cabbd76ae3fb8579b2b64d9765c94af9b96cb68ae8a2bc12ee262623a47e2da0fa396f357f00e0a3ddcc8daf348af425b9243650dd9129d26852df714996b5a278d0fb96c536e88aa4ecf87925cc8dafd30eb7de0ffa8e49f4489566df4d781b64a9a3876e886d6d6986b6ea0db0f9bd9128db1b7f7e003a79b09081801b6e4a22198c5ca4a104dc9bd920899d2f654e38147d1299277496f74d777919523f24f94f4e5afed6dbb1ec5afa8ca7e338fe876521c9eafb87a534718000000356d456edec901e4757d69ea5dad745ae9d36ae56dc97bd67f0c7d7fbe446c59d1344ede35e4e655d9d107c58f8de1fc52f16075f2f29b7d955cdbf039b264f2fd61d38b1ebf6b26c4c554ae39f3b1f57e0698f1c56372cf2649b4ea164d993200000000000000000000000000000000000000018000008acc8aaadf8e696c52d92b5ee568accf4e7647b438746fefa6fd7f6329cd33ed869f8b5ee97232fda557fb94c5d8df48a5fd3f7fc0acd6f6f74e9a56b11d283b650739dd252ba7d767ca2bc087a18ab3085cd4be221af8ed0cf0e8b5efc4e3e65e2f30cafe9eb7238b9307f519cb65e2da266d59ee1cf3e9af1ed94eaad62497f9a8ede2ec4478e3fa6734cb07d0736ce576a74c179d8dfe8898fc71f08fc7925b3c3d3287be4e5db9325f66a5c289f3fa4c60b4b65aa63e272c1c2aea7f7e5ef4bf165799edb4628af6e7e4665f933dec9ca4c9885bcf5c4256e3a5c54ac4a798d7bb5be9579bf3f22daf2ff008e6be4669a9e125919494f2a7ef5754bec7f14bcfc109b7c42294b5e776430b1bc8ed6c9394a4f7949f562b2d7262fd350ec6360fd270e57c6d4b867b4925bed1db76d6dd597b5b5d38229f12deecd574618f62b214d6d28f13f7b65e3fdf2262bf28bccc708332985191255db0b2b97bd0717becbc1f99313a2dad70b18b8eb2317b0c94942c971529bda4e5e5e4fa15bcef886b8ad38e76e5dd9365d0eca1154d29ffa71e9f3f1663d3d18a6f945087724566796d5ae92aaf972436d7c58ecfc3f11b566ad2556ddc4ed9cd5aaab77b244ed9f8ad558de4576dab4d2d5742d96e576d132a56c423c8ec52079b49529926d1caa8aea13a45251408432925d09d226c8baf9128126fa725fa84ec717d17240db56b640d83b4ec51f106b6debae76cf82b8b6d9133158dca2663e5738abd321b2dacca92f940cb5397be9cf33367324db7bb6db7d59d0bcf0f5bec62ff237bffe27f436a74f3bd57b9e88bb9000000c37b2f003c9eb5ac3d4a56e2e25bd9e155ff9190ba4bf857f7cfd08913689a3bc97565e5d3d963d7ff8d8cfbbf8a5e2d8d0ed666528ae08736cc32e4d710e8c58f7ccb38789d97d64f9cdfe45b162f157264f2e216cd98b20000000000000000000000000000000000000000022b2faebf8a4b7f0296bd69dad159972f33da1c6c74f6926d783dffe8cbf2dadec86918a23b739ea1abea2b6c5c69c6b7f6a5eeafcff0062b3599f7cadfac75c22b748cd9c78b3f508d70ef8c4888ac750d239fea95ab48c6f82b9e54d77cded12d16974570cfcf0ab2ccb1c5c2a8c2a83fb35c76444ff005d14a457a43bbf121a41bf8b0b6d894f65ce44c554b5e2399432cb827b26ff0002f18e5cb6f5748e21b42ded16ea4f622634b52f171bf30bccb59cf85737b1311be99defaed03b5ca4a304e4df45b178afdb8ed9be9d1715a6c36dd4f37bdf554f92f197e844cc4a62b69edb46a8e047b7c95c79762e28425cf87f8a5e7e088defa5eb588e94e774e7394ec6e5293ddb7d591e2da2fa59c5c753addf7cbb3c78be6fbe6fc1113c1393e9d7c3d4de24b83b08f629f28572e1e1f47dff003ea6d15d76f36f6999dc2a645bdbe4d96462d71cb7e1df7d8b4293b99589d2b0698d9757c764ded15b7bb07e7e2fc8ce6db6f5c733cabbbac95ead94db9ee9eefc8bc44474c279edb67c20f50bdd6b6839ee97ebf99cd79e5ee7a7dcd37289478765b7e055d1c43751df93fc8818700accb654efe43678b68d315b6c88da62ba4ab86282da61dca3de0f1692cc51e9cc9d2b3a46f32c7d0b699edaf6f73ef64693b6ae564bab6346d87193eacb69136153df264a219ecd25ef2212c4b65d7920947296ef64884b5516d819d926924dbf05de3be5333a5aab025c2acca92a6bf07d4ca72c75567393e9a5b9f1ad3af0e0ab8f7cbbd9318f7cd94d4cf6a3296edb6f76fab35d2db88e98d8274f63ec7c76d2e72fbd6bfd11bd3a797eaa777d3be5dcc000356d456edec901e4757d625aa3b2ba2d7469b572bafdb9d9e4bd7c3bfd08d89f44d1be9918646553d961c5f1518de3fc52f160773332b817043a9cf972eb886f8b1ef99313136dadb96f3ee5e04e2c5ae64cb977c5570e860019000000000000000000000000000000000018200082ecaaa94f8a4b975e7d3d7c0cef96b55eb4997172f5fde7d963c65658fa4609ff00f7fd0ca6d7b7f1ac52b5411d2f50cd5be6deb1ebfb91e6ff0065f99115ad7a26df4938746d21a970ab6d5f6a6f8a5ff45a6cbd715eca599ed35f66f1a22ab5e2f9b2ba75d7d356bdb8f764dd7cb7b2c94df9b25bc6a38aa2068091c8944cb5dd8566cd6cad4d25b96ace9965c7e70d5ae17fe945fa32db6535d4fb7ffa3959d157b7cc8d42d36c9f15ff00eb0e36bfb4a3e84feaacd72cfcb11c752925ce4df44bbc79a9182b1cd9d38c61a5476494b31af554ff00febf42b33b695a44f5d3308470231bae8a9e4c96f5d6d7c1fc52f3f04557999b710a16ca56d929ce4e5393ddb6fa96826b1d42c51890aea59399baabec413f7ac7e5e0bcc6fe994c2be5e5d99562734a318ada108af760bc116886732934ebef86556a9ad5d252e55c96e996df8a96ac4baf99a9625391fe52a50b9af7e517c5183efe1fdcacccdbb5631e97748d4ab54471ee70e526e0e7d25bf76fdccd35c31e6b2a32c5b2bcf8d5654eade7ba8b7becbc9f7a1bd42bccca1c9ba3571dd36f672f0ea72c47974f7bce31536a55e6d9916b8515c577ef266938e23b72d7d55b24ea909fb7b6949df5a51df6e28bdf6f52be313d35fcb6afb9694374a5befcbb8ce787546a796eb92216d239dca3c973252878e727cb71a1b4689c9f7b2da676be92c70896532916228ae8086b2ad47b8082734b9130accb4ed12eac26224766dcdf3217d30dce5d13237ae93112c764dfc4ff00e88e56d3318a94946b8b94bc12dc4cebb44cc476b0b02718f165590c78786fbc9fc8cff27d339cbf4d1ea1463271c2a5717fc93e6d93f8e6dee671133da8dd7d974b8ad9b93f366b5ac57a5f8847b920904c432decb621333ae1efb42c5789a4e3d6d6d271e297abe674578878d96de57dba25998061bd901e4f59d5e5a9cedc4c4b7b3c3aff00f23237e4d782fef991237d174879ceacacaabb2c3ab9e3e33fb5fc52f16ffbe42381e832f25531e18bf7bf431cb97c7a6d8b1f9768b0f15eeadb7e2ee5e057163f995b2e4ff30bc74b9d900000000000000000000000000000000000000456db1aa3bc9fa2ef652d78af329889971f3b597192ae94e539728c23cdbfdfe5cbcce7f3b649e3a6f5a4476af569b7e43566a1738c574aa0fa7abfd89af8d7a5bfe35b753c0d2e2ebc3aa3c5dfc3dfeafbc4ccb7a7a79b73671b2b59cbc97b3b5c63e11e434e9ae3a57a5072ddeedbdc9d2d3663a8443296c42fa3a025ab912a4cb010cefb036c6fbf9128993a100da5e089d2b368866aae791646baa3c5293d9244e99cde17ec8ff8649d35a6f317c766dfe9f947cfcc89898457f6e7e188d70c182b6f8a964496f0adfd8fe2979f82217def88e946c9ced9ca52937293ddb6cb4709f8d42e558f5e2d71bb2a3bca4b7ae9df9cbce5e0bf52b2ac4fc420bacb3227c76c9c9edf8226385f4d68c39e54da82518c56f39cbe18af164ef5db0bc24bae55572a7053aeb6b69cdfc767af82f244c4fdab38a54d5725b722caf8da17e9cb97d1e38f38414632dd4947def9bef262da52f8a6dcc3bb549d9ece6f29adeab3ddddf3dbc11192783d344465d4b9d38d774382715289cf1baf4f5af15b5752c51854d0f8aaaf85b5d5b16b5adda94c14a4eeb0d739c21876b96db35b2f52d8fdda47a9988c7cabe9b7cbe85b49fc2f65e84e48d4abe8ade54e524ad9d8f65c919bb2125547134d928995cab1e2ba22da636bed6614a4b922da65b49c092f0211b56c8bebad34da6fc02d0a6e39390feaeb6978b4566d10999d24869525ef5f62f911e5128f286cf1b12be6e49bf36168da2b2cc787c2a242ec530b325375a50ad759c9f22b6bc5516be989d9814729ce7913f05eec46af6e98cdad3d2bcf54bb671c78c688f8417f52d18e3e4f1df6a765b29cb79c9c9f8b6691111d2d1a86bb836c75036482d10cf4212ea7b3da63d43354ac8fd454f7979bee45eb1cb97d464f0ae9ee8dde632061bd901e4756d5e7aa4eda68b5d1a755feb5ff007fc97af72ef23637d1748ff108c2ebea74e9f07bd38efad8fef4bc7fbeeea881e8b2b25531e18b5bfe86397278f10db1e3f2941898cec7db5cb7f0895c58be6cbe5c9afd6ae81d2e600c80000000000000000000000000000000000c01064e5431e3cf672db92dccb2648a42f5a793cfdb9176a16caba1bdb7da7635c97979fa7e273c5773e57edd515d278471749aa5649ef36bde949ef291699dad5c7379d43859facdf96dc537087821a75d295a74e6b96ef996d2d33f6c75255ded951216886484b0e5b124db4d7a92cc0746fb0366c107f7e80e8dbc49d23e54ac6dd8f7f13687977f715593aac53ae4e325d1a7d0951ddc7d6a775aadbe09e4f02876b17b6ebc5aef66735e5a56ff00ae9a675329652941392b9ef17e2cacf12ecc5689aa6fa3474c6de44633cafb35f58c3cdf8bf2296dad13e71c74a96395964a7649ca52eadb1cb6d4425c7c4ed62edb65d9d09f396dce5e4bc58db399da4bed764155543b3a63d209f5f37e2c8ed7ad348953cba6e36d3c18756dd16e3689868e1b32c8d69bc64d2e1ddf5e8410b34f76e525ad613cac8c20e5269457564446fa5e6622372e0e7664b2ec4a3ba82f86274d2be30f1f3e69cd3a85bc6a5d7528bebd5a30bdb72f57d3e3fc74e576a824bc086d365a82e5e0bf52cc265620d25e0385621adb9d5d5eeaf7a5dc91333aed1e3b46d5f747b4c8b15157e6633963fca26623a5596a18b8ef6c6a7b49fdf991e16b7b959dcba7895accc19d96b729edbae7b6c6d4c558657e261e7259d9345b28c6d6b67dcc99c75956d1ca6a6faf3feaf65564776dca33f2f26566b34e63a698f37c4a1e19768a12dd3e2d9f90dfcba6788dadeab7bed7e8d5fbb5d4b8765deccf1578f26748e1cddcdc37dc1b602194885a21b20b1b904d93e161dd9d90a9a62db7d5f74578b2d11b677bc52372f7f818556063468a56d18f57dedf89bc469e4def369dac92a8decb76f901e5358d5a7aacecc4c2b5578705fe63237e4d782f2fd4ac868da4ff0089baafbea75e9f53de8a1ffb8fef4bfbfc89881e9322f8d15f2db7db922993278434c78fca557171ddf2ed6d5eef72f130c78fca772db264f18f1aba275b9590000000000000000000000000000000000000056cbc958f05b6ce72e515fd7d0cf264f08dad4af94b8175b665df2ae337c29fd659dedf82f3fd3d4e5ad67dd7eddd4a6a18cbcdab4fc750ad28bdbdd8a5d0bf6d698f7ccbcee4655b913e2b24dff42da6dbd75d206fc095667e8db7069b25b10bc0425ab96e5949b6c482219074c75e41025e003a79046d9dd789288b474eaceca32749bee55d78f0a1c138c5f3b1f817ac38b24cd2770a9ab5ba5bc38430ea4ad9ed2df6f7a2bcdf796873cf6e5d14b9be49b4bc17426510bd1aa318fbcbfe88994c433566d98b35cd4a2ba6eb7dbf662636b56d35e16b2655df7a9513958a4973dbab329deddf82758f69be83f447c59b169fd9a53e72f5f045277b4c5bcfdad2729dcd3b1f24b6514b6515e0911d3a2b4d32abd9787f5236d75a49186eb9ad881894125d102611765c4f922db67adb68d3b74446d78ab175d5e2c38ac7e8bbd935af9748c992b8e3767172b32cc97ef3da2ba457447456915793973db24ff1630f1b8369cd73ee4677bbb7d2fa6d479597a2f9f2e665a76cdb7d258cb6efdcb3348ef55aea11a620afc9696ee317f994b5a2bda78aa4b6dc7d3d70c52b2ffd3d4ce22d919ee67a72efc9b6f96f6d8e5e5bf436ad62bd27510838b9ad8ba96b7d3d56872e2c2b23e45aac324f30f2996b6c99af325599e55b89c5a926d345f513c3099f975a8d4bb66a73a6b94e3b6f271e6ce6b61d74e8c7926dc4a0c8b1db7d93db6e2937b781688f18d3a2bd22489346c0d33d02c6e41b63a81d6d2741c9d41a9c93aa8fbed737e88bd6bb61973c5387b1c1c0c7c0abb3c7ad47c5f7bf566b11a79f7bcdb995a2546252518b726925d581e4b54d5a7ab4acaeab5e3e9b57fab777d9e4bd7b977959919d1f4a7aa70db6d4e8d360f7aa87d6d7f7a5e24c40f4b7dd0c7ad2492d96c96dd0a64c914694c736955c7a25953ed6ddf83b9789cf8e9379f296f7bc638f1aba496cb647639003200000000000000000000000000000000003001ec96ec0f379f953be5c516e32b7943f862bbffafcd1c1bfcb7dfc43bf163d209590c2c57c2b6515cbccbef9dbaa2bb79ebee9df639cdeecbad328bab2541209886dd085c6f604ce9ab7b92a4cecd80cf406d8db7f208d33b7c9019db7206925ccb31b6c489515afb389f0ae88d2b1a72e4bef8668a5cdae44ccb2d3d3689aa62e99856557427c4e5c5bc127c6b6f85efdc20712737393d96dcfbbb8441b6ae2b67c44e91b6f83a84b4fb9eca338496cf896fb7995985e93cea5d172774bb49cdcdcb9eedee73cbdba5622234cc56cff00be45574ca3c88188f37b208db2e1e216d0a3b109f84397930c5a9ce5cdbe8bc596a57c99e5cb18abb79fb6db2fb1ca6dca4cea888878b6b5af3b9ed6a8c650da562e7dd133b5fe9dfe9fd3457f6baca7bf5e4bc8c5ddb4917f225565d9b725cc9da749f1b1256cd39f37d76f0f3297bf8a2d3156d979f1a93a715f3e92b3f633a63f2e6ccb5e5db98dedea747f17de91b7b92ce645d4955e9fd9e96f4ce3e45a18e579bd423c39962fe20aca948bb0b2c613da32f52b65f0a57cdb3397757a637d8258dfe434aed802ee069597a8492a296e3df39728af993a9952d96b4ede9f4df65f1f15ab325f6f62ee6bdd5f2ef348a69c793d44cfb5de4b6e48bb999035949462e526925d5b7d00f27ab6ab3d5e7663e359d969f573beefbebf6f05de5646748d2a5abbaefc8a9d5a754f7a287fee7f14bc7fbee26207a7bad863d7d12d972456f78aad4a4da74a34552ccb3b4b3e05f99cb4a4e49f29755ed18a350e924a2924b91dba71ff005b0000000000000000000000000000000000000030052d56e75632845fbd6cb817978fe4998e6b78d36d31d7cacf395cdce72b5fda7b47c91cf5af8c69ec56ae66a594ecb3813f7625e23e4b4eb8502ecd9482d10d884b56c226444aaca216e86fb9128d89019fcc23635cb905766ed2e834acccc31d596d2933328b22c505c317cdf52d586192fae10e3d0ed974e468e5741255a5182dd954ed8ecdbe737b1688576ea6812c094ad85ea876b947855cb938f7ede646d0e16a3657f4dbe38cdf62a6f8377dc4c274a8dee12eb6936ca754eb6fe1e7f26619634f4fd25e6634e8a5f23276248c5b440923049f4212cb89222b1a8a6dbd925cc8f95f7a8dbce65df2cac872e7b748af0476563c61e1e6c9392eb3450a98eef672f131b5b7d3d1f4f8231c73da54b7e866ea6c96c0d30e5bbd912aae6262be28adb7b25d3cbcca5ada56d6f133b2d453c7c66f87edcf7e727fb114a7fa9651136edce6fc0d9accb50cf4d49546f625132f43ecd4f7e34dfd9261cf69713565b6759ea4932e7c997616958c35ee4bd4ad97c30965d599cbba3a62109d9251845ca4fa28add8565d9c2f65b3723695dc38f0fe2e72fc0bc52585bd456bd3d060fb398187b4a55f6d3fbd673fcba178ac396d9ed675a31515b452497716632c8190349ce35c1ca6d28c56edb7d101e4752d4e7ac4ac7da4b1f4ba5fbf37d6cfdf7ee5f8959912691a5cb569432322a74e9d5f3a71ff00e4fe2978ff007dc4c40f4f75b0a2be8b92e48adefe30b529e53a850aeb9e6dae526d4175672d29392773d3aad68c51a8edd38a518a515b2476444474e4e67b64943200000000000000000000000000000000000000c10389aeddb5d18eff00e9d529fcdf25fa3397d4cf5575fa5aee5c5b2c55d4df4d97715887ab3c38ad4ac936937e88da2b2e4be4ad7b96b2718fc538a7e1b93e0ca7d4d5a76f5fdefc89f0527d5c7d30ef83fb5f913e04fabdfc0ac83fb487811ea63e9ba926bf629e32dab9e92cf5e8469aef7d32bcb9020f25c810d920865209861c7625959a59355c1b7f22d10c2f6f1e55a9a679166efa77b34db93b746baf852856b7f3235b474de7d9e34779b4e45b4af6e7e4664ac6d479225310af19c93f75b5bf2e4c8da52538fc6fde7c2bf32b366d8f14d9d2c7c7aaad9a8a6fc598dad2efc78694e56e8a2b84dd918ed26b67b7ec56d32d6b4ad67ca16e35efb146ba4b18036dd402bb251e408972b58b1d78924bac9f097c71fb32f537d63972f0e9da3dacbff535c96f863e930ffb95968c76f474ca212cc9ec8982786f8d0e29b94ba444b3995bbee7898892dd5f90b76fee44ce23cefbf8872cfef2e5be4b646ade788d3011ad356f62ca4cb52544b8f8791993e0c6a676befd9725ea5a2195ed15edeab46d073315377590adb5d22f76bf2d8b69cf6cd0a1a97b2da84ec9db5d90bb9ee937b4bf4d86911961e62eae74d92aed84a138bd9c64b6689526c9b0ded097a9166d8261e8341d096a29e46449c684f6497597fd15ad5a65cfe11a87adc5c2c6c3870e3d30ad792e6fe66bad38ad69b76b01500000349ce35c1ce72518c56edb7c9203ca6a5a94b599cebae6e9d369e76daf971ff7dcbbcac8ce95a5cb589d7939353a74ea9fd463fdff00e27e3fd7d0988d0f5339c29af7e4925c9116b457994c44cf4e74633cebbbd4175671c5672cee5d93318a1d284235c1462b648ed88d469c733b9dcb72500000000000000000000000000000000000000000600f25ed4e67d1b3671e16dce108af25bb6617c7e77897462c9f8e36f37666db2f857ce48d7c22195b2deddcab592b6c7efcdbf993d28d3b37e0107672f0252c3835dc0e5869a0309b4c0923749727cc8d42d1698e96633dd2ddf5e8cce6aedc79bc9224561bb64b6216d33d17308994739a8a7293ff00b2f10e6bdfe505754f2edddf28f8f81a74e4b5bca5d5a31b78ed15c15aef7de433b4a2cbceae88bae9d9bf12dd22236e44ec958f7936c94b11836576d6b4da58d7b15f26f5c4b154366b6dca4cb5ad217a9837b19cba217e986c915996d11a5b840844ca58c433996ea015db49c7905a25c9d5a877634e2baae68bd27563353cf1e9cfc79a9e2c36eee4c9bfb96f4b6de384766442b9f0bddbef15a4c993d5531cea5bc2d8d8b78b23c6617a66ae48dc32d37e417989d2e28f0d35c22be3924fcf9959657e215f3ec7667dcdbe92e15e497214aeab10cb1a0f32cddaca44c296b155565f62aea8b9ce5c924b99686332f59a4fb2b5d495b9fb593eead7c2bd7c4d22ae3c99e67daf435d70aa0a15c2308ae8a2b645dcd3332dc001c9f68346af56c47c314b260b7ae7fd1f93098ede421a2ea14a6be87773e7ca2672e9c76ac43dd6934bc7d331ea945c651ad6f17dcfbcbc469cf79dcad92ab200001a596429ae56592518456ee4df440790d435096b1295b74e58fa652fbfacdfa77b7dcbbbbcacc89749d327accebcacaa9d3a7d4fea31feff009bf1f5ef26207a9b271aa1bbe9dc88b5bc6372988dce9cedeccdbb64fdd5d59c9ce5975f18a1d2ae11ae0a315b2475c445788724ccccee5b164320000000000000000000000000000000000000000030078ff6c6b71d4f1ac6b68ce1b6fe8dff00fd8acf6b474e4bc2d9be2e636ab578d14ba11b4a395690114a09122294408e48911344a1a812d32da5c2fa3ea448b90dd3707cdc7bfc8cad0f470dfca34913dba732adb7a6939a4b76f91688db0bda10d554f2ecddeea0bbcd5c36bf93af462c2aa94ecda1547c7bc6b6ced6fa73f3f5495adc2af760bc09d1a73929498db48accf49a15ec5265d34c7a4918efdc5265ac426855e446da4426aaade4b64576b561d2a69d92d9146f11a5a857b6c55332b308722594ca58c033db6e1e44a368e71d905a1cfca5b2e657e7875535a71ac83aec94ea49a7d63fb1aef71cb19a4e39f2a28e4a73b37e069f7ee6d5d443cfcfbbdb7a6d8b5591b14b85a5dfb95bda34d3d2e2c916dc42daf896ef7317a5b5bc894a155738af81a62218e5e61066d5d9e6d8e3f04df1c5f8a7cc8a5b75e518ff008824f65b175e6661369fa7646a390aaa23d3e293e915e65e236e6c978a76f71a568f8fa5d7b56b8ac6bdeb1ae6ff00646b11a705f2cdfb7449660000000000000001aca51845ca4d24bbc0f2fad5b959b74a395196269d57bcdcbfdcfefb97e256469a5e973d66caf2b2ea74e055fe863fdef37fbf79311ae07aa6e35439eca2909988ec889973672b332ee1874ef7dc91c5ce6976c44628dcba14d51a61c105cbf53b2b5f18d4392d69b4ee529654000000000000000000000000000000000000000000000713dabc4edf4d5725bba25c4ff95f27fbfc8adfa5abdbcdc6ee3ad37c9edcfc9a2a21b27d4942bce604529122294808a4c911b250d409295bd8881d0b6b75ca12972e28fe3b149747a7ef4d27628c7af22b11b74defa474d13cb9a6f755a34e9c36b4cbb4d51a750acbd272dbdcad7713ad3299df4e1e6e7db9963726d47b97812988d22855bf52b36745717da68d7e45265d315884f1a77ee2bb69154b0a79f42369885ba71b7db74576dab459850935b22bb5a234b75c36db9108994f18067329a30259cca48c429b6ce3c823686c5b069572b33a3ddec474ebac6e1cc9bddbdb979b2cd2275d22e49f2044fd30defde113245734159e9d28c38e8e1db7e4444a931b8518d8b1d3c5ca4d55bef09a5bb87fd16b577cd5c9e538a53e16953ccc98423643b27cdd8a5cb6fdc45a37af95ef9a35b87b9c3c7c7c5a1538d18c611ee5fd4e887996999ed396559000000000000000359ce35c1ca4f6480812727db5feea8f38c5fd9f37e646d2ad7634356e1ede1fe5a13538c5fdb6bbfd0881d09ca308eef9244cceb92236e65b64f2ee55c3a7e88e2999cb3a875d6b18e372e85354698284172fd4ecad62bc4396d69b4ee521655900000000000000000000000000000000000000000000000abaa5b0a74cc9b2c49c6354b74fbf97403e734e4ee973eab9faafdccf5a5e796d3b37ef2caa194c08e5302372250d1b0356c9184b703b5a0e913ccb9dd6becf1ab5bd964b92dbc372043aae75595a84e542da8ad70d7e9e3f32261a629d4a3c5c4b32e69c949437e492ea116bccbaf6d98fa4d49cf8657edeec17d92da633332e05f75b996b9cdb6dbfc04cb4ad665bd74a5ea673676e3c5a58855cfa6e536da2a9a14f915db48aacc29e5b24576be93428d9f4236b4556a15f910b6d346015994d08865329a31259cca68c4339948a2149965ae44912ad7724436a38d9b24887655cc9bddb2cbb40431b7c812dea83725c821d282da0922aa8ea57271ec9cd77f2e83ca2195bc7a942f49a3ad729533f2b16cc9fcdf6e6be2a7c3d2e856376e4d09a71aa305baef7b3dcbfa6e2ac3d4fc3b074b9400000000000001a4e71ae3c527b202149c9f6d7ed18c79c62fbbcdf995ffa238c659b2e29a71a13e517f6fcdf9088df295b6d423bb69244cce90e6df74f2adecea4f638af69c93a87652b18e372bb8f8f1c7870ae6df57e275d29148e1cd7bcde794e5d4000000000000000000000000000000000000000000000000071bdad9f07b3d93fc5c2bffe480f9c465c3e9de44c2db4eaddd6cdf3fd4225ab901a3901ab610c123318b93d926c0ede8ba12ca4f2b267d8e255ce736f6df6ee4069adebbf4d82c4c38761835fc305c9cfcd815b4ed3a79338b945ecfa47c48994ef4eae767d3a5d6e9c76a790d6d292e91f244c33e65c0da77cdce6db6fab6566da7463c53659aead92d919793bab4884f0af7e84348aacc2bdb6ee2bb69a4f0873e48aed6d278c76e4885f4963121129631254994d18867329a31259cca68c433994b1892a4ca4510a4cb125c82614b2792643a28e0e74fdedba10ed8506f77e05930c25f20986d086ef6d812bd451d1c8aa161462f8a56351aebe72fd8a5a74c6d6d39f91a9dd7ce3087d5d49f28a2d4c511db3f0d3d4e1c21fe1f16a0b7dbaec74444396dee6fa37fe6e67f2d7fd4b5234a7a9f8758d1cac800000000000696591aa1c527c808631e1fafbf64d2e4b7e515fb95ffa238c659b256589c684fdd87def37e405b6d25bb7c8999d0e764e44afb3b2ad3f238ef79c93e30ebc78e291e52b98d8f1c7af65d5f57e275529158d39f25e6f3b4c59464900000000000000000000000000000000000000000000000001c7f6b2bed3d9ecadbac5465f84901f35096c98197baea3669aee1025bf440490a6527d1fe03695ca31b8766e3b7a9521635ad55e45146063fbb8f5456e97da978b26069a669365f6294e0df847fab1da2750bfa86a54e9d53c7c3929ded6d3b17d9f244c70aea65c285729cb8a6db6ff00329367563c4b30872f0339976c553c21bedc8ab48aac463b10ba584772a9884f15dc885a21345772204918844ca68c432994d0892ce65346219cca68c4967329a31259ccb7e1e415da3b392642d573332cd93e643b7155e7b267c537b3ef25d7a40d6dff0064a74cc62e4f65c8844caee351d36444a37a5ab5aa62a296f393da31ef6c8526dae54f53b9575c712324da7c56b5e3e04638dcf94b2afed3b7337f7d1bc1697b6d3defa6c3d0bc74e5b7b9be8bff009b99fcb5ff005268a7a8eaaeb9a39190000000000476591ae3bc9fa25d591b1125b3edf21a8edd137ca3ff00647fd11c6b9e64d4ed4e34a7eec1fdaf362237cc8b9d16e5b639d95932b66aaa93671e4c9379d43ab1638ac7959631315511ddf39beacdf163f086597279cad1ab2000000000000000000000000000000000000000000000000000015f3a8593857d0d6eacae51fc501f2669c5b4d6cd00412d94b6eab910961c796eba0da34de9bbb297bd1525e64e90e8d36c2d5ee35e9e0552951096b81830b35155cb6e29bde1c4f979fe04c2b2b3ab6af0a2b78580f9749dbdf22dd2b15df6e3575fda975293676e2c5f6b118993aa2a9a1121a44693479742174905b90984f05b9559345efc972094b15b10894d05b867329e110ce653c224b2994d0892ce6534624b3994c9067237b0215322cd97521b52ae1e7dfc9f321e8e3aea1c694b89bd8b34dfd31d1f8b253bfb5bc5a1c9a6d72292aba49428a9ce6d251419cca9abdd354b3ad5f5935c34c3c3cca4fed3e2cadfb70e4c9b6db936db7bb66ed75e31a6896d244b3d3da698f7d363e85e3a735fdc9745ff00cdccfe5aff00fa8b5197a9eaaec1772b200000000476d91aa3bcb9f3d925d5b02249549df9125c497ca2bc115ffa22ae13cd9ab6e4e34a7ee56fed79b1a174b0e7e665713ecebe7bfe67265c9bfd61d58b17cca7c4c5544779739beacd71e38a32cb926f3c2c9ab26490000000000000000000000000000000000000000000000000000000f9d7b59a64b03549db18fd4def8e2d2e49f7a038612771096632e125565c53e71646d3a6139425ba6d344a1729cfdb656adff89159836b919d57c5a8c94bd1f344692a92c39552dd2738f8aea88b4b6c53589e48f3e9ccacbbab1be92c56c55a44374fb910b6d2c797521310963e642f09a2f7f22a258cb6e415994f0e6fc42ab1021129e04b294f0259ca7892ca5245ec14986ce692ea15d21b6f515d434ad36e56665a4ba9576e3c7aedc4c8b5cdbddec89874e95dbdf92e44a36b18d8ee724f6226475a9a5423bbe492fc08d33b5be152d9fd3ad6b7e1c5ab9ce5e3e445ede3d76ce674e76664bcabfb46b68ae508f822d4ac5634b52bae55fa965dab7cf91665697b0d1e5be9b1f42f0e6b76b5a2c5acacc96dc9f02fc37fdcb518fa99e9d72ee6640000004765b1a973ddb7d22bab22644515d9ef7e449292f3e515e0881142a9e658adbe2e3545fb95beff00362237ca7a5d250a39795bfd5d7cf73972e5ff003574e3c5fea5b61e2f67f5962f7dfe45f162f1e654cb97cb88e974e86200000000000000000000000000000000000000000000000000000000014357d36bd570678f66c9f584b6f865dcc0f9965635b89913a2e8f0d907b34128bb88484aa27b3e406ea4a4b6911ad276c4a0e2b7eabc4449a6a9b8bdd3699285dc6cfb15908dad38b69393ea911a3fe2c6a1998729a86254dbefb5f7fc84c2f8af6aca34f9ec8c1eb6dbc7910b44258bd8859bc644276914f9ec82b329a120aacd72ee45565984ba730894f09067309a33259cc2456ec14f167b7d97508f043664edde1a571a8e4e5f727cc36ad34e5df77137cc436e95b6727b9273f29e8c6736b65c88994baf8d8bc2ba6c432b5f4ab9174f3ae78d8cf86a8ffa93f016b4563953dbda8e765425158d8cb6a21dff0079f8914a6bf6b7656bbe547bcd5a92e488844ba5a668197a8a562daaa7efc975f4469157265cd1497adc1d2a1898caa764a7b77edb1a78b92d9a6dd2de3d10c78b8c37e6f764c33b5a6dda525564000023b6d554777bb6dec977b7e004494688cafbe4b8df57e1e48a7fd11d75cf2ec575c9c6b4f7856fbfcd93102e1614b332d417043af79cd9b26b887462c5be659c2c4ecd76962f7dfe44e2c5e3cca32e5f2e23a5c3a18320000000000000000000000000000000000000000000000000000000000001c2f697418eab476b424b2ab5c9fdf5e0c0f9f595ce9b255d91719c5ece2d734c25a006820037858e2ff7ef2261689d26ecabb56f16a2fc1be4ca6e617d44b49e2d91938b8b4fc1968bc4f499c36f866146cfdeebe0566df4d71e1fb598bd8cf4ed88489ec4346c99032a7e0c2b32de320ac42684fc02c9e16edcb720da785bb736c84a78dc9779069bac84bbc23c479297783c5a4b2d6dc984f8aad992e5c93e5e24e97d2acec726d224de9a2adc9f46c6cd2d51852934dad910999887528c58d50e29ed18a5cdf810e7be599e2156fca9e6395385caa5fea5cfa242d6f1ed11c732e765e6571a562e1eea9fb53ef995ad277e56ed35aedcf7e08d5b6d95c90217747d3dea5a842a69f66bdeb1f917ac6d867c9e15dbe8118a84546292496c91bbc96c0000000057cbcba70a9ed6f96d1df6492ddc9f825dec7443833d5e78d77d33366d3b39538b0e6f6fdfc5fc915ec76aba277cd5d92b64be0afeefaf988fb94ad96429e665aad7041eece6cb975c437c58e66772d30f11b92b6e5cfb9118b0fccad972c7b6ae81d4e600000000000000000000000000000000000000000000000000000000000000000e0fb43eced7aac1dd46d5e545727dd3f27fb81f3fb6a9d16caab62e3383da517dcc0d40452e7bb03006d1938be4f61c0bb4662e150b12947eec9f4f47dc656c7be9be3cd35ed6e35c2e5b56f77f725ca4bd3c4c6666bdbba992b7e9a3c669375be2f2ef44edb4d3489a717b35cfcc9558e2dfa12af9368b04378b216896ea7b724422652c67b7992948acdbbf9909db2adf32067b6f30b0ec6c0d5c9cbc97ea12c28ca4f649837b4f5624a5b7223674e863e06cd72219db2c42cdf6e369f5f15d25bf747bd93a61fb649e1cec89d9950ed73a7f47c5fb35af8a6566ff00155e355e21cdccd41dd0545105550ba4577fa934a6b99ed7ad3e654b7f03469b10238679c9a496e0997bad034dff000fc15c6bebacf7a7e5e08deb1a87959f2fe4b3aa598000000021c8c8af1699dd74946115bb6079e9caecdc9593949452f860df2ae3fbbef7f2339b2da3d9cab133f51cbcfe0739d7351ae527ba8f2eef02f0897a6250ab9794a98f0c5fbdfa1865c9e3c435c78fc9161e2b6d5d72ddfd94530e2f9969972ff9aaf9d2e6649000000000000000000000000000000000000000000000000000000000000000000070bda1f676bd560eea76af2a2b93ee9f93fdc0f01938d7625d2a722b75d91ea9a023037b9c1cdf669a8f76e0680600de13945ad9b5b74e7d0895abdba14ea4db4b223c7fc5bed25f3eff009984e28ff2eca67b57b5956d37b494e32dfef7bb2fc7a14e6bdba7f3d6fdb59e224fdd96cfc26b6117dade13f0d258b7416f283dbc516d9e3aeda734f6d86d1bdb65cbd49e4886c9edd0aacdd6e3637516fb8274de35c9f71094b1c69bea82622562bc194b6dd72236899885fa74e696fc292f10c673c7c3695f8788d46cb53977460b76c29fbdfa4391a865496d5c61895fdeb1fbdf815fc91f0452b1ccf2e64f3b171e4e75b79591ff002d8b92f443c6d6ed6d4cf0e764645b93639dd3727fa1a56b10d22ba45b92b6d948263965bd8276f41ecc690eeb639b747eae1fe9a7f69f8fc8d2b570fa9cbafd61eb8d5c0c80000008afbebc6aa56db251847ab1d0e264593ccb96464270a20feaab7defc5f9fe9ea676b2d10a5ab2bf230a556334a73f8b9edcbc0ad7504c3aba45783a46046885b194be29c92e7291a7942ba41a9eb51aea72737555e3f6a5e48aee653a737d9acc9eabab5ca7baa2baf78c3cf75cd8fc713dad19263a7b134500000000000000000000000000000000000000000000000000000000000000000000000039dab68f8bab53c17c769af82c5f147fe80f03abe8995a45bb5d1e3a9fc36457baff0066073800180365d4895abdb644358653dba3d88d27b59ab36ea970a9371fbaf9afc1949a44af16b57a5aab5182eb170fe47b7e4f919ce396d19edf2b51c9a27d7b37fcf071fd0afecd232d25ba8634fec35e709a7fa91e5aed7f2ab758d8fb2ff592f3adff0041e696eb1f1d3e774bff00918f2394b1af123b7d64dfff00b6c6e0dd92278d0e6a36cfd2bdbf523708dd9b7d3ab87c388fff007b121e75f85277f3663fc47225caaecabfe58b9b1e7f4a6a9f28e54645cb8adededfe6970c7f044eaf298bc47b6105b6598c9aae15d7fcab98fc5bed6dccf6e55f64ec9373937f3348888e96d4474877d89d27675096522168867a7209de97b48d36cd4b2d56b755c79ce5e0bf72d5aed8e5c9f8e36f7d5d70a6b8d75c546115b24bb91bf4f2a677ccb708640000349ce35c1ce6d28c56edbee03cee6ea15d96abb25b8d717f554f7bf37e7fa19da76b44393a867665b6d53e174d326d716dbf08ac133a4ba2e4e4e551396443649fbb2db6dc5a20895bcbc9ab0e876db2d97725d64ca45763818d8d9ded267f0c56d08f57f66b46cabde697a663e958aa9c78f5e729beb27e2c91780000000000000000000000000000000000000000000000000000000000000000000000000023baaaefaa55db0538496ce2d726078ed63d8db2b93b74e7da43af6527ef2f47de0796b2b9d53942c84a128bd9c64b6680d0821b2ea82d5edb10d4212c849b84edb27b746c84b65649749323496f1bed8f49b4478c274923997ae963fc4af8553a6f1ccbdbf8dfe23c213a58a66ec6b8defea4784274ed61554b6b7ae2fd516f184e9d9a2308c7dd825e88bc698da1a64f38b2257a3cfe7ae6f6e455b6dc6b5736128d2216d36d88daf106e13b5bd3b4ebf51bfb3a23d3e293e9145a236caf9231c6e5eef4ec0ab4ec654d4bf9a5df27e26d11a7997c9379dcad92a00000115b7d54edda59186fd389edb81e6b5fd76106a114dadfdd8edc93f197f45f891d8e3635d1b6ce3958a736fab7cca4c2cece33f7762b2969a86a1460569daf79b5eec1757ff422a871b0b4fcff006972dd8df0d317b39bf862bc178b3588d2af7b8383469f8d1c7c6828c23f8b7e2c916400000000000000000000000000000000000000000000000000000000000000000000000000000001ccd5b43c4d5a1f5d0e0b52f76d8af797ee80f09aae8599a4cf7ba1c5577591f85fec12e6aea411db621b328259213a3609d320084b21204b78f52165cc77b3412ede14ba109d3b744bdd45a34ced05ff0009129a383a8479b2adb4e2dab9b0b6917421637dc27732bda5e9591a95ca3545a827ef4dae4bfec988db3c99231f6f7783854e063aa688ed15d5f7b7e2cda234f32d79bcee560955900000aba867d3a7624b22f7b45724bc5f7203cde4645f6664615a8e46a772f752e70c78ff007f8f7f72207a2c5c0aead3a18974616a51f7f78f29bef7b7a92383a97b1545bbcf4fb5d13fb92e71fc7aafcc0f3b9546afa2cf6b7b5ae3dd2df8a0ff00a11a4ace8da2656bd92f2b2a5258fbfbd37d67e51275a43df6363d58b4c69a20a15c79249012800000000000000000000000000000000000000000000000000000000000000000000000000000000000d2708d90709c54a2d734d6e981e7754f63b1b25bb30a7f479bfb3b6f17fb01e6f50f67751d3a1c7652acaf6e72a9f16dea4348b394990bc4b2884b64c2db084b2126c12c84b68f5212b543e6825d8c296cd094c3b98d2de28422f096de712654af0e26a0baf228df70e0ddd584f68a10959350845ca4fa24b760e21e934df64ec9b8d99d3508f5ece2f76fd5978a39efea75c55ea68a2bc7aa35d3050847a452e86910e39999e6528400000002aea3814ea5893c6bd370977aea9f8a020d1f47c7d231dc294e5397c76497397fd01d1000693846c8b84e2a516b669ae4c0575c2aae35d71508456ca296c9203700000000000000000000000000000000000000000000000000000000000000000000000000000000000003000001c9d47d9cd3b50de52a7b2b1fdbaf93fd9909dbcce77b1f9f8edcb1dc3261e4f865f810bc5dc4bb1eec79f05f54eb978496c434896816084b3b84ecdc276d975216dac532e6b9836eae24b9a129dbb9892de2842656a6f7889521ccc9c6b6f938d55ca6fc910d26f58edae3fb2965b352cbb9423f761cdfe25a28c2dea223daef60e9989811db1e98c5f7cbab7f32f10e7b5ed6ed6c95003200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000476d55dd0e0b2119c7c24b7039791ecbe957bdfe8eeb7e35cb62be2b45e5cebbd89a1bde9cbb21e528a7fb0f15e324ab4bd89bd7c19907eb068693f9611cbd8bcd5f0e450fd77fd8693f9608fb199ddf7e3fe2ff623c53f9a1355ec7e545fbd934af44d8f13f342fd1ecccabdb8b297ca1ff64f89ff00e47f1d2a34caea4939ca5f90f15673cfc2d468ae3f617ccb339bcca44b65d02ac800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003000000000000000000c8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030000f9159394a4dc9eec9d447109f188e21a0d1a7ffd9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

CREATE TABLE `nivel` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `nivel`
--

INSERT INTO `nivel` (`id`, `nombre`) VALUES
(1, 'I'),
(2, 'II'),
(3, 'III'),
(4, 'IV'),
(5, 'V'),
(6, 'VI'),
(7, 'VII'),
(8, 'VIII'),
(9, 'IX'),
(10, 'X'),
(11, 'XI'),
(12, 'XII');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nucleo`
--

CREATE TABLE `nucleo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `latitud` double NOT NULL,
  `longitud` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `nucleo`
--

INSERT INTO `nucleo` (`id`, `nombre`, `direccion`, `telefono`, `latitud`, `longitud`) VALUES
(1, 'Club Español', '6 e/ 53 y 54', '221 421-9286', -34.915552, -57.9463),
(2, 'Teatro Argentino', '53 9 y 10', '221 429-1732', -34.917868, -57.951469),
(3, 'Centro Cultural Papa Francisco', '44 y 126 ', '', -34.933806, -57.880958),
(4, 'Parroquia San Miguel Arcángel', '63 y 124', '221 482-4491', -34.907247, -57.922051),
(5, 'Centro Integración Complementaria (CIC)', '169 y 33', '', -34.881952, -57.857795),
(6, 'Escuela N°501', 'Pascual Ruberto e/ 168 y 169', '', -34.881311, -57.860249),
(7, 'Jardin N°904', '164 30 y 31', '221 421-9286', -34.884631, -57.86392),
(8, 'Escuela N°25 \"Crucero General Belgrano\"', '126 e/ 29 y 30', '', -34.926077, -57.893324),
(9, 'Escuela N°22 \"Independencia del Peru\"', '32 Y 173', '221 461-1975', -34.876378, -57.855967),
(10, 'Escuela N°20', 'Ruta 11 km 13- Pje La Hermosura', '', -34.957993, -57.817773),
(11, 'Escuela N°17', 'Calle 164 y 26', '', -34.881083, -57.86917),
(12, 'Escuela N°14', '96 y 126', '', -34.930286, -57.88508),
(13, 'Escuela N°8', '63 y 125', '221 483-2115', -34.906571, -57.921736),
(14, 'Escuela N°7 \"General Enrique Mosconi\"', 'Calle 151 e/ 8 y 9', '', -34.884462, -57.898273),
(15, 'Escuela N°6 \"Gabriela Mistral\"', 'Calle 8 y 158', '', -34.876275, -57.892968),
(16, 'Cancha de EDLP', '1 y 57', '', -34.911796, -57.938995);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `nombre`) VALUES
(1, 'estudiante_index'),
(2, 'estudiante_new'),
(3, 'estudiante_destroy'),
(4, 'estudiante_update'),
(5, 'estudiante_show'),
(6, 'configuracion_sistema'),
(7, 'usuario_index'),
(8, 'usuario_new'),
(9, 'usuario_destroy'),
(10, 'usuario_update'),
(11, 'usuario_show'),
(12, 'docente_index'),
(13, 'docente_new'),
(14, 'docente_destroy'),
(15, 'docente_update'),
(16, 'docente_show'),
(17, 'ciclo_index'),
(18, 'ciclo_show'),
(19, 'ciclo_new'),
(20, 'ciclo_destroy'),
(21, 'ciclo_update'),
(22, 'instrumento_index'),
(23, 'instrumento_new'),
(24, 'instrumento_destroy'),
(25, 'instrumento_update'),
(26, 'nucleo_new'),
(27, 'nucleo_update'),
(28, 'nucleo_destroy');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preceptor`
--

CREATE TABLE `preceptor` (
  `id` int(11) NOT NULL,
  `apellido` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preceptor_nucleo`
--

CREATE TABLE `preceptor_nucleo` (
  `preceptor_id` int(11) NOT NULL,
  `nucleo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsable`
--

CREATE TABLE `responsable` (
  `id` int(11) NOT NULL,
  `apellido` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nac` date NOT NULL,
  `localidad_id` int(11) NOT NULL,
  `domicilio` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `genero_id` int(11) NOT NULL,
  `tipo_doc_id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `tel` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `responsable`
--

INSERT INTO `responsable` (`id`, `apellido`, `nombre`, `fecha_nac`, `localidad_id`, `domicilio`, `genero_id`, `tipo_doc_id`, `numero`, `tel`) VALUES
(1, 'Sanchez', 'Julio', '1964-07-25', 5, 'Plaza', 1, 1, 987654321, '469469'),
(2, 'Muzzolini', 'Cacho', '2019-11-05', 1, 'calle falsa 123', 1, 1, 1212, '1212');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsable_estudiante`
--

CREATE TABLE `responsable_estudiante` (
  `responsable_id` int(11) NOT NULL,
  `estudiante_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Docente'),
(3, 'Estudiante'),
(4, 'Preceptor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_tiene_permiso`
--

CREATE TABLE `rol_tiene_permiso` (
  `id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `permiso_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `rol_tiene_permiso`
--

INSERT INTO `rol_tiene_permiso` (`id`, `rol_id`, `permiso_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 2, 1),
(7, 2, 5),
(8, 1, 6),
(9, 1, 7),
(10, 1, 8),
(11, 1, 9),
(12, 1, 10),
(13, 1, 11),
(15, 1, 17),
(16, 1, 18),
(18, 1, 19),
(19, 1, 20),
(20, 1, 21),
(32, 1, 12),
(33, 1, 13),
(34, 1, 14),
(35, 1, 15),
(36, 1, 16),
(37, 2, 7),
(38, 2, 10),
(39, 2, 11),
(40, 2, 12),
(41, 2, 16),
(42, 4, 1),
(43, 4, 4),
(44, 4, 5),
(46, 2, 17),
(50, 1, 22),
(51, 1, 23),
(52, 1, 24),
(53, 1, 25),
(122, 2, 18),
(123, 2, 4),
(124, 1, 26),
(125, 1, 27),
(126, 1, 28);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taller`
--

CREATE TABLE `taller` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_corto` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `taller`
--

INSERT INTO `taller` (`id`, `nombre`, `nombre_corto`) VALUES
(1, 'taller de clarinete', 'clarinete'),
(2, 'taller de flauta traversa', 'flauta traversa'),
(3, 'taller de piano', 'piano'),
(4, 'taller de canto comunitario', 'canto comunitario'),
(5, 'taller de guitarra', 'guitarra'),
(6, 'taller de bajo', 'bajo'),
(7, 'taller de acordeon', 'acordeon'),
(8, 'taller de oboe', 'oboe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_instrumento`
--

CREATE TABLE `tipo_instrumento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_instrumento`
--

INSERT INTO `tipo_instrumento` (`id`, `nombre`) VALUES
(1, 'Viento'),
(2, 'Cuerda'),
(3, 'Percusión');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contraseña` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `email`, `contraseña`, `updated_at`, `created_at`, `username`, `activo`) VALUES
(8, 'Nombre1', 'Apellido1', 'aa@aa', '1234', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1),
(10, 'Federico', 'Perez', 'fede@hotmail.com', '12345678', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0),
(11, 'Ana', 'Gutierrez', 'ana@hotmail.com', '12345678', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0),
(12, 'Fiorella', 'Bermudes', 'fiore@gmail.com', '12345678', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1),
(16, 'Nahuel', 'Romoli', 'admin@admin.com', 'admin', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1),
(17, 'Jere', 'Diaz', 'docente@docente.com', 'docente', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1),
(18, 'Agustín', 'Gonzalez', 'estudiante@estudiante.com', 'estudiante', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1),
(19, 'nombrePreceptor', 'apellidoPreceptor', 'preceptor@preceptor.com', 'preceptor', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_tiene_rol`
--

CREATE TABLE `usuario_tiene_rol` (
  `id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `usuario_tiene_rol`
--

INSERT INTO `usuario_tiene_rol` (`id`, `rol_id`, `usuario_id`) VALUES
(3, 1, 8),
(6, 3, 10),
(7, 3, 11),
(8, 3, 12),
(9, 1, 16),
(10, 2, 17),
(11, 3, 18),
(12, 4, 19);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencia_estudiante_taller`
--
ALTER TABLE `asistencia_estudiante_taller`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `barrio`
--
ALTER TABLE `barrio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ciclo_lectivo`
--
ALTER TABLE `ciclo_lectivo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ciclo_lectivo_taller`
--
ALTER TABLE `ciclo_lectivo_taller`
  ADD PRIMARY KEY (`taller_id`,`ciclo_lectivo_id`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_genero_docente_id` (`genero_id`);

--
-- Indices de la tabla `docente_responsable_taller`
--
ALTER TABLE `docente_responsable_taller`
  ADD PRIMARY KEY (`docente_id`,`ciclo_lectivo_id`,`taller_id`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estudiante_taller`
--
ALTER TABLE `estudiante_taller`
  ADD PRIMARY KEY (`estudiante_id`,`ciclo_lectivo_id`,`taller_id`);

--
-- Indices de la tabla `instrumento`
--
ALTER TABLE `instrumento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tipo_instrumento_id` (`tipo_id`);

--
-- Indices de la tabla `nucleo`
--
ALTER TABLE `nucleo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `responsable`
--
ALTER TABLE `responsable`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rol_tiene_permiso`
--
ALTER TABLE `rol_tiene_permiso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rol_id` (`rol_id`),
  ADD KEY `permiso_id` (`permiso_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `usuario_tiene_rol`
--
ALTER TABLE `usuario_tiene_rol`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rol_id` (`rol_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `barrio`
--
ALTER TABLE `barrio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `ciclo_lectivo`
--
ALTER TABLE `ciclo_lectivo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `docente`
--
ALTER TABLE `docente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `instrumento`
--
ALTER TABLE `instrumento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `nucleo`
--
ALTER TABLE `nucleo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `responsable`
--
ALTER TABLE `responsable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rol_tiene_permiso`
--
ALTER TABLE `rol_tiene_permiso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `usuario_tiene_rol`
--
ALTER TABLE `usuario_tiene_rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `rol_tiene_permiso`
--
ALTER TABLE `rol_tiene_permiso`
  ADD CONSTRAINT `rol_tiene_permiso_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `rol_tiene_permiso_ibfk_2` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`);

--
-- Filtros para la tabla `usuario_tiene_rol`
--
ALTER TABLE `usuario_tiene_rol`
  ADD CONSTRAINT `usuario_tiene_rol_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `usuario_tiene_rol_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
