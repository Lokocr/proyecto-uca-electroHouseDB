/*=============================================================
  PROYECTO: ElectroHouseDB
  
  DESCRIPCIÓN: Versión inicial - Tablas Clientes y Productos
==============================================================*/

-- Crear la base de datos
CREATE DATABASE ElectroHouseDB;
GO

USE ElectroHouseDB;
GO

-- ==========================================================
-- TABLA CLIENTES
-- ==========================================================
CREATE TABLE Clientes (
    ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Correo NVARCHAR(100) UNIQUE NOT NULL,
    Telefono NVARCHAR(20),
    Direccion NVARCHAR(150)
);
GO

-- ==========================================================
-- TABLA PRODUCTOS
-- ==========================================================
CREATE TABLE Productos (
    ProductoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Categoria NVARCHAR(50),
    Precio DECIMAL(10,2) CHECK (Precio > 0),
    Stock INT CHECK (Stock >= 0)
);
GO


-- ==========================================================
-- INSERTAR DATOS DE EJEMPLO
-- ==========================================================
INSERT INTO Clientes (Nombre, Correo, Telefono, Direccion)
VALUES 
('Juan Pérez', 'juanp@gmail.com', '8888-1111', 'San José'),
('María Gómez', 'maria.gomez@hotmail.com', '8877-2222', 'Heredia'),
('Carlos Rodríguez', 'carlosr@gmail.com', '8855-3333', 'Cartago');
GO

INSERT INTO Productos (Nombre, Categoria, Precio, Stock)
VALUES
('Televisor Samsung 55"', 'Electrónica', 650.00, 10),
('Laptop HP 15"', 'Computadoras', 800.00, 5),
('Celular iPhone 13', 'Telefonía', 950.00, 8),
('Parlante JBL', 'Audio', 120.00, 15);
GO


-- ==========================================================
-- CONSULTAS DE PRUEBA
-- ==========================================================
SELECT * FROM Clientes;
SELECT * FROM Productos;
GO

