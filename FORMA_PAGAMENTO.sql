--------------------------------------------------------
-- DDL for Sequence SEQ_FPG
--------------------------------------------------------
CREATE SEQUENCE  "APP"."SEQ_FPG"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

--------------------------------------------------------
-- DDL for Table FORMA_PAGAMENTO
--------------------------------------------------------
CREATE TABLE "APP"."FORMA_PAGAMENTO" (
  "FPG_ID" NUMBER(3,0),
  "FPG_NOME" VARCHAR2(100)
);


--------------------------------------------------------
-- DDL for Trigger TG_SEQ_FPG
--------------------------------------------------------
CREATE OR REPLACE NONEDITIONABLE TRIGGER "APP"."TG_SEQ_FPG"
BEFORE INSERT ON forma_pagamento
FOR EACH ROW
BEGIN
  :new.fpg_id := seq_fpg.nextval;
END;

ALTER TRIGGER "APP"."TG_SEQ_FPG" ENABLE;


--------------------------------------------------------
-- Constraints for Table FORMA_PAGAMENTO
--------------------------------------------------------
ALTER TABLE "APP"."FORMA_PAGAMENTO" MODIFY ("FPG_ID" NOT NULL ENABLE);
ALTER TABLE "APP"."FORMA_PAGAMENTO" MODIFY ("FPG_NOME" NOT NULL ENABLE);

ALTER TABLE "APP"."FORMA_PAGAMENTO"
ADD CONSTRAINT "PK_FPG"
PRIMARY KEY ("FPG_ID")
USING INDEX ENABLE;