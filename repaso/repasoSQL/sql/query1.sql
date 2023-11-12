-- 1. Obtener todos los productos de una categoría específica, en este caso "Electrónica", con su precio.

SELECT p.Nombre, p.Precio, c.NombreCategoria
FROM Productos p
JOIN Categorias c ON p.Categorias_CategoriaID = c.CategoriaID
WHERE c.NombreCategoria = 'Electrónica';
