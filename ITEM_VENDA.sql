--------------------------------------------------------
-- DDL for Sequence SEQ_ITV
--------------------------------------------------------
CREATE SEQUENCE  "APP"."SEQ_ITV"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
-- DDL for Table ITEM_VENDA
--------------------------------------------------------
CREATE TABLE "APP"."ITEM_VENDA" (
  "ITV_ID" NUMBER(3,0),
  "ITV_VDA_ID" NUMBER(3,0),
  "ITV_PRD_ID" NUMBER(3,0),
  "ITV_QUANTIDADE" NUMBER(8,0),
  "ITV_PRECO_VENDA" NUMBER(8,2)
);


--------------------------------------------------------
-- DDL for Trigger TG_SEQ_ITV
--------------------------------------------------------
CREATE OR REPLACE NONEDITIONABLE TRIGGER "APP"."TG_SEQ_ITV"
BEFORE INSERT ON item_venda
FOR EACH ROW
BEGIN
  :new.itv_id := seq_itv.nextval;
END;

ALTER TRIGGER "APP"."TG_SEQ_ITV" ENABLE;


--------------------------------------------------------
-- Constraints for Table ITEM_VENDA
--------------------------------------------------------
ALTER TABLE "APP"."ITEM_VENDA" MODIFY ("ITV_ID" NOT NULL ENABLE);
ALTER TABLE "APP"."ITEM_VENDA" MODIFY ("ITV_VDA_ID" NOT NULL ENABLE);
ALTER TABLE "APP"."ITEM_VENDA" MODIFY ("ITV_PRD_ID" NOT NULL ENABLE);
ALTER TABLE "APP"."ITEM_VENDA" MODIFY ("ITV_QUANTIDADE" NOT NULL ENABLE);
ALTER TABLE "APP"."ITEM_VENDA" MODIFY ("ITV_PRECO_VENDA" NOT NULL ENABLE);


--------------------------------------------------------
-- Primary Key
--------------------------------------------------------
ALTER TABLE "APP"."ITEM_VENDA"
ADD CONSTRAINT "PK_ITV"
PRIMARY KEY ("ITV_ID")
USING INDEX ENABLE;


--------------------------------------------------------
-- Foreign Key para VENDA
--------------------------------------------------------
ALTER TABLE "APP"."ITEM_VENDA"
ADD CONSTRAINT "FK_ITV_VDA"
FOREIGN KEY ("ITV_VDA_ID")
REFERENCES "APP"."VENDA" ("VDA_ID")
ENABLE;


--------------------------------------------------------
-- Foreign Key para PRODUTO
--------------------------------------------------------
ALTER TABLE "APP"."ITEM_VENDA"
ADD CONSTRAINT "FK_ITV_PRD"
FOREIGN KEY ("ITV_PRD_ID")
REFERENCES "APP"."PRODUTO" ("PRD_ID")
ENABLE;