INSERT INTO Clientes (nombre, correo_electronico, contrase�a) VALUES
('Juan P�rez', 'juanperez@example.com', 'contrase�a1'),
('Mar�a Garc�a', 'mariagarcia@example.com', 'contrase�a2'),
('Luis Mart�nez', 'luismartinez@example.com', 'contrase�a3'),
('Ana L�pez', 'analopez@example.com', 'contrase�a4'),
('Carlos Rodr�guez', 'carlosrodriguez@example.com', 'contrase�a5'),
('Laura S�nchez', 'laurasanchez@example.com', 'contrase�a6'),
('Pablo G�mez', 'pablogomez@example.com', 'contrase�a7'),
('Sof�a D�az', 'sofiadiaz@example.com', 'contrase�a8'),
('Diego Fern�ndez', 'diegofernandez@example.com', 'contrase�a9'),
('Elena Ruiz', 'elenaruiz@example.com', 'contrase�a10'),
('Mart�n Torres', 'martintorres@example.com', 'contrase�a11'),
('Carmen V�zquez', 'carmenvazquez@example.com', 'contrase�a12');

INSERT INTO Comics (titulo, anio, precio) VALUES
('Batman: A�o Uno', 05, 15.99),
('Watchmen', 86, 12.50),
('Saga', 12, 10.99),
('Sandman', 89, 14.75),
('Maus', 86, 18.25),
('The Walking Dead', 03, 11.30),
('Spider-Man: Blue', 02, 9.99),
('V for Vendetta', 88, 12.75),
('Y: The Last Man', 02, 16.50),
('The Dark Knight Returns', 86, 8.99),
('Bone', 91, 13.25),
('Fables', 02, 7.50),
('Scott Pilgrim', 04, 12.99),
('Preacher', 95, 10.25),
('Transmetropolitan', 97, 9.99);

INSERT INTO Inventario (id_comic, cantidad_disponible, disponibilidad) VALUES
(10, 5, 1),
(12, 0, 0),
(14, 8, 1),
(16, 0, 0),
(18, 15, 1),
(20, 3, 1),
(22, 10, 1),
(24, 0, 0),
(26, 7, 1),
(28, 0, 0),
(30, 20, 1),
(32, 2, 1),
(34, 0, 0),
(36, 12, 1),
(38, 6, 1);

INSERT INTO Compras (id_cliente, fecha_compra, total) VALUES
(1, '2024-05-25', 35.98),
(3, '2024-05-25', 12.50),
(5, '2024-05-26', 29.99),
(7, '2024-05-26', 45.97),
(9, '2024-05-27', 18.50),
(11, '2024-05-27', 33.25),
(12, '2024-05-28', 20.99),
(1, '2024-05-29', 47.97), 
(5, '2024-05-29', 14.75),
(9, '2024-05-28', 31.98);