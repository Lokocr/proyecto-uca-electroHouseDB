-- =============================================
-- TRANSACCIÓN 2: COMPRA DE VARIOS PRODUCTOS
-- =============================================

BEGIN TRANSACTION;

BEGIN TRY
    -- Disminuir el stock del producto con id_producto = 2
    UPDATE Productos
    SET stock = stock - 1
    WHERE id_producto = 2;

    -- Disminuir el stock del producto con id_producto = 3
    UPDATE Productos
    SET stock = stock - 1
    WHERE id_producto = 3;

    -- Registrar la orden del primer producto
    INSERT INTO Ordenes (id_cliente, id_producto, cantidad, fecha)
    VALUES (2, 2, 1, GETDATE());

    -- Registrar la orden del segundo producto
    INSERT INTO Ordenes (id_cliente, id_producto, cantidad, fecha)
    VALUES (2, 3, 1, GETDATE());

    -- Confirmar los cambios si todo fue exitoso
    COMMIT;
END TRY
BEGIN CATCH
    -- Revertir los cambios si ocurre un error
    ROLLBACK;

    -- Mostrar el mensaje de error
    SELECT ERROR_MESSAGE() AS Error;
END CATCH;

-- =============================================
-- FIN DE LA TRANSACCIÓN 2
-- =============================================
