--------------------------------------------------------
-- DDL for Table H_PRODUTO
--------------------------------------------------------
CREATE TABLE "APP"."H_PRODUTO" (
  "HPRD_ID" NUMBER(3,0),
  "HPRD_MAR_ID" NUMBER(3,0),
  "HPRD_NOME" VARCHAR2(100),
  "HPRD_QUANTIDADE" NUMBER(8,0),
  "HPRD_PRECO_CUSTO" NUMBER(8,2),
  "HPRD_PRECO_VENDA" NUMBER(8,2),
  "HPRD_DT_ENTRADA" DATE
);


--------------------------------------------------------
-- DDL for Trigger TG_HPRD
--------------------------------------------------------
CREATE OR REPLACE NONEDITIONABLE TRIGGER "APP"."TG_HPRD"
BEFORE UPDATE OR DELETE ON produto
FOR EACH ROW
BEGIN
  INSERT INTO h_produto (
    hprd_id,
    hprd_mar_id,
    hprd_nome,
    hprd_quantidade,
    hprd_preco_custo,
    hprd_preco_venda,
    hprd_dt_entrada
  )
  VALUES (
    :old.prd_id,
    :old.prd_mar_id,
    :old.prd_nome,
    :old.prd_quantidade,
    :old.prd_preco_custo,
    :old.prd_preco_venda,
    sysdate
  );
END;

ALTER TRIGGER "APP"."TG_HPRD" ENABLE;


--------------------------------------------------------
-- Constraints for Table H_PRODUTO
--------------------------------------------------------
ALTER TABLE "APP"."H_PRODUTO" MODIFY ("HPRD_ID" NOT NULL ENABLE);
ALTER TABLE "APP"."H_PRODUTO" MODIFY ("HPRD_MAR_ID" NOT NULL ENABLE);
ALTER TABLE "APP"."H_PRODUTO" MODIFY ("HPRD_NOME" NOT NULL ENABLE);
ALTER TABLE "APP"."H_PRODUTO" MODIFY ("HPRD_QUANTIDADE" NOT NULL ENABLE);
ALTER TABLE "APP"."H_PRODUTO" MODIFY ("HPRD_PRECO_CUSTO" NOT NULL ENABLE);
ALTER TABLE "APP"."H_PRODUTO" MODIFY ("HPRD_PRECO_VENDA" NOT NULL ENABLE);
ALTER TABLE "APP"."H_PRODUTO" MODIFY ("HPRD_DT_ENTRADA" NOT NULL ENABLE);

ALTER TABLE "APP"."H_PRODUTO"
ADD CONSTRAINT "PK_HPRD"
PRIMARY KEY ("HPRD_ID", "HPRD_DT_ENTRADA")
USING INDEX ENABLE;