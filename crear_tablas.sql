CREATE TABLE CATEGORIAS (
    codigo_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE PRODUCTOS (
    nombre VARCHAR(255) NOT NULL,
    marca VARCHAR(255) NOT NULL,
    codigo_categoria INT REFERENCES CATEGORIAS(codigo_categoria),
    codigo_producto SERIAL PRIMARY KEY,
    precio DECIMAL(10, 2) NOT NULL,
    unidades INT NOT NULL
);

CREATE TABLE USUARIOS (
    numero_documento INT PRIMARY KEY, 
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    numero_telefono VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE PAGOS (
    codigo_pago SERIAL PRIMARY KEY,
    metodo VARCHAR(50) NOT NULL,
    factura VARCHAR(100) NOT NULL UNIQUE 
);

CREATE TABLE PEDIDOS (
    codigo_pedido SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    factura VARCHAR(100),
    numero_documento INT,
    FOREIGN KEY (numero_documento) REFERENCES USUARIOS(numero_documento),
    FOREIGN KEY (factura) REFERENCES PAGOS(factura)
);

CREATE TABLE ENTREGAS (
    codigo_entrega SERIAL PRIMARY KEY,
    modalidad VARCHAR(50) NOT NULL,
    precio_envio DECIMAL(10, 2) NOT NULL,
    codigo_pedido INT,
    calle VARCHAR(255) NOT NULL,
    ciudad VARCHAR(255),
    provincia VARCHAR(255) NOT NULL,
    FOREIGN KEY (codigo_pedido) REFERENCES PEDIDOS(codigo_pedido)
);

CREATE TABLE PROMOCIONES (
    codigo_promocion SERIAL PRIMARY KEY,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    porcentaje_descuento INT NOT NULL,
    codigo_categoria INT,
    FOREIGN KEY (codigo_categoria) REFERENCES CATEGORIAS(codigo_categoria)
);

CREATE TABLE PEDIDOS_PRODUCTOS (
    codigo_producto INT, 
    codigo_pedido INT,
    cantidad INT NOT NULL,
    PRIMARY KEY (codigo_pedido, codigo_producto),
    FOREIGN KEY (codigo_pedido) REFERENCES PEDIDOS(codigo_pedido),
    FOREIGN KEY (codigo_producto) REFERENCES PRODUCTOS(codigo_producto)
);

CREATE TABLE WISHLISTS (
    numero_documento INT,
    codigo_producto INT,
    PRIMARY KEY (numero_documento, codigo_producto),
    FOREIGN KEY (numero_documento) REFERENCES USUARIOS(numero_documento),
    FOREIGN KEY (codigo_producto) REFERENCES PRODUCTOS(codigo_producto)
);
