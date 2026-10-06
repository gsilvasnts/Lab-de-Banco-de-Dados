--------------------------------------------------------
-- DDL for History Trigger 
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

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APP"."TG_HMAR" BEFORE
    UPDATE OR DELETE ON marca
    FOR EACH ROW
BEGIN
    insert into h_marca values (:old.mar_id, :old.mar_nome, sysdate);
END;

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

CREATE OR REPLACE NONEDITIONABLE TRIGGER "APP"."TG_SEQ_VDA"
BEFORE INSERT ON venda
FOR EACH ROW
BEGIN
  :new.vda_id := seq_vda.nextval;
END;