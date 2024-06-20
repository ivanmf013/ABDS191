--TSQL

--DECLARAR VARIABLES 
--declare @idcliente int 


--inicializar o asignar valor
--set @idcliente = 8

--if
--IF @idcliente = 8	
	--SELECT * FROM Clientes where id_cliente = @idcliente


--DECLARE @edad int
--set @idcliente = 8

--if @idcliente = 8 --empieza if
/*
BEGIN
set @edad = 25 -- finaliza if
    SELECT * FROM Clientes where id_cliente = @idcliente
	print @edad 

	IF EXISTS (select * from Clientes where id_cliente = 10)
	print 'si existe'
	END
ELSE
BEGIN
	print 'Error'
	print 'id no autorizado para la consulta'
	END */

--WHILE
/*
 declare @contador int = 0

 while @contador <=10
 BEGIN 
		PRINT @contador
		set @contador = @contador + 1
 END
 */
 --return
/* declare @contador int = 0

 while @contador <=10
 BEGIN 
		PRINT @contador
		set @contador = @contador + 1
		IF @contador = 3
		BREAK 
		print ('hola')
 END
 print('aqui continua el flujo')
 BEGIN TRY
 set @contador = 'ivan mf'
 END TRY
 BEGIN CATCH
	PRINT ('LA VARIABLE CONTADOR SOLO ACEPTA ENTEROS')
 END CATCH
 print('soy otra consulta')
 print('yo tambien')

 */

 --CASE 

 Declare @valor int 
 declare @resultado char(10)=''
 set @valor = 10

 set @resultado = (CASE WHEN @valor = 10 then 'ROJO'
						WHEN @valor =20 THEN 'MORADO'
						WHEN @valor = 30 THEN 'AMARILLO'
						ELSE 'AZUL'
						END)
PRINT @resultado

select * , (CASE WHEN disponibilidad = 1 then 'VERDE'
               WHEN disponibilidad = 0 then 'ROJO'
			   ELSE 'NEGRO' END) AS INDICADOR
			   FROM inventario
