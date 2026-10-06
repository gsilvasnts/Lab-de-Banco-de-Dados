--------------------------------------------------------
-- DDL for Sequence SEQ_VDA
--------------------------------------------------------
CREATE SEQUENCE  "APP"."SEQ_VDA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
-- DDL for Table VENDA
--------------------------------------------------------
CREATE TABLE "APP"."VENDA" (
  "VDA_ID" NUMBER(3,0),
  "VDA_DATA_HORA" DATE,
  "VDA_VALOR_TOTAL" NUMBER(10,2)
);


--------------------------------------------------------
-- DDL for Trigger TG_SEQ_VDA
--------------------------------------------------------
CREATE OR REPLACE NONEDITIONABLE TRIGGER "APP"."TG_SEQ_VDA"
BEFORE INSERT ON venda
FOR EACH ROW
BEGIN
  :new.vda_id := seq_vda.nextval;
END;

ALTER TRIGGER "APP"."TG_SEQ_VDA" ENABLE;


--------------------------------------------------------
-- Constraints for Table VENDA
--------------------------------------------------------
ALTER TABLE "APP"."VENDA" MODIFY ("VDA_ID" NOT NULL ENABLE);
ALTER TABLE "APP"."VENDA" MODIFY ("VDA_DATA_HORA" NOT NULL ENABLE);
ALTER TABLE "APP"."VENDA" MODIFY ("VDA_VALOR_TOTAL" NOT NULL ENABLE);

ALTER TABLE "APP"."VENDA"
ADD CONSTRAINT "PK_VDA"
PRIMARY KEY ("VDA_ID")
USING INDEX ENABLE;