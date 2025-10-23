-- CREACIÓN DE TABLAS
-- =============================================
-- Creamos tres tablas principales: Productos, Clientes y Ordenes.

USE ElectroHouseDB;
GO

-- Tabla Productos: almacena información sobre los productos disponibles.
CREATE TABLE Productos (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,   -- Identificador único del producto
    nombre NVARCHAR(100) NOT NULL,              -- Nombre del producto
    precio DECIMAL(10,2) NOT NULL,              -- Precio del producto con dos decimales
    stock INT NOT NULL                          -- Cantidad disponible en inventario
);
GO

-- Tabla Clientes: almacena información sobre los clientes.
CREATE TABLE Clientes (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,   -- Identificador único del cliente
    nombre NVARCHAR(100) NOT NULL,              -- Nombre completo del cliente
    email NVARCHAR(100) UNIQUE NOT NULL         -- Correo electrónico único para cada cliente
);
GO

-- Tabla Ordenes: almacena las órdenes de compra realizadas.
CREATE TABLE Ordenes (
    id_orden INT IDENTITY(1,1) PRIMARY KEY,     -- Identificador único de la orden
    id_cliente INT NOT NULL,                    -- Cliente que realizó la orden
    id_producto INT NOT NULL,                   -- Producto comprado
    cantidad INT NOT NULL,                      -- Cantidad del producto comprado
    fecha DATE NOT NULL DEFAULT GETDATE(),      -- Fecha de la orden (automática)
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente), -- Relación con Clientes
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto) -- Relación con Productos
);
GO
