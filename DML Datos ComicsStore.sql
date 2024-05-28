INSERT INTO Clientes (nombre, correo_electronico, contraseña) VALUES
('Juan Pérez', 'juanperez@example.com', 'contraseña1'),
('María García', 'mariagarcia@example.com', 'contraseña2'),
('Luis Martínez', 'luismartinez@example.com', 'contraseña3'),
('Ana López', 'analopez@example.com', 'contraseña4'),
('Carlos Rodríguez', 'carlosrodriguez@example.com', 'contraseña5'),
('Laura Sánchez', 'laurasanchez@example.com', 'contraseña6'),
('Pablo Gómez', 'pablogomez@example.com', 'contraseña7'),
('Sofía Díaz', 'sofiadiaz@example.com', 'contraseña8'),
('Diego Fernández', 'diegofernandez@example.com', 'contraseña9'),
('Elena Ruiz', 'elenaruiz@example.com', 'contraseña10'),
('Martín Torres', 'martintorres@example.com', 'contraseña11'),
('Carmen Vázquez', 'carmenvazquez@example.com', 'contraseña12');

INSERT INTO Comics (titulo, anio, precio) VALUES
('Batman: Año Uno', 05, 15.99),
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