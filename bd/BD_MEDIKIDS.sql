
USE master
IF EXISTS(select * from sys.databases where name='MEDIKIDS')
	DROP DATABASE MEDIKIDS


create DATABASE MEDIKIDS
GO

use MEDIKIDS
go

CREATE TABLE TIPO_SANGRE(
	id_tipo int identity(1,1) primary key,
	nombre_tipo_sangre varchar(5) not null
)
GO


CREATE TABLE ESPECIALIDAD(
	id_esp int identity(1,1) PRIMARY KEY,
	nombre_esp varchar(30) not null,
	estado bit default 1
)
GO

CREATE TABLE HISTORIA_CLINICA(
	id_hc int identity(1,1) PRIMARY KEY,
	cod_hc varchar(10) not null,
	dni_paciente char(8) not null,
	nom_paciente varchar(60) not null,
	apellidos_paciente varchar(80) not null,
	nombre_completo varchar(150) not null,
	nom_apod varchar(60) not null,
	apellidos_apod varchar(100) not null,
	direccion varchar(150) not null,
	telefono varchar(11),
	fecha_nac_paciente date not null,
	edad int not null,
	sexo bit not null,
	id_tipo_sangre int not null,
	alergias varchar(200),
	ant_hereditarios varchar(200),
	observ varchar(200),
	fecha_registro datetime default GETDATE(),
	estado bit default 1,
	CONSTRAINT fk_tipo_sangre FOREIGN KEY (id_tipo_sangre) REFERENCES TIPO_SANGRE (id_tipo)
)
GO

CREATE TABLE CONSULTORIO(
	id_consultorio int identity(1,1) PRIMARY KEY,
	cod_consultorio varchar(10) not null,
	ubicacion varchar(20) not null, -- revisar en el documento
	descripcion varchar(50) not null,
	id_especialidad int not null,
	fecha_registro datetime  default GETDATE() not null,
	estado bit default 1,
	CONSTRAINT fk_especialidad FOREIGN KEY (id_especialidad) REFERENCES ESPECIALIDAD (id_esp)
)
GO

CREATE TABLE ROL(
	id_rol int identity(1,1) PRIMARY KEY,
	descripcion varchar(30) not null,
	estado bit default 1,
)
GO

CREATE TABLE TIPO_PERSONAL(
	id_tipo int identity(1,1) PRIMARY KEY,
	descripcion varchar(30) not null
)
GO

CREATE TABLE PERSONAL(
	id_personal int identity(1,1) PRIMARY KEY, -- SI QUIEREN SE AGREGA CODIGO PARA MOSTRAR
	dni char(8) not null,
	nombres varchar(50) not null,
	apellidos varchar(100) not null,
    nombre_completo varchar(100) not null,
	telefono varchar(10),
	celular varchar(10),
	correo varchar(100),
	id_tipo_personal int not null,
	url_cv varchar(60),
    url_foto varchar(60),
	fecha_registro datetime default GETDATE(),
	estado bit default 1, -- 1 habilitado 0 deshabilitado
	CONSTRAINT chk_correo CHECK (correo like '%_@_%_.__%'),
	CONSTRAINT fk_tipo_personal FOREIGN KEY (id_tipo_personal) REFERENCES TIPO_PERSONAL (id_tipo)
)
GO

CREATE TABLE MEDICO(
    id_personal int PRIMARY KEY,
	cmp varchar(10),
    id_esp int,
    CONSTRAINT fk_personal_id FOREIGN KEY (id_personal) REFERENCES PERSONAL (id_personal),
    CONSTRAINT fk_especialidad_med FOREIGN KEY (id_esp) REFERENCES ESPECIALIDAD (id_esp)
)
GO

CREATE TABLE ASISTENTE(
    id_personal int PRIMARY KEY, 
    id_medico_asig int,
    CONSTRAINT fk_medico_asig FOREIGN KEY (id_medico_asig) REFERENCES PERSONAL (id_personal)
)
GO

CREATE TABLE CITA(
	id_cita int identity(1,1) PRIMARY KEY,
	codigo_cita varchar(10) not null,
	id_hc  int not null,
	personal_registro int not null,
	tipo_reserva varchar(10) not null, -- presencial, telefonica, etc.
	id_consultorio int not null,
	fecha_registro datetime default GETDATE(),
	fecha_atencion datetime not null,
	monto_pago decimal not null,
	estado_cita int default 1,
	CONSTRAINT fk_historia_clinica FOREIGN KEY (id_hc) REFERENCES HISTORIA_CLINICA (id_hc),
	CONSTRAINT fk_personal_cita FOREIGN KEY (personal_registro) REFERENCES PERSONAL (id_personal),
	CONSTRAINT fk_consultorio_cita FOREIGN KEY (id_consultorio) REFERENCES CONSULTORIO (id_consultorio)
)
GO

CREATE TABLE DIAS(
	id_dia int identity(1,1) PRIMARY KEY,
	nombre_dia varchar(15)
)
GO

CREATE TABLE TURNO(
	id_turno int identity(1,1) PRIMARY KEY,
	descripcion varchar(20),
	hora_inicio time,
	hora_fin time,
	estado bit default 1  -- aca no recuerdo como era!
)
GO

CREATE TABLE HORARIOS(
	id_horario int identity(1,1) PRIMARY KEY,
	id_consultorio int not null,
	id_medico int,
	id_dia int not null,
	id_turno int not null,
	estado bit default 1, -- 0 usado, 1 libre     si hay mas avisen
	CONSTRAINT fk_consultorio FOREIGN KEY (id_consultorio) REFERENCES CONSULTORIO (id_consultorio),
	CONSTRAINT fk_dia FOREIGN KEY (id_dia) REFERENCES DIAS (id_dia),
	CONSTRAINT fk_hora FOREIGN KEY (id_turno) REFERENCES TURNO (id_turno),
	CONSTRAINT fk_medico_horario FOREIGN KEY (id_medico) REFERENCES MEDICO (id_personal)
)
go

CREATE TABLE CONSULTA(
	id_consulta int identity(1,1) PRIMARY KEY,
	id_hc int,
	id_medico int,
	id_cita int,
	motivo_cons varchar(150),
	sintomas varchar(150),
	diagnostico varchar(200),
	receta varchar(150),
	fecha_registro datetime,
	estado bit,
	CONSTRAINT fk_hc FOREIGN KEY (id_hc) REFERENCES HISTORIA_CLINICA (id_hc),
	CONSTRAINT fk_medico FOREIGN KEY (id_medico) REFERENCES MEDICO (id_personal),
	CONSTRAINT fk_cita_cons FOREIGN KEY (id_cita) REFERENCES CITA (id_cita)
)
go


CREATE TABLE USUARIO(
	id_personal int primary key,
	nom_usuario varchar(20),
	contrasena varchar(20),
	id_rol int,
	estado bit default 1,
	CONSTRAINT fk_personal_usuario FOREIGN KEY (id_personal) REFERENCES PERSONAL (id_personal),
	CONSTRAINT fk_rol FOREIGN KEY (id_rol) REFERENCES ROL (id_rol)
)
GO

INSERT INTO ESPECIALIDAD (nombre_esp) VALUES ('Cardiologia'),('Oftalmologia')

INSERT INTO TURNO (descripcion,hora_inicio,hora_fin) VALUES ('Mañana','09:00:00','13:00:00'),('Tarde','14:00:00','18:00:00')

INSERT INTO DIAS (nombre_dia) VALUES ('Lunes'),('Martes'),('Miercoles'),('Jueves'),('Viernes'),('Sabado'),('Domingo')

INSERT INTO TIPO_PERSONAL (descripcion) VALUES ('Medico')
INSERT INTO TIPO_PERSONAL (descripcion) VALUES ('Recepcionista')
INSERT INTO TIPO_PERSONAL (descripcion) VALUES ('Asistente')
INSERT INTO TIPO_PERSONAL (descripcion) VALUES ('Personal Limpieza')

INSERT INTO ROL (descripcion) values ('Administrador')

INSERT INTO PERSONAL (dni, nombres,apellidos,nombre_completo,id_tipo_personal) VALUES ( '44254107','Luis','Almeyda Vasquez','Luis Almeyda Vasquez',1)
INSERT INTO PERSONAL (dni, nombres,apellidos,nombre_completo,id_tipo_personal) VALUES ( '12345678','Cesar','hipolito','Cesar Hipolito',1)
INSERT INTO PERSONAL (dni, nombres,apellidos,nombre_completo,id_tipo_personal) VALUES ( '98765432','Carlos','Cornejo','Carlos Cornejo',1)
INSERT INTO PERSONAL (dni, nombres,apellidos,nombre_completo,id_tipo_personal) VALUES ( '12345678','Jo','Yep','Jo Yep',3)

INSERT INTO MEDICO (id_personal,cmp,id_esp) VALUES (1, '12345',1);
INSERT INTO MEDICO (id_personal,cmp,id_esp) VALUES (3, '65487',2);
INSERT INTO MEDICO (id_personal,cmp,id_esp) VALUES (4, '23145',2);

INSERT INTO ASISTENTE(id_personal,id_medico_asig) VALUES (2, 1);



INSERT INTO USUARIO (id_personal,nom_usuario,contrasena,id_rol) values (1, 'prueba','12345',1)


select * from personal
select * from ESPECIALIDAD
select * from CONSULTORIO
select * from MEDICO
select * from TIPO_PERSONAL
select * from horarios;

SELECT m.id_personal, p.nombre_completo,cmp,url_foto,e.nombre_esp from MEDICO m
 		INNER JOIN ESPECIALIDAD E ON m.id_esp = e.id_esp
 		INNER JOIN PERSONAL p ON p.id_personal = m.id_personal
 		WHERE p.estado = 1

SELECT id_consultorio,cod_consultorio,ubicacion,descripcion,c.estado,id_esp,nombre_esp
		FROM CONSULTORIO c INNER JOIN ESPECIALIDAD e on e.id_esp = c.id_especialidad
		WHERE id_consultorio = 1

SELECT id_horario,id_consultorio,id_medico,nombre_completo,id_dia,id_turno 
from HORARIOS h INNER JOIN PERSONAL p on h.id_medico = p.id_personal
where id_consultorio = 2
GO


-- trigger crear horarios en insert consultorio
¨/*
CREATE TRIGGER crearhorarios ON CONSULTORIO AFTER INSERT
AS
declare @id int, @dia int = 1
BEGIN
	WHILE @dia < 8
	BEGIN
		select @id = id_consultorio from inserted
		INSERT INTO HORARIOS (id_consultorio,id_medico,id_dia,id_turno) 
		VALUES (@id, null, @dia, 1),(@id, null, @dia, 2)
		set @dia = @dia + 1
	END
END
GO
*/
INSERT INTO CONSULTORIO (cod_consultorio,ubicacion,descripcion,id_especialidad) 
 		VALUES ('001','asdads','asdasd',1)

select * from HORARIOS

SELECT id_horario,id_consultorio,id_medico,nombre_completo,id_dia,id_turno from HORARIOS h 
INNER JOIN PERSONAL p on h.id_medico = p.id_personal
 where id_consultorio = 1 and h.estado = 1 order by id_dia


SELECT id_horario,id_consultorio,id_medico,nombre_completo,id_dia,id_turno from HORARIOS h 
INNER JOIN PERSONAL p on h.id_medico = p.id_personal
 where id_consultorio = 1 and h.estado = 1 order by id_dia

 SELECT id_horario,id_consultorio,id_medico,id_dia,id_turno from HORARIOS h
		where id_consultorio = 1 and id_turno = 2
		and id_dia = 1 and h.estado = 1