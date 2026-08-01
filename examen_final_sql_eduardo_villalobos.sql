-- LOS INSERTS ESTÁN AL FINAL DEL SCRIPT, PROFE.

create database universidad;

use universidad;

-- Here I create the table named "carrera".
create table carrera
(
    id_carrera smallint primary key, -- I use smallint because there won't be many careers.
    nombre varchar(60) not null, -- The career name cannot be empty.
    facultad varchar(60) not null -- Every career belongs to a faculty.
);

-- Here I create the table named "estudiante".
create table estudiante
(
    id_estudiante int primary key, -- I use int because there can be many students.
    nombre varchar(40) not null, -- Student's first name.
    apellido varchar(40) not null, -- Student's last name.
    fecha_nacimiento date, -- Stores the student's birth date.
    correo varchar(80), -- Student's email address.
    telefono varchar(20), -- Student's phone number.
    activo bit, -- I use bit because it only stores two values: 1 (active) or 0 (inactive).
    id_carrera smallint -- Stores the student's career ID.
);

-- Here I create the table named "profesor".
create table profesor
(
    id_profesor smallint primary key, -- I use smallint because the number of professors is relatively small.
    nombre varchar(40) not null, -- Professor's first name.
    apellido varchar(40) not null, -- Professor's last name.
    especialidad varchar(50), -- Professor's specialty.
    telefono varchar(15), -- Professor's phone number.
    id_departamento tinyint -- Stores the department ID.
);

-- Here I create the table named "departamento".
create table departamento
(
    id_departamento tinyint primary key, -- Tinyint is enough because there are only a few departments.
    nombre varchar(50) not null, -- Department name.
    edificio varchar(30) -- Building where the department is located.
);

-- Here I create the table named "curso".
create table curso
(
    id_curso smallint primary key, -- Smallint is enough for the number of courses.
    nombre varchar(60) not null, -- Course name.
    creditos tinyint, -- Number of credits for the course.
    costo decimal(8,2), -- Stores the course cost with decimals.
    cupo smallint -- Maximum number of students allowed.
);

-- Here I create the table named "matricula".
create table matricula
(
    id_matricula int primary key, -- I use int because there can be many enrollments.
    fecha date, -- Stores the enrollment date.
    semestre tinyint, -- Semester number.
    anio smallint, -- Academic year.
    estado varchar(20), -- Enrollment status.
    id_estudiante int, -- Student ID.
    id_curso smallint -- Course ID.
);

-- Here I create the table named "pago".
create table pago
(
    id_pago int primary key, -- I use int because there can be many payments.
    fecha_pago date, -- Stores the payment date.
    monto decimal(10,2), -- Stores the payment amount with decimal values.
    metodo_pago varchar(30), -- Payment method (Cash, Card, SINPE, etc.).
    pagado bit, -- Indicates whether the payment was completed (1) or not (0).
    id_matricula int -- Enrollment associated with the payment.
);








--consultas


--questions with commands to show
--select

-- Mostrar todos los estudiantes registrados
-- Display all registered students
select * from estudiante;

-- Mostrar todos los cursos disponibles
-- Display all available courses
select * from curso;

-------------------------------------------------
--where

-- Mostrar los estudiantes que se encuentran activos
-- Display active students
select * from estudiante
where activo = 1;

-- Mostrar los cursos cuyo costo es mayor a 100000
-- Display courses with a cost greater than 100000
select * from curso
where costo > 100000;


-------------------------------------------------------
--order by

-- Mostrar los estudiantes ordenados por apellido.
-- Display students ordered by last name.
select * from estudiante
order by apellido; --order the list by the apellido letter

-- Mostrar los cursos ordenados de mayor a menor costo.
-- Display courses ordered from highest to lowest cost.
select * from curso
order by costo desc;--order the data by min to max


-------------------------------------------------------
--distinct

-- Mostrar las diferentes facultades registradas.
-- Display different registered faculties.
select distinct facultad
from carrera;

-- Mostrar los diferentes métodos de pago.
-- Display different payment methods.
select distinct metodo_pago --show the group of diferent kind of answers 
from pago;


---------------------------------------------------------
--top

-- Mostrar los primeros cinco estudiantes.
-- Display the first five students.
select top 5 * 
from estudiante;

-- Mostrar los diez cursos más caros.
-- Display the ten most expensive courses.
select top 10 * --display the 10 most value of the table
from curso
order by costo desc;


-----------------------------------------------------------
--like
-- Mostrar los estudiantes cuyo nombre inicia con A.
-- Display students whose name starts with A.
select *
from estudiante
where nombre like 'A%';

-- Mostrar los profesores cuyo apellido termina en z.
-- Display teachers whose last name ends with z.
select *
from profesor
where apellido like '%z';

------------------------------------------------------------
--bewtween

-- Mostrar los cursos cuyo costo está entre 80000 y 100000.
-- Display courses whose cost is between 80000 and 100000.
select *
from curso
where costo between 80000 and 100000;

-- Mostrar los estudiantes con ID entre 10 y 30.
-- Display students whose ID is between 10 and 30.
select *
from estudiante
where id_estudiante between 10 and 30;


-----------------------------------------------------------------
--in

-- Mostrar las carreras con ID 1, 3 y 5.
-- Display careers with IDs 1, 3 and 5.
select *
from carrera
where id_carrera in (1,3,5);

-- Mostrar los pagos realizados con tarjeta o SINPE.
-- Display payments made by card or SINPE.
select *
from pago
where metodo_pago in ('Tarjeta','SINPE');


--------------------------------------------------------------------
--not

-- Mostrar los estudiantes que no están inactivos.
-- Display students who are not inactive.
select *
from estudiante
where not activo = 0;

-- Mostrar los cursos que no tienen un cupo de 20 estudiantes.
-- Display courses that do not have a capacity of 20 students.
select *
from curso
where not cupo = 20;


----------------------------------------------------------------------------
--is null

-- Mostrar estudiantes sin correo electrónico.
-- Display students without an email address.
select *
from estudiante
where correo is null;

-- Mostrar profesores sin número telefónico.
-- Display teachers without a phone number.
select *
from profesor
where telefono is null;


----------------------------------------------------------------------------------
--is not null

-- Mostrar estudiantes con correo registrado.
-- Display students with a registered email.
select *
from estudiante
where correo is not null;

-- Mostrar profesores con teléfono registrado.
-- Display teachers with a registered phone number.
select *
from profesor
where telefono is not null;


------------------------------------------------------------------------------------
--and

-- Mostrar cursos con costo mayor a 90000 y cupo mayor o igual a 25.
-- Display courses costing more than 90000 and having a capacity of at least 25.
select *
from curso
where costo > 90000
and cupo >= 25;

-- Mostrar estudiantes activos de la carrera 1.
-- Display active students from career 1.
select *
from estudiante
where activo = 1
and id_carrera = 1;


-----------------------------------------------------------------------------------
--or

-- =====================================
-- OR
-- =====================================

-- Mostrar carreras de Ingeniería o Salud.
-- Display careers from Engineering or Health.
select *
from carrera
where facultad = 'Ingenieria'
or facultad = 'Salud';

-- Mostrar pagos realizados con tarjeta o SINPE.
-- Display payments made by card or SINPE.
select *
from pago
where metodo_pago = 'Tarjeta'
or metodo_pago = 'SINPE';


-----------------------------------------------------------------------------------------
--group by

-- Mostrar la cantidad de pagos por método de pago.
-- Display the number of payments by payment method.
select metodo_pago,
count(*) as cantidad
from pago
group by metodo_pago;

-- Mostrar la cantidad de estudiantes por carrera.
-- Display the number of students in each career.
select id_carrera,
count(*) as cantidad
from estudiante
group by id_carrera;

------------------------------------------------------------------------------------------
--having

-- Mostrar los métodos de pago que tengan más de 10 registros.
-- Display payment methods with more than 10 records.
select metodo_pago,
count(*) as cantidad
from pago
group by metodo_pago
having count(*) > 10;

-- Mostrar las carreras que tengan más de 5 estudiantes.
-- Display careers with more than 5 students.
select id_carrera,
count(*) as cantidad
from estudiante
group by id_carrera
having count(*) > 5;

-----------------------------------------------------------------------------------------------
--count

-- Contar el total de estudiantes registrados.
-- Count the total number of registered students.
select count(*) as total_estudiantes
from estudiante;

-- Contar el total de cursos registrados.
-- Count the total number of registered courses.
select count(*) as total_cursos
from curso;


---------------------------------------------------------------------------------------------------
--sum

-- Mostrar la suma total del costo de todos los cursos.
-- Display the total cost of all courses.
select sum(costo) as costo_total
from curso;

-- Mostrar el monto total de todos los pagos.
-- Display the total amount of all payments.
select sum(monto) as monto_total
from pago;


--------------------------------------------------------------------------------------------------------
--avg

-- Mostrar el costo promedio de los cursos.
-- Display the average course cost.
select avg(costo) as promedio_costo
from curso;

-- Mostrar el promedio de los pagos realizados.
-- Display the average payment amount.
select avg(monto) as promedio_pago
from pago;


----------------------------------------------------------------------------------------------------------------
--min

-- Mostrar el curso con el costo más bajo.
-- Display the course with the lowest cost.
select min(costo) as costo_minimo
from curso;

-- Mostrar el pago de menor monto.
-- Display the lowest payment amount.
select min(monto) as pago_minimo
from pago;

-------------------------------------------------------------------------------------------------------------------
--max

-- Mostrar el curso con el costo más alto.
-- Display the course with the highest cost.
select max(costo) as costo_maximo
from curso;

-- Mostrar el pago de mayor monto.
-- Display the highest payment amount.
select max(monto) as pago_maximo
from pago;


-------------------------------------------------------------------------------------------------------------------------
--inner join

-- Mostrar el nombre del estudiante y la carrera a la que pertenece.
-- Display the student's name and the career they belong to.
select
e.nombre,
e.apellido,
c.nombre as carrera
from estudiante e
inner join carrera c
on e.id_carrera = c.id_carrera;

-- Mostrar el estudiante y el curso matriculado.
-- Display the student and the enrolled course.
select
e.nombre,
c.nombre as curso
from matricula m
inner join estudiante e
on m.id_estudiante = e.id_estudiante
inner join curso c
on m.id_curso = c.id_curso;


----------------------------------------------------------------------------------------
--inner join

-- Mostrar todas las carreras y sus estudiantes.
-- Display all careers and their students.
select
c.nombre,
e.nombre
from carrera c
left join estudiante e
on c.id_carrera = e.id_carrera;

-- Mostrar todos los estudiantes y sus matrículas.
-- Display all students and their enrollments.
select
e.nombre,
m.id_matricula
from estudiante e
left join matricula m
on e.id_estudiante = m.id_estudiante;

-------------------------------------------------------------------------------
--left join

-- Mostrar todas las carreras y sus estudiantes.
-- Display all careers and their students.
select
c.nombre,
e.nombre
from carrera c
left join estudiante e
on c.id_carrera = e.id_carrera;

-- Mostrar todos los estudiantes y sus matrículas.
-- Display all students and their enrollments.
select
e.nombre,
m.id_matricula
from estudiante e
left join matricula m
on e.id_estudiante = m.id_estudiante;


------------------------------------------------------------------------------------
--right join

-- Mostrar todas las matrículas con su estudiante.
-- Display all enrollments with their student.
select
e.nombre,
m.id_matricula
from estudiante e
right join matricula m
on e.id_estudiante = m.id_estudiante;

-- Mostrar todos los estudiantes junto con su carrera.
-- Display all students together with their career.
select
c.nombre,
e.nombre
from carrera c
right join estudiante e
on c.id_carrera = e.id_carrera;


--------------------------------------------------------------------------------------------
--subconsulta
-- Mostrar los estudiantes que pertenecen a la carrera de Ingeniería Informática

-- Display students who belong to the Computer Engineering career
select *
from estudiante
where id_carrera = (
    select id_carrera
    from carrera
    where nombre = 'Ingenieria Informatica'
);

-- Mostrar los cursos cuyo costo es mayor al costo promedio
-- Display courses whose cost is greater than the average cost
select *
from curso
where costo > (
    select avg(costo)
    from curso
);

----------------------------------------------------------------------------------------------------------
--views


--view 1
-- Mostrar la información de los estudiantes junto con su carrera.
-- Display student information along with their career.
create view vista_estudiantes_carrera
as
select
e.id_estudiante,
e.nombre,
e.apellido,
c.nombre as carrera
from estudiante e
inner join carrera c
on e.id_carrera = c.id_carrera;
select * from vista_estudiantes_carrera
--view 2 
-- Mostrar las matrículas realizadas por los estudiantes.
-- Display student enrollments.
create view vista_matriculas
as
select
m.id_matricula,
e.nombre,
c.nombre as curso,
m.fecha,
m.estado
from matricula m
inner join estudiante e
on m.id_estudiante = e.id_estudiante
inner join curso c
on m.id_curso = c.id_curso;
select * from vista_matriculas


--view 3
-- Mostrar todos los pagos realizados.
-- Display all completed payments.
create view vista_pagos
as
select
id_pago,
fecha_pago,
monto,
metodo_pago
from pago
where pagado = 1;
select * from vista_pagos


--view 4
-- Mostrar los cursos con costo mayor a 100000.
-- Display courses with a cost greater than 100000.
create view vista_cursos_costosos
as
select
id_curso,
nombre,
costo
from curso
where costo > 100000;

select * from vista_cursos_costosos
--view 5
-- Mostrar los estudiantes activos.
-- Display all active students.
create view vista_estudiantes_activos
as
select
id_estudiante,
nombre,
apellido,
correo
from estudiante
where activo = 1;

select * from vista_estudiantes_activos

--INSERTS
--carrera
insert into carrera values (1,'Ingenieria Informatica','Ingenieria');
insert into carrera values (2,'Administracion','Ciencias Economicas');
insert into carrera values (3,'Contabilidad','Ciencias Economicas');
insert into carrera values (4,'Derecho','Ciencias Sociales');
insert into carrera values (5,'Psicologia','Ciencias Sociales');
insert into carrera values (6,'Arquitectura','Ingenieria');
insert into carrera values (7,'Medicina','Salud');
insert into carrera values (8,'Enfermeria','Salud');
insert into carrera values (9,'Turismo','Humanidades');
insert into carrera values (10,'Educacion','Humanidades');

--departamento
insert into departamento values (1,'Computacion','Edificio A');
insert into departamento values (2,'Administracion','Edificio B');
insert into departamento values (3,'Contabilidad','Edificio B');
insert into departamento values (4,'Derecho','Edificio C');
insert into departamento values (5,'Psicologia','Edificio C');
insert into departamento values (6,'Arquitectura','Edificio D');
insert into departamento values (7,'Medicina','Edificio E');
insert into departamento values (8,'Enfermeria','Edificio E');
insert into departamento values (9,'Turismo','Edificio F');
insert into departamento values (10,'Educacion','Edificio G');

--profesor
insert into profesor values (1,'Carlos','Mora','Bases de Datos','88880001',1);
insert into profesor values (2,'Andrea','Rojas','Programacion','88880002',1);
insert into profesor values (3,'Luis','Campos','Redes','88880003',1);
insert into profesor values (4,'Ana','Solis','Administracion','88880004',2);
insert into profesor values (5,'Mario','Vargas','Finanzas','88880005',2);
insert into profesor values (6,'Laura','Jimenez','Contabilidad','88880006',3);
insert into profesor values (7,'Pedro','Chaves','Auditoria','88880007',3);
insert into profesor values (8,'Jose','Ramirez','Derecho Penal','88880008',4);
insert into profesor values (9,'Sofia','Castro','Derecho Civil','88880009',4);
insert into profesor values (10,'Elena','Mendez','Psicologia Clinica','88880010',5);
insert into profesor values (11,'Marco','Lopez','Psicologia Infantil','88880011',5);
insert into profesor values (12,'David','Ruiz','Diseño','88880012',6);
insert into profesor values (13,'Paula','Alfaro','Construccion','88880013',6);
insert into profesor values (14,'Jorge','Cordero','Anatomia','88880014',7);
insert into profesor values (15,'Natalia','Salas','Cirugia','88880015',7);
insert into profesor values (16,'Kevin','Vega','Enfermeria General','88880016',8);
insert into profesor values (17,'Melissa','Herrera','Pediatria','88880017',8);
insert into profesor values (18,'Oscar','Aguilar','Turismo Rural','88880018',9);
insert into profesor values (19,'Rocio','Murillo','Hoteleria','88880019',9);
insert into profesor values (20,'Daniel','Arce','Didactica','88880020',10);
insert into profesor values (21,'Tatiana','Quesada','Matematica','88880021',10);
insert into profesor values (22,'Diego','Fonseca','Seguridad Informatica','88880022',1);
insert into profesor values (23,'Gabriela','Montero','IA','88880023',1);
insert into profesor values (24,'Julio','Valverde','Marketing','88880024',2);
insert into profesor values (25,'Viviana','Porras','Costos','88880025',3);
insert into profesor values (26,'Mauricio','Soto','Constitucional','88880026',4);
insert into profesor values (27,'Silvia','Arias','Psicologia Social','88880027',5);
insert into profesor values (28,'Fernando','Navarro','Urbanismo','88880028',6);
insert into profesor values (29,'Cristina','Villalobos','Farmacologia','88880029',7);
insert into profesor values (30,'Adrian','Rojas','Emergencias','88880030',8);


--curso
insert into curso values (1,'Introduccion a la Programacion',4,85000,30);
insert into curso values (2,'Programacion I',4,90000,30);
insert into curso values (3,'Programacion II',4,95000,30);
insert into curso values (4,'Bases de Datos',4,98000,25);
insert into curso values (5,'Redes I',3,85000,30);
insert into curso values (6,'Redes II',3,90000,30);
insert into curso values (7,'Seguridad Informatica',4,110000,25);
insert into curso values (8,'Inteligencia Artificial',4,120000,20);
insert into curso values (9,'Administracion I',3,80000,35);
insert into curso values (10,'Administracion II',3,85000,35);
insert into curso values (1,'Introduccion a la Programacion',4,85000,30);
insert into curso values (2,'Programacion I',4,90000,30);
insert into curso values (3,'Programacion II',4,95000,30);
insert into curso values (4,'Bases de Datos',4,98000,25);
insert into curso values (5,'Redes I',3,85000,30);
insert into curso values (6,'Redes II',3,90000,30);
insert into curso values (7,'Seguridad Informatica',4,110000,25);
insert into curso values (8,'Inteligencia Artificial',4,120000,20);
insert into curso values (9,'Administracion I',3,80000,35);
insert into curso values (10,'Administracion II',3,85000,35);
insert into curso values (11,'Contabilidad I',3,80000,35);
insert into curso values (12,'Contabilidad II',3,85000,35);
insert into curso values (13,'Auditoria',3,90000,30);
insert into curso values (14,'Finanzas',4,95000,30);
insert into curso values (15,'Derecho Penal',4,90000,30);
insert into curso values (16,'Derecho Civil',4,90000,30);
insert into curso values (17,'Derecho Constitucional',4,95000,25);
insert into curso values (18,'Psicologia General',3,85000,35);
insert into curso values (19,'Psicologia Infantil',3,85000,30);
insert into curso values (20,'Psicologia Social',3,90000,30);
insert into curso values (21,'Diseño Arquitectonico',4,120000,20);
insert into curso values (22,'Construccion',4,125000,20);
insert into curso values (23,'Urbanismo',4,130000,20);
insert into curso values (24,'Anatomia',5,150000,25);
insert into curso values (25,'Cirugia',5,170000,15);
insert into curso values (26,'Farmacologia',4,145000,20);
insert into curso values (27,'Enfermeria General',4,120000,30);
insert into curso values (28,'Pediatria',4,135000,20);
insert into curso values (29,'Turismo Rural',3,80000,35);
insert into curso values (30,'Hoteleria',3,85000,35);
insert into curso values (31,'Didactica',3,80000,40);
insert into curso values (32,'Matematica General',4,85000,40);
insert into curso values (33,'Calculo I',4,90000,35);
insert into curso values (34,'Calculo II',4,95000,35);
insert into curso values (35,'Fisica I',4,90000,30);
insert into curso values (36,'Fisica II',4,95000,30);
insert into curso values (37,'Quimica General',4,90000,30);
insert into curso values (38,'Estadistica',3,85000,35);
insert into curso values (39,'Investigacion',3,90000,30);
insert into curso values (40,'Etica Profesional',2,70000,40);
insert into curso values (41,'Ingles I',2,65000,40);
insert into curso values (42,'Ingles II',2,70000,40);
insert into curso values (43,'Ofimatica',2,60000,35);
insert into curso values (44,'Emprendimiento',3,85000,35);
insert into curso values (45,'Gestion de Proyectos',4,98000,30);
insert into curso values (46,'Analisis de Sistemas',4,100000,30);
insert into curso values (47,'Programacion Web',4,105000,25);
insert into curso values (48,'Desarrollo Movil',4,110000,25);
insert into curso values (49,'Cloud Computing',4,120000,20);
insert into curso values (50,'Big Data',4,125000,20);


--estudiantes
insert into estudiante values (1,'Juan','Perez','2002-05-14','juan.perez@correo.com','88880001',1,1);
insert into estudiante values (2,'Maria','Gonzalez','2001-08-20','maria.gonzalez@correo.com','88880002',1,2);
insert into estudiante values (3,'Carlos','Rodriguez','2003-02-10','carlos.rodriguez@correo.com','88880003',1,3);
insert into estudiante values (4,'Ana','Lopez','2002-11-18','ana.lopez@correo.com','88880004',1,4);
insert into estudiante values (5,'Luis','Jimenez','2001-04-05','luis.jimenez@correo.com','88880005',1,5);
insert into estudiante values (6,'Sofia','Ramirez','2003-09-15','sofia.ramirez@correo.com','88880006',1,6);
insert into estudiante values (7,'Diego','Vargas','2002-07-01','diego.vargas@correo.com','88880007',1,7);
insert into estudiante values (8,'Laura','Castro','2001-03-30','laura.castro@correo.com','88880008',1,8);
insert into estudiante values (9,'Pedro','Mora','2002-12-22','pedro.mora@correo.com','88880009',1,9);
insert into estudiante values (10,'Daniela','Rojas','2003-01-11','daniela.rojas@correo.com','88880010',1,10);
insert into estudiante values (11,'Jose','Salas','2002-06-17','jose.salas@correo.com','88880011',1,1);
insert into estudiante values (12,'Valeria','Herrera','2001-10-08','valeria.herrera@correo.com','88880012',1,2);
insert into estudiante values (13,'Kevin','Murillo','2003-04-25','kevin.murillo@correo.com','88880013',1,3);
insert into estudiante values (14,'Paula','Arias','2002-09-09','paula.arias@correo.com','88880014',1,4);
insert into estudiante values (15,'Fernando','Navarro','2001-12-19','fernando.navarro@correo.com','88880015',1,5);
insert into estudiante values (16,'Melissa','Campos','2002-02-27','melissa.campos@correo.com','88880016',1,6);
insert into estudiante values (17,'Oscar','Cordero','2003-05-06','oscar.cordero@correo.com','88880017',1,7);
insert into estudiante values (18,'Gabriela','Alfaro','2002-08-16','gabriela.alfaro@correo.com','88880018',1,8);
insert into estudiante values (19,'Javier','Quesada','2001-07-28','javier.quesada@correo.com','88880019',1,9);
insert into estudiante values (20,'Natalia','Montero','2003-11-03','natalia.montero@correo.com','88880020',1,10);
insert into estudiante values (21,'Andres','Vega','2002-01-15','andres.vega@correo.com','88880021',1,1);
insert into estudiante values (22,'Camila','Soto','2001-06-09','camila.soto@correo.com','88880022',1,2);
insert into estudiante values (23,'Ricardo','Valverde','2003-03-13','ricardo.valverde@correo.com','88880023',1,3);
insert into estudiante values (24,'Silvia','Porras','2002-10-01','silvia.porras@correo.com','88880024',1,4);
insert into estudiante values (25,'Mauricio','Aguilar','2001-11-25','mauricio.aguilar@correo.com','88880025',1,5);
insert into estudiante values (26,'Viviana','Mendez','2002-04-04','viviana.mendez@correo.com','88880026',1,6);
insert into estudiante values (27,'Jorge','Fonseca','2003-07-17','jorge.fonseca@correo.com','88880027',1,7);
insert into estudiante values (28,'Tatiana','Ruiz','2002-05-23','tatiana.ruiz@correo.com','88880028',1,8);
insert into estudiante values (29,'Cristian','Chaves','2001-08-30','cristian.chaves@correo.com','88880029',1,9);
insert into estudiante values (30,'Rocio','Villalobos','2003-09-21','rocio.villalobos@correo.com','88880030',1,10);
insert into estudiante values (31,'Samuel','Arce','2002-03-12','samuel.arce@correo.com','88880031',1,1);
insert into estudiante values (32,'Andrea','Solis','2001-05-08','andrea.solis@correo.com','88880032',1,2);
insert into estudiante values (33,'Brayan','Cruz','2003-12-02','brayan.cruz@correo.com','88880033',1,3);
insert into estudiante values (34,'Monica','Jimenez','2002-07-19','monica.jimenez@correo.com','88880034',1,4);
insert into estudiante values (35,'Pablo','Mendoza','2001-09-27','pablo.mendoza@correo.com','88880035',1,5);
insert into estudiante values (36,'Karla','Esquivel','2002-02-06','karla.esquivel@correo.com','88880036',1,6);
insert into estudiante values (37,'Ivan','Rojas','2003-04-18','ivan.rojas@correo.com','88880037',1,7);
insert into estudiante values (38,'Diana','Leon','2002-06-24','diana.leon@correo.com','88880038',1,8);
insert into estudiante values (39,'Esteban','Vargas','2001-10-15','esteban.vargas@correo.com','88880039',1,9);
insert into estudiante values (40,'Paola','Campos','2003-01-20','paola.campos@correo.com','88880040',1,10);
insert into estudiante values (41,'Alberto','Perez','2002-11-14','alberto.perez@correo.com','88880041',1,1);
insert into estudiante values (42,'Natalie','Gomez','2001-08-02','natalie.gomez@correo.com','88880042',1,2);
insert into estudiante values (43,'Cesar','Rojas','2003-06-26','cesar.rojas@correo.com','88880043',1,3);
insert into estudiante values (44,'Lucia','Castillo','2002-05-31','lucia.castillo@correo.com','88880044',1,4);
insert into estudiante values (45,'Gerardo','Herrera','2001-04-12','gerardo.herrera@correo.com','88880045',1,5);
insert into estudiante values (46,'Karen','Lopez','2002-09-03','karen.lopez@correo.com','88880046',1,6);
insert into estudiante values (47,'Erick','Mora','2003-03-22','erick.mora@correo.com','88880047',1,7);
insert into estudiante values (48,'Daniel','Navarro','2002-12-10','daniel.navarro@correo.com','88880048',1,8);
insert into estudiante values (49,'Jessica','Salazar','2001-01-29','jessica.salazar@correo.com','88880049',1,9);
insert into estudiante values (50,'Miguel','Cordero','2003-08-18','miguel.cordero@correo.com','88880050',1,10);


--matricula
insert into matricula values (1,'2026-01-15',1,2026,'Activa',1,1);
insert into matricula values (2,'2026-01-15',1,2026,'Activa',2,2);
insert into matricula values (3,'2026-01-15',1,2026,'Activa',3,3);
insert into matricula values (4,'2026-01-15',1,2026,'Activa',4,4);
insert into matricula values (5,'2026-01-15',1,2026,'Activa',5,5);
insert into matricula values (6,'2026-01-15',1,2026,'Activa',6,6);
insert into matricula values (7,'2026-01-15',1,2026,'Activa',7,7);
insert into matricula values (8,'2026-01-15',1,2026,'Activa',8,8);
insert into matricula values (9,'2026-01-15',1,2026,'Activa',9,9);
insert into matricula values (10,'2026-01-15',1,2026,'Activa',10,10);
insert into matricula values (11,'2026-01-16',1,2026,'Activa',11,11);
insert into matricula values (12,'2026-01-16',1,2026,'Activa',12,12);
insert into matricula values (13,'2026-01-16',1,2026,'Activa',13,13);
insert into matricula values (14,'2026-01-16',1,2026,'Activa',14,14);
insert into matricula values (15,'2026-01-16',1,2026,'Activa',15,15);
insert into matricula values (16,'2026-01-16',1,2026,'Activa',16,16);
insert into matricula values (17,'2026-01-16',1,2026,'Activa',17,17);
insert into matricula values (18,'2026-01-16',1,2026,'Activa',18,18);
insert into matricula values (19,'2026-01-16',1,2026,'Activa',19,19);
insert into matricula values (20,'2026-01-16',1,2026,'Activa',20,20);
insert into matricula values (21,'2026-01-17',1,2026,'Activa',21,21);
insert into matricula values (22,'2026-01-17',1,2026,'Activa',22,22);
insert into matricula values (23,'2026-01-17',1,2026,'Activa',23,23);
insert into matricula values (24,'2026-01-17',1,2026,'Activa',24,24);
insert into matricula values (25,'2026-01-17',1,2026,'Activa',25,25);
insert into matricula values (26,'2026-01-17',1,2026,'Activa',26,26);
insert into matricula values (27,'2026-01-17',1,2026,'Activa',27,27);
insert into matricula values (28,'2026-01-17',1,2026,'Activa',28,28);
insert into matricula values (29,'2026-01-17',1,2026,'Activa',29,29);
insert into matricula values (30,'2026-01-17',1,2026,'Activa',30,30);
insert into matricula values (31,'2026-01-18',1,2026,'Activa',31,31);
insert into matricula values (32,'2026-01-18',1,2026,'Activa',32,32);
insert into matricula values (33,'2026-01-18',1,2026,'Activa',33,33);
insert into matricula values (34,'2026-01-18',1,2026,'Activa',34,34);
insert into matricula values (35,'2026-01-18',1,2026,'Activa',35,35);
insert into matricula values (36,'2026-01-18',1,2026,'Activa',36,36);
insert into matricula values (37,'2026-01-18',1,2026,'Activa',37,37);
insert into matricula values (38,'2026-01-18',1,2026,'Activa',38,38);
insert into matricula values (39,'2026-01-18',1,2026,'Activa',39,39);
insert into matricula values (40,'2026-01-18',1,2026,'Activa',40,40);
insert into matricula values (41,'2026-01-19',1,2026,'Activa',41,41);
insert into matricula values (42,'2026-01-19',1,2026,'Activa',42,42);
insert into matricula values (43,'2026-01-19',1,2026,'Activa',43,43);
insert into matricula values (44,'2026-01-19',1,2026,'Activa',44,44);
insert into matricula values (45,'2026-01-19',1,2026,'Activa',45,45);
insert into matricula values (46,'2026-01-19',1,2026,'Activa',46,46);
insert into matricula values (47,'2026-01-19',1,2026,'Activa',47,47);
insert into matricula values (48,'2026-01-19',1,2026,'Activa',48,48);
insert into matricula values (49,'2026-01-19',1,2026,'Activa',49,49);
insert into matricula values (50,'2026-01-19',1,2026,'Activa',50,50);

--pago
insert into pago values (1,'2026-01-20',85000.00,'Tarjeta',1,1);
insert into pago values (2,'2026-01-20',90000.00,'Efectivo',1,2);
insert into pago values (3,'2026-01-20',95000.00,'SINPE',1,3);
insert into pago values (4,'2026-01-20',98000.00,'Transferencia',1,4);
insert into pago values (5,'2026-01-20',85000.00,'Tarjeta',1,5);
insert into pago values (6,'2026-01-20',90000.00,'Efectivo',1,6);
insert into pago values (7,'2026-01-20',110000.00,'SINPE',1,7);
insert into pago values (8,'2026-01-20',120000.00,'Tarjeta',1,8);
insert into pago values (9,'2026-01-20',80000.00,'Transferencia',1,9);
insert into pago values (10,'2026-01-20',85000.00,'Tarjeta',1,10);
insert into pago values (11,'2026-01-21',80000.00,'Efectivo',1,11);
insert into pago values (12,'2026-01-21',85000.00,'SINPE',1,12);
insert into pago values (13,'2026-01-21',90000.00,'Tarjeta',1,13);
insert into pago values (14,'2026-01-21',95000.00,'Transferencia',1,14);
insert into pago values (15,'2026-01-21',90000.00,'Tarjeta',1,15);
insert into pago values (16,'2026-01-21',90000.00,'SINPE',1,16);
insert into pago values (17,'2026-01-21',95000.00,'Efectivo',1,17);
insert into pago values (18,'2026-01-21',85000.00,'Tarjeta',1,18);
insert into pago values (19,'2026-01-21',85000.00,'Transferencia',1,19);
insert into pago values (20,'2026-01-21',90000.00,'SINPE',1,20);
insert into pago values (21,'2026-01-22',120000.00,'Tarjeta',1,21);
insert into pago values (22,'2026-01-22',125000.00,'Efectivo',1,22);
insert into pago values (23,'2026-01-22',130000.00,'Transferencia',1,23);
insert into pago values (24,'2026-01-22',150000.00,'SINPE',1,24);
insert into pago values (25,'2026-01-22',170000.00,'Tarjeta',1,25);
insert into pago values (26,'2026-01-22',145000.00,'Efectivo',1,26);
insert into pago values (27,'2026-01-22',120000.00,'SINPE',1,27);
insert into pago values (28,'2026-01-22',135000.00,'Tarjeta',1,28);
insert into pago values (29,'2026-01-22',80000.00,'Transferencia',1,29);
insert into pago values (30,'2026-01-22',85000.00,'Tarjeta',1,30);
insert into pago values (31,'2026-01-23',80000.00,'Efectivo',1,31);
insert into pago values (32,'2026-01-23',85000.00,'SINPE',1,32);
insert into pago values (33,'2026-01-23',90000.00,'Tarjeta',1,33);
insert into pago values (34,'2026-01-23',95000.00,'Transferencia',1,34);
insert into pago values (35,'2026-01-23',90000.00,'Efectivo',1,35);
insert into pago values (36,'2026-01-23',95000.00,'Tarjeta',1,36);
insert into pago values (37,'2026-01-23',90000.00,'SINPE',1,37);
insert into pago values (38,'2026-01-23',85000.00,'Transferencia',1,38);
insert into pago values (39,'2026-01-23',90000.00,'Tarjeta',1,39);
insert into pago values (40,'2026-01-23',70000.00,'Efectivo',1,40);
insert into pago values (41,'2026-01-24',65000.00,'SINPE',1,41);
insert into pago values (42,'2026-01-24',70000.00,'Tarjeta',1,42);
insert into pago values (43,'2026-01-24',60000.00,'Transferencia',1,43);
insert into pago values (44,'2026-01-24',85000.00,'Efectivo',1,44);
insert into pago values (45,'2026-01-24',98000.00,'Tarjeta',1,45);
insert into pago values (46,'2026-01-24',100000.00,'SINPE',1,46);
insert into pago values (47,'2026-01-24',105000.00,'Transferencia',1,47);
insert into pago values (48,'2026-01-24',110000.00,'Tarjeta',1,48);
insert into pago values (49,'2026-01-24',120000.00,'Efectivo',1,49);
insert into pago values (50,'2026-01-24',125000.00,'SINPE',1,50);