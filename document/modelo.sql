-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2025-04-14 20:58:49 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE dados_sensor 
    ( 
     id_dado_sensor    INTEGER  NOT NULL , 
     id_sensor         INTEGER  NOT NULL , 
     data_hora_leitura DATE  NOT NULL , 
     valor_fosforo     UNKNOWN 
--  ERROR: Datatype UNKNOWN is not allowed 
                    , 
     valor_potassio    NUMBER , 
     valor_ph          NUMBER 
    ) 
;

ALTER TABLE dados_sensor 
    ADD CONSTRAINT dados_sensor_PK PRIMARY KEY ( id_dado_sensor ) ;

CREATE TABLE plantacao 
    ( 
     id_plantacao  INTEGER  NOT NULL , 
     nome          VARCHAR2 (100) , 
     localizacao   VARCHAR2 (100) , 
     area_hectares NUMBER , 
     data_plantio  DATE 
    ) 
;

ALTER TABLE plantacao 
    ADD CONSTRAINT plantacao_PK PRIMARY KEY ( id_plantacao ) ;

CREATE TABLE sensor 
    ( 
     id_sensor       INTEGER  NOT NULL , 
     tipo_sensor     VARCHAR2 (20 CHAR) , 
     data_instalacao DATE , 
     id_plantacao    INTEGER  NOT NULL 
    ) 
;

ALTER TABLE sensor 
    ADD CONSTRAINT sensor_PK PRIMARY KEY ( id_sensor ) ;

ALTER TABLE dados_sensor 
    ADD CONSTRAINT dados_sensor_sensor_FK FOREIGN KEY 
    ( 
     id_sensor
    ) 
    REFERENCES sensor 
    ( 
     id_sensor
    ) 
;

ALTER TABLE sensor 
    ADD CONSTRAINT sensor_plantacao_FK FOREIGN KEY 
    ( 
     id_plantacao
    ) 
    REFERENCES plantacao 
    ( 
     id_plantacao
    ) 
;

CREATE OR REPLACE TRIGGER FKNTM_sensor 
BEFORE UPDATE OF id_plantacao 
ON sensor 
BEGIN 
  raise_application_error(-20225,'Non Transferable FK constraint  on table sensor is violated'); 
END; 
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             0
-- ALTER TABLE                              5
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   1
-- WARNINGS                                 0
