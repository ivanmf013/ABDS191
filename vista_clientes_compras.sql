CREATE VIEW vista_clientes_compras AS
SELECT C.id_cliente, C.nombre AS CLIENTE, C.correo_electronico, Cm.id_compra, Cm.fecha_compra, Cm.total
FROM Clientes C
LEFT JOIN Compras Cm
ON c.id_cliente = Cm.id_cliente

SELECT * FROM vista_clientes_compras;

SELECT * FROM vista_comicsInventario;

SELECT * FROM vista_ccci;