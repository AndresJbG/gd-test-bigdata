-- Crear base de datos
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

-- Insertar Clientes
INSERT INTO Clientes (Nombre, Email, Telefono, Direccion) VALUES
('Andrés Pérez', 'andres_perez@gmail.com', '0987654321', 'Calle Olmedo 123'),
('María-Luisa Ñáñez', 'maria_luisa@gmail.com', '0991234567', 'Av. América 45-67'),
('Juan Rodríguez', 'juan.rodriguez@hotmail.com', '0987651234', 'Av. Quito 01-12'),
('Carla Gómez', 'carla_gomez@yahoo.com', '0981234567', 'Calle Bolívar 45-78'),
('José Martínez', 'jose.martinez@gmail.com', '0998765432', 'Calle Juan Montalvo 12-34'),
('Ana-Lucia Ñiquiz', 'ana_niquiz@gmail.com', '0984321786', 'Calle del Sol 23-67'),
('Luis Torres', 'luis.torres@gmail.com', '0997651234', 'Av. Loja 45-89'),
('Mónica Fernández', 'monica_fernandez@gmail.com', '0986453210', 'Barrio Los Andes'),
('Pedro García', 'pedro_garcia@yahoo.com', '0989876543', 'Av. Amazonas 12-34'),
('Sofía Ñacato', 'sofia_nacato@hotmail.com', '0991237890', 'Av. Patria 56-78'),
('Lucía López', 'lucia_lopez@gmail.com', '0981239876', 'Calle Pérez 99-11'),
('Carlos Rodríguez', 'carlos_rodriguez@yahoo.com', '0998761234', 'Av. Machala 11-22'),
('Felipe Vásquez', 'felipe.vasquez@hotmail.com', '0987456123', 'Calle Simón Bolívar 34-45'),
('Laura Silva', 'laura.silva@gmail.com', '0982345678', 'Barrio El Jardín 13-67'),
('José Luis González', 'joseluis.gonzalez@yahoo.com', '0996543210', 'Calle El Sauce 89-10'),
('Fernando Pérez', 'fernando_perez@hotmail.com', '0985432109', 'Av. Los Shyris 23-45'),
('Patricia Ramos', 'patricia.ramos@gmail.com', '0986543210', 'Av. Prensa 12-56'),
('Luis Alberto Álvarez', 'luisalvarez@gmail.com', '0998769876', 'Calle Sol 45-89'),
('Marcela Bravo', 'marcela_bravo@yahoo.com', '0987654321', 'Calle Quito 34-12'),
('Javier Rodríguez', 'javier.rodriguez@gmail.com', '0991234567', 'Av. Carrión 56-78'),
('Karla Gutiérrez', 'karla.gutierrez@hotmail.com', '0983210987', 'Calle Montúfar 12-34'),
('Víctor Sánchez', 'victor.sanchez@gmail.com', '0986547890', 'Av. Napo 23-45'),
('Alejandra Martínez', 'alejandra_martinez@yahoo.com', '0993219876', 'Calle Shyris 56-78'),
('Nicolás Rodríguez', 'nicolas.rodriguez@gmail.com', '0987654321', 'Barrio Carcelén 12-34'),
('David López', 'davidlopez@gmail.com', '0998765432', 'Av. Ladrón de Guevara 45-89'),
('Erika Mendoza', 'erika.mendoza@yahoo.com', '0985432109', 'Av. Eloy Alfaro 32-10'),
('Bárbara Herrera', 'barbara_herrera@gmail.com', '0997654321', 'Calle Loja 23-45'),
('Antonio Díaz', 'antonio.diaz@hotmail.com', '0983210987', 'Av. Amazonas 12-34'),
('Jessica Salazar', 'jessica.salazar@gmail.com', '0995432109', 'Calle Río Coca 45-67'),
('Pedro Pérez', 'pedro_perez@yahoo.com', '0987659876', 'Av. Pichincha 56-78'),
('Cristina Muñoz', 'cristina.munoz@gmail.com', '0998765432', 'Calle Pichincha 78-56'),
('Mario Martínez', 'mario.martinez@yahoo.com', '0981234321', 'Calle Los Chillos 67-23'),
('Carolina Cordero', 'carolina.cordero@gmail.com', '0985432109', 'Av. La Florida 45-89'),
('Carlos Fernández', 'carlos.fernandez@hotmail.com', '0998765432', 'Calle Samanes 12-34'),
('Verónica González', 'veronica.gonzalez@gmail.com', '0987654321', 'Calle Los Olivos 34-56'),
('Ricardo López', 'ricardo.lopez@yahoo.com', '0997654321', 'Calle 5 de Junio 23-78'),
('Ángel Fernández', 'angel_fernandez@hotmail.com', '0982345678', 'Av. Valle de los Chillos 45-12'),
('Luis Enrique Zambrano', 'luis.zambrano@gmail.com', '0998765432', 'Calle José Martí 11-22'),
('Antonio Ramírez', 'antonio.ramirez@yahoo.com', '0986543210', 'Calle General Rumiñahui 23-56'),
('Elsa Hidalgo', 'elsa.hidalgo@gmail.com', '0991234567', 'Av. Los Andes 45-89'),
('Sandra Vásquez', 'sandra.vasquez@hotmail.com', '0987654321', 'Calle Quito 56-78'),
('María Teresa Paredes', 'mariateresa.paredes@gmail.com', '0998765432', 'Calle Cañar 12-34'),
('Gabriel Soto', 'gabriel.soto@yahoo.com', '0985432109', 'Calle Machala 23-45'),
('Carmen Ortega', 'carmen.ortega@gmail.com', '0993210987', 'Av. Guayaquil 56-78'),
('Ricardo Castillo', 'ricardo.castillo@hotmail.com', '0987654321', 'Av. Montevideo 23-45'),
('José Luis Ramírez', 'joseluis.ramirez@gmail.com', '0998765432', 'Calle La Paz 78-12'),
('Juan Carlos Herrera', 'juancarlos.herrera@yahoo.com', '0983210987', 'Calle La Rábida 34-56'),
('Fernando Aguilar', 'fernando.aguilar@gmail.com', '0997654321', 'Calle La Ecuatoriana 12-34'),
('Vanessa Sánchez', 'vanessa.sanchez@hotmail.com', '0987659876', 'Av. Chillos 56-78'),
('Jorge Pérez', 'jorge.perez@gmail.com', '0998765432', 'Calle Cajas 45-89');


-- Productos
INSERT INTO Productos (Nombre, Descripcion, Precio, Stock) VALUES
('Audífonos Bluetooth', 'Audífonos inalámbricos con cancelación de ruido', 25.34987, 100),
('Cable USB-C', 'Cable de carga rápida 1.5m', 5.12345, 200),
('Altavoz portátil', 'Altavoz resistente al agua', 45.98765, 50),
('Cargador rápido', 'Cargador 30W con entrada doble', 15.33333, 150),
('Memoria USB 64GB', 'USB 3.0 metálica', 9.87412, 300),
('Teclado mecánico', 'Teclado retroiluminado RGB', 49.55678, 60),
('Mouse inalámbrico', 'Mouse ergonómico con DPI ajustable', 12.65432, 120),
('Webcam HD', 'Cámara 1080p con micrófono', 27.81923, 75),
('Lámpara LED', 'Lámpara con sensor de movimiento', 7.33145, 180),
('Power Bank', 'Cargador portátil 10000mAh', 22.99753, 90),
('Auriculares gaming', 'Auriculares con micrófono y sonido envolvente', 35.98764, 120),
('Soporte para móvil', 'Soporte ajustable para teléfonos móviles', 7.65432, 150),
('Batería externa', 'Batería de 20000mAh para múltiples dispositivos', 30.12345, 80),
('Cargador inalámbrico', 'Cargador de mesa para móviles compatibles', 20.43210, 110),
('Silla ergonómica', 'Silla de oficina ajustable y ergonómica', 120.99876, 30),
('Monitor 24"', 'Pantalla Full HD de 24 pulgadas', 150.67890, 45),
('Micrófono de condensador', 'Micrófono de alta calidad para grabaciones', 65.98765, 40),
('Router Wi-Fi', 'Router con cobertura de largo alcance', 55.43210, 70),
('Pantalla táctil', 'Pantalla táctil de 10 pulgadas para proyectos DIY', 75.33333, 60),
('Smartwatch', 'Reloj inteligente con monitor de actividad', 120.43210, 200),
('Cámara de seguridad', 'Cámara Wi-Fi con visión nocturna', 60.65432, 100),
('Proyector portátil', 'Proyector compacto para presentaciones', 185.67890, 50),
('Teclado numérico', 'Teclado USB compacto', 25.98765, 200),
('Lentes VR', 'Gafas de realidad virtual', 130.12345, 70),
('Soporte para laptop', 'Base para laptop con ventilación', 15.43210, 150),
('Altavoces Bluetooth', 'Altavoces portátiles con sonido estéreo', 35.98765, 90),
('Cable HDMI', 'Cable HDMI de alta calidad 1.8m', 8.12345, 180),
('Disco duro externo', 'Disco duro portátil de 1TB', 85.55678, 60),
('Micrófono para PC', 'Micrófono USB para conferencias', 40.98765, 120),
('Bocina de sonido', 'Bocina de sonido con bajo potente', 50.43210, 100),
('Parlantes estéreo', 'Parlantes de alta calidad para PC', 70.98765, 80),
('Tarjeta gráfica', 'Tarjeta gráfica de 4GB para gaming', 220.43210, 40),
('Soporte para auriculares', 'Soporte vertical para auriculares', 12.12345, 150),
('Cargador para MacBook', 'Cargador de 60W para MacBook', 50.67890, 70),
('Monitor 27"', 'Pantalla ultra ancha de 27 pulgadas', 199.99999, 30),
('Cámara de acción', 'Cámara portátil para deportes extremos', 150.67890, 60),
('Teclado inalámbrico', 'Teclado sin cables con retroiluminación', 40.43210, 120),
('Control remoto', 'Control remoto universal para TV', 15.98765, 180),
('Ventilador portátil', 'Ventilador compacto USB', 20.98765, 110),
('Luces LED RGB', 'Luces LED ajustables para decoración', 15.98765, 140),
('Cámara IP', 'Cámara de vigilancia IP inalámbrica', 75.43210, 50),
('Estabilizador de voltaje', 'Estabilizador de energía para dispositivos electrónicos', 45.43210, 60),
('Cargador solar', 'Cargador de energía solar para teléfonos', 25.98765, 90),
('Adaptador USB', 'Adaptador USB para tarjetas SD', 6.43210, 180),
('Lentes de sol con Bluetooth', 'Lentes de sol con auriculares Bluetooth', 100.43210, 70),
('Estuche para laptop', 'Estuche para laptop de 15 pulgadas', 22.65432, 150),
('Joystick para PC', 'Joystick para juegos en PC y consolas', 45.12345, 80),
('Base para consola', 'Base de soporte para consolas', 30.98765, 100);


-- Corresponsales
INSERT INTO Corresponsales (Nombre, Direccion) VALUES
('Banco Pichincha', 'Av. Naciones Unidas y Amazonas'),
('Servipagos', 'Centro Comercial El Jardín'),
('Western Union', 'Av. 10 de Agosto y Colón'),
('Produbanco', 'Av. Orellana y Amazonas'),
('Banco de Guayaquil', 'Calle 6 de Diciembre y Rumipamba'),
('Banco Bolivariano', 'Calle Cordero y Pedro Vicente Maldonado'),
('Banco del Pacífico', 'Calle Loja y 10 de Agosto'),
('Banco ProCredit', 'Av. Amazonas y De los Shyris'),
('Banco Internacional', 'Calle Vaca de Castro y Napo'),
('Diners Club', 'Av. 6 de Diciembre y 9 de Octubre');


-- Órdenes
INSERT INTO Ordenes (ID_Cliente, ID_Corresponsal, Total) VALUES
(1, 1, 50.69332),
(2, 2, 21.87777),
(3, 1, 37.54678),
(4, 3, 62.76543),
(5, 1, 31.23213),
(6, 2, 18.23123),
(7, 3, 90.56432),
(8, 1, 45.12987),
(9, 2, 67.92103),
(10, 3, 29.33729),
(11, 4, 45.00000),
(12, 5, 38.20012),
(13, 6, 27.55432),
(14, 7, 62.98888),
(15, 8, 50.45123),
(16, 9, 35.23689),
(17, 10, 48.25670),
(18, 1, 55.34623),
(19, 2, 23.67520),
(20, 3, 40.22534),
(21, 4, 53.00210),
(22, 5, 31.55432),
(23, 6, 29.48765),
(24, 7, 51.23456),
(25, 8, 44.98765),
(26, 9, 35.12345),
(27, 10, 39.67523),
(28, 1, 60.56489),
(29, 2, 55.23679),
(30, 3, 45.87650),
(31, 4, 58.98432),
(32, 5, 41.34532),
(33, 6, 52.65432),
(34, 7, 38.23456),
(35, 8, 56.76543),
(36, 9, 45.21345),
(37, 10, 48.99999),
(38, 1, 36.89076),
(39, 2, 29.65432),
(40, 3, 55.43210),
(41, 4, 49.23456),
(42, 5, 27.87650),
(43, 6, 63.65432),
(44, 7, 58.98765),
(45, 8, 51.23679),
(46, 9, 46.43210),
(47, 10, 38.76543),
(48, 1, 51.56432),
(49, 2, 40.12345),
(50, 3, 42.98765);


-- Detalles de Órdenes
INSERT INTO Detalles_Orden (ID_Orden, ID_Producto, Cantidad, Precio_Unitario, Subtotal) VALUES
(1, 1, 2, 25.34987, 50.69974),
(2, 2, 3, 5.12345, 15.37035),
(3, 3, 1, 45.98765, 45.98765),
(4, 4, 2, 15.33333, 30.66666),
(5, 5, 4, 9.87412, 39.49648),
(6, 6, 1, 49.55678, 49.55678),
(7, 7, 3, 12.65432, 37.96296),
(8, 8, 2, 27.81923, 55.63846),
(9, 9, 1, 7.33145, 7.33145),
(10, 10, 2, 22.99753, 45.99506),
(11, 11, 1, 35.98764, 35.98764),
(12, 12, 2, 7.65432, 15.30864),
(13, 13, 3, 30.12345, 90.37035),
(14, 14, 1, 20.43210, 20.43210),
(15, 15, 2, 120.99876, 241.99752),
(16, 16, 1, 150.67890, 150.67890),
(17, 17, 2, 65.98765, 131.97530),
(18, 18, 3, 55.43210, 166.29630),
(19, 19, 1, 75.33333, 75.33333),
(20, 20, 2, 120.43210, 240.86420),
(21, 21, 1, 150.67890, 150.67890),
(22, 22, 4, 100.43210, 401.72840),
(23, 23, 2, 35.98765, 71.97530),
(24, 24, 1, 30.98765, 30.98765),
(25, 25, 1, 45.12345, 45.12345),
(26, 26, 3, 40.98765, 122.96295),
(27, 27, 2, 55.43210, 110.86420),
(28, 28, 1, 50.56489, 50.56489),
(29, 29, 3, 55.23679, 165.71037),
(30, 30, 2, 45.87650, 91.75300),
(31, 31, 1, 58.98432, 58.98432),
(32, 32, 2, 41.34532, 82.69064),
(33, 33, 3, 52.65432, 157.96296),
(34, 34, 1, 38.23456, 38.23456),
(35, 35, 2, 56.76543, 113.53086),
(36, 36, 1, 45.21345, 45.21345),
(37, 37, 2, 48.99999, 97.99998),
(38, 38, 3, 36.89076, 110.67228),
(39, 39, 2, 29.65432, 59.30864),
(40, 40, 1, 55.43210, 55.43210),
(41, 41, 2, 49.23456, 98.46912),
(42, 42, 3, 27.87650, 83.62950),
(43, 43, 1, 63.65432, 63.65432),
(44, 44, 2, 58.98765, 117.97530),
(45, 45, 3, 51.23679, 153.71037),
(46, 46, 1, 46.43210, 46.43210),
(47, 47, 2, 38.76543, 77.53086),
(48, 48, 1, 51.56432, 51.56432),
(49, 49, 3, 40.12345, 120.37035),
(50, 50, 2, 42.98765, 85.97530);
