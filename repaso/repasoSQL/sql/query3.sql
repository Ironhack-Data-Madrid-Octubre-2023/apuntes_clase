-- 3. Encontrar los productos más vendidos por cliente.

SELECT c.Nombre, p.Nombre AS Producto, MAX(pe.Cantidad) AS MaxCantidad
FROM Clientes c
JOIN Pedidos pe 
ON c.ClienteID = pe.Clientes_ClienteID
JOIN pedidos_has_productos php
ON pe.PedidoID = php.Pedidos_PedidoID
JOIN Productos p 
ON php.Productos_ProductoID = p.ProductoID
GROUP BY c.Nombre, p.Nombre
ORDER BY MaxCantidad 
DESC;
