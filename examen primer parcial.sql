CREATE TABLE Autores (
    id_autor bigint IDENTITY(300,1) PRIMARY KEY,
    nombre VARCHAR(100),
    pais_origen VARCHAR(100)
);

ALTER TABLE Comics
ADD id_autor bigint;
FOREIGN KEY (id_autor) REFERENCES Autores(id_autor);



INSERT INTO Autores (nombre, pais_origen) VALUES
('Alejandra Pizarnik', 'Reino Unido'),
('tomas navarro', 'España'),
('sally rooney', 'estados unidos'),
('banana yoshimoto', 'japon');


UPDATE Comics SET id_autor = 300 WHERE id_comic = 10; 
UPDATE Comics SET id_autor = 300 WHERE id_comic = 12; 
UPDATE Comics SET id_autor = 301 WHERE id_comic = 14; 
UPDATE Comics SET id_autor = 301 WHERE id_comic = 16;
UPDATE Comics SET id_autor = 302 WHERE id_comic = 18; 
UPDATE Comics SET id_autor = 302 WHERE id_comic = 20; 
UPDATE Comics SET id_autor = 303 WHERE id_comic = 22; 
UPDATE Comics SET id_autor = 303 WHERE id_comic = 24; 
UPDATE Comics SET id_autor = 303 WHERE id_comic = 26; 
UPDATE Comics SET id_autor = 303 WHERE id_comic = 28; 
UPDATE Comics SET id_autor = 300 WHERE id_comic = 30; 

SELECT
    c.titulo AS Nombre, 
    a.pais_origen AS Pais_Origen,
    a.id_autor AS nombre,
    cc.cantidad
FROM Autores a
FULL JOIN Comics c ON a.id_autor = c.id_autor
FULL JOIN Comic_Compras cc ON c.id_comic = cc.id_comic
ORDER BY a.nombre;

SELECT
    a.id_autor AS Nombre,
    c.titulo AS Nombre, 
    i.cantidad_disponible 
FROM Autores a
FULL JOIN Comics c ON a.id_autor = c.id_autor
FULL JOIN Inventario i ON c.id_comic = i.id_inventario
ORDER BY a.nombre;