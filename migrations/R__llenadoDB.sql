USE [esencialVerde]
GO

-- Productos 
INSERT INTO [dbo].[productos]
           ([descripcion]
           ,[createdAt]
           ,[computer]
           ,[username])
VALUES
	('ladrillosPlastico', GETDATE(), 'computer4', 'usario4'), 
	('bolsasPlastica', GETDATE(), 'computer5', 'usario5'), 
	('filamento3D', GETDATE(), 'computer6', 'usario6'), 

	('ladrillosCarton', GETDATE(), 'computer4', 'usario4'), 
	('papelPeriodico', GETDATE(), 'computer4', 'usario4'), 
	('carritoCarton', GETDATE(), 'computer4', 'usario4'), 
		   
	('lingote', GETDATE(), 'computer4', 'usario4'), 
	('lamina', GETDATE(), 'computer4', 'usario4'), 
	('martillo', GETDATE(), 'computer4', 'usario4'), 

	('silla', GETDATE(), 'computer4', 'usario4'), 
	('mesa', GETDATE(), 'computer4', 'usario4'), 
	('cuadro', GETDATE(), 'computer4', 'usario4'), 

	('canicas', GETDATE(), 'computer4', 'usario4'), 
	('adorno', GETDATE(), 'computer4', 'usario4'), 
	('botellas', GETDATE(), 'computer4', 'usario4'), 

	('cajas', GETDATE(), 'computer4', 'usario4'), 
	('ladrillo', GETDATE(), 'computer4', 'usario4'), 
	('cromos', GETDATE(), 'computer4', 'usario4');
GO

-- Precio Produ
INSERT INTO [dbo].[preciosProdu]
           ([productoID]
           ,[startDate]
           ,[precioProduccion]
           ,[precioVenta]
           ,[createdAt]
           ,[computer]
           ,[username]
           ,[enable])
     VALUES
		(1, GETDATE(), 32.44, 73.43, GETDATE(), 'computer1', 'username1', 1),
		(2, GETDATE(), 45.67, 89.12, GETDATE(), 'computer2', 'username2', 1),
		(3, GETDATE(), 12.34, 56.78, GETDATE(), 'computer3', 'username3', 1),
		(4, GETDATE(), 98.76, 113.21, GETDATE(), 'computer4', 'username4', 1),
		(5, GETDATE(), 21.43, 87.65, GETDATE(), 'computer5', 'username5', 1),
		(6, GETDATE(), 34.56, 78.90, GETDATE(), 'computer6', 'username6', 1),
		(7, GETDATE(), 67.89, 119.12, GETDATE(), 'computer7', 'username7', 1),
		(8, GETDATE(), 98.12, 114.56, GETDATE(), 'computer8', 'username8', 1),
		(9, GETDATE(), 43.21, 117.89, GETDATE(), 'computer9', 'username9', 1),
		(10, GETDATE(), 56.78, 90.12, GETDATE(), 'computer10', 'username10', 1),
		(11, GETDATE(), 09.87, 21.34, GETDATE(), 'computer11', 'username11', 1),
		(12, GETDATE(), 78.90, 345.67, GETDATE(), 'computer12', 'username12', 1),
		(13, GETDATE(), 32.44, 113.43, GETDATE(), 'computer13', 'username13', 1),
		(14, GETDATE(), 45.67, 89.12, GETDATE(), 'computer14', 'username14', 1),
		(15, GETDATE(), 12.34, 56.78, GETDATE(), 'computer15', 'username15', 1),
		(16, GETDATE(), 98.76, 113.21, GETDATE(), 'computer16', 'username16', 1),
		(17, GETDATE(), 21.43, 117.65, GETDATE(), 'computer17', 'username17', 1),
		(18, GETDATE(), 34.56, 78.90, GETDATE(), 'computer18', 'username18', 1);
GO

 -- CLASES DE DESECHOS --
INSERT INTO [dbo].[clasesDesecho] ([recyclable], [description])
VALUES (1, 'plastico V1'),
	(1, 'papeles y cartones'),
	(1, 'aluminio'),
	(1, 'madera'),
	(1, 'vidrios'),
	(1, 'tetrapack'),
	(0, 'organicos'),
	(0, 'electrónicos'),
	(0, 'aceites'),
	(0, 'aguas');
GO

-- Clase X Produ
INSERT INTO [dbo].[claseDxProdu]
           ([productoID]
           ,[claseDesechoID]
           ,[cantidad])
     VALUES
		   (1, 1, 4),
		   (2, 1, 2),
		   (3, 1, 5),
		   (4, 2, 1),
		   (5, 2, 2),
		   (6, 2, 1),
		   (7, 3, 3),
		   (8, 3, 6),
		   (9, 3, 5),
		   (10, 4, 6),
		   (11, 4, 8),
		   (12, 4, 11),
		   (13, 5, 4),
		   (14, 5, 4),
		   (15, 5, 3),
		   (16, 6, 4),
		   (17, 6, 4),
		   (18, 6, 3);
GO

-- DESECHOS --
INSERT INTO [dbo].[desechos] ([description],[claseDesechoID])
VALUES 
	('botellas plasticas', 1), 
	('empaques plasticos', 1), 
	('cajas de carton', 2), 
    ('hojas de papel', 2), 
	('cajas de aluminio', 3),
	('piezas de aluminio', 3),
	('trozos de madera', 4),
	('botellas de vidrio', 5),
	('ventanas rotas', 5),
	('cajas tetrapack', 6), 
	('comida', 7),
	('cadaveres', 7),
	('chips electronicos', 8),
	('electrodomesticos', 8),
	('gasolina', 9),
	('aguas aceitosas', 10),
	('aguas jabonosas', 10);
GO

-- Procesos
INSERT INTO [dbo].[procesos]
           ([desechoID]
           ,[description]
           ,[enable])
     VALUES
		   (1, 'Desintoxicacion de Bacterias', 1),
		   (1, 'Fundir', 1),
		   (2, 'Fundir', 1),

		   (3, 'Suavizar', 1),
		   (3, 'Compactar en Molde', 1), 
		   (4, 'Suavizar', 1),
		   (4, 'Compactar en Molde', 1), 

		   (5, 'Desintoxicacion de Bacterias', 1),
		   (5, 'Fundicion', 1), 
		   (6, 'Desintoxicacion de Bacterias', 1),
		   (6, 'Fundicion', 1), 

		   (7, 'Eliminar partes dañadas', 1),
		   (7, 'Lijar la madera', 1), 

		   (8, 'Derretir vidrio', 1), 
		   (9, 'Derretir vidrio', 1), 

		   (10, 'Limpieza profunda', 1),
		   (10, 'Compactar el material', 1), 

           (11, 'Quemar', 1),
		   (12, 'Quemar', 1), 

		   (13, 'Desensamblar', 1),
		   (13, 'Fundir', 1),

		   (14, 'Desensamblar', 1),
		   (14, 'Fundir', 1),

		   (15, 'Purificar', 1),
		   (15, 'CombinarQuimicos', 1),

		   (16, 'CombinarQuimicos', 1),
		   (16, 'Purificar', 1),

		   (17, 'CombinarQuimicos', 1),
		   (17, 'Purificar', 1)
GO

-- Precios Procesos 26
INSERT INTO [dbo].[preciosProce]
           ([startDate]
           ,[precio]
           ,[enable]
           ,[procesoID]
           ,[createdAt]
           ,[computer]
           ,[username])
     VALUES

		    (GETDATE(), 1244.34, 1, 1, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 1345.56, 1, 2, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 1456.78, 1, 3, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 1567.89, 1, 4, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 1678.90, 1, 5, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 1789.01, 1, 6, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 1890.12, 1, 7, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 1901.23, 1, 8, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 2012.34, 1, 9, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 2123.45, 1, 10, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 2234.56, 1, 11, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 2345.67, 1, 12, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 2456.78, 1, 13, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 2567.89, 1, 14, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 2678.90, 1, 15, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 2789.01, 1, 16, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 2890.12, 1, 17, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 2901.23, 1, 18, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 1951.23, 1, 19, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 2022.34, 1, 20, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 2173.45, 1, 21, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 2234.56, 1, 22, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 2385.67, 1, 23, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 2486.78, 1, 24, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 2587.89, 1, 25, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 2688.90, 1, 26, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 2739.01, 1, 27, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 2850.12, 1, 28, GETDATE(), 'computer1', 'username'),
			(GETDATE(), 2981.23, 1, 29, GETDATE(), 'computer1', 'username')
GO

-- Marcas
INSERT INTO [dbo].[marcas]
           ([name])
     VALUES
           ('Tota'),
           ('Nissantini'),
           ('Hondo'),
           ('Cartoret'),
           ('Fordable'),
           ('RMATastic'),
           ('Volvio'),
           ('Basuraki'),
           ('Trash-Benz'),
           ('BSW');
GO

-- Modelos
INSERT INTO [dbo].[modelos]
           ([name]
           ,[brandID]
           ,[year])
     VALUES
           ('priusanto', 1, 2020),
           ('trakea', 2, 2019),
           ('fondo', 3, 2018),
           ('cartaro', 4, 2021),
           ('FordUnfocused', 5, 2017),
           ('RAM420', 6, 2022),
           ('volvioc04', 7, 2016),
           ('Ninja', 8, 2015),
           ('c-wagon', 9, 2014),
           ('DogeChallenged', 10, 2013),
		   ('corona', 1, 2020),
           ('sentro', 2, 2019),
           ('civico', 3, 2018),
           ('corvetton', 4, 2021),
           ('FordUnfocused', 5, 2017),
           ('F302', 6, 2022),
           ('SuperSlow', 7, 2016),
           ('soulness', 8, 2015),
           ('Mayfront', 9, 2014),
           ('X18', 10, 2013)
GO

-- ContainerType
INSERT INTO [dbo].[containerTypes]
           ([modeloID]
           ,[weight]
           ,[capacity]
           ,[claseDesechoID]
           ,[description])
VALUES
           (1, 5, 50, 1, 'Contenedor Mediano'),
		   (2, 5, 50, 2, 'Contenedor Mediano'),
		   (3, 5, 50, 3, 'Contenedor Mediano'),
		   (4, 5, 50, 4, 'Contenedor Mediano'),
		   (5, 5, 50, 5, 'Contenedor Mediano'),
		   (6, 5, 50, 6, 'Contenedor Mediano'),
		   (7, 5, 50, 7, 'Contenedor Mediano'),
		   (8, 5, 50, 8, 'Contenedor Mediano'),
		   (9, 5, 50, 9, 'Contenedor Mediano'),
		   (10, 5, 50, 10, 'Contenedor Grande'),
		   (11, 10, 150, 1, 'Contenedor Grande'),
		   (12, 10, 150 , 2, 'Contenedor Grande'),
		   (13, 10, 150, 3, 'Contenedor Grande'),
		   (14, 10, 150, 4, 'Contenedor Grande'),
		   (15, 10, 150, 5, 'Contenedor Grande'),
		   (16, 10, 150, 6, 'Contenedor Grande'),
		   (17, 10, 150, 7, 'Contenedor Grande'),
		   (18, 10, 150, 8, 'Contenedor Grande'),
		   (19, 10, 150, 9, 'Contenedor Grande'),
		   (20, 10, 150, 10, 'Contenedor Grande');
GO

-- PAISES -- 
INSERT INTO [dbo].[paises] ([nombre])
VALUES ('Estados Unidos'),
	('Canadá');
GO

-- ESTADOS -- 
INSERT INTO [dbo].[estados] ([nombre],[paisID])
VALUES ('California', 1), ('New York', 1),
('Ontario', 2), ('Quebec', 2);
GO

-- CIUDADES -- 
INSERT INTO [dbo].[ciudades] ([nombre], [estadoID])
VALUES ('Los Angeles', 1), ('San Francisco', 1),
	('New York City', 2), ('Buffalo', 2),
	('Toronto', 3), ('Ottawa', 3),
	('Montreal', 4), ('Quebec City', 4);
GO

-- ADDRESSES -- 
INSERT INTO [dbo].[addresses] ([ciudadID] ,[zipcode], [location])
VALUES
	(1, '90001', geography::Point(33.9738, -118.2485, 4326)),
    (1, '90002', geography::Point(33.9492, -118.2468, 4326)),
    (1, '90003', geography::Point(33.9642, -118.2728, 4326)),
    (1, '90004', geography::Point(34.0762, -118.3109, 4326)),
    (1, '90005', geography::Point(34.0597, -118.3089, 4326)),
    (1, '90006', geography::Point(34.0492, -118.2912, 4326)),
    (1, '90007', geography::Point(34.0286, -118.2844, 4326)),
    (2, '94102', geography::Point(37.7793, -122.4193, 4326)),
    (2, '94103', geography::Point(37.7723, -122.4146, 4326)),
    (2, '94104', geography::Point(37.7915, -122.4027, 4326)),
    (2, '94105', geography::Point(37.7895, -122.3948, 4326)),
    (2, '94107', geography::Point(37.7603, -122.4108, 4326)),
    (2, '94108', geography::Point(37.7922, -122.4070, 4326)),
    (2, '94109', geography::Point(37.7989, -122.4194, 4326)),
	(3, '10001', geography::Point(40.7506, -73.9978, 4326)),
    (3, '10002', geography::Point(40.7157, -73.9865, 4326)),
    (3, '10003', geography::Point(40.7318, -73.9891, 4326)),
    (3, '10004', geography::Point(40.7037, -74.0113, 4326)),
    (3, '10005', geography::Point(40.7060, -74.0088, 4326)),
    (3, '10006', geography::Point(40.7093, -74.0125, 4326)),
    (3, '10007', geography::Point(40.7131, -74.0076, 4326)),
    (4, '14201', geography::Point(42.9026, -78.8784, 4326)),
    (4, '14202', geography::Point(42.8866, -78.8770, 4326)),
    (4, '14203', geography::Point(42.8696, -78.8670, 4326)),
    (4, '14204', geography::Point(42.8916, -78.8648, 4326)),
    (4, '14206', geography::Point(42.8709, -78.8228, 4326)),
    (4, '14207', geography::Point(42.9485, -78.8995, 4326)),
    (4, '14208', geography::Point(42.9278, -78.8629, 4326)); 


-- Contact Type
INSERT INTO [dbo].[contactTypes]
           ([name])
     VALUES
           ('telefono'),
		   ('correo'),
		   ('fax'),
		   ('postal'),
		   ('linkedin'),
		   ('instagram'),
		   ('facebook'),
           ('discord');
GO

-- Monedas
INSERT INTO [dbo].[monedas]
           ([descripcion]
           ,[simbolo]
           ,[acronimo]
           ,[createdAt]
           ,[computer]
           ,[username]
           ,[enable])
     VALUES
    ('Dólar estadounidense', '$', 'USD', GETDATE(), 'computer1', 'username1', 1),
    ('Euro', '€', 'EUR', GETDATE(), 'computer2', 'username2', 1),
    ('Yen japonés', '¥', 'JPY', GETDATE(), 'computer3', 'username3', 1),
    ('Libra esterlina', '£', 'GBP', GETDATE(), 'computer4', 'username4', 1),
    ('Dólar canadiense', 'C$', 'CAD', GETDATE(), 'computer5', 'username5', 1),
	('Colon Costaricence', '₡', 'CRC', GETDATE(), 'computer5', 'username5', 1);
GO

-- Tipo de Cambio
INSERT INTO [dbo].[tiposCambio]
    ([monedaID], [cambio], [startdate], [createdAt], [computer], [username], [enable])
VALUES
    (1, 4.5678, '2023-04-22', GETDATE(), 'computer1', 'username1', 1),
    (2, 3.2456, '2023-04-22', GETDATE(), 'computer1', 'username1', 1),
    (3, 5.6789, '2023-04-22', GETDATE(), 'computer1', 'username1', 1),
    (4, 2.1234, '2023-04-22', GETDATE(), 'computer1', 'username1', 1),
    (5, 6.7890, '2023-04-22', GETDATE(), 'computer1', 'username1', 1),
	(6, 530.7890, '2023-04-22', GETDATE(), 'computer1', 'username1', 1)
GO

-- EMPRESAS
INSERT INTO [dbo].[empresas]
    ([description]
    ,[type]
    ,[paisID])
VALUES 
	('Esencial Verde', 1, 1),
	('CoopeCartago', 1, 1),
	('Verde Hoja', 1, 1),
	('Bulbasaur', 1, 1),

	('Kentuky Fried Steaks', 0, 1),
	('Bares Marco', 0, 1),
	('Maderos', 0, 1),
	('CoperoINC', 0, 1),
	('HardMetal', 0, 1)
GO


-- PLANTAS
INSERT INTO [dbo].[plantas]
    ([addressID]
    ,[description])
VALUES
    (1, 'Planta Recolectora Paleta LA'),
	(8, 'Planta Recolectora Lavanda SF'),
	(15, 'Planta Recolectora Carmin NY'),
	(22, 'Planta Recolectora Azulona BF');
GO

-- INDUSTRIAS
INSERT INTO [dbo].[industriaTypes]
    ([description])
VALUES
    ('Comida'),
	('Industrial');
GO

-- PRODUCTORES
INSERT INTO [dbo].[sedesProdu]
    ([empresaID]
	,[description]
    ,[addressID]
    ,[industriaTypeID])
		   
VALUES
    (5, 'KFS LA', 2, 1),
	(6, 'BM LA', 3, 1),
	(8, 'Copero LA', 4, 1),
	(7, 'Maderos LA', 5, 2),

	(5, 'KFS SF', 8, 1),
	(8, 'Copero SF', 9, 1),
	(9, 'HardMetal SF', 10, 2),
	(7, 'Maderos SF', 11, 2),

	(5, 'KFS NY', 16, 1), 
	(9, 'BM NY', 17, 1),
	(8, 'HardMetal NY', 18, 2),
	(7, 'Maderos NY', 19, 2),

	(5, 'KFS BF', 23, 1),
	(8, 'Copero BF', 24, 1),
	(9, 'HardMetal BF', 25, 2),
	(7, 'Maderos BF', 26, 2);
GO


INSERT INTO [dbo].[sedesReco]
    ([empresaID]
    ,[description]
    ,[addressID])
VALUES
    (1, 'EV LA', 6),
	(2, 'CoopeCartago LA', 7),

	(2, 'CoopeCartago SF', 14),
	(3, 'Verde Hoja SF', 13),

	(3, 'Verde Hoja NY', 20),
	(4, 'Bulbasaur NY', 21),

	(4, 'Bulbasaur BF', 27),
	(1, 'EV BF', 28);
GO

-- ContainerType
INSERT INTO [dbo].[containerTypes]
    ([modeloID]
    ,[weight]
    ,[capacity]
    ,[claseDesechoID]
    ,[description])
VALUES
    (1, 5, 50, 1, 'Contenedor Mediano'),
	(2, 5, 50, 2, 'Contenedor Mediano'),
	(3, 5, 50, 3, 'Contenedor Mediano'),
	(4, 5, 50, 4, 'Contenedor Mediano'),
	(5, 5, 50, 5, 'Contenedor Mediano'),
	(6, 5, 50, 6, 'Contenedor Mediano'),
	(7, 5, 50, 7, 'Contenedor Mediano'),
	(8, 5, 50, 8, 'Contenedor Mediano'),
	(9, 5, 50, 9, 'Contenedor Mediano'),
	(10, 5, 50, 10, 'Contenedor Grande'),
	(11, 10, 150, 1, 'Contenedor Grande'),
	(12, 10, 150, 2, 'Contenedor Grande'),
	(13, 10, 150, 3, 'Contenedor Grande'),
	(14, 10, 150, 4, 'Contenedor Grande'),
	(15, 10, 150, 5, 'Contenedor Grande'),
	(16, 10, 150, 6, 'Contenedor Grande'),
	(17, 10, 150, 7, 'Contenedor Grande'),
	(18, 10, 150, 8, 'Contenedor Grande'),
	(19, 10, 150, 9, 'Contenedor Grande'),
	(20, 10, 150, 10, 'Contenedor Grande');
GO

INSERT INTO [dbo].[objectTypes]
           ([name])
     VALUES
           ('sedesProdu'),
		   ('sedesReco')
GO

INSERT INTO [dbo].[actores]
    ([referenceID]
    ,[objectTypeID]
    ,[cuenta])
VALUES
    (1, 1, '5839027164' ), 
    (2, 1, '5739027164'), 
    (3, 1,'2710458639' ), 
    (4, 1, '7469108235'), 
    (5, 1, '3598201746' ), 
    (6, 1, '6401593278'), 
    (7, 1,  '8274510369'), 
    (8, 1,  '4936185270'), 
    (9, 1,  '2160973854'), 
    (10,1, '7084612395' ), 
    (11,1, '142735173'  ), 
    (12,1, '19381838182' ),
    (13,1, '7084612395' ),
    (14,1, '9187325240'),
    (15,1, '7084612395' ),
    (16,1, '9187365240'),
    (1, 2, '5839027164' ), 
    (2, 2, '5839027164'), 
    (3, 2,'2710458639' ), 
    (4, 2, '7469108235'), 
    (5, 2, '3598201746' ), 
    (6, 2, '6401593278'), 
    (7, 2,  '8274510369'), 
    (8, 2,  '4936185270') 
GO


INSERT INTO [dbo].[actores]
    ([freeName]
    ,[cuenta])

VALUES

('municipalidad', '5839027164' ),
('ICE', '5839227164' ),
('AYA', '583902164' ),
('Sindicato', '5839037164' ),
('JPS', '5839057164' )

GO


INSERT INTO [dbo].[transactionTypes]
           ([name])
     VALUES
           ('pago'),
           ('venta')
GO

-- Contratos
INSERT INTO [dbo].[contratos]
           ([startDate],[recoType],[sedeProduID],[sedeRecoID],[reqGroupID],[comisionID],[createdAt],[computer],[username],[precio],[empresaID])
     VALUES
           (GETDATE(),1,2,1,NEWID(),NEWID(),GETDATE(),'computer','username',0,6),
           (GETDATE(),1,3,2,NEWID(),NEWID(),GETDATE(),'computer','username',0,8),
           (GETDATE(),1,4,2,NEWID(),NEWID(),GETDATE(),'computer','username',0,7)
GO

--Se le agrega manual a las comisiones 
INSERT INTO [dbo].[comisiones]
           ([comisionID]
           ,[porcentaje]
           ,[actorID])
     VALUES
           ('FC638A28-C76B-48DB-84E6-0C3633529195',0.20,1),
           ('FC638A28-C76B-48DB-84E6-0C3633529195',0.30,18),
           ('FC638A28-C76B-48DB-84E6-0C3633529195',0.10,25), 
           ('FC638A28-C76B-48DB-84E6-0C3633529195',0.40,30),

           ('2CC335C0-CDAD-4C1C-9BEC-558FFBC7C0E3',0.25,2),
           ('2CC335C0-CDAD-4C1C-9BEC-558FFBC7C0E3',0.25,17),
           ('2CC335C0-CDAD-4C1C-9BEC-558FFBC7C0E3',0.5,26), 
           ('2CC335C0-CDAD-4C1C-9BEC-558FFBC7C0E3',0.45,30),

           ('2F898EB4-C2AD-4FD5-AA3B-A9AFE0056E4C',0.20,3),
           ('2F898EB4-C2AD-4FD5-AA3B-A9AFE0056E4C',0.30,18),
           ('2F898EB4-C2AD-4FD5-AA3B-A9AFE0056E4C',0.10,27), 
           ('2F898EB4-C2AD-4FD5-AA3B-A9AFE0056E4C',0.40,30),

           ('DDD5B72E-3135-43C7-8E07-F047A49E1654',0.25,4),
           ('DDD5B72E-3135-43C7-8E07-F047A49E1654',0.25,17),
           ('DDD5B72E-3135-43C7-8E07-F047A49E1654',0.5,28), 
           ('DDD5B72E-3135-43C7-8E07-F047A49E1654',0.45,30)

GO

CREATE TYPE transactionData 
   AS TABLE
      (actorID INT, 
      monto MONEY,
      posttime DATETIME,
      monedaID INT);
GO