-- 4. Encontrar el cliente que más gastó.

SELECT c.Nombre, SUM(pe.Cantidad * p.Precio) AS total_gastado
FROM Clientes c
LEFT JOIN Pedidos pe
ON c.ClienteID = pe.Clientes_ClienteID
LEFT JOIN Pedidos_has_Productos php 
ON pe.PedidoID = php.Pedidos_PedidoID
LEFT JOIN Productos p
ON php.Productos_ProductoID = p.ProductoID
GROUP BY pe.Clientes_ClienteID, c.Nombre
ORDER BY total_gastado
DESC;