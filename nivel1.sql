-- =========================================================================
-- TALLER PRÁCTICO: CONSULTAS SQL (NIVEL 1 Y NIVEL 2 - NUMERADAS DEL 1 AL 13)
-- =========================================================================

-- Limpieza de tablas anteriores si existen para evitar conflictos
DROP TABLE IF EXISTS Empleado;
DROP TABLE IF EXISTS Departamento;

-- 1. Creación de la tabla Departamento
CREATE TABLE Departamento (
    DeptID INT NOT NULL PRIMARY KEY,
    NombreDepto VARCHAR(60) NOT NULL,
    ubicacion VARCHAR(100) NOT NULL
);

-- 2. Creación de la tabla Empleado
CREATE TABLE Empleado(
    EmpID INT NOT NULL,
    Nombre VARCHAR(60) NOT NULL,
    Apellido VARCHAR(60) NOT NULL,
    Edad TINYINT UNSIGNED NOT NULL,
    Salario DECIMAL(12,2) NOT NULL,
    DeptID INT NOT NULL,
    CONSTRAINT PK_Empleado PRIMARY KEY(EmpID),
    CONSTRAINT FK_Empleado_Departamento FOREIGN KEY (DeptID)
        REFERENCES Departamento (DeptID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT CK_Empleado_Edad CHECK (Edad BETWEEN 18 AND 120),
    CONSTRAINT CK_Empleado_Salario CHECK (Salario >= 0)
);

-- Inserción de datos en Departamento
INSERT INTO Departamento (DeptID, NombreDepto, ubicacion) VALUES
(1, 'Recursos Humanos', 'Piso 2 - Edificio Principal'),
(2, 'Tecnologia', 'Piso 3 - Edificio Principal'),
(3, 'Finanzas', 'Piso 2 - Edificio Principal'),
(4, 'Mercadeo', 'Piso 1 - Edificio Principal'),
(5, 'Ventas', 'Sede Comercial'),
(6, 'Operaciones', 'Centro Logistico');

-- Inserción de datos en Empleado
INSERT INTO Empleado (EmpID, Nombre, Apellido, Edad, Salario, DeptID) VALUES
(101, 'Laura',    'Gomez',     29, 3200000.00, 1),
(102, 'Carlos',   'Ramirez',   35, 4500000.00, 2),
(103, 'Andres',   'Martinez',  27, 3800000.00, 2),
(104, 'Diana',    'Torres',    41, 5200000.00, 3),
(105, 'Sofia',    'Herrera',   31, 4100000.00, 4),
(106, 'Miguel',   'Castro',    38, 3600000.00, 5),
(107, 'Valentina','Rojas',     26, 3000000.00, 1),
(108, 'Jorge',    'Moreno',    45, 6100000.00, 2),
(109, 'Camila',   'Diaz',      33, 4700000.00, 3),
(110, 'Felipe',   'Ortiz',     24, 2800000.00, 4),
(111, 'Natalia',  'Vargas',    37, 3900000.00, 5),
(112, 'Daniel',   'Silva',     30, 3400000.00, 6),
(113, 'Paula',    'Mendoza',   28, 3300000.00, 1),
(114, 'Ricardo',  'Acosta',    50, 7200000.00, 3),
(115, 'Mariana',  'Pineda',    32, 4400000.00, 4),
(116, 'Sebastian','Navarro',   22, 2500000.00, 6),
(117, 'Gabriela', 'Leon',      39, 5300000.00, 2),
(118, 'Esteban',  'Cortes',    34, 4200000.00, 5),
(119, 'Isabella', 'Reyes',     25, 3100000.00, 6),
(120, 'Oscar',    'Fuentes',   43, 4900000.00, 5);


-- =========================================================================
-- CONSULTAS DEL 1 AL 13 (NIVEL 1 Y NIVEL 2)
-- =========================================================================

-- 1. Consultar todos los registros de la tabla Departamento[cite: 8].
SELECT * FROM Departamento;

-- 2. Consultar todos los empleados registrados en la empresa[cite: 8].
SELECT * FROM Empleado;

-- 3. Mostrar únicamente el nombre, apellido y salario de los empleados[cite: 8].
SELECT Nombre, Apellido, Salario FROM Empleado;

-- 4. Consultar los empleados que tengan una edad superior a 30 años[cite: 8].
SELECT * FROM Empleado WHERE Edad > 30;

-- 5. Consultar los empleados cuyo salario sea superior a $4.000.000[cite: 8]. 
SELECT * FROM Empleado WHERE Salario > 4000000;  

-- 6. Mostrar los empleados cuyo nombre sea 'Laura'[cite: 8]. 
SELECT * FROM Empleado WHERE Nombre = 'Laura';  

-- 7. Consultar los departamentos ubicados en el edificio principal[cite: 8]. 
SELECT * FROM Departamento WHERE ubicacion LIKE '%Edificio Principal%';  

-- 8. Mostrar todos los empleados ordenados alfabéticamente por apellido. 
SELECT * FROM Empleado ORDER BY Apellido ASC;  

-- 9. Consultar los empleados ordenados de mayor a menor salario. 
SELECT * FROM Empleado ORDER BY Salario DESC;  

-- 10. Mostrar los empleados que tengan entre 25 y 40 años. 
SELECT * FROM Empleado WHERE Edad BETWEEN 25 AND 40;  

-- 11. Consultar los empleados cuyo salario esté entre $3.000.000 y $5.000.000.
SELECT * FROM Empleado WHERE Salario BETWEEN 3000000 AND 5000000;

-- 12. Mostrar los empleados cuyo apellido comience por la letra 'M'.
SELECT * FROM Empleado WHERE Apellido LIKE 'M%';

-- 13. Consultar los empleados que pertenezcan a los departamentos con DeptID 2, 3 o 5.
SELECT * FROM Empleado WHERE DeptID IN (2, 3, 5);
