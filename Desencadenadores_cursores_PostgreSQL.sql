CREATE TABLE categoria (
    idcategoria int primary key,
    categoria varchar(25)
);

CREATE TABLE producto (
    idproducto int primary key,
    nombre varchar(150),
    idcategoria int,
    medida varchar(100),
    precio int,
    stock int,
    foreign key (idcategoria) references categoria(idcategoria)
);

CREATE TABLE cliente (
    idcliente char(5) primary key,
    cia varchar(150),
    contacto varchar(100),
    cargo varchar(150),
    direccion varchar(200),
    ciudad varchar(50),
    region varchar(25),
    cp varchar(10),
    pais varchar(25),
    tlf varchar(25),
    fax varchar(25)
);

CREATE TABLE pedido (
    idpedido int primary key,
    idcliente char(5),
    fechapedido timestamp,
    fechaentrega timestamp,
    foreign key (idcliente) references cliente(idcliente)
);

CREATE TABLE detalle (
    idpedido int,
    idproducto int,
    precio float,
    unidades int,
    descuento float,
    foreign key (idpedido) references pedido(idpedido),
    foreign key (idproducto) references producto(idproducto)
);
CREATE TABLE LOGGER (
FECHAHORA timestamp,
ACCION character varying(200)
);
CREATE OR REPLACE FUNCTION tInsertCategoria() RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO LOGGER VALUES 
                (NOW(), concat('Insertada categoria con id ', NEW.IDCATEGORIA));
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER triggerInsertCategoria 
AFTER INSERT ON CATEGORIA 
FOR EACH ROW EXECUTE PROCEDURE tInsertCategoria();
CREATE OR REPLACE FUNCTION tUpdateCategoria() RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO LOGGER VALUES 
                (NOW(), concat('Actualizada categoria con id ', NEW.IDCATEGORIA));
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER triggerUpdateCategoria 
AFTER UPDATE ON CATEGORIA 
FOR EACH ROW EXECUTE PROCEDURE tUpdateCategoria();

CREATE OR REPLACE FUNCTION tDeleteCategoria() RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO LOGGER VALUES 
                (NOW(), concat('Borrada categoria con id ', OLD.IDCATEGORIA));
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER triggerDeleteCategoria 
AFTER DELETE ON CATEGORIA 
FOR EACH ROW EXECUTE PROCEDURE tDeleteCategoria();  

-- Para la tabla producto

CREATE OR REPLACE FUNCTION tInsertProducto() RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO LOGGER VALUES 
                (NOW(), concat('Insertado producto con id ', NEW.IDPRODUCTO));
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER triggerInsertProducto 
AFTER INSERT ON PRODUCTO 
FOR EACH ROW EXECUTE PROCEDURE tInsertProducto();

CREATE OR REPLACE FUNCTION tUpdateProducto() RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO LOGGER VALUES 
                (NOW(), concat('Actualizado producto con id ', NEW.IDPRODUCTO));
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER triggerUpdateProducto 
AFTER UPDATE ON PRODUCTO 
FOR EACH ROW EXECUTE PROCEDURE tUpdateProducto();

CREATE OR REPLACE FUNCTION tDeleteProducto() RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO LOGGER VALUES 
                (NOW(), concat('Borrado producto con id ', OLD.IDPRODUCTO));
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER triggerDeleteProducto 
AFTER DELETE ON PRODUCTO 
FOR EACH ROW EXECUTE PROCEDURE tDeleteProducto();

-- Para la tabla cliente

CREATE OR REPLACE FUNCTION tInsertCliente() RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO LOGGER VALUES 
                (NOW(), concat('Insertado cliente con id ', NEW.IDCLIENTE));
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER triggerInsertCliente 
AFTER INSERT ON CLIENTE 
FOR EACH ROW EXECUTE PROCEDURE tInsertCliente();

CREATE OR REPLACE FUNCTION tUpdateCliente() RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO LOGGER VALUES 
                (NOW(), concat('Actualizado cliente con id ', NEW.IDCLIENTE));
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER triggerUpdateCliente 
AFTER UPDATE ON CLIENTE 
FOR EACH ROW EXECUTE PROCEDURE tUpdateCliente();

CREATE OR REPLACE FUNCTION tDeleteCliente() RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO LOGGER VALUES 
                (NOW(), concat('Borrado cliente con id ', OLD.IDCLIENTE));
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER triggerDeleteCliente 
AFTER DELETE ON CLIENTE 
FOR EACH ROW EXECUTE PROCEDURE tDeleteCliente();

-- Para la tabla Pedido

CREATE OR REPLACE FUNCTION tInsertPedido() RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO LOGGER VALUES 
                (NOW(), concat('Insertado pedido con id ', NEW.IDPEDIDO));
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER triggerInsertPedido 
AFTER INSERT ON PEDIDO 
FOR EACH ROW EXECUTE PROCEDURE tInsertPedido();

CREATE OR REPLACE FUNCTION tUpdatePedido() RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO LOGGER VALUES 
                (NOW(), concat('Actualizado pedido con id ', NEW.IDPEDIDO));
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER triggerUpdatePedido 
AFTER UPDATE ON PEDIDO 
FOR EACH ROW EXECUTE PROCEDURE tUpdatePedido();

CREATE OR REPLACE FUNCTION tDeletePedido() RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO LOGGER VALUES 
                (NOW(), concat('Borrado pedido con id ', OLD.IDPEDIDO));
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER triggerDeletePedido 
AFTER DELETE ON PEDIDO 
FOR EACH ROW EXECUTE PROCEDURE tDeletePedido();

-- Para la tabla detalle

CREATE OR REPLACE FUNCTION tInsertDetalle() RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO LOGGER VALUES 
                (NOW(), concat('Insertado detalle con idpedido ', NEW.IDPEDIDO, ' e idproducto ', NEW.IDPRODUCTO));
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER triggerInsertDetalle 
AFTER INSERT ON DETALLE 
FOR EACH ROW EXECUTE PROCEDURE tInsertDetalle();

CREATE OR REPLACE FUNCTION tUpdateDetalle() RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO LOGGER VALUES 
                (NOW(), concat('Actualizado detalle con idpedido ', NEW.IDPEDIDO, ' e idproducto ', NEW.IDPRODUCTO));
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER triggerUpdateDetalle 
AFTER UPDATE ON DETALLE 
FOR EACH ROW EXECUTE PROCEDURE tUpdateDetalle();

CREATE OR REPLACE FUNCTION tDeleteDetalle() RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO LOGGER VALUES 
                (NOW(), concat('Borrado detalle con idpedido ', OLD.IDPEDIDO, ' e idproducto ', OLD.IDPRODUCTO));
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER triggerDeleteDetalle 
AFTER DELETE ON DETALLE 
FOR EACH ROW EXECUTE PROCEDURE tDeleteDetalle();

-- Insertar un registro en la tabla
INSERT INTO categoria (idcategoria, categoria)
VALUES (1, 'Frutas');

-- Actualizar el nombre de una categoría existente
UPDATE categoria
SET categoria = 'Vegetales'
WHERE idcategoria = 1;

-- Eliminar una categoría
DELETE FROM categoria
WHERE idcategoria = 1;

-- Insertar un registro en la tabla
INSERT INTO producto (idproducto, nombre, idcategoria, medida, precio, stock)
VALUES (1, 'Manzanas', 1, '1 kg', 50, 100);

-- Actualizar el precio de un producto existente
UPDATE producto
SET precio = 60
WHERE idproducto = 1;

-- Eliminar un producto
DELETE FROM producto
WHERE idproducto = 1;

-- Insertar un registro en la tabla
INSERT INTO cliente (idcliente, cia, contacto, cargo, direccion, ciudad, region, cp, pais, tlf, fax)
VALUES ('C0001', 'Compañía Ejemplo', 'Juan Pérez', 'Gerente', 'Av. Ejemplo 123', 'Ciudad Ejemplo', 'Región Ejemplo', '12345', 'México', '+52 123 456 7890', '+52 123 456 7891');

-- Actualizar el cargo del contacto de un cliente existente
UPDATE cliente
SET cargo = 'Director'
WHERE idcliente = 'C0001';

-- Eliminar un cliente
DELETE FROM cliente
WHERE idcliente = 'C0001';

-- Insertar un registro en la tabla
INSERT INTO pedido (idpedido, idcliente, fechapedido, fechaentrega)
VALUES (1, 'C0001', now(), now() + interval '7 days');

-- Actualizar la fecha de entrega de un pedido existente
UPDATE pedido
SET fechaentrega = now() + interval '10 days'
WHERE idpedido = 1;

-- Eliminar un pedido
DELETE FROM pedido
WHERE idpedido = 1;

-- Insertar un registro en la tabla
INSERT INTO detalle (idpedido, idproducto, precio, unidades, descuento)
VALUES (1, 1, 50.0, 2, 0.1);

-- Actualizar el precio de un producto en un detalle existente
UPDATE detalle
SET precio = 60.0
WHERE idpedido = 1 AND idproducto = 1;

-- Eliminar un detalle
DELETE FROM detalle
WHERE idpedido = 1 AND idproducto = 1;


SELECT * FROM LOGGER;