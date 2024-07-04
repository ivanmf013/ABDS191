CREATE PROCEDURE sp_InsertarPeliculaYRegistroHistoria
    @Titulo NVARCHAR(100),
    @Genero NVARCHAR(50),
    @FechaEstreno DATE
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Insertar la nueva película
        INSERT INTO Peliculas (Titulo, Genero, FechaEstreno)
        VALUES (@Titulo, @Genero, @FechaEstreno);

        -- Obtener el ID de la película recién insertada
        DECLARE @PeliculaID INT;
        SELECT @PeliculaID = MAX(PeliculaID) FROM Peliculas;

        -- Insertar un registro en HistorialVisualizacion para cualquier usuario
        INSERT INTO HistorialVisualizacion (UsuarioID, PeliculaID)
        SELECT TOP 1 UsuarioID, @PeliculaID
        FROM Usuarios;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;


EXEC sp_InsertarPeliculaYRegistroHistoria @Titulo = 'pelicula n', @Genero = 'Género n', @FechaEstreno = '2024-07-03';

select * from Peliculas
select * from HistorialVisualizacion


CREATE PROCEDURE sp_InsertarUsuarioSuscripcionYVisualizacion
    @Nombre NVARCHAR(100),
    @Email NVARCHAR(100),
    @Pass NVARCHAR(100),
    @FechaInicio DATE,
    @FechaFin DATE,
    @Tipo NVARCHAR(50),
    @PeliculaID INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
	INSERT INTO Usuarios (Nombre, Email, Pass) VALUES (@Nombre, @Email, @Pass);

	DECLARE @UsuarioID INT;
        SET @UsuarioID = SCOPE_IDENTITY(); 

	INSERT INTO Suscripciones (UsuarioID, FechaInicio, FechaFin, Tipo) VALUES (@UsuarioID, @FechaInicio, @FechaFin, @Tipo);
 COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;

EXEC sp_InsertarUsuarioSuscripcionYVisualizacion  @Nombre = 'alan sanchez',  @Email = 'alan.sanchez@example.com', @Pass = 'passwordiba',  @FechaInicio = '2024-07-01',  @FechaFin = '2025-06-30',  @Tipo = 'Anual', @PeliculaID = 1;

select * from Usuarios
select * from Suscripciones
select * from HistorialVisualizacion


CREATE PROCEDURE sp_ActualizarCorreoYTipoSuscripcion
    @UsuarioID INT,
    @NuevoEmail NVARCHAR(100)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY

	UPDATE Usuarios SET Email = @NuevoEmail WHERE UsuarioID = @UsuarioID;
	UPDATE Suscripciones  SET Tipo = 'Anual' WHERE UsuarioID = @UsuarioID;

	COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;

EXEC sp_ActualizarCorreoYTipoSuscripcion  @UsuarioID = 1, @NuevoEmail = 'nuevo.email@example.com';

select * from Usuarios
select * from Suscripciones



CREATE PROCEDURE sp_EliminarPeliculaYRegistrosHistoriall
    @PeliculaID INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Eliminar los registros 
        DELETE FROM HistorialVisualizacion
        WHERE PeliculaID = @PeliculaID;

        -- Eliminar la película
        DELETE FROM Peliculas
        WHERE PeliculaID = @PeliculaID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;


EXEC sp_EliminarPeliculaYRegistrosHistoriall @PeliculaID = 2;

select * from Peliculas
select * from HistorialVisualizacion

CREATE PROCEDURE sp_EliminarUsuarioYRegistros
    @UsuarioID INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Eliminar los registros 
        DELETE FROM HistorialVisualizacion
        WHERE UsuarioID = @UsuarioID;

        -- Eliminar las suscripciones
        DELETE FROM Suscripciones
        WHERE UsuarioID = @UsuarioID;

        -- Eliminar el usuario
        DELETE FROM Usuarios
        WHERE UsuarioID = @UsuarioID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        PRINT @ErrorMessage;
    END CATCH;
END;

EXEC sp_EliminarUsuarioYRegistros @UsuarioID = 1;

select * from Usuarios
select * from Suscripciones
select * from HistorialVisualizacion

