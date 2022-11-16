-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2022 a las 01:08:37
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_taller_mecanico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auto`
--

CREATE TABLE `auto` (
  `id_auto` int(11) NOT NULL,
  `patente` varchar(15) NOT NULL,
  `duenio` varchar(45) NOT NULL,
  `modelo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auto`
--

INSERT INTO `auto` (`id_auto`, `patente`, `duenio`, `modelo`) VALUES
(17, 'LDE061', 'Fernando Lagos', 'Volskwagen Vento 2.5'),
(18, 'IEL603', 'Florencia Petruzzella', 'Fiat Siena'),
(23, 'AAA000', 'Florencia Arispe', 'Renault Kangoo '),
(25, 'AD105JI', 'Lorenzo Fernandez', 'Chevrolet Corsa'),
(28, 'KUH596', 'Luis Arias', 'Peugeot 206'),
(29, 'AB305LP', 'Andrea Molina', 'Fiat Palio'),
(39, 'AE605RA', 'Emiliano Fernandez', 'Ford Focus'),
(40, 'JKO122', 'Gabriel Ledesma', 'Volkswagen Gol Trend'),
(42, 'POO886', 'Julia Santiago', 'Ford Ka'),
(43, 'JTK041', 'Juan Perez', 'Citroen C3'),
(44, 'EFD975', 'Maria Palacios', 'Peugeot 404'),
(46, 'AF102AE', 'David Granados', 'Ford Fiesta Kinetic'),
(47, 'THI007', 'Nancy Cisneros', 'Renault Kangoo 2.0'),
(48, 'AF889YI', 'Braian Roman', 'Toyota Corolla'),
(50, 'AAAEEE', 'Delfina Ferreyra', 'Fiat 147'),
(51, 'BEE051', 'Ricardo Caballero', 'Chevrolet Meriva');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `service`
--

CREATE TABLE `service` (
  `id_service` int(11) NOT NULL,
  `id_auto` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `km` double NOT NULL,
  `km_prox_service` double NOT NULL,
  `gastos_repuestos` double NOT NULL,
  `gastos_mo` double NOT NULL,
  `descripcion` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `service`
--

INSERT INTO `service` (`id_service`, `id_auto`, `fecha`, `km`, `km_prox_service`, `gastos_repuestos`, `gastos_mo`, `descripcion`) VALUES
(48, 17, '2021-02-20', 850000, 95000, 135000, 86000, 'Service caja de cambio, cambio de aceite y filtros.'),
(50, 17, '2022-01-11', 95000, 105000, 37650.5, 27500, 'Arreglo tren delantero.'),
(51, 18, '2022-10-03', 168000, 180000, 28000, 9500, 'Cambio radiador.'),
(55, 28, '2022-10-13', 66900, 76900, 15960, 18550, 'Frenos delanteros. Cambio bomba de agua'),
(56, 29, '2022-06-16', 146000, 156000, 19600, 13000, 'Reajuste tapa cilindro. Arreglo perdida de agua'),
(57, 17, '2022-10-17', 108000, 118000, 36000, 30000, 'Cambio embrague.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id_user`, `email`, `password`) VALUES
(1, 'admin@gmail.com', '$2a$12$duuwyupnvVIi/t5a2QLY0e4UIbM3AN8gHrCFaJ25AHnZvz9in7ht6');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`id_auto`);

--
-- Indices de la tabla `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id_service`),
  ADD KEY `id_auto` (`id_auto`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auto`
--
ALTER TABLE `auto`
  MODIFY `id_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `service`
--
ALTER TABLE `service`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`id_auto`) REFERENCES `auto` (`id_auto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
