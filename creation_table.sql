DROP TABLE IF EXISTS dimension_cliente;
DROP TABLE IF EXISTS dimension_tiempo;
DROP TABLE IF EXISTS dimension_transaccion;
DROP TABLE IF EXISTS dimension_ciudad;
DROP TABLE IF EXISTS dimension_sucursal;
DROP TABLE IF EXISTS fact_table;


create table fact_table(
    identificacion varchar(50) not null primary key,
    precio_unitario float not null,
    cantidad float not null,
    impuesto float not null,
    total float not null,
    cogs float not null,
    porcentaje_de_margen_bruto float not null,
    ingresos_brutos float not null
);

create table dimension_cliente (
    identificacion varchar(50) not null primary key,
    tipo_de_cliente varchar(50) not null,
    genero varchar(50) not null,
    clasificacion float not null,
    foreign key (identificacion) references fact_table(identificacion)
);

create table dimension_ciudad(
    identificacion varchar(50) not null primary key,
    nombre varchar(50) not null,
    foreign key (identificacion) references fact_table(identificacion)
);
create table dimension_sucursal(
    identificacion varchar(50) not null primary key,
    denominacion varchar(50) not null,
    foreign key (identificacion) references fact_table(identificacion)
);
create table dimension_transaccion(
    identificacion varchar(50) not null primary key,
    nombre_categoria varchar(50) not null,
    metodo_pago varchar(50) not null,
    foreign key (identificacion) references fact_table(identificacion)
);
create table dimension_tiempo(
    identificacion varchar(50) not null primary key,
    fecha date not null,
    hora time not null,
    foreign key (identificacion) references fact_table(identificacion)
);