--procedimiento almacenado con el cual podremos Insertar usuarios atreves de los parámetros
CREATE PROCEDURE sp_InsertarUsuario
    @Nombre NVARCHAR(100),
    @Email NVARCHAR(100),
    @pass NVARCHAR(100)
AS
BEGIN
    INSERT INTO Usuarios (Nombre, Email, pass)
    VALUES (@Nombre, @Email, @pass);
END;


EXEC sp_InsertarUsuario @Nombre ='juan jose', @Email= 'jj@gmail.com',@pass ='bedhcehjbce'
EXEC sp_InsertarUsuario @Nombre ='samuel', @Email= 'samas@gmail.com',@pass ='lenteha29'
EXEC sp_InsertarUsuario @Nombre ='axel ramirez', @Email= 'axelrami@gmail.com',@pass ='huehuw'

select * from usuarios;

--Editar una Suscripción
CREATE PROCEDURE sp_editarSuscripcion
    @suscripcionID INT,
    @FechaInicio DATE,
    @FechaFin DATE,
    @Tipo NVARCHAR(50)
AS
BEGIN
    UPDATE suscripciones
    SET FechaInicio = @FechaInicio,
        FechaFin = @FechaFin,
        Tipo = @Tipo
    WHERE suscripcionID = @suscripcionID;
END;

EXEC sp_editarSuscripcion @suscripcionID = '1', @FechaInicio ='2024-03-03', @FechaFin ='2024-04-13', @Tipo ='mensual'
EXEC sp_editarSuscripcion @suscripcionID = '2', @FechaInicio ='2024-03-04', @FechaFin ='2024-05-11', @Tipo ='mensual'
EXEC sp_editarSuscripcion @suscripcionID = '3', @FechaInicio ='2024-03-05', @FechaFin ='2024-06-10', @Tipo ='anual'

select * from suscripciones;

--Eliminar un registro en la tabla 
CREATE PROCEDURE sp_EliminarHistorialVisualizacion
    @HistorialID INT
AS
BEGIN
    DELETE FROM HistrorialVisualizacion
    WHERE HistorialID = @HistorialID;
END;

EXEC sp_EliminarHistorialVisualizacion @HistorialID = '1';
EXEC sp_EliminarHistorialVisualizacion @HistorialID = '2';
EXEC sp_EliminarHistorialVisualizacion @HistorialID = '3';

select * from HistrorialVisualizacion;

--para consultar los usuarios 
CREATE PROCEDURE sp_ConsultarUsuarios
    @TipoSuscripcion NVARCHAR(50)
AS
BEGIN
    SELECT 
        u.UsuarioID,
        u.Nombre,
        u.Email,
        s.suscripcionID,
        s.FechaInicio AS FechaInicioSuscripcion,
        s.FechaFin AS FechaFinSuscripcion,
        s.Tipo AS TipoSuscripcion
    FROM 
        Usuarios u
    LEFT JOIN 
        suscripciones s ON u.UsuarioID = s.UsuarioID
    WHERE 
        s.Tipo = @TipoSuscripcion;
END;

EXEC sp_ConsultarUsuarios @TipoSuscripcion = 'Anual';
EXEC sp_ConsultarUsuarios @TipoSuscripcion = 'mensual';

--consultar
CREATE PROCEDURE sp_ConsultarPeli
    @GeneroPelicula NVARCHAR(50)
AS
BEGIN
    SELECT 
        h.HistorialID,
		u.Nombre,
		u.Email,
		p.Titulo,
		P.genero
    FROM 
        HistrorialVisualizacion h
     LEFT JOIN Usuarios u ON h.usuarioID = u.UsuarioID
     LEFT JOIN peliculas p ON h.peliculaID = p.PeliculaID
    WHERE 
        p.Genero = @GeneroPelicula
END;

EXEC sp_ConsultarPeliculas  @GeneroPelicula = 'Animación';
EXEC sp_ConsultarPeliculas  @GeneroPelicula = 'Animación';
EXEC sp_ConsultarPeliculas  @GeneroPelicula = 'Animación';