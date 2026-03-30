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

Ejercicio 2 25-03-2026

TABLA DE VETERINARIA
create database Veterinaria
go

USE Veterinaria

create table dueño(
id_dueño int identity (1,1) primary key,
nombre NVARCHAR(80) NOT NULL,
email NVARCHAR (150)
);

go

create table Mascotas(
id_mascotas int identity (1,1) Primary Key,
nombre Nvarchar (80) not null,
especie nvarchar (50) NOT NULL,
nacimiento date,
id_dueño int NOT NULL,
CONSTRAINT fk_dueño FOREIGN KEY([id_dueño]) REFERENCES dueño(id_dueño)
);
go

Insert into dueño (nombre,email) VALUES ('Ana Garcia', 'ana@gmail.com'),
('Luis Perez', 'luis@gmail.com'), ('Diego' , 'diego@gmail.com')

Insert into Mascotas (nombre, especie, nacimiento,id_dueño) VALUES
('Rex' , 'Perro', '2020-03-15',1),
('Mia', 'Gato','2021-07-01',1),
('Mejia','therian', '2021-02-01',2);

select * from dueño;

select * from Mascotas;

Select * from Mascotas
where especie ='Perro'

Select M.nombre as mascotas , M.especie , D.nombre as dueño 
from Mascotas m
join dueño d on M.id_dueño = D.id_dueño;

select m.nombre as Mascota m.especie , D.nombre as dueño
from Mascotas m, dueño d
where m.id_dueño = d.id_dueño

select top 1 * from Mascotas

select nombre, ISNULL(email, 'sin email') as email 
from dueño

select nombre, 
datediff (DAY, nacimiento , getdate()) as dias
from mascotas
