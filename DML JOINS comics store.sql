INSERT INTO Comic_Compras (id_compra, id_comic, cantidad)
VALUES
    (100, 10, 1),  
    (103, 12, 2),  
    (106, 14, 1),   
    (109, 16, 9),  
    (112, 18, 2),  
    (115, 20, 1),   
    (118, 22, 2),   
    (121, 24, 3),   
    (124, 26, 3),   
    (127, 28, 1);


--JOIN--
SELECT c.id_compra, cl.nombre AS CLIENTE, c.fecha_compra, c.total
FROM compras c
JOIN Clientes cl ON c.id_cliente = c.id_cliente

--LEFT--
SELECT c.id_compra, cl.nombre AS CLIENTE, c.fecha_compra, c.total
FROM compras c
LEFT JOIN Clientes cl ON c.id_cliente = c.id_cliente

--RIGHT--
SELECT c.id_compra, cl.nombre AS CLIENTE, c.fecha_compra, c.total
FROM compras c
RIGHT JOIN Clientes cl ON c.id_cliente = c.id_cliente

--FULL JOIN--
SELECT *
FROM Clientes cl
FULL JOIN compras  c
ON c.id_cliente = c.id_cliente