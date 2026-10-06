--------------------------------------------------------
--  DDL for Sequence SEQ_MAR
--------------------------------------------------------

   CREATE SEQUENCE  "APP"."SEQ_MAR"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table MARCA
--------------------------------------------------------

  CREATE TABLE "APP"."MARCA" 
   (	"MAR_ID" NUMBER(3,0), 
	"MAR_NOME" VARCHAR2(100)
   ) ;

--------------------------------------------------------
--  DDL for Trigger TG_SEQ_MAR
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "APP"."TG_SEQ_MAR" BEFORE
    INSERT ON marca
    FOR EACH ROW
BEGIN
    :new.mar_id := seq_mar.nextval;
END;


ALTER TRIGGER "APP"."TG_SEQ_MAR" ENABLE;

--------------------------------------------------------
--  Constraints for Table marca
--------------------------------------------------------

  ALTER TABLE "APP"."MARCA" MODIFY ("MAR_ID" NOT NULL ENABLE);
  ALTER TABLE "APP"."MARCA" MODIFY ("MAR_NOME" NOT NULL ENABLE);
  ALTER TABLE "APP"."MARCA" ADD CONSTRAINT "PK_MAR" PRIMARY KEY ("MAR_ID")
  USING INDEX  ENABLE;