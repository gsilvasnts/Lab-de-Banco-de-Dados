--------------------------------------------------------
-- DDL for Table H_VENDA
--------------------------------------------------------
CREATE TABLE "APP"."H_VENDA" (
  "HVDA_ID" NUMBER(3,0),
  "HVDA_DATA_HORA" DATE,
  "HVDA_VALOR_TOTAL" NUMBER(10,2),
  "HVDA_DT_ENTRADA" DATE
);


--------------------------------------------------------
-- DDL for Trigger TG_HVDA
--------------------------------------------------------
CREATE OR REPLACE NONEDITIONABLE TRIGGER "APP"."TG_HVDA"
BEFORE UPDATE OR DELETE ON venda
FOR EACH ROW
BEGIN
  INSERT INTO h_venda (
    hvda_id,
    hvda_data_hora,
    hvda_valor_total,
    hvda_dt_entrada
  )
  VALUES (
    :old.vda_id,
    :old.vda_data_hora,
    :old.vda_valor_total,
    sysdate
  );
END;

ALTER TRIGGER "APP"."TG_HVDA" ENABLE;


--------------------------------------------------------
-- Constraints for Table H_VENDA
--------------------------------------------------------
ALTER TABLE "APP"."H_VENDA" MODIFY ("HVDA_ID" NOT NULL ENABLE);
ALTER TABLE "APP"."H_VENDA" MODIFY ("HVDA_DATA_HORA" NOT NULL ENABLE);
ALTER TABLE "APP"."H_VENDA" MODIFY ("HVDA_VALOR_TOTAL" NOT NULL ENABLE);
ALTER TABLE "APP"."H_VENDA" MODIFY ("HVDA_DT_ENTRADA" NOT NULL ENABLE);

ALTER TABLE "APP"."H_VENDA"
ADD CONSTRAINT "PK_HVDA"
PRIMARY KEY ("HVDA_ID", "HVDA_DT_ENTRADA")
USING INDEX ENABLE;