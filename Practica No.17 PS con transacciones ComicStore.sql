CREATE PROCEDURE sp_InsertarComicYActualizarInventario
    @Titulo VARCHAR(100),
    @Anio TINYINT,
    @Precio DECIMAL(10,2),
    @CantidadDisponible INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Insertar nuevo cómic
        INSERT INTO Comics (titulo, anio, precio) VALUES (@Titulo, @Anio, @Precio);

        -- Obtener el ID del cómic recién insertado
        DECLARE @ComicID BIGINT;
        SELECT @ComicID = MAX(id_comic) FROM Comics;

        -- Insertar en el inventario
        INSERT INTO Inventario (id_comic, cantidad_disponible, disponibilidad)
        VALUES (@ComicID, @CantidadDisponible, CASE WHEN @CantidadDisponible > 0 THEN 1 ELSE 0 END);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;

-- ejecución 1
EXEC sp_InsertarComicYActualizarInventario @Titulo = 'The Umbrella Academy', @Anio = 07, @Precio = 15.99, @CantidadDisponible = 10;

-- ejecución 2
EXEC sp_InsertarComicYActualizarInventario @Titulo = 'Ten Count', @Anio = 94, @Precio = 20.00, @CantidadDisponible = 5;

-- ejecucion 3
EXEC sp_InsertarComicYActualizarInventario @Titulo = 'Hellboy', @Anio = 93, @Precio = 18.00, @CantidadDisponible = 0;

--resultados 
SELECT * FROM Comics;
SELECT * FROM Inventario;


--transaccion 2 
CREATE PROCEDURE sp_ActualizarPrecioInventarioComic
    @IdComic BIGINT,
    @NuevoPrecio DECIMAL(10,2),
    @NuevaCantidadDisponible INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Actualizar precio del cómic
        UPDATE Comics
        SET precio = @NuevoPrecio
        WHERE id_comic = @IdComic;

        -- Actualizar inventario del cómic
        UPDATE Inventario
        SET cantidad_disponible = @NuevaCantidadDisponible,
            disponibilidad = CASE WHEN @NuevaCantidadDisponible > 0 THEN 1 ELSE 0 END
        WHERE id_comic = @IdComic;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;

-- ejecucion 1
EXEC sp_ActualizarPrecioInventarioComic @IdComic = 10, @NuevoPrecio = 20.00, @NuevaCantidadDisponible = 8;

-- ejecucion 2 
EXEC sp_ActualizarPrecioInventarioComic @IdComic = 12, @NuevoPrecio = 15.00, @NuevaCantidadDisponible = 5;

-- ejecucion 3
EXEC sp_ActualizarPrecioInventarioComic @IdComic = 14, @NuevoPrecio = 25.00, @NuevaCantidadDisponible = 0;


SELECT * FROM Comics;
SELECT * FROM Inventario;


--transaccion 3

CREATE PROCEDURE sp_EliminarClienteYCompras
    @IdCliente BIGINT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Eliminar registros de Comic_Compras
        DELETE FROM Comic_Compras
        WHERE id_compra IN (SELECT id_compra FROM Compras WHERE id_cliente = @IdCliente);

        -- Eliminar registros de Compras
        DELETE FROM Compras
        WHERE id_cliente = @IdCliente;

        -- Eliminar cliente
        DELETE FROM Clientes
        WHERE id_cliente = @IdCliente;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;

-- ejecucion 1
EXEC sp_EliminarClienteYCompras @IdCliente = 4;

-- ejecucion 2
EXEC sp_EliminarClienteYCompras @IdCliente = 5;

-- ejecucion 3
EXEC sp_EliminarClienteYCompras @IdCliente = 6;


SELECT * FROM Clientes;
SELECT * FROM Compras;
SELECT * FROM Comic_Compras;


CREATE PROCEDURE sp_ActualizarCorreoYContrasenaCliente
    @IdCliente BIGINT,
    @NuevoCorreoElectronico VARCHAR(255),
    @NuevaContrasena VARCHAR(255)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Actualizar correo electrónico del cliente
        UPDATE Clientes
        SET correo_electronico = @NuevoCorreoElectronico
        WHERE id_cliente = @IdCliente;

        -- Actualizar contraseña del cliente
        UPDATE Clientes
        SET contraseña = @NuevaContrasena
        WHERE id_cliente = @IdCliente;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;


-- ejecucion 1
EXEC sp_ActualizarCorreoYContrasenaCliente @IdCliente = 9, @NuevoCorreoElectronico = 'nuevo_correo2@example.com', @NuevaContrasena = 'nueva_contrasena2';

-- ejecucion 2
EXEC sp_ActualizarCorreoYContrasenaCliente @IdCliente = 7, @NuevoCorreoElectronico = 'nuevo_correo4@example.com', @NuevaContrasena = 'nueva_contrasena4';

-- ejecucion 3
EXEC sp_ActualizarCorreoYContrasenaCliente @IdCliente = 8, @NuevoCorreoElectronico = 'nuevo_correo6@example.com', @NuevaContrasena = 'nueva_contrasena6';

SELECT * FROM Clientes;



CREATE PROCEDURE sp_ActualizarTituloYAnioComic
    @IdComic BIGINT,
    @NuevoTitulo VARCHAR(100),
    @NuevoAnio TINYINT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Actualizar título del cómic
        UPDATE Comics
        SET titulo = @NuevoTitulo,
            anio = @NuevoAnio
        WHERE id_comic = @IdComic;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;

-- ejecucion 1
EXEC sp_ActualizarTituloYAnioComic @IdComic = 10, @NuevoTitulo = 'Batman: Year One', @NuevoAnio = 87;

-- ejecucion 2
EXEC sp_ActualizarTituloYAnioComic @IdComic = 12, @NuevoTitulo = 'Saga of the Swamp Thing', @NuevoAnio = 85;

-- ejecucion 3
EXEC sp_ActualizarTituloYAnioComic @IdComic = 14, @NuevoTitulo = 'Crisis on Infinite Earths', @NuevoAnio = 85;


SELECT * FROM Comics;
