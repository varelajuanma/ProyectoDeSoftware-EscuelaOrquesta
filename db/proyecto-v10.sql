-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2019 a las 22:13:00
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

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
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(6000) COLLATE utf8_bin NOT NULL,
  `mailcontacto` varchar(255) COLLATE utf8_bin NOT NULL,
  `habilitacion` int(1) DEFAULT NULL,
  `paginacion` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `titulo`, `descripcion`, `mailcontacto`, `habilitacion`, `paginacion`) VALUES
(1, '   Orquesta Escula De Berisso\r\n	 	\r\n    \r\n    \r\n    \r\n    ', 'La Orquesta   Escuela de Berisso comenzó a funcionar en septiembre del 2005 en el barrio de El Carmen de la localidad de Berisso bajo la dirección del Mtro. Juan Carlos Herrero, orientada especialmente a la atención de chicos en situación de vulnerabilidad socio-cultural. Desde sus 20 alumnos iniciales fue creciendo hasta atender actualmente una matrícula de aproximadamente 530 chicos, distribuidos en los 15 núcleos que la conforman y dirigida a una franja etaria de 5 a 23 años, cubriendo en su accionar a la casi totalidad de los barrios de Berisso más los espacios cedidos por el Club Español y el Teatro Argentino En 2012 marcó la apertura de sesión en la Honorable Cámara de Diputados de la Nación durante el tratamiento de la Ley para la recuperación de YPF, realizando la grabación del Himno Nacional Argentino en el mismo lugar. Sus alumnos se han presentado en escenarios de la categoría del Salón Dorado de la Municipalidad de La Plata, las Catedrales de La Plata y Buenos Aires , Senado de la Provincia, el Coliseo Podestá, el Teatro Argentino, Centro Cultural Néstor Kirchner y el Luna Park en nuestro país; en el exterior han participado en forma grupal e individual en experiencias musicales realizadas en Venezuela, Francia, EEUU y Brasil. A partir de su formación, alumnos de la Orquesta Escuela pudieron acceder a estudios universitarios en la Facultad de Bellas Artes de La Plata y la Universidad de Lanús. Sus alumnos de nivel superior cumplen tareas docentes como agentes multiplicadores dentro de su misma estructura, además de lograr la inserción en los circuitos semiprofesionales de trabajo ocupando cargos en la Orquesta Municipal de Tango de Berisso, la Orquesta Sinfónica Municipal de Berisso a los que se sumaron posteriormente desempeños en la Camerata Académica del Teatro Argentino. Es responsable también de la formación musical de la primer alumna del Sistema de Orquestas en ingresar por concurso a la Orquesta Estable del Teatro Argentino. Asimismo en la actualidad ofrece una capacitación única en el país en Música de Cámara a cargo del Mtro. José Bondar. En 2015, enmarcado en el festejo por sus 10 años, brindó una serie de conciertos entre los que se incluyó la invitación del Teatro Argentino para formar parte del Ciclo de la Sala A. Piazzolla, una presentación en el CCK de Bs. As, un concierto en el Teatro Mitre de San Salvador de Jujuy para presentarse junto al Sistema de Orquestas Juveniles de Jujuy bajo la dirección del Mtro. Sergio Jurado y el estreno de la Misa Mestiza, escrita en honor de SS el papa Francisco, junto al Vocal de Cámara Platense, el coro de Cámara de la facultad de Bellas Artes y el Ensamble de Percusión de Pehuajó, con la dirección del Mtro. Fernando Tomé. Sus formaciones se han presentado bajo la dirección de los Mtros Ruben Cabanes, José Bondar, Sergio Jurado y Mario Benzecry, entre otros. Fue distinguida en su labor educativa por la Fundación Florencio Pérez, con el Premio Daniel Román de la Dirección de Cultura de Berisso ; en 2014 la Federación de Entidades de Bien Público de Berisso hizo entrega de una distinción por Servicio Comunitario y en 2015 nuevamente con el Premio de Cultura Daniel Román por su Camerata.', ' @berisso.gob.ar', 0, 0);

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
(6, 'configuracion_sistema');

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
(3, 'Estudiante');

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
(8, 1, 6);

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
(8, 'Nombre1', 'Apellido1', 'aa@aa', '1234', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0),
(9, 'oscar', 'gomez', 'oscar.gomez@hotmail.com', '1234', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0),
(10, 'Federico', 'Perez', 'fede@gmail.com', '12345678', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0),
(11, 'Ana', 'Gutierrez', 'ana@hotmail.com', '12345678', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0),
(12, 'Fiorella', 'Bermudes', 'fiore@gmail.com', '12345678', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0),
(13, 'Martin', 'Sosa', 'martins@gmail.com', '12345678', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0);

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
(5, 2, 9),
(6, 3, 10),
(7, 3, 11),
(8, 3, 12),
(9, 3, 13);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
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
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `rol_tiene_permiso`
--
ALTER TABLE `rol_tiene_permiso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `usuario_tiene_rol`
--
ALTER TABLE `usuario_tiene_rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
