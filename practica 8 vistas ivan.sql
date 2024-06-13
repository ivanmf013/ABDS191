CREATE VIEW Vista_ComprasComic AS
SELECT cc.id_CC, cc.cantidad, c.titulo AS nombre_comic, co.id_compra, co.fecha_compra, co.total
FROM Compras co
JOIN Comic_Compras cc ON co.id_compra = cc.id_compra
JOIN Comics c ON cc.id_comic = c.id_comic;

SELECT * FROM Vista_ComprasComic;

CREATE VIEW Vista_ComicsComprados AS
SELECT cl.id_cliente, cl.nombre AS nombre_cliente, cc.cantidad AS cantidad_comics_comprados
FROM Comic_Compras cc
JOIN Clientes cl ON cc.id_CC = cc.id_CC

SELECT * FROM Vista_ComicsComprados;
SELECT * FROM Vista_AutoresComics;
SELECT * FROM Vista_ComprasClienteAutores