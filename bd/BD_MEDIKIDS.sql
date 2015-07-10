
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
	nom_paciente varchar(60) not null,
	apellido_paterno_paciente varchar(80) not null,
	apellido_materno_paciente varchar(80) not null,
	dni_paciente char(8) not null,
	edad int not null,
	sexo bit not null,
	direccion_paciente varchar(150) not null,
	fecha_nac_paciente date not null,
	observ varchar(200),
	nom_padre varchar(60),
	apellido_paterno_padre varchar(80),
	apellido_materno_padre varchar(80),
	dni_padre char(8),
	telefono_padre varchar(11),
	correo_padre varchar(100),
	direccion_padre varchar(150),
	nom_madre varchar(60),
	apellido_paterno_madre varchar(80),
	apellido_materno_madre varchar(80),
	dni_madre char(8),
	telefono_madre varchar(11),
	correo_madre varchar(100),
	direccion_madre varchar(150),
	nom_apoderado varchar(60),
	apellido_paterno_apoderado varchar(80),
	apellido_materno_apoderado varchar(80),
	dni_apoderado char(8),
	telefono_apoderado varchar(11),
	correo_apoderado varchar(100),
	direccion_apoderado varchar(150),
	id_tipo_sangre int not null,
	alergias varchar(200),
	ant_hereditarios varchar(200),
	fecha_registro datetime default GETDATE(),
	foto_paciente varchar(50),
	foto_padre varchar(50),
	foto_madre varchar(50),
	foto_apoderado varchar(50),
	estado bit default 1,
	CONSTRAINT chk_correo1 CHECK (correo_padre like '%_@_%_.__%'),
	CONSTRAINT chk_correo2 CHECK (correo_madre like '%_@_%_.__%'),
	CONSTRAINT chk_correo3 CHECK (correo_apoderado like '%_@_%_.__%'),
	CONSTRAINT fk_tipo_sangre FOREIGN KEY (id_tipo_sangre) REFERENCES TIPO_SANGRE (id_tipo)
)
GO


CREATE SEQUENCE codigoConsultorio
    AS int
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999
    CYCLE
    CACHE 3
go

CREATE TABLE CONSULTORIO(
	id_consultorio int identity(1,1) PRIMARY KEY,
	cod_consultorio varchar(10) not null default RIGHT('0000'+CAST(next value for codigoConsultorio AS VARCHAR(4)),4),
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
	hora_atencion time not null,
	monto_pago decimal not null,
	estado_cita varchar(10) not null default 'RESERVA',
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
	estado bit,  -- 0:  1: Atendida
	CONSTRAINT fk_hc FOREIGN KEY (id_hc) REFERENCES HISTORIA_CLINICA (id_hc),
	CONSTRAINT fk_medico FOREIGN KEY (id_medico) REFERENCES MEDICO (id_personal),
	CONSTRAINT fk_cita_cons FOREIGN KEY (id_cita) REFERENCES CITA (id_cita)
)
go


CREATE TABLE USUARIO(
	id_usuario int identity(1,1) PRIMARY KEY,
	cod_personal int not null,
	nom_usuario varchar(20),
	contrasena varchar(20),
	id_rol int,
	estado bit default 1,
	CONSTRAINT fk_personal_usuario FOREIGN KEY (cod_personal) REFERENCES PERSONAL (id_personal),
	CONSTRAINT fk_rol FOREIGN KEY (id_rol) REFERENCES ROL (id_rol)
)
GO

INSERT INTO TIPO_SANGRE (nombre_tipo_sangre) VALUES ('A+');
INSERT INTO TIPO_SANGRE (nombre_tipo_sangre) VALUES ('A-');
INSERT INTO TIPO_SANGRE (nombre_tipo_sangre) VALUES ('B+');
INSERT INTO TIPO_SANGRE (nombre_tipo_sangre) VALUES ('B-');
INSERT INTO TIPO_SANGRE (nombre_tipo_sangre) VALUES ('O+');
INSERT INTO TIPO_SANGRE (nombre_tipo_sangre) VALUES ('O-');
INSERT INTO TIPO_SANGRE (nombre_tipo_sangre) VALUES ('AB+');
INSERT INTO TIPO_SANGRE (nombre_tipo_sangre) VALUES ('AB-')

INSERT INTO ESPECIALIDAD (nombre_esp) VALUES ('Cardiologia'),('Oftalmologia')

INSERT INTO TURNO (descripcion,hora_inicio,hora_fin) VALUES ('Mañana','09:00:00','13:00:00'),('Tarde','14:00:00','18:00:00')

INSERT INTO DIAS (nombre_dia) VALUES ('Lunes'),('Martes'),('Miercoles'),('Jueves'),('Viernes'),('Sabado')

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

INSERT INTO USUARIO (cod_personal, nom_usuario, contrasena, id_rol,estado) values ( 1, 'prueba', 12345, 1, 1)


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

INSERT INTO HISTORIA_CLINICA(
cod_hc,nom_paciente,apellido_paterno_paciente,apellido_materno_paciente,dni_paciente,edad,sexo,
direccion_paciente,fecha_nac_paciente,observ,
nom_padre,apellido_paterno_padre,apellido_materno_padre,dni_padre,telefono_padre,correo_padre,
direccion_padre,
nom_madre,apellido_paterno_madre,apellido_materno_madre,dni_madre,telefono_madre,correo_madre,
direccion_madre,
nom_apoderado,apellido_paterno_apoderado,apellido_materno_apoderado,dni_apoderado,telefono_apoderado,
correo_apoderado,direccion_apoderado,
id_tipo_sangre,alergias,ant_hereditarios
) VALUES(
'holo4','hola4','hola4','hola',12345678,12,0,
'','03-03-1998','1312312312313',
'holo1','holo1','holo1',12345678,123123,'ewrwer@qwe.com',
'123123123',
'holo1','holo1','holo1',12345678,123123,'ewrwer@qwe.com',
'123123123',
'holo1','holo1','holo1',12345678,123123,'ewrwer@qwe.com',
'123123123',
2,'12123','123123'
)
go

INSERT INTO CONSULTORIO (ubicacion,descripcion,id_especialidad) 
 		VALUES ('asdads','asdasd',1),('numero2','no se',1)
go

CREATE TABLE HORAS_DIA(
	id int identity(1,1) primary key,
	hora time not null
)

select * from HORAS_DIA

declare
	@hora time,
	@contador int
Begin
	set @contador = 1
	set @hora = CONVERT(time,'0:00')
	while @contador <= 24
	begin
		INSERT INTO HORAS_DIA (hora) values (@hora)
		set @hora = DATEADD(HOUR, 1, @hora)
		set @contador = @contador + 1
	end
end


go


select * from USUARIO
select * from HORARIOS

select id_cita,codigo_cita,tipo_reserva,fecha_atencion,c.id_hc,h.nom_paciente,h.apellido_paterno_paciente,
h.apellido_materno_paciente, c.id_consultorio,cn.cod_consultorio
from cita c inner join HISTORIA_CLINICA h on c.id_hc = c.id_hc
inner join CONSULTORIO cn on c.id_consultorio = cn.id_consultorio
where estado_cita = 'RESERVA';

select * from CITA
select * from HORARIOS
select * from TURNO

-- horas disponibles del consultorio dependiendo fecha 
select CONVERT(TIME(0), hora) from HORAS_DIA where hora 
not in 
(select hora_atencion from cita c 
 where c.id_consultorio = 1 and c.fecha_atencion = '2015/07/08'
 and c.estado_cita in ('RESERVA', 'PAGADA'))
 and hora in
 (select hora from HORAS_DIA inner join TURNO t on
hora >= t.hora_inicio and hora < t.hora_fin
where id_turno in (SELECT h.id_turno from HORARIOS h
where id_consultorio = 1 and h.id_dia = DATEPART(weekday, '2015/07/08')-1 and h.estado = 1))



-- turnos de consultorio dependiendo dia de semana
SELECT id_turno from HORARIOS 
where id_consultorio = 1 and id_dia = 1 and estado = 1
GO

select id_cita,codigo_cita,tipo_reserva,fecha_atencion, CONVERT(TIME(0), hora_atencion) hora_atencion, monto_pago, e.id_esp,
c.id_hc,h.nom_paciente,h.apellido_paterno_paciente,h.apellido_materno_paciente,c.id_consultorio,cn.cod_consultorio
from cita c inner join HISTORIA_CLINICA h on c.id_hc = c.id_hc
inner join CONSULTORIO cn on c.id_consultorio = cn.id_consultorio
inner join ESPECIALIDAD e on e.id_esp = cn.id_especialidad
where estado_cita = 'RESERVA' 


select fecha_atencion, count(fecha_atencion),(select count(*) from HORAS_DIA inner join TURNO t on
hora >= t.hora_inicio and hora < t.hora_fin
where id_turno in (SELECT h.id_turno from HORARIOS h
where id_consultorio = 2 and h.id_dia = DATEPART(weekday, fecha_atencion)-1 and h.estado = 1))
from cita where id_consultorio = 1 and estado_cita in ('RESERVA', 'PAGADA')
group by fecha_atencion


select fecha_atencion, count(fecha_atencion)
from cita where id_consultorio = 2 and estado_cita in ('RESERVA', 'PAGADA')
group by fecha_atencion


select fecha_atencion, (select count(*) from HORAS_DIA inner join TURNO t 
on hora >= t.hora_inicio and hora < t.hora_fin where id_turno in 
(SELECT h.id_turno from HORARIOS h where id_consultorio = 1 
and h.id_dia = DATEPART(weekday, fecha_atencion)-1 and h.estado = 1)) - count(fecha_atencion) horasDispo 
from cita where id_consultorio = 1 and estado_cita in ('RESERVA', 'PAGADA') group by fecha_atencion 

