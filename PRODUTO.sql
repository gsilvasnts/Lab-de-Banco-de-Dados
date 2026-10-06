--------------------------------------------------------
-- DDL for Sequence SEQ_PRD
--------------------------------------------------------

CREATE SEQUENCE  "APP"."SEQ_PRD"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
-- DDL for Table PRODUTO
--------------------------------------------------------
CREATE TABLE "APP"."PRODUTO" (
  "PRD_ID" NUMBER(3,0),
  "PRD_MAR_ID" NUMBER(3,0),
  "PRD_NOME" VARCHAR2(100),
  "PRD_QUANTIDADE" NUMBER(8,0),
  "PRD_PRECO_CUSTO" NUMBER(8,2),
  "PRD_PRECO_VENDA" NUMBER(8,2)
);


--------------------------------------------------------
-- DDL for Trigger TG_SEQ_PRD
--------------------------------------------------------
CREATE OR REPLACE NONEDITIONABLE TRIGGER "APP"."TG_SEQ_PRD"
BEFORE INSERT ON produto
FOR EACH ROW
BEGIN
  :new.prd_id := seq_prd.nextval;
END;

ALTER TRIGGER "APP"."TG_SEQ_PRD" ENABLE;


--------------------------------------------------------
-- Constraints for Table PRODUTO
--------------------------------------------------------
ALTER TABLE "APP"."PRODUTO" MODIFY ("PRD_ID" NOT NULL ENABLE);
ALTER TABLE "APP"."PRODUTO" MODIFY ("PRD_MAR_ID" NOT NULL ENABLE);
ALTER TABLE "APP"."PRODUTO" MODIFY ("PRD_NOME" NOT NULL ENABLE);
ALTER TABLE "APP"."PRODUTO" MODIFY ("PRD_QUANTIDADE" NOT NULL ENABLE);
ALTER TABLE "APP"."PRODUTO" MODIFY ("PRD_PRECO_CUSTO" NOT NULL ENABLE);
ALTER TABLE "APP"."PRODUTO" MODIFY ("PRD_PRECO_VENDA" NOT NULL ENABLE);

ALTER TABLE "APP"."PRODUTO"
ADD CONSTRAINT "PK_PRD"
PRIMARY KEY ("PRD_ID")
USING INDEX ENABLE;


--------------------------------------------------------
-- Foreign Key for Table PRODUTO
--------------------------------------------------------
ALTER TABLE "APP"."PRODUTO"
ADD CONSTRAINT "FK_PRD_MAR"
FOREIGN KEY ("PRD_MAR_ID")
REFERENCES "APP"."MARCA" ("MAR_ID")
ENABLE;