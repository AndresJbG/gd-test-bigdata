-- Crear base de datos
DROP DATABASE IF EXISTS mp3_db;

CREATE DATABASE mp3_db;
\c mp3_db;

-- Eliminar tablas si existen
DROP TABLE IF EXISTS Detalles_Orden CASCADE;
DROP TABLE IF EXISTS Ordenes CASCADE;
DROP TABLE IF EXISTS Productos CASCADE;
DROP TABLE IF EXISTS Clientes CASCADE;
DROP TABLE IF EXISTS Corresponsales CASCADE;

-- Tabla de Clientes
CREATE TABLE Clientes (
    ID_Cliente SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Telefono VARCHAR(15),
    Direccion TEXT,
    Fecha_Registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Productos
CREATE TABLE Productos (
    ID_Producto SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    Precio NUMERIC(10, 5) NOT NULL,
    Stock INT NOT NULL
);

-- Tabla de Corresponsales
CREATE TABLE Corresponsales (
    ID_Corresponsal SERIAL PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion TEXT
);

-- Tabla de Órdenes
CREATE TABLE Ordenes (
    ID_Orden SERIAL PRIMARY KEY,
    ID_Cliente INT REFERENCES Clientes(ID_Cliente),
    ID_Corresponsal INT REFERENCES Corresponsales(ID_Corresponsal),
    Fecha_Orden TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Total NUMERIC(10, 5) NOT NULL
);

-- Tabla de Detalles de Órdenes
CREATE TABLE Detalles_Orden (
    ID_Detalle SERIAL PRIMARY KEY,
    ID_Orden INT REFERENCES Ordenes(ID_Orden),
    ID_Producto INT REFERENCES Productos(ID_Producto),
    Cantidad INT NOT NULL,
    Precio_Unitario NUMERIC(10, 5) NOT NULL,
    Subtotal NUMERIC(10, 5) NOT NULL
);
-- Insertar Corresponsales
INSERT INTO Corresponsales (Nombre, Direccion) VALUES
('Banco Pichincha', 'Av. Amazonas y Naciones Unidas'),
('Western Union', 'Calle Bolívar y Vargas'),
('Cooperativa Andalucía', 'Av. 6 de Diciembre'),
('Banco Guayaquil', 'Malecón Simón Bolívar'),
('Servipagos', 'Av. De Los Shyris'),
('RedActiva', 'Centro Comercial El Jardín'),
('Banco del Pacífico', 'Av. República y Mariana de Jesús');

-- Insertar Clientes
INSERT INTO Clientes (Nombre, Email, Telefono, Direccion) VALUES
('Rosalinda del Vigil', 'maxi91@gmail.com', '+34 696 109 211', 'Urbanización Ileana Jara 88 Apt. 84  Guadalajara, 40627'),
('Xavier Zaragoza Alarcón', 'cuestafortunato@gmail.com', '+34737892325', 'Pasadizo Ángel Acevedo 58 Apt. 55  Baleares, 32878'),
('Micaela Borrego Borrell', 'ana-belenarrieta@rubio-querol.es', '+34 717 22 88 8', 'Pasadizo Edmundo Reguera 83 Apt. 68  Alicante, 19408'),
('Claudio Gutierrez Salinas', 'aaron86@cruz.com', '+34 962 07 59 1', 'Glorieta de Arturo Amo 17 León, 79725'),
('Vasco Parra', 'violeta58@yahoo.com', '+34709764488', 'Vial Roldán Solís 53 Navarra, 65772'),
('Pepe Laguna Guillén', 'lcarballo@gmail.com', '+34 862107190', 'C. de Néstor Pi 93 Apt. 74  Badajoz, 52227'),
('Sergio Otero Serna', 'ogamez@yahoo.com', '+34715760953', 'Urbanización Américo Amo 81 La Coruña, 32241'),
('Nieves Clavero Pino', 'jtenorio@padilla-maza.es', '+34 749 256 343', 'Via de Rómulo Castrillo 80 Piso 9  Baleares, 26914'),
('Alejandra Juan Robles', 'piedadhierro@hotmail.com', '+34 845 437 745', 'Alameda Teodoro Lasa 225 Murcia, 14932'),
('Herminia Corominas-Barceló', 'imenendez@yahoo.com', '+34742419282', 'Avenida de Caridad Aguado 6 Puerta 0  Santa Cruz de Tenerife, 35353'),
('Clemente Padilla', 'pelayocharo@cortina.com', '+34 645 49 88 0', 'Pasaje de Dimas Gallart 51 Piso 5  Ciudad, 37355'),
('Constanza Barberá Macías', 'rcamino@yahoo.com', '+34 746494255', 'Urbanización Samu Estrada 7 Puerta 9  Castellón, 84245'),
('Zacarías Barragán', 'graciela16@monreal.es', '+34732 26 74 36', 'Urbanización Victoriano Lobato 60 Cantabria, 76895'),
('Encarnación Román Rivas', 'manolocordero@domenech-pelaez.es', '+34 744 92 18 5', 'Rambla Amando Ibañez 921 Apt. 54  Vizcaya, 87525'),
('Ruperto Plana Jiménez', 'duranfabiana@yahoo.com', '+34744402664', 'Via Ariadna Cerezo 622 Alicante, 07621'),
('Eligia Carrera Fábregas', 'herediamaricela@gmail.com', '+34727067631', 'Ronda de Prudencia Bellido 85 Toledo, 82850'),
('Cosme Riera', 'yago39@herranz.es', '+34739 60 11 37', 'Ronda Cipriano Torrijos 55 Piso 5  Cantabria, 67443'),
('Adelia Nogués-Ferrando', 'nmarin@hotmail.com', '+34728 972 192', 'Pasaje Ambrosio Guerra 68 Apt. 05  Girona, 90153'),
('Milagros Trujillo Borrego', 'ivelazquez@navarro.com', '+34 747 590 355', 'C. de Flor Salinas 112 Apt. 09  Lleida, 65110'),
('Nicolasa Beltran Paredes', 'pedrorequena@yahoo.com', '+34711 087 914', 'Callejón de Silvia Antón 24 Piso 8  Madrid, 86329'),
('María Barrena Montesinos', 'chavesfelix@mas.net', '+34864 20 10 36', 'Acceso de Cecilio Pellicer 26 Almería, 55293'),
('Josefina Company Calderon', 'cabreraarmando@gimenez.org', '+34844738341', 'Callejón Rodolfo Escalona 1 Cáceres, 31072'),
('Prudencia Blanca Quintanilla', 'qcortes@granados.com', '+34 969 393 971', 'Alameda Tristán Pino 22 Valencia, 96149'),
('Efraín Roldan Llorens', 'fidelbas@gmail.com', '+34739 691 008', 'Cañada de Irene Cobos 23 Toledo, 28557'),
('Bernardino Pastor Piquer', 'aranzazuvalcarcel@uria.org', '+34917 402 870', 'Calle de Haydée Real 68 Apt. 97  Almería, 81878'),
('Noa Jerez Olmo', 'jose-mariacabo@yahoo.com', '+34 748926212', 'Cuesta Concha Roldán 34 Piso 4  Guipúzcoa, 11504'),
('Yaiza Manuelita Baños Bayo', 'baudeliovall@gmail.com', '+34932 64 37 88', 'Pasadizo Vidal Crespo 23 Apt. 71  Huesca, 78178'),
('Itziar Sevillano Molins', 'burgosfortunata@gmail.com', '+34 712 83 97 6', 'Pasaje de Marina Acevedo 75 Piso 3  Santa Cruz de Tenerife, 50346'),
('Gustavo Miralles', 'hectorgirona@grande-roldan.com', '+34621694466', 'Paseo Samanta Cabrero 77 Apt. 21  Huesca, 16373'),
('Nélida Escobar Córdoba', 'zsanz@hotmail.com', '+34649088870', 'Camino Chuy Bas 76 Santa Cruz de Tenerife, 91719');

-- Insertar Productos
INSERT INTO Productos (Nombre, Descripcion, Precio, Stock) VALUES
('Laptop Lenovo ThinkPad X1 Ñ-carbon', 'Producto tecnológico de alta calidad: Laptop Lenovo ThinkPad X1 Ñ-carbon.', 442.47849, 91),
('Smartphone Samsung Galaxy Ñ-S24', 'Producto tecnológico de alta calidad: Smartphone Samsung Galaxy Ñ-S24.', 272.04082, 96),
('Tablet Apple iPad Ñ-Pro', 'Producto tecnológico de alta calidad: Tablet Apple iPad Ñ-Pro.', 182.13936, 20),
('Monitor LG UltraWide Ñ-34', 'Producto tecnológico de alta calidad: Monitor LG UltraWide Ñ-34.', 232.92347, 81),
('Auriculares Sony WH-1000XM5 Ñ-wireless', 'Producto tecnológico de alta calidad: Auriculares Sony WH-1000XM5 Ñ-wireless.', 496.58918, 79),
('Cámara Canon EOS Ñ-90D', 'Producto tecnológico de alta calidad: Cámara Canon EOS Ñ-90D.', 319.15744, 74),
('Smartwatch Apple Watch Ñ-Series 9', 'Producto tecnológico de alta calidad: Smartwatch Apple Watch Ñ-Series 9.', 331.14467, 68),
('Teclado Mecánico Ñ-Logitech G915', 'Producto tecnológico de alta calidad: Teclado Mecánico Ñ-Logitech G915.', 432.32877, 80),
('Mouse Gamer Ñ-Razer DeathAdder', 'Producto tecnológico de alta calidad: Mouse Gamer Ñ-Razer DeathAdder.', 419.14535, 48),
('Disco Duro Externo Ñ-Seagate 2TB', 'Producto tecnológico de alta calidad: Disco Duro Externo Ñ-Seagate 2TB.', 126.87675, 80),
('Impresora HP Ñ-LaserJet Pro', 'Producto tecnológico de alta calidad: Impresora HP Ñ-LaserJet Pro.', 229.9976, 83),
('Router TP-Link Ñ-Archer AX6000', 'Producto tecnológico de alta calidad: Router TP-Link Ñ-Archer AX6000.', 105.00419, 78),
('Consola PlayStation Ñ-5', 'Producto tecnológico de alta calidad: Consola PlayStation Ñ-5.', 156.446, 73),
('Consola Xbox Ñ-Series X', 'Producto tecnológico de alta calidad: Consola Xbox Ñ-Series X.', 383.63912, 98),
('Proyector Epson Ñ-Home Cinema', 'Producto tecnológico de alta calidad: Proyector Epson Ñ-Home Cinema.', 111.82866, 56),
('Memoria RAM Corsair Ñ-32GB DDR5', 'Producto tecnológico de alta calidad: Memoria RAM Corsair Ñ-32GB DDR5.', 36.23674, 31),
('Tarjeta Gráfica Ñ-NVIDIA RTX 4080', 'Producto tecnológico de alta calidad: Tarjeta Gráfica Ñ-NVIDIA RTX 4080.', 366.45782, 61),
('Placa Base ASUS Ñ-ROG STRIX', 'Producto tecnológico de alta calidad: Placa Base ASUS Ñ-ROG STRIX.', 197.01824, 85),
('Fuente de Poder Ñ-Corsair RM850x', 'Producto tecnológico de alta calidad: Fuente de Poder Ñ-Corsair RM850x.', 200.4883, 85),
('SSD Samsung Ñ-980 PRO 1TB', 'Producto tecnológico de alta calidad: SSD Samsung Ñ-980 PRO 1TB.', 65.03901, 78),
('Webcam Logitech Ñ-StreamCam', 'Producto tecnológico de alta calidad: Webcam Logitech Ñ-StreamCam.', 299.88077, 64),
('Microfono Blue Ñ-Yeti X', 'Producto tecnológico de alta calidad: Microfono Blue Ñ-Yeti X.', 114.51415, 85),
('Silla Gamer Ñ-Herman Miller', 'Producto tecnológico de alta calidad: Silla Gamer Ñ-Herman Miller.', 338.52229, 57),
('Drone DJI Ñ-Mini 3 Pro', 'Producto tecnológico de alta calidad: Drone DJI Ñ-Mini 3 Pro.', 142.8904, 17),
('Sistema Mesh WiFi Ñ-NETGEAR Orbi', 'Producto tecnológico de alta calidad: Sistema Mesh WiFi Ñ-NETGEAR Orbi.', 259.71175, 51),
('Lector Kindle Ñ-Paperwhite', 'Producto tecnológico de alta calidad: Lector Kindle Ñ-Paperwhite.', 380.96887, 86),
('Control Xbox Ñ-Elite Series 2', 'Producto tecnológico de alta calidad: Control Xbox Ñ-Elite Series 2.', 349.2837, 30),
('Procesador AMD Ñ-Ryzen 9 7950X', 'Producto tecnológico de alta calidad: Procesador AMD Ñ-Ryzen 9 7950X.', 184.52701, 97),
('All in One HP Ñ-24-cb1126', 'Producto tecnológico de alta calidad: All in One HP Ñ-24-cb1126.', 406.42338, 86),
('Servidor Dell Ñ-PowerEdge T40', 'Producto tecnológico de alta calidad: Servidor Dell Ñ-PowerEdge T40.', 361.25949, 17);

-- Insertar Órdenes
INSERT INTO Ordenes (ID_Cliente, ID_Corresponsal, Fecha_Orden, Total) VALUES
(1, 6, '2025-04-25 01:12:43', 903.06262),
(1, 1, '2025-02-11 15:05:19', 2116.0269),
(1, 4, '2025-01-13 15:15:20', 852.62219),
(2, 3, '2025-03-24 04:18:00', 1557.0188),
(2, 2, '2025-02-09 22:28:48', 1385.15426),
(2, 4, '2025-04-06 12:14:07', 1153.30327),
(3, 7, '2025-01-10 03:24:49', 631.02544),
(3, 3, '2025-04-01 18:08:49', 823.44736),
(3, 3, '2025-03-11 10:38:02', 2639.75554),
(4, 6, '2025-02-05 19:24:23', 3235.74524),
(4, 3, '2025-04-12 10:54:27', 2342.82755),
(5, 3, '2025-01-10 19:14:54', 374.75903),
(5, 5, '2025-01-10 19:07:36', 1041.82646),
(6, 3, '2025-04-12 20:15:14', 397.66853),
(6, 7, '2025-02-11 09:16:40', 2110.69722),
(6, 6, '2025-01-19 09:40:46', 1286.70174),
(7, 2, '2025-02-23 05:42:06', 2010.79833),
(7, 5, '2025-02-07 17:50:13', 1196.8735),
(7, 3, '2025-01-03 03:15:40', 1000.64947),
(8, 4, '2025-02-04 04:22:01', 1457.27104),
(8, 4, '2025-01-02 15:48:02', 1633.95535),
(9, 2, '2025-01-15 08:36:38', 1264.56209),
(9, 1, '2025-02-11 07:02:52', 1099.60535),
(9, 2, '2025-03-05 09:55:13', 1662.13578),
(10, 2, '2025-01-30 02:39:54', 1205.7712),
(10, 1, '2025-03-27 03:32:41', 1304.73328),
(10, 7, '2025-03-20 13:05:17', 1873.29525),
(11, 4, '2025-03-19 09:13:11', 1511.41416),
(11, 6, '2025-02-16 23:36:44', 2415.59875),
(12, 1, '2025-04-16 07:44:40', 2391.60442),
(12, 5, '2025-03-13 00:52:02', 1931.67822),
(13, 5, '2025-02-12 20:54:46', 1983.23461),
(13, 3, '2025-02-15 17:33:29', 1362.86367),
(13, 3, '2025-03-17 20:04:59', 1447.23051),
(14, 1, '2025-01-13 04:29:49', 516.66968),
(14, 6, '2025-01-23 04:14:44', 964.36936),
(15, 3, '2025-01-01 17:35:04', 2212.3162),
(15, 6, '2025-02-25 04:53:11', 787.39225),
(16, 6, '2025-02-08 17:24:21', 819.49858),
(16, 3, '2025-01-07 23:47:40', 820.12195),
(16, 6, '2025-02-15 23:14:23', 2176.33734),
(17, 6, '2025-03-20 15:13:26', 1641.74431),
(17, 7, '2025-02-22 10:29:03', 1381.66244),
(18, 2, '2025-03-05 03:45:39', 1570.93412),
(18, 2, '2025-04-06 22:25:16', 2328.05824),
(18, 6, '2025-03-01 22:53:40', 1187.31029),
(19, 1, '2025-01-20 00:32:23', 2742.02427),
(19, 3, '2025-01-17 05:33:41', 1349.36992),
(19, 3, '2025-03-06 05:54:19', 962.17011),
(20, 7, '2025-02-22 20:50:00', 1293.80776),
(20, 7, '2025-01-13 02:19:08', 1124.35922),
(20, 1, '2025-04-21 13:17:03', 1685.83817),
(21, 3, '2025-04-16 01:28:03', 1663.85943),
(21, 7, '2025-03-21 20:30:01', 1223.46266),
(21, 2, '2025-03-08 06:41:14', 588.56274),
(22, 2, '2025-01-08 15:23:11', 2580.7892),
(22, 6, '2025-01-20 07:58:29', 1206.9545),
(23, 3, '2025-01-19 16:25:26', 986.56013),
(23, 2, '2025-04-08 08:05:09', 1262.05088),
(24, 6, '2025-01-22 03:25:52', 2680.61076),
(24, 7, '2025-04-08 12:36:34', 2705.72549),
(25, 6, '2025-04-17 05:10:54', 1738.08585),
(25, 5, '2025-04-03 20:41:04', 599.41602),
(26, 6, '2025-01-17 04:47:10', 1811.45751),
(26, 7, '2025-02-01 11:46:42', 1410.38741),
(27, 7, '2025-01-24 01:08:41', 2633.5818),
(27, 5, '2025-02-04 16:58:37', 1448.8277),
(28, 4, '2025-03-01 12:46:30', 1110.82069),
(28, 2, '2025-04-20 17:54:18', 1674.83319),
(28, 2, '2025-01-07 04:38:56', 2502.8296),
(29, 2, '2025-04-25 13:04:43', 1268.8446),
(29, 1, '2025-04-18 00:48:05', 3702.15999),
(30, 2, '2025-03-01 10:41:31', 1166.2749),
(30, 3, '2025-02-09 05:31:37', 772.0499),
(30, 7, '2025-04-25 01:59:54', 1374.14723);

-- Insertar Detalles de Órdenes
INSERT INTO Detalles_Orden (ID_Orden, ID_Producto, Cantidad, Precio_Unitario, Subtotal) VALUES
(1, 25, 2, 259.71175, 519.4235),
(1, 14, 1, 383.63912, 383.63912),
(2, 26, 2, 380.96887, 761.93774),
(2, 23, 4, 338.52229, 1354.08916),
(3, 28, 4, 184.52701, 738.10804),
(3, 22, 1, 114.51415, 114.51415),
(4, 10, 5, 126.87675, 634.38375),
(4, 28, 5, 184.52701, 922.63505),
(5, 17, 3, 366.45782, 1099.37346),
(5, 24, 2, 142.8904, 285.7808),
(6, 12, 3, 105.00419, 315.01257),
(6, 9, 2, 419.14535, 838.2907),
(7, 7, 1, 331.14467, 331.14467),
(7, 21, 1, 299.88077, 299.88077),
(8, 26, 1, 380.96887, 380.96887),
(8, 1, 1, 442.47849, 442.47849),
(9, 5, 3, 496.58918, 1489.76754),
(9, 11, 5, 229.9976, 1149.988),
(10, 17, 4, 366.45782, 1465.83128),
(10, 1, 4, 442.47849, 1769.91396),
(11, 16, 5, 36.23674, 181.1837),
(11, 8, 5, 432.32877, 2161.64385),
(12, 16, 1, 36.23674, 36.23674),
(12, 23, 1, 338.52229, 338.52229),
(13, 10, 2, 126.87675, 253.7535),
(13, 18, 4, 197.01824, 788.07296),
(14, 16, 2, 36.23674, 72.47348),
(14, 20, 5, 65.03901, 325.19505),
(15, 3, 2, 182.13936, 364.27872),
(15, 27, 5, 349.2837, 1746.4185),
(16, 14, 2, 383.63912, 767.27824),
(16, 25, 2, 259.71175, 519.4235),
(17, 28, 5, 184.52701, 922.63505),
(17, 2, 4, 272.04082, 1088.16328),
(18, 16, 3, 36.23674, 108.71022),
(18, 2, 4, 272.04082, 1088.16328),
(19, 28, 1, 184.52701, 184.52701),
(19, 2, 3, 272.04082, 816.12246),
(20, 14, 2, 383.63912, 767.27824),
(20, 11, 3, 229.9976, 689.9928),
(21, 4, 5, 232.92347, 1164.61735),
(21, 13, 3, 156.446, 469.338),
(22, 21, 4, 299.88077, 1199.52308),
(22, 20, 1, 65.03901, 65.03901),
(23, 18, 5, 197.01824, 985.0912),
(23, 22, 1, 114.51415, 114.51415),
(24, 18, 5, 197.01824, 985.0912),
(24, 23, 2, 338.52229, 677.04458),
(25, 11, 4, 229.9976, 919.9904),
(25, 24, 2, 142.8904, 285.7808),
(26, 3, 5, 182.13936, 910.6968),
(26, 18, 2, 197.01824, 394.03648),
(27, 27, 5, 349.2837, 1746.4185),
(27, 10, 1, 126.87675, 126.87675),
(28, 29, 2, 406.42338, 812.84676),
(28, 27, 2, 349.2837, 698.5674),
(29, 2, 4, 272.04082, 1088.16328),
(29, 1, 3, 442.47849, 1327.43547),
(30, 8, 4, 432.32877, 1729.31508),
(30, 7, 2, 331.14467, 662.28934),
(31, 4, 2, 232.92347, 465.84694),
(31, 17, 4, 366.45782, 1465.83128),
(32, 14, 5, 383.63912, 1918.1956),
(32, 20, 1, 65.03901, 65.03901),
(33, 27, 3, 349.2837, 1047.8511),
(33, 12, 3, 105.00419, 315.01257),
(34, 29, 2, 406.42338, 812.84676),
(34, 10, 5, 126.87675, 634.38375),
(35, 15, 3, 111.82866, 335.48598),
(35, 16, 5, 36.23674, 181.1837),
(36, 3, 1, 182.13936, 182.13936),
(36, 13, 5, 156.446, 782.23),
(37, 30, 4, 361.25949, 1445.03796),
(37, 14, 2, 383.63912, 767.27824),
(38, 26, 1, 380.96887, 380.96887),
(38, 29, 1, 406.42338, 406.42338),
(39, 6, 2, 319.15744, 638.31488),
(39, 16, 5, 36.23674, 181.1837),
(40, 19, 2, 200.4883, 400.9766),
(40, 9, 1, 419.14535, 419.14535),
(41, 1, 4, 442.47849, 1769.91396),
(41, 29, 1, 406.42338, 406.42338),
(42, 2, 4, 272.04082, 1088.16328),
(42, 28, 3, 184.52701, 553.58103),
(43, 21, 4, 299.88077, 1199.52308),
(43, 3, 1, 182.13936, 182.13936),
(44, 12, 4, 105.00419, 420.01676),
(44, 14, 3, 383.63912, 1150.91736),
(45, 5, 3, 496.58918, 1489.76754),
(45, 9, 2, 419.14535, 838.2907),
(46, 7, 2, 331.14467, 662.28934),
(46, 12, 5, 105.00419, 525.02095),
(47, 8, 3, 432.32877, 1296.98631),
(47, 30, 4, 361.25949, 1445.03796),
(48, 3, 2, 182.13936, 364.27872),
(48, 18, 5, 197.01824, 985.0912),
(49, 21, 1, 299.88077, 299.88077),
(49, 7, 2, 331.14467, 662.28934),
(50, 14, 3, 383.63912, 1150.91736),
(50, 24, 1, 142.8904, 142.8904),
(51, 15, 4, 111.82866, 447.31464),
(51, 23, 2, 338.52229, 677.04458),
(52, 7, 4, 331.14467, 1324.57868),
(52, 30, 1, 361.25949, 361.25949),
(53, 9, 3, 419.14535, 1257.43605),
(53, 29, 1, 406.42338, 406.42338),
(54, 23, 2, 338.52229, 677.04458),
(54, 3, 3, 182.13936, 546.41808),
(55, 29, 1, 406.42338, 406.42338),
(55, 3, 1, 182.13936, 182.13936),
(56, 9, 1, 419.14535, 419.14535),
(56, 8, 5, 432.32877, 2161.64385),
(57, 22, 5, 114.51415, 572.57075),
(57, 10, 5, 126.87675, 634.38375),
(58, 1, 1, 442.47849, 442.47849),
(58, 2, 2, 272.04082, 544.08164),
(59, 7, 2, 331.14467, 662.28934),
(59, 21, 2, 299.88077, 599.76154),
(60, 1, 4, 442.47849, 1769.91396),
(60, 3, 5, 182.13936, 910.6968),
(61, 2, 2, 272.04082, 544.08164),
(61, 8, 5, 432.32877, 2161.64385),
(62, 30, 2, 361.25949, 722.51898),
(62, 23, 3, 338.52229, 1015.56687),
(63, 20, 2, 65.03901, 130.07802),
(63, 13, 3, 156.446, 469.338),
(64, 27, 5, 349.2837, 1746.4185),
(64, 20, 1, 65.03901, 65.03901),
(65, 25, 5, 259.71175, 1298.55875),
(65, 15, 1, 111.82866, 111.82866),
(66, 29, 5, 406.42338, 2032.1169),
(66, 19, 3, 200.4883, 601.4649),
(67, 27, 3, 349.2837, 1047.8511),
(67, 19, 2, 200.4883, 400.9766),
(68, 14, 2, 383.63912, 767.27824),
(68, 22, 3, 114.51415, 343.54245),
(69, 30, 3, 361.25949, 1083.77847),
(69, 18, 3, 197.01824, 591.05472),
(70, 1, 4, 442.47849, 1769.91396),
(70, 17, 2, 366.45782, 732.91564),
(71, 25, 4, 259.71175, 1038.847),
(71, 11, 1, 229.9976, 229.9976),
(72, 5, 3, 496.58918, 1489.76754),
(72, 1, 5, 442.47849, 2212.39245),
(73, 18, 5, 197.01824, 985.0912),
(73, 16, 5, 36.23674, 181.1837),
(74, 19, 1, 200.4883, 200.4883),
(74, 24, 4, 142.8904, 571.5616),
(75, 26, 1, 380.96887, 380.96887),
(75, 5, 2, 496.58918, 993.17836);