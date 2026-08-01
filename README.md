# EXAMEN_FINAL_MANEJO_PREPARACION_DATOS_EDUARDO_VILLALOBOS
Examen Final — Base de Datos Universidad

Script de SQL Server para el examen final del curso de Bases de Datos (8am), que modela un sistema de gestión universitaria: carreras, estudiantes, profesores, departamentos, cursos, matrículas y pagos.

Estructura de la base de datos
Tabla	Descripción
carrera	Carreras universitarias y su facultad
estudiante	Datos personales y de contacto de los estudiantes
profesor	Datos de los profesores y su departamento
departamento	Departamentos y el edificio donde se ubican
curso	Cursos, créditos, costo y cupo
matricula	Matrículas de estudiantes en cursos, por semestre
pago	Pagos asociados a cada matrícula

Relaciones principales: estudiante → carrera, profesor → departamento, matricula → estudiante y matricula → curso, pago → matricula.

Consultas incluidas

El script agrupa las consultas por cláusula/operador para facilitar su revisión:

SELECT · WHERE · ORDER BY · DISTINCT · TOP · LIKE · BETWEEN · IN · NOT · IS NULL / IS NOT NULL · AND / OR · GROUP BY · HAVING · COUNT / SUM / AVG / MIN / MAX · INNER JOIN · LEFT JOIN · RIGHT JOIN · Subconsultas

Vistas
Vista	Propósito
vista_estudiantes_carrera	Estudiantes junto con el nombre de su carrera
vista_matriculas	Matrículas con estudiante, curso, fecha y estado
vista_pagos	Pagos completados
vista_cursos_costosos	Cursos con costo mayor a 100 000
vista_estudiantes_activos	Estudiantes con estado activo
