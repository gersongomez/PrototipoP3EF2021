
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `finanzas` DEFAULT CHARACTER SET utf8 ;
USE `finanzas` ;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asientocontabledetalle`
--

CREATE TABLE `asientocontabledetalle` (
  `Codigo_DetalleAsiento` varchar(100) NOT NULL,
  `CuentaContable_Asiento` varchar(100) NOT NULL,
  `Partida_Asiento` varchar(100) NOT NULL,
  `Encabezado_Asiento` varchar(100) NOT NULL,
  `Tipo_Asiento` varchar(100) NOT NULL,
  `Monto_Debe` varchar(100) NOT NULL,
  `Monto_Haber` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asientocontabledetalle`
--

INSERT INTO `asientocontabledetalle` (`Codigo_DetalleAsiento`, `CuentaContable_Asiento`, `Partida_Asiento`, `Encabezado_Asiento`, `Tipo_Asiento`, `Monto_Debe`, `Monto_Haber`) VALUES
('0000001', 'A001-Caja', '0000001', '0000001', 'AO1', '800', '0'),
('0000002', 'A002-Bancos', '0000001', '0000001', 'AO1', '0', '800'),
('0000003', 'C001-Compras', '0000002', '0000001', 'AO1', '850000', '0'),
('0000004', 'A001-IVAPC', '0000002', '0000001', 'AO1', '102000', '0'),
('0000005', 'A001-Caja', '0000002', '0000001', 'AO1', '0', '952000'),
('0000006', 'A002-MOBYEQU', '0000003', '0000001', 'AA1', '3500', '0'),
('0000007', 'A001-IVAPC', '0000003', '0000001', 'AO1', '420', '0'),
('0000008', 'A001-Caja', '0000003', '0000001', 'AO1', '0', '420'),
('0000009', 'P001-DOCPC', '0000003', '0000001', 'AO1', '0', '3500');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco`
--

CREATE TABLE `banco` (
  `Codigo_Banco` varchar(100) NOT NULL,
  `Nombre_Banco` varchar(100) NOT NULL,
  `Clave_Banco` varchar(100) NOT NULL,
  `Telefono_Banco` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Volcado de datos para la tabla `Banco`
--

INSERT INTO `banco` (`Codigo_Banco`, `Nombre_Banco`, `Clave_Banco`, `Telefono_Banco`) VALUES
('AC0221', 'Banrural', '18829191', '22335654'),
('AC0321', 'Banrural', '14529191', '22335654'),
('AC0421', 'Banrural', '17629191', '22335654'),
('CP2343', 'Banco Industrial', '46654444', '34533463'),
('CP2543', 'Banco Industrial', '47854444', '34533463');


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cheque`
--

CREATE TABLE `cheque` (
  `Numero_Cheque` varchar(255) NOT NULL,
  `Fecha_Cheque` varchar(255) NOT NULL,
  `FK_Banco` varchar(255) NOT NULL,
  `FK_Cuenta` varchar(255) NOT NULL,
  `FK_Cuentahabiente` varchar(255) NOT NULL,
  `Monto_Cheque` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Volcado de datos para la tabla `cheque`
--

INSERT INTO `cheque` (`Numero_Cheque`, `Fecha_Cheque`, `FK_Banco`,`FK_Cuenta`,`FK_Cuentahabiente`,`Monto_Cheque`) VALUES
('00022','09/05/2021','AC0221','499399','33949','455'),
('00023','05/05/2021','AC0221','499399','12343','3433'),
('00024','04/05/2021','AC0221','499399','12444','45444'),
('00025','06/05/2021','AC0221','499399','43422','433'),
('00026','07/05/2021','AC0221','564544','43221','345345');




-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificacioncuenta`
--

CREATE TABLE `clasificacioncuenta` (
  `Codigo_clasificacion` varchar(100) NOT NULL,
  `Clasificacion_CuentaNombre` varchar(100) DEFAULT NULL,
  `Descripcion_Clasificacion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clasificacioncuenta`
--

INSERT INTO `clasificacioncuenta` (`Codigo_clasificacion`, `Clasificacion_CuentaNombre`, `Descripcion_Clasificacion`) VALUES
('A001', 'Activo Corriente', 'Activos que se movilizan en la empresa en un período menor o igual a un año.'),
('A002', 'Activo No Corriente', 'Activos que se movilizan en un período mayor a un año y menor a 3 años.'),
('C001', 'Resultados', 'Capital de la Empresa'),
('C002', 'Estado de Resultados', 'Resultados'),
('P001', 'Pasivo Corriente', 'Pasivos que se movilizan en un período menor a un año.'),
('P002', 'Pasivo No Corriente', 'Pasivos que circulan entre uno y tres años.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentabancaria`
--

CREATE TABLE `cuentabancaria` (
  `Numero_CuentaBancaria` varchar(100) NOT NULL,
  `Moneda_Cuenta` varchar(100) NOT NULL,
  `CuentaHabiente_Cuenta` varchar(100) NOT NULL,
  `Banco_Cuenta` varchar(100) NOT NULL,
  `Saldo_Cuenta` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cuentabancaria`
--

INSERT INTO `cuentabancaria` (`Numero_CuentaBancaria`, `Moneda_Cuenta`, `CuentaHabiente_Cuenta`, `Banco_Cuenta`,`Saldo_Cuenta`) VALUES
('232234', 'GTQ', '43422', 'AC0221', '0'),
('234232', 'GTQ', '12343', 'AC0221', '0'),
('446464', 'GTQ', '12444', 'AC0221', '0'),
('499399', 'GTQ', '33949', 'AC0221', '0'),
('564544', 'GTQ', '43221', 'AC0221', '0');


-- --------------------------------------------------------



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentacontable`
--

CREATE TABLE `cuentacontable` (
  `Codigo_CuentaContable` varchar(100) NOT NULL,
  `Nombre_CuentaContable` varchar(100) DEFAULT NULL,
  `Clasificacion_CuentaContable` varchar(100) DEFAULT NULL,
  `Estado_CuentaContable` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Monto_CuentaContable` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cuentacontable`
--

INSERT INTO `cuentacontable` (`Codigo_CuentaContable`, `Nombre_CuentaContable`, `Clasificacion_CuentaContable`, `Estado_CuentaContable`, `Monto_CuentaContable`) VALUES
('A001-Caja', 'Caja', 'A001', 'A', '15000'),
('A001-IVAPC', 'IVA por pagar', 'A001', 'A', '0'),
('A002-Bancos', 'Bancos', 'A002', 'I', '8000'),
('A002-MOBYEQU', 'Mobiliario y Equipo', 'A002', 'A', '0'),
('C001-Compras', 'Compras', 'C001', 'A', '0'),
('P001-DOCPC', 'Documentos por Pagar', 'P001', 'A', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentahabiente`
--

CREATE TABLE `cuentahabiente` (
  `Codigo_CuentaHabiente` varchar(100) NOT NULL,
  `Nombre_CuentaHabiente` varchar(100) NOT NULL,
  `ApellidoP_CuentaHabiente` varchar(100) NOT NULL,
  `ApellidoM_CuentaHabiente` varchar(100) NOT NULL,
  `TipoPersona_CuentaHabiente` varchar(100) NOT NULL,
  `Saldo_Habilitado` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




--
-- Volcado de datos para la tabla `cuentahabiente`
--

INSERT INTO `cuentahabiente` (`Codigo_CuentaHabiente`, `Nombre_CuentaHabiente`, `ApellidoP_CuentaHabiente`,`ApellidoM_CuentaHabiente`,`TipoPersona_CuentaHabiente`,`Saldo_Habilitado`) VALUES
('33949', 'SANTIAGO', 'MARTINEZ', 'DIAZ', 'PN1','10'),
('12343', 'MARCO', 'LOPEZ', 'LOPEZ', 'PN1','10'),
('12444', 'ADRIANA', 'HERNANDEZ', 'MONTERROZA', 'PN1','10'),
('43422', 'ALEXANDER', 'CARVAJAL', 'VARGAS', 'PN1','10'),
('43221', 'ANGELA', 'VILLA', 'MONROY', 'PN1','10');

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Deposito`
--

CREATE TABLE `Deposito` (
  `Codigo_CuentaHabiente` varchar(100) NOT NULL,
  `Balance` varchar(100) NOT NULL,
  `Transaccion` varchar(100) NOT NULL,
  `fecha` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Volcado de datos para la tabla `Deposito`
--

INSERT INTO `Deposito` (`Codigo_CuentaHabiente`, `Balance`, `Transaccion`, `fecha`) VALUES
('232234', '0', '100', '22/05/2021'),
('234232', '0', '100', '22/05/2021'),
('446464', '0', '100', '22/05/2021'),
('499399', '0', '100', '22/05/2021'),
('564544', '0', '100', '22/05/2021');


--
-- Volcado de datos para la tabla `cuentahabiente`
--

INSERT INTO `cuentahabiente` (`Codigo_CuentaHabiente`, `Nombre_CuentaHabiente`, `ApellidoP_CuentaHabiente`, `ApellidoM_CuentaHabiente`, `TipoPersona_CuentaHabiente`) VALUES
('A001CB', 'Juan', 'Pérez', 'López', 'PN1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encabezadoasientocontable`
--

CREATE TABLE `encabezadoasientocontable` (
  `Codigo_EncabezadoAsiento` varchar(100) NOT NULL,
  `Fecha_AsientoContable` varchar(100) NOT NULL,
  `Moneda_Asiento` varchar(100) NOT NULL,
  `Descripcion_Asiento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `encabezadoasientocontable`
--

INSERT INTO `encabezadoasientocontable` (`Codigo_EncabezadoAsiento`, `Fecha_AsientoContable`, `Moneda_Asiento`, `Descripcion_Asiento`) VALUES
('0000001', '09/05/2021', 'GTQ', 'Libro diario del mes de mayo.'),
('0000002', '01/06/2021', 'GTQ', 'Libro Diario de Junio 2021'),
('0000003', '12/01/2021', 'GTQ', 'Libro Diario de Enero 2021'),
('0000004', '01/06/2021', 'GTQ', 'Libro Diario de Febrero 2021'),
('0000005', '22/05/2021', 'GTQ', 'Libro Diario de Abril 2021');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda`
--

CREATE TABLE `moneda` (
  `Codigo_Moneda` varchar(100) NOT NULL,
  `Nombre_Moneda` varchar(100) NOT NULL,
  `Simbolo_Moneda` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `moneda`
--

INSERT INTO `moneda` (`Codigo_Moneda`, `Nombre_Moneda`, `Simbolo_Moneda`) VALUES
('GTQ', 'Quetzal guatemalteco', 'Q'),
('JPY', 'Yen japonés', '¥'),
('EUR', 'Euro', '€'),
('GBP', 'Libra esterlina', '£'),
('USD', 'Dólar', '$');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidacontable`
--

CREATE TABLE `partidacontable` (
  `Codigo_PartidaContable` varchar(100) NOT NULL,
  `Fecha_PartidaContable` varchar(100) NOT NULL,
  `Periodo_FiscalPartida` varchar(100) NOT NULL,
  `Glosa_PartidaContable` varchar(100) NOT NULL,
  `Monto_DeCuadre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `partidacontable`
--

INSERT INTO `partidacontable` (`Codigo_PartidaContable`, `Fecha_PartidaContable`, `Periodo_FiscalPartida`, `Glosa_PartidaContable`, `Monto_DeCuadre`) VALUES
('0000001', '09/05/2021', 'PF2021', 'Depósito de Caja a Bancos', '0'),
('0000002', '13/05/2021', 'PF2021', 'Compras al contado según Fac. No. 1566 de Seprodi.S.A.', '0'),
('0000003', '13/05/2021', 'PF2021', 'Compra de una fotocopiadora para uso de La empresa pagando el iva en efectivo.', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodofiscal`
--

CREATE TABLE `periodofiscal` (
  `Codigo_PeriodoFiscal` varchar(100) NOT NULL,
  `Fecha_inicioPF` varchar(100) NOT NULL,
  `Fecha_finPF` varchar(100) NOT NULL,
  `Estado_PeriodoFiscal` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `periodofiscal`
--

INSERT INTO `periodofiscal` (`Codigo_PeriodoFiscal`, `Fecha_inicioPF`, `Fecha_finPF`, `Estado_PeriodoFiscal`) VALUES
('PF2017', '01/01/2017','31/12/2018', '0'),
('PF2018', '01/01/2018','31/12/2019', '0'),
('PF2019', '01/01/2019','31/12/2020', '0'),
('PF2020', '01/01/2020','31/12/2021', '0'),
('PF2021', '01/01/2021','31/12/2022', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopersona`
--

CREATE TABLE `tipopersona` (
  `Codigo_TipoPersona` varchar(100) NOT NULL,
  `TipoPersona_Nombres` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipopersona`
--

INSERT INTO `tipopersona` (`Codigo_TipoPersona`, `TipoPersona_Nombres`) VALUES
('PN1', 'Persona Natural'),
('PN2', 'Persona Juridica');


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipotransaccion`
--

CREATE TABLE `tipotransaccion` (
  `Codigo_TipoTransaccion` varchar(100) NOT NULL,
  `Transaccion_Tipo` varchar(100) NOT NULL,
  `Efecto_TipoTransaccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Volcado de datos para la tabla `tipotransaccion`
--

INSERT INTO `tipotransaccion` (`Codigo_TipoTransaccion`, `Transaccion_Tipo`, `Efecto_TipoTransaccion`) VALUES
('2293339', 'Deposito', '400'),
('1399929', 'Bancaria', '200'),
('4220399', 'Bancaria', '300'),
('4320010', 'Deposito', '500'),
('2311211', 'Deposito', '600');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_asiento`
--

CREATE TABLE `tipo_asiento` (
  `Codigo_TipoAsiento` varchar(100) NOT NULL,
  `Tipo_AsientoDesc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_asiento`
--

INSERT INTO `tipo_asiento` (`Codigo_TipoAsiento`, `Tipo_AsientoDesc`) VALUES
('AA1', 'Asiento de Ajustes'),
('AO1', 'Asiento Ordinario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccionbancaria`
--

CREATE TABLE `transaccionbancaria` (
  `Codigo_Transaccion` varchar(100) NOT NULL,
  `Fecha_Transaccion` varchar(100) NOT NULL,
  `Beneficiario` varchar(100) NOT NULL,
  `Cuenta_Bancaria` varchar(100) NOT NULL,
  `Tipo_Transaccion` varchar(100) NOT NULL,
  `Monto_Transaccion` varchar(100) NOT NULL,
  `Concepto_Transaccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `transaccionbancaria`
--

INSERT INTO `transaccionbancaria` (`Codigo_Transaccion`, `Fecha_Transaccion`, `Beneficiario`,`Cuenta_Bancaria`,`Tipo_Transaccion`,`Monto_Transaccion`,`Concepto_Transaccion`) VALUES
('001', '17/05/2020', 'SANTIAGO MARTINEZ DIAZ', '499399', '2293339', '455', 'PAGO DE DEUDA'),
('002', '17/05/2020', 'MARCO LOPEZ LOPEZ', '234232', '2293339', '3433', 'PAGO DE DEUDA'),
('003', '17/05/2020', 'juan HERNANDEZ MONTERROZA', '446464', '2293339', '45444', 'PAGO DE DEUDA'),
('004', '17/05/2020', 'ANGELA CARVAJAL VARGAS','232234', '2293339','433', 'PAGO DE DEUDA'),
('005', '17/05/2020', 'JOSEFINA VILLA MONROY','564544', '2293339', '345345', 'PAGO DE DEUDA');




--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asientocontabledetalle`
--
ALTER TABLE `asientocontabledetalle`
  ADD PRIMARY KEY (`Codigo_DetalleAsiento`),
  ADD KEY `fkAsientoContableDetalleCuentaContable1` (`CuentaContable_Asiento`),
  ADD KEY `fkAsientoContableDetallePartidaContable1` (`Partida_Asiento`),
  ADD KEY `fkAsientoContableDetalleEncabezadoAsientoContable1` (`Encabezado_Asiento`),
  ADD KEY `fkAsientoContableDetalleTipo_Asiento1` (`Tipo_Asiento`);



--
-- Indices de la tabla `banco`
--
ALTER TABLE `banco`
  ADD PRIMARY KEY (`Codigo_Banco`);

--
-- Indices de la tabla `cheque`
--
ALTER TABLE `cheque`
  ADD PRIMARY KEY (`Numero_Cheque`),
  ADD KEY `FK_BANCOCHEQUE` (`FK_Banco`);

--
-- Indices de la tabla `clasificacioncuenta`
--
ALTER TABLE `clasificacioncuenta`
  ADD PRIMARY KEY (`Codigo_clasificacion`);

--
-- Indices de la tabla `cuentabancaria`
--
ALTER TABLE `cuentabancaria`
  ADD PRIMARY KEY (`Numero_CuentaBancaria`),
  ADD KEY `fkCuentaBancariaMoneda1` (`Moneda_Cuenta`),
  ADD KEY `fkCuentaBancariaCuentaHabiente1` (`CuentaHabiente_Cuenta`),
  ADD KEY `fkCuentaBancariaBanco1` (`Banco_Cuenta`);

--
-- Indices de la tabla `cuentacontable`
--
ALTER TABLE `cuentacontable`
  ADD PRIMARY KEY (`Codigo_CuentaContable`),
  ADD KEY `fkCuentaContableClasificacionCuenta1` (`Clasificacion_CuentaContable`);

--
-- Indices de la tabla `cuentahabiente`
--
ALTER TABLE `cuentahabiente`
  ADD PRIMARY KEY (`Codigo_CuentaHabiente`),
  ADD KEY `fkCuentaHabienteTipoPersona1` (`TipoPersona_CuentaHabiente`);

--
-- Indices de la tabla `encabezadoasientocontable`
--
ALTER TABLE `encabezadoasientocontable`
  ADD PRIMARY KEY (`Codigo_EncabezadoAsiento`),
  ADD KEY `fkEncabezadoAsientoContableMoneda1` (`Moneda_Asiento`);

--
-- Indices de la tabla `moneda`
--
ALTER TABLE `moneda`
  ADD PRIMARY KEY (`Codigo_Moneda`);

--
-- Indices de la tabla `partidacontable`
--
ALTER TABLE `partidacontable`
  ADD PRIMARY KEY (`Codigo_PartidaContable`),
  ADD KEY `fkPartida_ContablePeriodoFiscal1` (`Periodo_FiscalPartida`);

--
-- Indices de la tabla `periodofiscal`
--
ALTER TABLE `periodofiscal`
  ADD PRIMARY KEY (`Codigo_PeriodoFiscal`);

--
-- Indices de la tabla `tipopersona`
--
ALTER TABLE `tipopersona`
  ADD PRIMARY KEY (`Codigo_TipoPersona`);

--
-- Indices de la tabla `tipotransaccion`
--
ALTER TABLE `tipotransaccion`
  ADD PRIMARY KEY (`Codigo_TipoTransaccion`);

--
-- Indices de la tabla `tipo_asiento`
--
ALTER TABLE `tipo_asiento`
  ADD PRIMARY KEY (`Codigo_TipoAsiento`);

--
-- Indices de la tabla `transaccionbancaria`
--
ALTER TABLE `transaccionbancaria`
  ADD PRIMARY KEY (`Codigo_Transaccion`),
  ADD KEY `fkTransaccionBancariaCuentaBancaria1` (`Cuenta_Bancaria`),
  ADD KEY `fkTransaccionBancariaTipoTransaccion1` (`Tipo_Transaccion`);

--
-- Restricciones para tablas volcadas
--


--
-- Filtros para la tabla `asientocontabledetalle`
--
ALTER TABLE `asientocontabledetalle`
  ADD CONSTRAINT `fkAsientoContableDetalleCuentaContable1` FOREIGN KEY (`CuentaContable_Asiento`) REFERENCES `cuentacontable` (`Codigo_CuentaContable`),
  ADD CONSTRAINT `fkAsientoContableDetalleEncabezadoAsientoContable1` FOREIGN KEY (`Encabezado_Asiento`) REFERENCES `encabezadoasientocontable` (`Codigo_EncabezadoAsiento`),
  ADD CONSTRAINT `fkAsientoContableDetallePartidaContable1` FOREIGN KEY (`Partida_Asiento`) REFERENCES `partidacontable` (`Codigo_PartidaContable`),
  ADD CONSTRAINT `fkAsientoContableDetalleTipo_Asiento1` FOREIGN KEY (`Tipo_Asiento`) REFERENCES `tipo_asiento` (`Codigo_TipoAsiento`);

--
-- Filtros para la tabla `cuentabancaria`
--
ALTER TABLE `cuentabancaria`
  ADD CONSTRAINT `fkCuentaBancariaBanco1` FOREIGN KEY (`Banco_Cuenta`) REFERENCES `banco` (`Codigo_Banco`),
  ADD CONSTRAINT `fkCuentaBancariaCuentaHabiente1` FOREIGN KEY (`CuentaHabiente_Cuenta`) REFERENCES `cuentahabiente` (`Codigo_CuentaHabiente`),
  ADD CONSTRAINT `fkCuentaBancariaMoneda1` FOREIGN KEY (`Moneda_Cuenta`) REFERENCES `moneda` (`Codigo_Moneda`);

--
-- Filtros para la tabla `cuentacontable`
--
ALTER TABLE `cuentacontable`
  ADD CONSTRAINT `fkCuentaContableClasificacionCuenta1` FOREIGN KEY (`Clasificacion_CuentaContable`) REFERENCES `clasificacioncuenta` (`Codigo_clasificacion`);
  

--
-- Filtros para la tabla `cuentahabiente`
--
ALTER TABLE `cuentahabiente`
  ADD CONSTRAINT `fkCuentaHabienteTipoPersona1` FOREIGN KEY (`TipoPersona_CuentaHabiente`) REFERENCES `tipopersona` (`Codigo_TipoPersona`);

--
-- Filtros para la tabla `encabezadoasientocontable`
--
ALTER TABLE `encabezadoasientocontable`
  ADD CONSTRAINT `fkEncabezadoAsientoContableMoneda1` FOREIGN KEY (`Moneda_Asiento`) REFERENCES `moneda` (`Codigo_Moneda`);

--
-- Filtros para la tabla `partidacontable`
--
ALTER TABLE `partidacontable`
  ADD CONSTRAINT `fkPartida_ContablePeriodoFiscal1` FOREIGN KEY (`Periodo_FiscalPartida`) REFERENCES `periodofiscal` (`Codigo_PeriodoFiscal`);

--
-- Filtros para la tabla `transaccionbancaria`
--
ALTER TABLE `transaccionbancaria`
  ADD CONSTRAINT `fkTransaccionBancariaCuentaBancaria1` FOREIGN KEY (`Cuenta_Bancaria`) REFERENCES `cuentabancaria` (`Numero_CuentaBancaria`),
  ADD CONSTRAINT `fkTransaccionBancariaTipoTransaccion1` FOREIGN KEY (`Tipo_Transaccion`) REFERENCES `tipotransaccion` (`Codigo_TipoTransaccion`);

COMMIT;

--
-- Filtros para la tabla `cheque`
--
ALTER TABLE `cheque`
  ADD CONSTRAINT `fkChequeBancoBanco1` FOREIGN KEY (`FK_Banco`) REFERENCES `Banco` (`Codigo_Banco`),
  ADD CONSTRAINT `fkChequeCuentaBancaria1` FOREIGN KEY (`FK_Cuenta`) REFERENCES `CuentaBancaria` (`Numero_CuentaBancaria`),
  ADD CONSTRAINT `fkChequeCuentaHabiente1` FOREIGN KEY (`FK_Cuentahabiente`) REFERENCES `CuentaHabiente` (`Codigo_CuentaHabiente`);
COMMIT;


