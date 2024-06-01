SELECT c.titulo AS Comics, i.cantidad_disponible
FROM Comics c
JOIN Inventario i ON c.id_comic = i.id_comic
where i.cantidad_disponible >= 0;

SELECT 
    cl.nombre AS Nombre_Clientes,
    co.id_compra,
    c.titulo AS Nombre_Comic,
    cc.cantidad
FROM Clientes cl
JOIN compras co ON cl.id_cliente = co.id_cliente
JOIN Comic_Compras cc ON co.id_compra = cc.id_compra
JOIN Comics c ON cc.id_comic = c.id_comic
ORDER BY cl.nombre;

SELECT 
    co.id_compra,
    c.titulo AS nombre_comic,
    i.cantidad_disponible AS cantidad_disponible
FROM Comics c
LEFT JOIN Comic_Compras cc ON c.id_comic = cc.id_comic
LEFT JOIN Compras co ON cc.id_compra = co.id_compra
LEFT JOIN Clientes cl ON co.id_cliente = cl.id_cliente
LEFT JOIN Inventario i ON c.id_comic = i.id_comic
ORDER BY c.titulo;

SELECT 
    c.titulo AS nombre_comic,
    i.cantidad_disponible AS cantidad_disponible
FROM Comics c
LEFT JOIN Inventario i ON c.id_comic = i.id_comic
ORDER BY c.titulo;

SELECT 
    C.id_comic AS id_comic,
    C.titulo AS nombre,
    C.anio,
    I.id_inventario,
    I.id_comic AS id_comic_inventario,
    I.cantidad_disponible,
    I.disponibilidad,
    CC.id_CC,
    CC.cantidad,
    CC.id_compra,
    Com.id_compra AS id_comic
FROM 
    Comics c
INNER JOIN Inventario I ON C.id_comic = I.id_comic
INNER JOIN Comic_Compras cc ON C.id_comic = cc.id_comic
INNER JOIN Compras com ON cc.id_compra = Com.id_compra
ORDER BY 
C.id_comic;

SELECT 
    Cl.nombre AS Cliente,
    Com.id_compra AS Compra,
    C.titulo AS Comic,
    CC.cantidad AS Cantidad,
    I.cantidad_disponible AS En_Inventario
FROM 
    Clientes cl
INNER JOIN 
    Compras com ON Cl.id_cliente = Com.id_cliente
INNER JOIN 
    Comic_Compras CC ON Com.id_compra = CC.id_compra
INNER JOIN 
    Comics C ON CC.id_comic = C.id_comic
INNER JOIN 
    Inventario I ON C.id_comic = I.id_comic
ORDER BY 
    C.titulo, Com.id_compra;
