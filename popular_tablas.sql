COPY CATEGORIAS FROM 'C:/Program Files/PostgreSQL/17/data/CSV/categorias.csv' 
	DELIMITER ',' 
	CSV HEADER;

COPY PRODUCTOS FROM 'C:/Program Files/PostgreSQL/17/data/CSV/productos.csv' 
	DELIMITER ',' 
	CSV HEADER; 

COPY USUARIOS FROM 'C:/Program Files/PostgreSQL/17/data/CSV/usuarios.csv' 
	DELIMITER ',' 
	CSV HEADER; 

COPY PEDIDOS FROM 'C:/Program Files/PostgreSQL/17/data/CSV/pedidos.csv' 
	DELIMITER ',' 
	CSV HEADER; 

COPY ENTREGAS FROM 'C:/Program Files/PostgreSQL/17/data/CSV/entregas.csv' 
	DELIMITER ',' 
	CSV HEADER; 

COPY PAGOS FROM 'C:/Program Files/PostgreSQL/17/data/CSV/pagos.csv' 
	DELIMITER ',' 
	CSV HEADER; 

COPY PROMOCIONES FROM 'C:/Program Files/PostgreSQL/17/data/CSV/promociones.csv' 
	DELIMITER ',' 
	CSV HEADER; 

COPY PEDIDOS_PRODUCTOS FROM 'C:/Program Files/PostgreSQL/17/data/CSV/pedidos-productos.csv' 
	DELIMITER ',' 
	CSV HEADER; 

COPY CATEGORIAS_PRODUCTOS FROM 'C:/Program Files/PostgreSQL/17/data/CSV/categorias-productos.csv' 
	DELIMITER ',' 
	CSV HEADER; 

COPY WISHLIST FROM 'C:/Program Files/PostgreSQL/17/data/CSV/usuarios-productos.csv' 
	DELIMITER ',' 
	CSV HEADER; 

COPY PROMOCIONES_CATEGORIAS FROM 'C:/Program Files/PostgreSQL/17/data/CSV/promociones-categorias.csv' 
	DELIMITER ',' 
	CSV HEADER; 