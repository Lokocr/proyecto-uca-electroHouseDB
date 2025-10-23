-- =============================================
-- Proyecto: ElectroHouseDB
-- Parte 2: Base de Datos
-- Autor: Equipo de Desarrollo
-- Descripción: Este script crea la estructura de la base de datos,
-- inserta datos iniciales, realiza consultas y simula una transacción.
-- Cada sección está comentada para explicar su propósito.
-- =============================================

-- =============================================
-- 1. CREACIÓN DE TABLAS
-- =============================================
-- Creamos tres tablas principales: Productos, Clientes y Ordenes.
-- Estas tablas representan el inventario, los clientes y las órdenes de compra.

-- Tabla Productos: almacena información sobre los productos disponibles.
CREATE TABLE Productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único del producto
    nombre VARCHAR(100) NOT NULL,              -- Nombre del producto
    precio DECIMAL(10,2) NOT NULL,            -- Precio del producto con dos decimales
    stock INT NOT NULL                         -- Cantidad disponible en inventario
);

-- Tabla Clientes: almacena información sobre los clientes.
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único del cliente
    nombre VARCHAR(100) NOT NULL,             -- Nombre completo del cliente
    email VARCHAR(100) UNIQUE NOT NULL        -- Correo electrónico único para cada cliente
);

-- Tabla Ordenes: almacena las órdenes de compra realizadas.
CREATE TABLE Ordenes (
    id_orden INT PRIMARY KEY AUTO_INCREMENT,  -- Identificador único de la orden
    id_cliente INT NOT NULL,                  -- Cliente que realizó la orden
    id_producto INT NOT NULL,                 -- Producto comprado
    cantidad INT NOT NULL,                    -- Cantidad del producto comprado
    fecha DATE NOT NULL,                      -- Fecha de la orden
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente), -- Relación con Clientes
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto) -- Relación con Productos
);

-- =============================================
-- 2. INSERCIÓN DE DATOS INICIALES
-- =============================================
-- Insertamos datos para simular un inventario y algunos clientes.

-- Insertar productos en la tabla Productos
INSERT INTO Productos (nombre, precio, stock) VALUES
('Laptop', 850.00, 10),
('Smartphone', 500.00, 20),
('Auriculares', 50.00, 50);

-- Insertar clientes en la tabla Clientes
INSERT INTO Clientes (nombre, email) VALUES
('Ana Pérez', 'ana@example.com'),
('Luis Gómez', 'luis@example.com');

-- Insertar órdenes en la tabla Ordenes
INSERT INTO Ordenes (id_cliente, id_producto, cantidad, fecha) VALUES
(1, 1, 1, '2025-10-20'),
(2, 3, 2, '2025-10-21');

-- =============================================
-- 3. CONSULTAS SELECT
-- =============================================
-- Estas consultas permiten obtener información específica.

-- a) Listar todos los productos con precio mayor a 100
SELECT * FROM Productos WHERE precio > 100;

-- b) Listar los clientes que tienen órdenes registradas
SELECT DISTINCT Clientes.nombre, Clientes.email
FROM Clientes
JOIN Ordenes ON Clientes.id_cliente = Ordenes.id_cliente;

-- =============================================
-- 4. CONSULTA CON JOIN
-- =============================================
-- Combinar información de clientes y sus órdenes con detalles del producto.
SELECT Clientes.nombre AS Cliente, Productos.nombre AS Producto, Ordenes.cantidad, Ordenes.fecha
FROM Ordenes
JOIN Clientes ON Ordenes.id_cliente = Clientes.id_cliente
JOIN Productos ON Ordenes.id_producto = Productos.id_producto;

-- =============================================
-- 5. TRANSACCIÓN PARA SIMULAR UNA VENTA
-- =============================================
-- Una transacción agrupa varias operaciones para asegurar consistencia.
-- Si todo se ejecuta correctamente, se confirma con COMMIT.
-- Si ocurre un error, se revierte con ROLLBACK.

START TRANSACTION;

-- Disminuir el stock del producto con id_producto = 2 (Smartphone)
UPDATE Productos SET stock = stock - 1 WHERE id_producto = 2;

-- Registrar la orden en la tabla Ordenes
INSERT INTO Ordenes (id_cliente, id_producto, cantidad, fecha)
VALUES (1, 2, 1, CURDATE());

-- Confirmar los cambios
COMMIT;
-- Si hubiera un error, usar ROLLBACK en lugar de COMMIT
-- ROLLBACK;

-- =============================================
-- FIN DEL SCRIPT
-- =============================================
