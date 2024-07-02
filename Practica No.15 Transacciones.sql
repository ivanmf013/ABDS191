CREATE PROCEDURE sp_updateSuscripcionyactualizaruasuario
	@FechaInicio  DATE,
	@FechaFin  DATE, 
	@Tipo NVARCHAR(50),
	@UsuarioID INT

AS
BEGIN 
	BEGIN TRANSACTION;
	BEGIN TRY

--insertar la nueva suscripcion 
	Insert into Suscripciones (UsuarioID,FechaInicio,FechaFin,Tipo) VALUES (@UsuarioID, @FechaInicio, @FechaFin,@Tipo);

--actualizar la fecha del registro del usuario
	UPDATE Usuarios SET  FechaRegistro = @FechaInicio WHERE UsuarioID = @UsuarioID;

COMMIT TRANSACTION;
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION;
	DECLARE @ErrorMessage NVARCHAR(4000);
	SET @ErrorMessage = ERROR_MESSAGE();
	PRINT @ErrorMessage;
END CATCH
END;

EXEC sp_updateSuscripcionyactualizaruasuario 