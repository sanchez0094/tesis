create database Notas_Pedidos_Entregas;

use Notas_Pedidos_Entregas;

create table cliente(
id_cliente int IDENTITY (1,1) PRIMARY KEY,
nombre_cliente varchar (50) ,
apellido_cliente varchar (50),
nombre_local varchar (50),
cuit numeric (15),
telefono numeric (20),
direccion varchar (20)
)

create table negocio(
id_negocio int IDENTITY (1,1) PRIMARY KEY ,
nombre_negocio varchar (50),
telefono numeric (20),
direccion varchar (50)
)

create table empleado(
id_empleado int IDENTITY (1,1) PRIMARY KEY ,
nombre_empleado varchar (50),
cuil numeric (15),
telefono numeric (20),
direccion varchar (50)
)

create table pedido(
id_pedido int IDENTITY (1,1) PRIMARY KEY ,
fecha_pedido date ,
fecha_entrega_etipulada date ,
detalle_pedido varchar (100),
monto numeric (6,5),
id_negocio int FOREIGN KEY  REFERENCES negocio (id_negocio),
id_empleado int FOREIGN KEY REFERENCES empleado(id_empleado)
)

create table pedidos_x_cliente(
id_pedido_x_cliente  int IDENTITY (1,1) PRIMARY KEY ,
id_cliente int FOREIGN KEY REFERENCES cliente(id_cliente),
id_pedido int FOREIGN KEY  REFERENCES pedido(id_pedido),
monto_final numeric (6,5),
seña numeric (6,5)
)

create table entrega_x_cliente(
id_entrega_x_client  int IDENTITY (1,1) PRIMARY KEY,
id_pedido_x_cliente  int FOREIGN KEY REFERENCES pedidos_x_cliente(id_pedido_x_cliente),
pagoEfectuado numeric (6,5),
cuenta_corriente bit
)