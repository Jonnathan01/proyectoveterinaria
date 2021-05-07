-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-05-2021 a las 22:46:05
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `petclinit`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id_Especialidad` int(11) NOT NULL,
  `Nombre_Especialidad` varchar(45) NOT NULL,
  `Id_Verinario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial mascota`
--

CREATE TABLE `historial mascota` (
  `Id_Persona` int(11) NOT NULL,
  `Id_Mascota` int(11) NOT NULL,
  `Hospitalizacion` varchar(45) NOT NULL,
  `Formula_Medica` varchar(45) NOT NULL,
  `Consultas_Realizadas` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Raza` varchar(45) NOT NULL,
  `Peso` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

CREATE TABLE `mascota` (
  `Id_Mascota` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `Id_Verinario` int(11) NOT NULL,
  `Tipo_Mascota` varchar(45) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Raza` varchar(45) NOT NULL,
  `peso` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id_Persona` int(11) NOT NULL,
  `Identificacion` int(11) NOT NULL,
  `nombres` varchar(20) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `telefono` int(11) NOT NULL,
  `tipo_identificacion` varchar(20) NOT NULL,
  `direccion` varchar(11) NOT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id_Persona`, `Identificacion`, `nombres`, `apellidos`, `telefono`, `tipo_identificacion`, `direccion`, `email`) VALUES
(12, 434545, 'jefferson david', 'Rincon Angel', 45435464, 'cc', 'kr 122 b 73', 'david3@gmail.com'),
(32, 0, 'jefferson camilo', 'Rincon Angel', 45435464, 'cc', 'kr 23 26 37', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

CREATE TABLE `propietario` (
  `Id_Persona` int(11) NOT NULL,
  `Id_Mascota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veterinario`
--

CREATE TABLE `veterinario` (
  `Id_Persona` int(11) NOT NULL,
  `id_Especialidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id_Especialidad`);

--
-- Indices de la tabla `historial mascota`
--
ALTER TABLE `historial mascota`
  ADD PRIMARY KEY (`Id_Persona`,`Id_Mascota`),
  ADD KEY `Id_Mascota` (`Id_Mascota`);

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`Id_Mascota`,`id_persona`,`Id_Verinario`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id_Persona`);

--
-- Indices de la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`Id_Persona`,`Id_Mascota`),
  ADD KEY `Id_Mascota` (`Id_Mascota`);

--
-- Indices de la tabla `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`Id_Persona`,`id_Especialidad`),
  ADD KEY `id_Especialidad` (`id_Especialidad`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id_Persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=630;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD CONSTRAINT `especialidad_ibfk_1` FOREIGN KEY (`id_Especialidad`) REFERENCES `veterinario` (`id_Especialidad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `historial mascota`
--
ALTER TABLE `historial mascota`
  ADD CONSTRAINT `historial mascota_ibfk_1` FOREIGN KEY (`Id_Mascota`) REFERENCES `mascota` (`Id_Mascota`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial mascota_ibfk_2` FOREIGN KEY (`Id_Persona`) REFERENCES `veterinario` (`Id_Persona`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `veterinario` (`Id_Persona`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD CONSTRAINT `propietario_ibfk_1` FOREIGN KEY (`Id_Mascota`) REFERENCES `mascota` (`Id_Mascota`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `veterinario`
--
ALTER TABLE `veterinario`
  ADD CONSTRAINT `veterinario_ibfk_1` FOREIGN KEY (`Id_Persona`) REFERENCES `personas` (`id_Persona`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
