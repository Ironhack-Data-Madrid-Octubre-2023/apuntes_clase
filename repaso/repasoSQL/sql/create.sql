CREATE DATABASE repasosql;
USE repasosql;

-- Crear la tabla "Categorías"
CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY,
    NombreCategoria VARCHAR(255)
);

-- Crear la tabla "Productos"
CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Precio DECIMAL(10, 2),
    CategoriaID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);

-- Crear la tabla "Clientes"
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Email VARCHAR(255)
);

-- Crear la tabla "Pedidos"
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,
    ClienteID INT,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Crear la tabla "DetallesPedido" para la relación Many-to-Many entre "Productos" y "Pedidos"
CREATE TABLE DetallesPedido (
    DetalleID INT PRIMARY KEY,
    PedidoID INT,
    ProductoID INT,
    Cantidad INT,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);
