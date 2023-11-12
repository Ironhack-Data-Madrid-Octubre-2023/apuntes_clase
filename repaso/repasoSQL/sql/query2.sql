-- 2. Calcular el total de ventas de cada producto por categoría.

SELECT c.NombreCategoria, p.Nombre, SUM(pe.Cantidad) AS TotalVentas
FROM Categorias c
JOIN Productos p 
ON c.CategoriaID = p.Categorias_CategoriaID
JOIN pedidos_has_productos php 
ON p.ProductoID = php.Productos_ProductoID
JOIN pedidos pe
ON php.Pedidos_PedidoID=pe.PedidoID
GROUP BY c.NombreCategoria, p.Nombre;

