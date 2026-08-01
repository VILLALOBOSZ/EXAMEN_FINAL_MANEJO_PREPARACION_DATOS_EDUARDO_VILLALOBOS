# EXAMEN_FINAL_MANEJO_PREPARACION_DATOS_EDUARDO_VILLALOBOS
Examen Final — Base de Datos Universidad

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
