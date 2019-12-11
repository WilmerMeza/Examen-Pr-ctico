-- 1.1.4 Consultas multitabla (Composición interna)
-- Meza Yalle

--  Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT 
PRODUCTO.NOMBRE AS PRODUCTO, 
PRODUCTO.PRECIO, 
FABRICANTE.NOMBRE AS FABRICANTE  
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO;

-- 2 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. 
-- Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT 
PRODUCTO.NOMBRE AS PRODUCTO, 
PRODUCTO.PRECIO, 
FABRICANTE.NOMBRE AS FABRICANTE
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
ORDER BY FABRICANTE.NOMBRE ASC;

--  Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, 
-- de todos los productos de la base de datos.
SELECT
PRODUCTO.CODIGO AS CODPROD,
PRODUCTO.NOMBRE AS NOMPROD,
FABRICANTE.CODIGO AS CODFAB,
FABRICANTE.NOMBRE AS NOMFAB
FROM PRODUCTO
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO;

--  Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT 
PRODUCTO.NOMBRE AS PRODUCTO, 
PRODUCTO.PRECIO, 
FABRICANTE.NOMBRE AS FABRICANTE
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
ORDER BY PRODUCTO.PRECIO ASC LIMIT 1;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT 
PRODUCTO.NOMBRE AS PRODUCTO, 
PRODUCTO.PRECIO, 
FABRICANTE.NOMBRE AS FABRICANTE
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
ORDER BY PRODUCTO.PRECIO DESC LIMIT 1;

--  Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT 
PRODUCTO.NOMBRE AS PRODUCTO,
FABRICANTE.NOMBRE AS FABRICANTE
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE  = "Lenovo";

--  Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT 
PRODUCTO.NOMBRE AS PRODUCTO,
PRODUCTO.PRECIO AS PRECIO,
FABRICANTE.NOMBRE AS FABRICANTE
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE = "Crucial" AND PRODUCTO.PRECIO > 200 ;

--  Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy, Seagate. Sin utilizar el operador IN.
SELECT 
PRODUCTO.NOMBRE AS PRODUCTO,
PRODUCTO.PRECIO AS PRECIO,
FABRICANTE.NOMBRE AS FABRICANTE
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE LIKE "Asus" OR FABRICANTE.NOMBRE LIKE "Hewlett-Packard" OR FABRICANTE.NOMBRE LIKE "Seagate";

--  Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT 
PRODUCTO.NOMBRE AS PRODUCTO,
PRODUCTO.PRECIO AS PRECIO,
FABRICANTE.NOMBRE AS FABRICANTE
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE IN ("Asus","Hewlett-Packard","Seagate");

--  Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
SELECT 
PRODUCTO.NOMBRE AS PRODUCTO,
PRODUCTO.PRECIO AS PRECIO,
FABRICANTE.NOMBRE AS FABRICANTE
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE LIKE "%e";

--  Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT 
PRODUCTO.NOMBRE AS PRODUCTO,
PRODUCTO.PRECIO AS PRECIO,
FABRICANTE.NOMBRE AS FABRICANTE
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE FABRICANTE.NOMBRE LIKE "%w%";

-- Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el 
-- resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT 
PRODUCTO.NOMBRE AS PRODUCTO,
PRODUCTO.PRECIO AS PRECIO,
FABRICANTE.NOMBRE AS FABRICANTE
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO
WHERE PRODUCTO.PRECIO >= 180
ORDER BY PRODUCTO.PRECIO DESC, PRODUCTO.NOMBRE ASC;

--  Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT 
DISTINCT(FABRICANTE.CODIGO),
FABRICANTE.NOMBRE AS FABRICANTE
FROM PRODUCTO 
INNER JOIN 
FABRICANTE ON PRODUCTO.CODIGO_FABRICANTE = FABRICANTE.CODIGO;


--  Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. 
-- El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
SELECT 
FABRICANTE.NOMBRE,
COUNT(PRODUCTO.NOMBRE) AS TOTAL
FROM FABRICANTE
LEFT JOIN PRODUCTO
ON FABRICANTE.CODIGO = PRODUCTO.CODIGO_FABRICANTE
GROUP BY FABRICANTE.CODIGO DESC;


