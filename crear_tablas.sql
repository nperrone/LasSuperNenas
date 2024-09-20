CREATE TABLE CATEGORIA (
    codigo_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE PRODUCTO (
    nombre VARCHAR(255) NOT NULL,
    marca VARCHAR(255),
    codigo_categoria INT REFERENCES CATEGORIA(codigo_categoria)
    codigo_producto SERIAL PRIMARY KEY,
    precio DECIMAL(10, 2),
    unidades INT,
);

CREATE TABLE USUARIOS (
    numero_documento BIGINT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    numero_telefono VARCHAR(20) UNIQUE
    email VARCHAR(255) NOT NULL UNIQUE,
    domicilio VARCHAR(255),
);

CREATE TABLE PEDIDOS (
    codigo_pedido SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(50),
    factura VARCHAR(100),
    numero_documento VARCHAR(20),
    FOREIGN KEY (numero_documento) REFERENCES USUARIOS(numero_documento)
);

CREATE TABLE ENTREGAS (
    codigo_entrega SERIAL PRIMARY KEY,
    modalidad VARCHAR(50),
    direccion VARCHAR(255),
    precio_envio DECIMAL(10, 2) NOT NULL,
    numero_documento VARCHAR(20)
);

CREATE TABLE PAGOS (
    codigo_pago SERIAL PRIMARY KEY,
    metodo VARCHAR(50) NOT NULL,
    factura VARCHAR(100)
);

CREATE TABLE PROMOCIONES (
    codigo_promocion SERIAL PRIMARY KEY,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    tipo VARCHAR(50),
    porcentaje_descuento DECIMAL(5, 2) NOT NULL,
    codigo_categoria INT,
    FOREIGN KEY (codigo_categoria) REFERENCES CATEGORIAS(codigo_categoria)
);

CREATE TABLE PEDIDOS_PRODUCTOS (
    codigo_pedido INT,
    codigo_producto INT,
    cantidad INT NOT NULL,
    PRIMARY KEY (codigo_pedido, codigo_producto),
    FOREIGN KEY (codigo_pedido) REFERENCES PEDIDOS(codigo_pedido),
    FOREIGN KEY (codigo_producto) REFERENCES PRODUCTOS(codigo_producto)
);

CREATE TABLE CATEGORIAS_PRODUCTOS (
    codigo_categoria INT,
    codigo_producto INT,
    PRIMARY KEY (codigo_categoria, codigo_producto),
    FOREIGN KEY (codigo_categoria) REFERENCES CATEGORIAS(codigo_categoria),
    FOREIGN KEY (codigo_producto) REFERENCES PRODUCTOS(codigo_producto)
);

CREATE TABLE WISHLIST (
    numero_documento VARCHAR(20),
    codigo_producto INT,
    PRIMARY KEY (numero_documento, codigo_producto),
    FOREIGN KEY (numero_documento) REFERENCES USUARIOS(numero_documento),
    FOREIGN KEY (codigo_producto) REFERENCES PRODUCTOS(codigo_producto)
);

CREATE TABLE PROMOCIONES_CATEGORIAS (
    codigo_promocion INT,
    codigo_categoria INT,
    PRIMARY KEY (codigo_promocion, codigo_categoria),
    FOREIGN KEY (codigo_promocion) REFERENCES PROMOCIONES(codigo_promocion),
    FOREIGN KEY (codigo_categoria) REFERENCES CATEGORIA(codigo_categoria)
);