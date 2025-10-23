-- =============================================
-- TRANSACCIÓN 1: SIMULAR UNA COMPRA DE PRODUCTO
-- =============================================

BEGIN TRANSACTION;  -- Inicia la transacción

BEGIN TRY
    -- Disminuir el stock del producto con id_producto = 1
    UPDATE Productos
    SET stock = stock - 1
    WHERE id_producto = 1;

    -- Registrar la orden en la tabla Ordenes
    INSERT INTO Ordenes (id_cliente, id_producto, cantidad, fecha)
    VALUES (1, 1, 1, GETDATE());

    -- Confirmar los cambios si no hubo errores
    COMMIT;
END TRY
BEGIN CATCH
    -- En caso de error, revertir los cambios
    ROLLBACK;

    -- Opcional: mostrar el error
    SELECT ERROR_MESSAGE() AS Error;
END CATCH;

-- =============================================
-- FIN DE LA TRANSACCIÓN 1
-- =============================================
