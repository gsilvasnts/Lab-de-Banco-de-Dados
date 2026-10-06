--------------------------------------------------------
--  DDL for Table H_MARCA
--------------------------------------------------------

  CREATE TABLE "APP"."H_MARCA" 
   (	"HMAR_ID" NUMBER(3,0), 
	"HMAR_NOME" VARCHAR2(100), 
	"HMAR_DT_ENTRADA" DATE
   ) ;
--------------------------------------------------------
--  DDL for Trigger TG_HMAR
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "APP"."TG_HMAR" BEFORE
    UPDATE OR DELETE ON marca
    FOR EACH ROW
BEGIN
    insert into h_marca values (:old.mar_id, :old.mar_nome, sysdate);
END;

ALTER TRIGGER "APP"."TG_HMAR" ENABLE;
--------------------------------------------------------
--  Constraints for Table H_MAR
--------------------------------------------------------

  ALTER TABLE "APP"."H_MARCA" MODIFY ("HMAR_ID" NOT NULL ENABLE);
  ALTER TABLE "APP"."H_MARCA" MODIFY ("HMAR_NOME" NOT NULL ENABLE);
  ALTER TABLE "APP"."H_MARCA" MODIFY ("HMAR_DT_ENTRADA" NOT NULL ENABLE);
  ALTER TABLE "APP"."H_MARCA" ADD CONSTRAINT "PK_HMAR" PRIMARY KEY ("HMAR_ID", "HMAR_DT_ENTRADA")
  USING INDEX  ENABLE;