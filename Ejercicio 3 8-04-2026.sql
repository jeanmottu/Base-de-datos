select especie, count (*) as cantidad
from mascotas
group by especie

select * from dueño

select D.nombre, count (*) as cantidad_mascotas
from mascotas M
join dueño D on M.id_dueño = D.id_dueño
group by D.nombre
having count(*)>1;

select * from mascotas

CREATE TABLE Consultas( 
id_consulta INT Identity (1,1)Primary key,
id_mascotas INT NOT NULL,
fecha Datetime default getdate(),
motivo nvarchar(200),
costo DECIMAL (8,2) NOT NULL,
CONSTRAINT fk_mascota FOREIGN KEY (id_mascotas) REFERENCES Mascotas(id_mascotas)
);

delete from Consultas


INSERT INTO Consultas (id_mascotas, motivo, costo) VALUES 
(1,'Vacuna anual',850.00),
(2,'Control de peso',400.00),
(3,'Constracion',2200.00),
(2,'Vacunacion ovina',850.00),
(1,'Revision general',550.00),
(3,'Supervision de ganados',800.00)

select M.especie,SUM (C.costo) as CostoTotalConsultas
from Consultas C
join Mascotas M on C.id_mascotas= M.id_mascotas
group by M. especie

select M.especie,SUM (C.costo) as CostoTotalConsultas
from Consultas C, Mascotas m
where c.id_mascotas = m.id_mascotas
group by M.especie

select M.nombre,AVG(C.costo) as Promedio_Consulta
from Consultas C
JOIN Mascotas M on C.id_mascotas = M.id_mascotas
group by M.nombre

-- Costo total y promedio de consultas por mascotas
SELECT 
    M.nombre,
    SUM(c.costo) AS costo_total,
    AVG(c.costo) AS costo_promedio,
    MAX(c.costo) AS maximo,
    MIN(c.costo) AS minimo
FROM Consultas C
JOIN Mascotas m on C.id_mascotas = M.id_mascotas
GROUP BY m.nombre

-- costo mas caro y mas barato por mascota
SELECT 
    M.nombre,
    MAX(c.costo) AS costo_total,
    MIN(c.costo) AS costo_promedio
FROM consultas C
JOIN Mascotas m on C.id_mascotas = M.id_mascotas
GROUP BY m.nombre

-- Dueños con gastos total >$1000
SELECT 
    m.id_dueño,
    m.id_mascotas,
    SUM(c.costo) AS gasto_total
FROM Consultas c
JOIN Mascotas M ON c.id_mascotas = m.id_mascotas
JOIN dueño d ON m.id_dueño = d.id_dueño
GROUP BY m.id_dueño
HAVING SUM(c.costo) > 1000;