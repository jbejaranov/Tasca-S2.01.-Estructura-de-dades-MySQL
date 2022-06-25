SELECT apellido1, apellido2, nombre FROM persona ORDER BY apellido1, apellido2, nombre;
SELECT apellido1, apellido2, nombre, telefono FROM persona WHERE telefono IS NULL;
SELECT apellido1, apellido2, nombre, fecha_nacimiento FROM persona WHERE fecha_nacimiento LIKE '%1999%';
SELECT apellido1, apellido2, nombre, nif, tipo, telefono FROM persona WHERE tipo LIKE 'profesor' AND telefono IS NULL AND nif LIKE '%K';
SELECT nombre, cuatrimestre, curso, id_grado FROM asignatura WHERE cuatrimestre LIKE '1' AND curso LIKE '3' AND id_grado Like '7';
SELECT apellido1, apellido2, persona.nombre, departamento.nombre FROM persona INNER JOIN departamento ON persona.id=departamento.id WHERE tipo LIKE 'profesor' ORDER BY apellido1, apellido2, persona.nombre;
SELECT persona.id, nif, apellido1, apellido2, persona.nombre, asignatura.nombre FROM persona INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno INNER JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id WHERE nif LIKE '26902806M';
SELECT COUNT(persona.nombre) AS 'Alumnos matriculados', curso_escolar.anyo_inicio FROM persona INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE persona.tipo LIKE 'alumno' GROUP BY curso_escolar.anyo_inicio;
SELECT persona.apellido1, persona.apellido2, persona.nombre, asignatura.nombre, curso_escolar.anyo_inicio FROM persona INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno INNER JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id INNER JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar WHERE curso_escolar.id LIKE '5';

SELECT departamento.nombre as 'nombre departamento', apellido1, apellido2, persona.nombre FROM persona LEFT JOIN departamento ON persona.id = departamento.id WHERE tipo LIKE 'profesor' ORDER BY departamento.nombre, apellido1, apellido2,nombre;
SELECT departamento.nombre as 'nombre departamento', apellido1, apellido2, persona.nombre, tipo FROM persona LEFT JOIN departamento ON persona.id = departamento.id WHERE tipo LIKE 'profesor' AND departamento.nombre IS NULL;
SELECT nombre, id_profesor FROM departamento LEFT JOIN profesor ON id_departamento=departamento.id WHERE id_profesor IS NULL;
SELECT asignatura.nombre, id_profesor FROM asignatura WHERE id_profesor IS NULL;

SELECT count(nombre) AS 'total alumnos' FROM persona WHERE tipo LIKE 'alumno';
SELECT count(nombre) AS 'total alumnos' FROM persona WHERE tipo LIKE 'alumno' AND fecha_nacimiento LIKE '%1999%';
SELECT grado.nombre AS Grado, COUNT(asignatura.nombre) AS Asignatura FROM grado LEFT JOIN asignatura ON grado.id=asignatura.id_grado GROUP BY grado.nombre ORDER BY asignatura.nombre ASC; 
SELECT grado.nombre AS Grado, COUNT(asignatura.nombre) AS Asignatura FROM grado LEFT JOIN asignatura ON grado.id=asignatura.id_grado WHERE asignatura.nombre<40 GROUP BY grado.nombre ORDER BY asignatura.nombre ASC;
SELECT grado.nombre, asignatura.tipo, count(asignatura.id_grado) AS suma_asignaturas FROM grado INNER JOIN asignatura ON asignatura.id_grado = grado.id GROUP BY asignatura.id_grado;
SELECT DISTINCT(curso_escolar.anyo_inicio), COUNT(alumno_se_matricula_asignatura.id_alumno) AS alumno_matriculado FROM alumno_se_matricula_asignatura INNER JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar GROUP BY id_alumno;
SELECT asignatura.id_profesor, persona.nombre, persona.apellido1, persona.apellido2, COUNT(asignatura.nombre) AS suma_asignatura FROM asignatura LEFT JOIN persona ON persona.id=asignatura.id_profesor GROUP BY asignatura.id_profesor ORDER BY asignatura.nombre DESC;