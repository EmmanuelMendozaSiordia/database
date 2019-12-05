-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2019 a las 16:00:11
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdcarros`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carros`
--

CREATE TABLE `carros` (
  `Num_placa` varchar(7) NOT NULL,
  `Precio` double(10,2) NOT NULL,
  `Seminuevo` tinyint(1) NOT NULL,
  `Color` varchar(20) NOT NULL,
  `Modelo` varchar(20) NOT NULL,
  `Marca` int(25) NOT NULL,
  `Imagen` blob NOT NULL,
  `Año` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carroscliente`
--

CREATE TABLE `carroscliente` (
  `Num_placa` varchar(7) NOT NULL,
  `Fecha` date NOT NULL,
  `Cantidad` int(3) NOT NULL,
  `Id_Cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Id_Cliente` int(11) NOT NULL,
  `RFC` varchar(20) NOT NULL,
  `Nombre` varchar(35) NOT NULL,
  `Appellidos` varchar(35) NOT NULL,
  `Direccion` varchar(70) NOT NULL,
  `Telefono` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carros`
--
ALTER TABLE `carros`
  ADD PRIMARY KEY (`Num_placa`);

--
-- Indices de la tabla `carroscliente`
--
ALTER TABLE `carroscliente`
  ADD KEY `Num_placa` (`Num_placa`),
  ADD KEY `Id_Cliente` (`Id_Cliente`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id_Cliente`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carroscliente`
--
ALTER TABLE `carroscliente`
  ADD CONSTRAINT `Id_Cliente` FOREIGN KEY (`Id_Cliente`) REFERENCES `cliente` (`Id_Cliente`),
  ADD CONSTRAINT `Num_placa` FOREIGN KEY (`Num_placa`) REFERENCES `carros` (`Num_placa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
