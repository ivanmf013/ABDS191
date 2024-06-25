-- explorar las propiedades de una base de datos 

EXEC sp_helpdb 'PlataformaStreaming'

--explorar las propiedades de un objeto de la BD
EXEC sp_help 'peliculas'

--llaves primarias de una tabla 
EXEC sp_helpindex 'peliculas'

--informacion de los ususarios y procesos actuales 
EXEC sp_who

--rendimiento del servidor 
EXEC sp_monitor

--espacio usado por la BD
EXEC sp_spaceused

--puerto de escucha del SQL SERVER
EXEC sp_readerrorlog 0,1



--- PROCEDIMIENTOS PROPIOS 

CREATE PROCEDURE sp_ObtenerHistorial
@usuarioId INT

AS
BEGIN 

 SELECT h.HistorialID, p.titulo, h.FechaVisualizacion
 FROM HistrorialVisualizacion h
 JOIN peliculas p ON h.PeliculaID = p.PeliculaID
 WHERE h.UsuarioID = @usuarioId
 ORDER BY h.FechaVisualizacion DESC

END;

EXEC sp_ObtenerHistorial '6';

CREATE PROCEDURE sp_insertarPeliculas
@titulo NVARCHAR(100),
@genero NVARCHAR(50),
@fecha_estreno DATE
AS
BEGIN

INSERT INTO peliculas(Titulo, Genero, FechaEstreno)
	VALUES(@titulo, @genero, @fecha_estreno)
END;

EXEC sp_insertarPeliculas @titulo ='intensamente', @genero= 'infantil',@fecha_estreno ='2014-06-13'

select * from peliculas