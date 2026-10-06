--------------------------------------------------------
--  DDL for Sequence SEQ_AUD
--------------------------------------------------------

   CREATE SEQUENCE  "APP_AUDIT"."SEQ_AUD"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table AUDITORIA
--------------------------------------------------------

  CREATE TABLE "APP_AUDIT"."AUDITORIA" 
   (	"AUD_ID" NUMBER(6,0), 
	"AUD_TABELA" VARCHAR2(30), 
	"AUD_COLUNA" VARCHAR2(30), 
	"AUD_VALOR_ANTIGO" VARCHAR2(100), 
	"AUD_VALOR_NOVO" VARCHAR2(100), 
	"AUD_TP_OPERACAO" CHAR(1), 
	"AUD_DATA_ENTRADA" DATE, 
	"AUD_BD_USER" VARCHAR2(255), 
	"AUD_SO_USER" VARCHAR2(255)
   ) ;
--------------------------------------------------------
--  Permissions
--------------------------------------------------------
GRANT SELECT, UPDATE, DELETE ON APP.H_MARCA TO APP_AUDIT;
GRANT SELECT, UPDATE, DELETE ON APP.H_PRODUTO TO APP_AUDIT;
GRANT SELECT, UPDATE, DELETE ON APP.H_VENDA TO APP_AUDIT;
GRANT SELECT, UPDATE, DELETE ON APP.H_FORMA_PAGAMENTO TO APP_AUDIT;
GRANT SELECT, UPDATE, DELETE ON APP.H_ITEM_VENDA TO APP_AUDIT;
--------------------------------------------------------
--  DDL for Trigger TG_SEQ_AUD
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "APP_AUDIT"."TG_SEQ_AUD" BEFORE
    INSERT ON auditoria
    FOR EACH ROW
BEGIN
    :new.aud_id := seq_aud.nextval;
END;
ALTER TRIGGER "APP_AUDIT"."TG_SEQ_AUD" ENABLE;

--------------------------------------------------------
--  DDL for Procedure PR_INSERE_AUDITORIA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "APP_AUDIT"."PR_INSERE_AUDITORIA" (
    P_TABELA           IN VARCHAR2,
    P_COLUNA           IN VARCHAR2, 
    P_VALOR_ANTIGO     IN VARCHAR2,
    P_VALOR_NOVO       IN VARCHAR2,
    P_TP_OPERACAO      IN VARCHAR2,
    P_DATA_ENTRADA     IN DATE,
    P_BD_USER          IN VARCHAR2,
    P_SO_USER          IN VARCHAR2
)
IS
BEGIN
    INSERT INTO AUDITORIA (
        AUD_TABELA,
        AUD_COLUNA,
        AUD_VALOR_ANTIGO,
        AUD_VALOR_NOVO,
        AUD_TP_OPERACAO,
        AUD_DATA_ENTRADA,
        AUD_BD_USER,
        AUD_SO_USER
    )
    VALUES (
        P_TABELA,
        P_COLUNA,
        P_VALOR_ANTIGO,
        P_VALOR_NOVO,
        P_TP_OPERACAO,
        P_DATA_ENTRADA,
        P_BD_USER,
        P_SO_USER
    );
END;

--------------------------------------------------------
--  Constraints for Table AUDITORIA
--------------------------------------------------------

  ALTER TABLE "APP_AUDIT"."AUDITORIA" MODIFY ("AUD_ID" NOT NULL ENABLE);
  ALTER TABLE "APP_AUDIT"."AUDITORIA" MODIFY ("AUD_TABELA" NOT NULL ENABLE);
  ALTER TABLE "APP_AUDIT"."AUDITORIA" MODIFY ("AUD_COLUNA" NOT NULL ENABLE);
  ALTER TABLE "APP_AUDIT"."AUDITORIA" MODIFY ("AUD_TP_OPERACAO" NOT NULL ENABLE);
  ALTER TABLE "APP_AUDIT"."AUDITORIA" MODIFY ("AUD_DATA_ENTRADA" NOT NULL ENABLE);
  ALTER TABLE "APP_AUDIT"."AUDITORIA" MODIFY ("AUD_BD_USER" NOT NULL ENABLE);
  ALTER TABLE "APP_AUDIT"."AUDITORIA" MODIFY ("AUD_SO_USER" NOT NULL ENABLE);
  ALTER TABLE "APP_AUDIT"."AUDITORIA" ADD CONSTRAINT "PK_AUD" PRIMARY KEY ("AUD_ID")
  USING INDEX  ENABLE;