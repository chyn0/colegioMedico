CREATE TABLE PROVINCIA (
  idProvincia INT  NOT NULL  ,
  nombre VARCHAR(20)      ,
PRIMARY KEY(idProvincia));



CREATE TABLE MEDICO (
  idMedico INT  NOT NULL  ,
  nombre VARCHAR(20)    ,
  direccion VARCHAR(255)    ,
  telefono VARCHAR(13)    ,
  idProvincia INT    ,
  fechaIngreso DATE    ,
  estatus VARCHAR(20)      ,
PRIMARY KEY(idMedico)  ,
  FOREIGN KEY(idProvincia)
    REFERENCES PROVINCIA(idProvincia)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX MEDICO_PROVINCIA_FK ON MEDICO (idProvincia);



CREATE TABLE CUOTA (
  idCuotaMes INT  NOT NULL  ,
  idMedico INT    ,
  mes INT    ,
  ano INT    ,
  monto INT    ,
  estatus VARCHAR(20)      ,
PRIMARY KEY(idCuotaMes)  ,
  FOREIGN KEY(idMedico)
    REFERENCES MEDICO(idMedico)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX CUOTA_MEDICO_FK ON CUOTA (idMedico);



CREATE TABLE CUOTAXMEDICO (
  idCuota INT  NOT NULL  ,
  idMedico INT  NOT NULL  ,
  cuotaPagar INT      ,
PRIMARY KEY(idCuota, idMedico)  ,
  FOREIGN KEY(idMedico)
    REFERENCES MEDICO(idMedico)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX CUOTA_MEDICO_FK ON CUOTAXMEDICO (idMedico);



CREATE TABLE PAGO (
  idPago INT  NOT NULL  ,
  idCuotaMes INT  NOT NULL  ,
  idMedico INT    ,
  pago INT    ,
  fechaPago DATE      ,
PRIMARY KEY(idPago)  ,
  FOREIGN KEY(idCuotaMes)
    REFERENCES CUOTA(idCuotaMes)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX CUOTA_PAGO_FK ON PAGO (idCuotaMes);




