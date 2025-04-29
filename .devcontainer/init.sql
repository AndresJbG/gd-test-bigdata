CREATE DATABASE mp3_db;
\c mp3_db;

-- Eliminar las tablas si existen
DROP TABLE IF EXISTS Detalles_Orden CASCADE;
DROP TABLE IF EXISTS Ordenes CASCADE;
DROP TABLE IF EXISTS Productos CASCADE;
DROP TABLE IF EXISTS Clientes CASCADE;

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
    Precio NUMERIC(10, 5) NOT NULL, -- Decimales con 5 dígitos
    Stock INT NOT NULL
);

-- Tabla de Órdenes
CREATE TABLE Ordenes (
    ID_Orden SERIAL PRIMARY KEY,
    ID_Cliente INT REFERENCES Clientes(ID_Cliente),
    Fecha_Orden TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Total NUMERIC(10, 5) NOT NULL
);

-- Tabla de Detalles de Órdenes
CREATE TABLE Detalles_Orden (
    ID_Detalle SERIAL PRIMARY KEY,
    ID_Orden INT REFERENCES Ordenes(ID_Orden),
    ID_Producto INT REFERENCES Productos(ID_Producto),
    Cantidad INT NOT NULL,
    Precio_Unitario NUMERIC(10, 5) NOT NULL, -- Decimales con 5 dígitos
    Subtotal NUMERIC(10, 5) NOT NULL
);

----

INSERT INTO Clientes (Nombre, Email, Telefono, Direccion) VALUES
('Andrés Pérez', 'andres_perez@gmail.com', '0987654321', 'Calle Olmedo 123'),
('María-Luisa Ñáñez', 'maria_luisa@gmail.com', '0991234567', 'Av. América 45-67'),
('Juan Rodríguez', 'juan.rodriguez@hotmail.com', '0987651234', 'Av. Quito 01-12'),
('Carla Gómez', 'carla_gomez@yahoo.com', '0981234567', 'Calle Bolívar 45-78'),
('José Martínez', 'jose.martinez@gmail.com', '0998765432', 'Calle Juan Montalvo 12-34'),
('Ana-Lucia Ñiquiz', 'ana_niquiz@gmail.com', '0984321786', 'Calle del Sol 23-67'),
('Luis Torres', 'luis.torres@gmail.com', '0997651234', 'Av. Loja 45-89'),
('Mónica Fernández', 'monica_fernandez@gmail.com', '0986453210', 'Barrio Los Andes'),
('Pedro García', 'pedro_garcia@yahoo.com', '0989876543', 'Calle Villavicencio'),
('Gabriela Núñez', 'gabriela_nunez@hotmail.com', '0994321678', 'Calle Mercurio 67-45');

INSERT INTO Productos (Nombre, Descripcion, Precio, Stock) VALUES
('Teléfono Xiaomi', 'Smartphone con pantalla AMOLED', 399.99001, 50),
('Auriculares Ñ-tech', 'Auriculares con cancelación de ruido', 59.95001, 100),
('Laptop HP', 'Computadora portátil con 16GB RAM', 999.0004, 25),
('Teclado Mecánico', 'Teclado RGB retroiluminado', 75.50004, 80),
('Monitor Samsung', 'Monitor LED 24 pulgadas', 180.4505, 30),
('Mouse Gamer', 'Mouse óptico con DPI ajustable', 25.99005, 200),
('Silla Ergonómica', 'Silla de oficina ajustable', 250.25005, 15),
('Cable HDMI', 'Cable HDMI de 2 metros', 12.50005, 150),
('Router Wi-Fi', 'Router de alta velocidad', 89.99005, 50),
('Disco Duro Externo', 'Disco duro de 1TB', 120.75005, 45);

INSERT INTO Ordenes (ID_Cliente, Total) VALUES
(1, 459.94002),
(2, 119.90002),
(3, 175.99000),
(4, 1250.25008),
(5, 89.99005),
(6, 75.50005),
(7, 220.45005),
(8, 399.99005),
(9, 180.45005),
(10, 250.25005);


INSERT INTO Detalles_Orden (ID_Orden, ID_Producto, Cantidad, Precio_Unitario, Subtotal) VALUES
(1, 1, 1, 399.99001, 399.99001),
(1, 2, 1, 59.95001, 59.95001),
(2, 2, 2, 59.95002, 119.90002),
(3, 3, 1, 999.00004, 999.00004),
(3, 4, 1, 75.50004, 75.50004),
(4, 5, 2, 180.45005, 360.90005),
(5, 6, 4, 25.99005, 103.96005),
(6, 7, 1, 250.25005, 250.25005),
(7, 8, 2, 12.50005, 25.00005),
(8, 9, 1, 89.99005, 89.99005);
