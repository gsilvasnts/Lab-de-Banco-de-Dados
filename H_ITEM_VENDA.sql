--------------------------------------------------------
-- DDL for Table H_ITEM_VENDA
--------------------------------------------------------
CREATE TABLE "APP"."H_ITEM_VENDA" (
  "HITV_ID" NUMBER(3,0),
  "HITV_VDA_ID" NUMBER(3,0),
  "HITV_PRD_ID" NUMBER(3,0),
  "HITV_QUANTIDADE" NUMBER(8,0),
  "HITV_PRECO_VENDA" NUMBER(8,2),
  "HITV_DT_ENTRADA" DATE
);


--------------------------------------------------------
-- DDL for Trigger TG_HITV
--------------------------------------------------------
CREATE OR REPLACE NONEDITIONABLE TRIGGER "APP"."TG_HITV"
BEFORE UPDATE OR DELETE ON item_venda
FOR EACH ROW
BEGIN
  INSERT INTO h_item_venda (
    hitv_id,
    hitv_vda_id,
    hitv_prd_id,
    hitv_quantidade,
    hitv_preco_venda,
    hitv_dt_entrada
  )
  VALUES (
    :old.itv_id,
    :old.itv_vda_id,
    :old.itv_prd_id,
    :old.itv_quantidade,
    :old.itv_preco_venda,
    sysdate
  );
END;

ALTER TRIGGER "APP"."TG_HITV" ENABLE;


--------------------------------------------------------
-- Constraints for Table H_ITEM_VENDA
--------------------------------------------------------
ALTER TABLE "APP"."H_ITEM_VENDA" MODIFY ("HITV_ID" NOT NULL ENABLE);
ALTER TABLE "APP"."H_ITEM_VENDA" MODIFY ("HITV_VDA_ID" NOT NULL ENABLE);
ALTER TABLE "APP"."H_ITEM_VENDA" MODIFY ("HITV_PRD_ID" NOT NULL ENABLE);
ALTER TABLE "APP"."H_ITEM_VENDA" MODIFY ("HITV_QUANTIDADE" NOT NULL ENABLE);
ALTER TABLE "APP"."H_ITEM_VENDA" MODIFY ("HITV_PRECO_VENDA" NOT NULL ENABLE);
ALTER TABLE "APP"."H_ITEM_VENDA" MODIFY ("HITV_DT_ENTRADA" NOT NULL ENABLE);


--------------------------------------------------------
-- Primary Key
--------------------------------------------------------
ALTER TABLE "APP"."H_ITEM_VENDA"
ADD CONSTRAINT "PK_HITV"
PRIMARY KEY ("HITV_ID", "HITV_DT_ENTRADA")
USING INDEX ENABLE;