-- 4. CONSULTAS SQL DE PRUEBA
-- =============================================
-- Realizamos diferentes consultas para verificar la información
-- almacenada en las tablas de la base de datos ElectroHouseDB.

USE ElectroHouseDB;
GO

-- a) Mostrar todos los productos con precio mayor a cierto valor.
SELECT * FROM Productos
WHERE precio > 100000;
GO

-- b) Mostrar los clientes que tienen órdenes registradas.(Select Distinct se usa para ver datos no duplicados)
SELECT DISTINCT C.id_cliente, C.nombre, C.email
FROM Clientes C
INNER JOIN Ordenes O ON C.id_cliente = O.id_cliente;
GO

-- c) JOIN: Mostrar clientes junto con los productos comprados y la cantidad.
SELECT 
    C.nombre AS Cliente,
    P.nombre AS Producto,
    O.cantidad AS Cantidad,
    O.fecha AS Fecha_Compra
FROM Ordenes O
INNER JOIN Clientes C ON O.id_cliente = C.id_cliente
INNER JOIN Productos P ON O.id_producto = P.id_producto;
GO
