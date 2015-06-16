use master
go

create DATABASE MEDIKIDS
GO

use MEDIKIDS
go

CREATE TABLE TIPO_SANGRE(
	id_tipo int identity(1,1) primary key,
	tipo_sangre varchar(5) 
)
GO


CREATE TABLE ESPECIALIDAD(
	id_esp int identity(1,1) PRIMARY KEY,
	nombre_esp varchar(30)
)
GO

CREATE TABLE HISTORIA_CLINICA(
	id_hc int identity(1,1) PRIMARY KEY,
	cod_hc varchar(10),
	dni_paciente char(8),
	nom_paciente varchar(50),
	ape_pat_paciente varchar(50),
	ape_mat_paciente varchar(50),
	nombre_completo varchar(150),
	nom_apod varchar(50),
	apellidos_apod varchar(100),
	direccion varchar(150),
	telefono varchar(11),
	fecha_nac_paciente date,
	edad int,
	sexo bit,
	id_tipo_sangre int,
	alergias varchar(200),
	ant_hereditarios varchar(200),
	observ varchar(200),
	CONSTRAINT fk_tipo_sangre FOREIGN KEY (id_tipo_sangre) REFERENCES TIPO_SANGRE (id_tipo)
)
GO

CREATE TABLE CONSULTORIO(
	id_consultorio int identity(1,1) PRIMARY KEY,
	ubicacion varchar(20), -- revisar en el documento
	descripcion varchar(50),
	id_especialidad int,
	CONSTRAINT fk_especialidad FOREIGN KEY (id_especialidad) REFERENCES ESPECIALIDAD (id_esp)
)
GO

CREATE TABLE ROL(
	id_rol int identity(1,1) PRIMARY KEY,
	descripcion varchar(30)
)
GO

CREATE TABLE TIPO_PERSONAL(
	id_tipo int identity(1,1) PRIMARY KEY,
	descripcion varchar(30)
)
GO

CREATE TABLE PERSONAL(
	id_personal int identity(1,1) PRIMARY KEY, -- SI QUIEREN SE AGREGA CODIGO PARA MOSTRAR
	dni char(8),
	nombres varchar(50),
	ape_pat varchar(50),
	ape_mat varchar(50),
	telefono varchar(10),
	celular varchar(10),
	correo varchar(100),
	id_tipo_personal int,
	url_cv varchar(60),
	medico_asignado int, -- este campo sera null la mayoria, podriamos sacarlo en una tabla tipo herencia
	CONSTRAINT chk_correo CHECK (correo like '%_@_%_.__%'),
	CONSTRAINT fk_tipo_personal FOREIGN KEY (id_tipo_personal) REFERENCES TIPO_PERSONAL (id_tipo),
	CONSTRAINT fk_personal FOREIGN KEY (medico_asignado) REFERENCES PERSONAL (id_personal)
)
GO


CREATE TABLE CITA(
	id_cita int identity(1,1) PRIMARY KEY,
	codigo_cita varchar(10),
	id_hc  int,
	personal_registro int,
	tipo_reserva varchar(10), -- presencial, telefonica, etc.
	id_consultorio int,
	fecha_registro datetime,
	fecha_atencion datetime,
	monto_pago decimal,
	estado_cita int,
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

CREATE TABLE HORAS(
	id_hora int identity(1,1) PRIMARY KEY,
	hora varchar(8)   -- aca no recuerdo como era!
)
GO

CREATE TABLE HORARIOS(
	id_horario int identity(1,1) PRIMARY KEY,
	id_consultorio int,
	id_dia int,
	id_hora int,
	estado bit, -- 0 usado, 1 libre     si hay mas avisen
	CONSTRAINT fk_consultorio FOREIGN KEY (id_consultorio) REFERENCES CONSULTORIO (id_consultorio),
	CONSTRAINT fk_dia FOREIGN KEY (id_dia) REFERENCES DIAS (id_dia),
	CONSTRAINT fk_hora FOREIGN KEY (id_hora) REFERENCES HORAS (id_hora)
)
go

CREATE TABLE CONSULTA(
	id_consulta int identity(1,1) PRIMARY KEY,
	id_medico int,
	motivo_cons varchar(150),
	sintomas varchar(150),
	diagnostico varchar(200),
	receta varchar(150),
	fecha_registro datetime,
	CONSTRAINT fk_medico FOREIGN KEY (id_medico) REFERENCES PERSONAL (id_personal)
)
go


CREATE TABLE USUARIOS(
	id_usuario int identity(1,1),
	nom_usuario varchar(20),
	clave varchar(20),
	id_personal int,
	id_rol int,
	CONSTRAINT fk_personal_usuario FOREIGN KEY (id_personal) REFERENCES PERSONAL (id_personal),
	CONSTRAINT fk_rol FOREIGN KEY (id_rol) REFERENCES ROL (id_rol)
)
GO