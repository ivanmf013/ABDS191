--2 procedimientos almacenados para Insertar
CREATE PROCEDURE sp_InsertarCliente
    @nombre VARCHAR(100),
    @correo_electronico VARCHAR(255),
    @contraseña VARCHAR(255)
AS
BEGIN
    INSERT INTO Clientes (nombre, correo_electronico, contraseña)
    VALUES (@nombre, @correo_electronico, @contraseña);
END;

EXEC sp_InsertarCliente @nombre = 'Carlos Menendez', @correo_electronico = 'carlosmenendez@example.com', @contraseña = 'password13';
EXEC sp_InsertarCliente @nombre = 'Lucia Suarez', @correo_electronico = 'luciasuarez@example.com', @contraseña = 'password14';
EXEC sp_InsertarCliente @nombre = 'Pedro Alvarado', @correo_electronico = 'pedroalvarado@example.com', @contraseña = 'password15';

select  * from Clientes

CREATE PROCEDURE sp_InsertarComic
    @titulo VARCHAR(100),
    @anio TINYINT,
    @precio DECIMAL(10,2),
    @id_autor BIGINT
AS
BEGIN
    INSERT INTO Comics (titulo, anio, precio, id_autor)
    VALUES (@titulo, @anio, @precio, @id_autor);
END;

EXEC sp_InsertarComic @titulo = 'Las menos que épicas aventuras de TJ y Amal', @anio = 21, @precio = 19.99, @id_autor = 300;
EXEC sp_InsertarComic @titulo = 'steven universo', @anio = 22, @precio = 17.50, @id_autor = 301;
EXEC sp_InsertarComic @titulo = 'Vengadores jóvenes', @anio = 23, @precio = 14.99, @id_autor = 302;
 
select * from Comics

--2 procedimientos almacenados para Editar
CREATE PROCEDURE sp_EditarCliente
    @id_cliente BIGINT,
    @nombre VARCHAR(100),
    @correo_electronico VARCHAR(255),
    @contraseña VARCHAR(255)
AS
BEGIN
    UPDATE Clientes
    SET nombre = @nombre, correo_electronico = @correo_electronico, contraseña = @contraseña
    WHERE id_cliente = @id_cliente;
END;

EXEC sp_EditarCliente @id_cliente = 1, @nombre = 'Juan Pérez Modificado', @correo_electronico = 'juanperezmod@example.com', @contraseña = 'newpassword1';
EXEC sp_EditarCliente @id_cliente = 2, @nombre = 'María García Modificada', @correo_electronico = 'mariagarciamod@example.com', @contraseña = 'newpassword2';
EXEC sp_EditarCliente @id_cliente = 3, @nombre = 'Luis Martínez Modificado', @correo_electronico = 'luismartinezmod@example.com', @contraseña = 'newpassword3';

select * from Clientes

CREATE PROCEDURE sp_EditarComic
    @id_comic BIGINT,
    @titulo VARCHAR(100),
    @anio TINYINT,
    @precio DECIMAL(10,2),
    @id_autor BIGINT
AS
BEGIN
    UPDATE Comics
    SET titulo = @titulo, anio = @anio, precio = @precio, id_autor = @id_autor
    WHERE id_comic = @id_comic;
END;

EXEC sp_EditarComic @id_comic = 10, @titulo = 'Batman: Año Uno Modi', @anio = 5, @precio = 15.99, @id_autor = 300;
EXEC sp_EditarComic @id_comic = 12, @titulo = 'Watchmen Modi', @anio = 86, @precio = 12.50, @id_autor = 301;
EXEC sp_EditarComic @id_comic = 14, @titulo = 'Saga Modi', @anio = 12, @precio = 10.99, @id_autor = 302;

select * from Comics

--3 procedimientos de consulta que implementen JOINS y que necesite de mínimo un parámetro para trabajar
CREATE PROCEDURE sp_comprascliente
    @clienteId bigint
AS
BEGIN
    SELECT c.titulo, cc.cantidad, cm.fecha_compra
    FROM Compras cm
    INNER JOIN Comic_Compras cc ON cm.id_compra = cc.id_compra
    INNER JOIN Comics c ON cc.id_comic = c.id_comic
    WHERE cm.id_cliente = @clienteId;
END;

EXEC sp_comprascliente @clienteId = 1;
EXEC sp_comprascliente @clienteId = 5;
EXEC sp_comprascliente @clienteId = 7;



CREATE PROCEDURE sp_InventarioComicsDisponibles
AS
BEGIN
    SELECT c.titulo, i.cantidad_disponible
    FROM Inventario i
    INNER JOIN Comics c ON i.id_comic = c.id_comic
    WHERE i.disponibilidad = 1; 
END;

EXEC sp_InventarioComicsDisponibles;

CREATE PROCEDURE sp_ComprasPorFechas
    @fechaInicio DATE,
    @fechaFin DATE
AS
BEGIN
    SELECT cl.nombre, cm.fecha_compra, cm.total
    FROM Compras cm
    INNER JOIN Clientes cl ON cm.id_cliente = cl.id_cliente
    WHERE cm.fecha_compra BETWEEN @fechaInicio AND @fechaFin;
END;

EXEC sp_ComprasPorFechas @fechaInicio = '2024-05-25', @fechaFin = '2024-05-27';

EXEC sp_ComprasPorFechas @fechaInicio = '2024-05-25', @fechaFin = '2024-05-29';

EXEC sp_ComprasPorFechas @fechaInicio = '2024-05-27', @fechaFin = '2024-05-27';


--2 procedimientos almacenados para Eliminar
CREATE PROCEDURE sp_DeleteAutorrr
    @autorId bigint
AS
BEGIN
    BEGIN TRY
        -- Actualizar los cómics relacionados para eliminar la referencia al autor
        UPDATE Comics
        SET id_autor = NULL
        WHERE id_autor = @autorId;

        -- Eliminar el autor
        DELETE FROM Autores
        WHERE id_autor = @autorId;

        PRINT 'Autor eliminado exitosamente.';
    END TRY
    BEGIN CATCH
        PRINT 'Error al intentar eliminar el autor.';
        THROW;
    END CATCH
END;

--Pruebas de Ejecución 
EXEC sp_DeleteAutorrr  @autorId = 300;
EXEC sp_DeleteAutorrr  @autorId = 301;
EXEC sp_DeleteAutorrr  @autorId = 302;

select * from Autores


CREATE PROCEDURE sp_DeleteClientee
    @clienteId bigint
AS
BEGIN
    BEGIN TRY
        -- Eliminar las relaciones en Comic_Compras
        DELETE CC
        FROM Comic_Compras CC
        INNER JOIN Compras C ON CC.id_compra = C.id_compra
        WHERE C.id_cliente = @clienteId;

        -- Eliminar las relaciones en Compras
        DELETE FROM Compras
        WHERE id_cliente = @clienteId;

        -- Eliminar el cliente
        DELETE FROM Clientes
        WHERE id_cliente = @clienteId;

        PRINT 'Cliente eliminado exitosamente.';
    END TRY
    BEGIN CATCH
        PRINT 'Error al intentar eliminar el cliente.';
        THROW;
    END CATCH
END;

--pruenas de ejecución 
EXEC sp_DeleteClientee @clienteId = 1;
EXEC sp_DeleteClientee @clienteId = 2;
EXEC sp_DeleteClientee @clienteId = 3;

select * from Clientes