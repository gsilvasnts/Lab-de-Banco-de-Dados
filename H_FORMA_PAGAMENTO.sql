--------------------------------------------------------
-- DDL for Table H_FORMA_PAGAMENTO
--------------------------------------------------------
CREATE TABLE "APP"."H_FORMA_PAGAMENTO" (
  "HFPG_ID" NUMBER(3,0),
  "HFPG_NOME" VARCHAR2(100),
  "HFPG_DT_ENTRADA" DATE
);

--------------------------------------------------------
-- DDL for Trigger TG_HFPG
--------------------------------------------------------
CREATE OR REPLACE NONEDITIONABLE TRIGGER "APP"."TG_HFPG"
BEFORE UPDATE OR DELETE ON forma_pagamento
FOR EACH ROW
BEGIN
  INSERT INTO h_forma_pagamento (
    hfpg_id,
    hfpg_nome,
    hfpg_dt_entrada
  )
  VALUES (
    :old.fpg_id,
    :old.fpg_nome,
    sysdate
  );
END;

ALTER TRIGGER "APP"."TG_HFPG" ENABLE;

--------------------------------------------------------
-- Constraints for Table H_FORMA_PAGAMENTO
--------------------------------------------------------
ALTER TABLE "APP"."H_FORMA_PAGAMENTO" MODIFY ("HFPG_ID" NOT NULL ENABLE);
ALTER TABLE "APP"."H_FORMA_PAGAMENTO" MODIFY ("HFPG_NOME" NOT NULL ENABLE);
ALTER TABLE "APP"."H_FORMA_PAGAMENTO" MODIFY ("HFPG_DT_ENTRADA" NOT NULL ENABLE);

ALTER TABLE "APP"."H_FORMA_PAGAMENTO"
ADD CONSTRAINT "PK_HFPG"
PRIMARY KEY ("HFPG_ID", "HFPG_DT_ENTRADA")
USING INDEX ENABLE;