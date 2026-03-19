Ejercicio 1

CREATE DATABASE Base_de_datos;
GO

USE Base_de_datos;
GO

CREATE TABLE Persona (
    CI INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Nombre NVARCHAR(10) NULL,
    Apellido NVARCHAR(6) NULL,
    Telefono NUMERIC(10,0) NOT NULL
);


INSERT INTO Persona (Nombre, Apellido, Telefono)
VALUES ('Juan', 'Carlos', 23455667);

Select * from Persona;
