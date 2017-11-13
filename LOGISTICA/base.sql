-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 11-11-2017 a las 14:23:35
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `base`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `id_reporte` varchar(10) NOT NULL,
  `longitud` varchar(20) NOT NULL,
  `latitud` varchar(20) NOT NULL,
  `km_recorrido_real` int(10) NOT NULL,
  `combustible_real` int(10) NOT NULL,
  `tiempo_real` time DEFAULT NULL,
  `contratiempo` varchar(50) DEFAULT NULL,
  `id_viaje` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chofer_vehiculo`
--

CREATE TABLE `chofer_vehiculo` (
  `usuario` varchar(10) NOT NULL,
  `id_vehiculo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chofer_viaje`
--

CREATE TABLE `chofer_viaje` (
  `id_viaje` int(10) NOT NULL,
  `usuario` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(10) NOT NULL,
  `razon_social` varchar(10) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `telefono` int(10) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `razon_social`, `direccion`, `telefono`, `email`) VALUES
(1, 'RS1', 'cochabamba 11', 2345, 'lalala@lila.com'),
(2, 'RS2', 'cochabamba 12', 2345, 'lalala@lila.com'),
(3, 'RS3', 'cochabamba 13', 2345, 'lalala@lila.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` int(8) NOT NULL,
  `usuario` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `rol` int(10) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `apellido` varchar(10) NOT NULL,
  `dni` int(10) NOT NULL,
  `area` varchar(20) DEFAULT NULL,
  `licencia` varchar(20) DEFAULT NULL,
  `matricula` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `usuario`, `password`, `rol`, `nombre`, `apellido`, `dni`, `area`, `licencia`, `matricula`) VALUES
(3, 'cacho', '1234', 2, 'Carlos', 'Perez', 37254136, 'chofer', 'profesional', ''),
(4, 'est', '8888', 2, 'esther', 'dddduuud', 212121111, NULL, NULL, NULL),
(5, 'lau', '4567', 1, 'Laura', 'Ramos', 34332212, 'administrador', '', ''),
(1, 'laush', '1111', 2, 'laura', 'ramos', 34332212, NULL, NULL, NULL),
(2, 'leo', '1212', 3, 'Leonardo', 'Montero', 212121111, 'mecanico', 'profesional', '12345'),
(9, 'nuevo', '3333', 1, 'sadasd', 'asdasd', 34332212, 'dasd', 'as234234', 'rsfdd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento`
--

CREATE TABLE `mantenimiento` (
  `id_mantenimiento` varchar(10) NOT NULL,
  `fecha_service` date DEFAULT NULL,
  `km_unidad` float DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `repuestos` varchar(15) DEFAULT NULL,
  `usuario` varchar(10) DEFAULT NULL,
  `id_vehiculo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `nro` int(1) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `usuario` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id_vehiculo` varchar(10) NOT NULL,
  `patente` varchar(6) DEFAULT NULL,
  `nro_motor` int(11) DEFAULT NULL,
  `nro_chasis` int(11) DEFAULT NULL,
  `marca` varchar(15) DEFAULT NULL,
  `modelo` varchar(15) DEFAULT NULL,
  `usuario` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`id_vehiculo`, `patente`, `nro_motor`, `nro_chasis`, `marca`, `modelo`, `usuario`) VALUES
('23', 'sdf456', 1123456, 12345, 'ford', 'ka', 'lau');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo_viaje`
--

CREATE TABLE `vehiculo_viaje` (
  `id_vehiculo` varchar(10) NOT NULL,
  `id_viaje` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viaje`
--

CREATE TABLE `viaje` (
  `id_viaje` int(10) NOT NULL,
  `origen` varchar(20) NOT NULL,
  `destino` varchar(20) NOT NULL,
  `fecha_salida` date NOT NULL,
  `fecha_llegada` date NOT NULL,
  `tipo_carga` varchar(20) NOT NULL,
  `km_recorrido_previsto` int(10) NOT NULL,
  `km_recorrido_real` int(10) NOT NULL,
  `combustible_previsto` int(10) NOT NULL,
  `combustible_real` int(10) NOT NULL,
  `tiempo_estimado` time DEFAULT NULL,
  `tiempo_real` time DEFAULT NULL,
  `id_cliente` int(10) NOT NULL,
  `usuario` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `viaje`
--

INSERT INTO `viaje` (`id_viaje`, `origen`, `destino`, `fecha_salida`, `fecha_llegada`, `tipo_carga`, `km_recorrido_previsto`, `km_recorrido_real`, `combustible_previsto`, `combustible_real`, `tiempo_estimado`, `tiempo_real`, `id_cliente`, `usuario`) VALUES
(1, 'Argentina', 'Brasil', '2017-08-09', '2017-08-09', 'Mercaderia', 100, 150, 25, 20, '12:02:00', '10:01:01', 1, 'lau'),
(2, 'Argentina', 'chileeeee', '2017-08-09', '2017-08-09', 'Mercaderia', 100, 0, 25, 0, '12:02:00', '00:00:00', 2, 'cacho'),
(3, 'Argentina', 'Brasil', '2017-08-09', '2017-08-09', 'Mercaderia', 100, 150, 25, 20, '12:02:00', '10:01:01', 3, 'leo'),
(5, 'Argentina', 'Brasil', '2017-08-09', '2017-08-09', 'Mercaderia', 100, 150, 25, 20, '12:02:00', '10:01:01', 2, 'cacho');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id_reporte`),
  ADD KEY `bbitacora_fk` (`id_viaje`);

--
-- Indices de la tabla `chofer_vehiculo`
--
ALTER TABLE `chofer_vehiculo`
  ADD PRIMARY KEY (`usuario`,`id_vehiculo`),
  ADD KEY `vehiculo_fk` (`id_vehiculo`);

--
-- Indices de la tabla `chofer_viaje`
--
ALTER TABLE `chofer_viaje`
  ADD PRIMARY KEY (`id_viaje`,`usuario`),
  ADD KEY `chofer_fk` (`usuario`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`usuario`);

--
-- Indices de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD PRIMARY KEY (`id_mantenimiento`),
  ADD KEY `me_fk` (`usuario`),
  ADD KEY `ve_fk` (`id_vehiculo`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`nro`),
  ADD KEY `fk_rol` (`usuario`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id_vehiculo`),
  ADD KEY `flota_fk` (`usuario`);

--
-- Indices de la tabla `vehiculo_viaje`
--
ALTER TABLE `vehiculo_viaje`
  ADD PRIMARY KEY (`id_vehiculo`,`id_viaje`),
  ADD KEY `vii_fk` (`id_viaje`);

--
-- Indices de la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD PRIMARY KEY (`id_viaje`),
  ADD KEY `ad_fk` (`usuario`),
  ADD KEY `cli_fk` (`id_cliente`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `bbitacora_fk` FOREIGN KEY (`id_viaje`) REFERENCES `viaje` (`id_viaje`);

--
-- Filtros para la tabla `chofer_vehiculo`
--
ALTER TABLE `chofer_vehiculo`
  ADD CONSTRAINT `usuario_fk` FOREIGN KEY (`usuario`) REFERENCES `empleado` (`usuario`),
  ADD CONSTRAINT `vehiculo_fk` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`);

--
-- Filtros para la tabla `chofer_viaje`
--
ALTER TABLE `chofer_viaje`
  ADD CONSTRAINT `chofer_fk` FOREIGN KEY (`usuario`) REFERENCES `empleado` (`usuario`),
  ADD CONSTRAINT `vi_fk` FOREIGN KEY (`id_viaje`) REFERENCES `viaje` (`id_viaje`);

--
-- Filtros para la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD CONSTRAINT `me_fk` FOREIGN KEY (`usuario`) REFERENCES `empleado` (`usuario`),
  ADD CONSTRAINT `ve_fk` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`);

--
-- Filtros para la tabla `rol`
--
ALTER TABLE `rol`
  ADD CONSTRAINT `fk_rol` FOREIGN KEY (`usuario`) REFERENCES `empleado` (`usuario`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `flota_fk` FOREIGN KEY (`usuario`) REFERENCES `empleado` (`usuario`);

--
-- Filtros para la tabla `vehiculo_viaje`
--
ALTER TABLE `vehiculo_viaje`
  ADD CONSTRAINT `vee_fk` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`),
  ADD CONSTRAINT `vii_fk` FOREIGN KEY (`id_viaje`) REFERENCES `viaje` (`id_viaje`);

--
-- Filtros para la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD CONSTRAINT `ad_fk` FOREIGN KEY (`usuario`) REFERENCES `empleado` (`usuario`),
  ADD CONSTRAINT `cli_fk` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
