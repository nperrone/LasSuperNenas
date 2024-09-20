-- Imprimir el nombre de todos los productos bajo la categoría “perfumes”
SELECT productos.nombre 
FROM productos
JOIN categorias ON productos.codigo_categoria = categorias.codigo_categoria
WHERE categorias.nombre = 'fragancias';

-- Imprimir todos los productos bajo la marca "WAVE"
SELECT nombre 
FROM productos 
WHERE marca = 'WAVE';

-- Mostrar los nombres y apellidos de las personas que compraron el artículo “Sauvage Eau de Toilette”
SELECT usuarios.nombre, usuarios.apellido
FROM usuarios
JOIN pedidos ON usuarios.numero_documento = pedidos.numero_documento
JOIN pedidos_productos ON pedidos.codigo_pedido = pedidos_productos.codigo_pedido
JOIN productos ON pedidos_productos.codigo_producto = productos.codigo_producto
WHERE productos.nombre = 'Sauvage Eau de Toilette';

-- ¿Cuántas unidades de un producto específico se han vendido en marzo de este año?

-- ¿Qué categorías de productos tienen más productos asociados?
SELECT c.nombre, COUNT(p.codigo_producto) AS total_productos
FROM categorias c
JOIN productos p ON c.codigo_categoria = p.codigo_categoria
GROUP BY c.nombre
ORDER BY total_productos DESC;

-- ¿Cuántos usuarios han realizado compras en más de una categoría?
SELECT u.numero_documento, u.nombre, u.apellido, COUNT(DISTINCT p.codigo_categoria) AS total_categorias
FROM usuarios u
JOIN pedidos pe ON u.numero_documento = pe.numero_documento
JOIN pedidos_productos pp ON pe.codigo_pedido = pp.codigo_pedido
JOIN productos p ON pp.codigo_producto = p.codigo_producto
GROUP BY u.numero_documento
HAVING COUNT(DISTINCT p.codigo_categoria) > 1;

-- ¿Qué usuarios han realizado más de 5 compras durante el último año?
SELECT u.nombre, u.apellido, COUNT(pe.codigo_pedido) AS total_compras
FROM usuarios u
JOIN pedidos pe ON u.numero_documento = pe.numero_documento
WHERE pe.fecha BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY u.numero_documento
HAVING COUNT(pe.codigo_pedido) > 5;

-- Todo el dinero que gastó un cliente en particular (ejemplo: cliente con número de documento 3240479)
SELECT SUM(pedidos_productos.cantidad * productos.precio) AS total_gastado
FROM pedidos
JOIN pedidos_productos ON pedidos.codigo_pedido = pedidos_productos.codigo_pedido
JOIN productos ON pedidos_productos.codigo_producto = productos.codigo_producto
WHERE pedidos.numero_documento = 3240479;  

-- Todo el dinero que gastó cada cliente en total
SELECT usuarios.nombre, usuarios.apellido, SUM(pedidos_productos.cantidad * productos.precio) AS total_gastado
FROM usuarios
JOIN pedidos ON usuarios.numero_documento = pedidos.numero_documento
JOIN pedidos_productos ON pedidos.codigo_pedido = pedidos_productos.codigo_pedido
JOIN productos ON pedidos_productos.codigo_producto = productos.codigo_producto
GROUP BY usuarios.numero_documento;

-- ¿Qué porcentaje de usuarios vive en la Ciudad Autónoma de Buenos Aires (CABA)?

-- ¿Cuáles son los productos más vendidos dentro de cada categoría?
SELECT categorias.nombre AS categoria, productos.nombre AS producto, SUM(pedidos_productos.cantidad) AS total_vendido
FROM categorias
JOIN productos ON categorias.codigo_categoria = productos.codigo_categoria
JOIN pedidos_productos ON productos.codigo_producto = pedidos_productos.codigo_producto
GROUP BY categorias.nombre, productos.nombre
ORDER BY categorias.nombre, total_vendido DESC;

-- ¿Cuál es el producto más comprado de la promoción X? (ejemplo: promoción con código '2')
