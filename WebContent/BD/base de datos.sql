drop database proyFinalPIT;
create database proyFinalPIT;

use proyFinalPIT;

create table tb_usuario(
cod_usuario varchar(5) primary key,
usuario varchar(10),
contrasena varchar(10),
ult_fecha date,
estado varchar(5));

insert tb_usuario values('1a','pepito','123','2015/05/03','true');
insert tb_usuario values('2a','pepito1','111','2015/05/03','true');

select * from tb_usuario;