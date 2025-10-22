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
