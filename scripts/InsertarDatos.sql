-- Insertamos productos disponibles en la tienda.
INSERT INTO Productos (nombre, precio, stock) VALUES
('Televisor Samsung 55"', 450000, 10),
('Laptop HP', 600000, 5),
('Mouse Inalámbrico', 15000, 50),
('Refrigeradora LG', 700000, 3),
('Teclado Mecánico', 25000, 20);
GO

-- Insertamos clientes registrados en el sistema.
INSERT INTO Clientes (nombre, email) VALUES
('Juan Pérez', 'juanperez@gmail.com'),
('María López', 'mlopez@hotmail.com'),
('Carlos Ramírez', 'carlosr@gmail.com');
GO

-- Insertamos órdenes de ejemplo para simular compras.
INSERT INTO Ordenes (id_cliente, id_producto, cantidad, fecha) VALUES
(1, 1, 1, GETDATE()),
(2, 2, 1, GETDATE()),
(1, 3, 2, GETDATE());
GO