--------------------------------------------------------
--  DDL for Trigger TG_AUD_HMAR
--------------------------------------------------------
CREATE OR REPLACE TRIGGER APP_AUDIT.TG_AUD_HMAR
BEFORE DELETE OR UPDATE ON APP.H_MARCA
FOR EACH ROW
DECLARE
    V_TABELA     VARCHAR2(100) := 'H_MARCA';
    V_USU_BD     VARCHAR2(30) := USER;
    V_USU_SO     VARCHAR2(255) := SYS_CONTEXT('USERENV', 'OS_USER');
    V_TP_OPERACAO CHAR(1);
BEGIN

    IF DELETING THEN

        V_TP_OPERACAO := 'D';

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA,
            'HMAR_ID',
            TO_CHAR(:OLD.HMAR_ID),
            NULL,
            V_TP_OPERACAO,
            SYSDATE,
            V_USU_BD,
            V_USU_SO
        );

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA,
            'HMAR_NOME',
            :OLD.HMAR_NOME,
            NULL,
            V_TP_OPERACAO,
            SYSDATE,
            V_USU_BD,
            V_USU_SO
        );

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA,
            'HMAR_DT_ENTRADA',
            TO_CHAR(:OLD.HMAR_DT_ENTRADA, 'DD/MM/YYYY HH24:MI:SS'),
            NULL,
            V_TP_OPERACAO,
            SYSDATE,
            V_USU_BD,
            V_USU_SO
        );

    ELSE

        V_TP_OPERACAO := 'U';

        IF :OLD.HMAR_ID <> :NEW.HMAR_ID THEN

            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA,
                'HMAR_ID',
                TO_CHAR(:OLD.HMAR_ID),
                TO_CHAR(:NEW.HMAR_ID),
                V_TP_OPERACAO,
                SYSDATE,
                V_USU_BD,
                V_USU_SO
            );

        END IF;

        IF :OLD.HMAR_NOME <> :NEW.HMAR_NOME THEN

            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA,
                'HMAR_NOME',
                :OLD.HMAR_NOME,
                :NEW.HMAR_NOME,
                V_TP_OPERACAO,
                SYSDATE,
                V_USU_BD,
                V_USU_SO
            );

        END IF;

        IF :OLD.HMAR_DT_ENTRADA <> :NEW.HMAR_DT_ENTRADA THEN

            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA,
                'HMAR_DT_ENTRADA',
                TO_CHAR(:OLD.HMAR_DT_ENTRADA, 'DD/MM/YYYY HH24:MI:SS'),
                TO_CHAR(:NEW.HMAR_DT_ENTRADA, 'DD/MM/YYYY HH24:MI:SS'),
                V_TP_OPERACAO,
                SYSDATE,
                V_USU_BD,
                V_USU_SO
            );

        END IF;

    END IF;

END;
--------------------------------------------------------
--  DDL for Trigger TG_AUD_HPRD
--------------------------------------------------------
CREATE OR REPLACE NONEDITIONABLE TRIGGER "APP_AUDIT"."TG_AUD_HPRD"
BEFORE DELETE OR UPDATE ON APP.H_PRODUTO
FOR EACH ROW
DECLARE
    V_TABELA VARCHAR(100) := 'H_PRODUTO';
    V_USU_BD VARCHAR(30);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;

    IF DELETING THEN
        V_TP_OPERACAO := 'D';

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA, 'HPRD_ID',
            :OLD.HPRD_ID, NULL,
            V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
        );

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA, 'HPRD_MAR_ID',
            :OLD.HPRD_MAR_ID, NULL,
            V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
        );

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA, 'HPRD_NOME',
            :OLD.HPRD_NOME, NULL,
            V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
        );

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA, 'HPRD_QUANTIDADE',
            :OLD.HPRD_QUANTIDADE, NULL,
            V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
        );

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA, 'HPRD_PRECO_CUSTO',
            :OLD.HPRD_PRECO_CUSTO, NULL,
            V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
        );

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA, 'HPRD_PRECO_VENDA',
            :OLD.HPRD_PRECO_VENDA, NULL,
            V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
        );

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA, 'HPRD_DT_ENTRADA',
            :OLD.HPRD_DT_ENTRADA, NULL,
            V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
        );

    ELSE
        V_TP_OPERACAO := 'U';

        IF (:OLD.HPRD_ID <> :NEW.HPRD_ID) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA, 'HPRD_ID',
                :OLD.HPRD_ID, :NEW.HPRD_ID,
                V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
            );
        END IF;

        IF (:OLD.HPRD_MAR_ID <> :NEW.HPRD_MAR_ID)
            OR (:OLD.HPRD_MAR_ID IS NULL AND :NEW.HPRD_MAR_ID IS NOT NULL)
            OR (:OLD.HPRD_MAR_ID IS NOT NULL AND :NEW.HPRD_MAR_ID IS NULL)
        THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA, 'HPRD_MAR_ID',
                :OLD.HPRD_MAR_ID, :NEW.HPRD_MAR_ID,
                V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
            );
        END IF;

        IF (:OLD.HPRD_NOME <> :NEW.HPRD_NOME) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA, 'HPRD_NOME',
                :OLD.HPRD_NOME, :NEW.HPRD_NOME,
                V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
            );
        END IF;

        IF (:OLD.HPRD_QUANTIDADE <> :NEW.HPRD_QUANTIDADE) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA, 'HPRD_QUANTIDADE',
                :OLD.HPRD_QUANTIDADE, :NEW.HPRD_QUANTIDADE,
                V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
            );
        END IF;

        IF (:OLD.HPRD_PRECO_CUSTO <> :NEW.HPRD_PRECO_CUSTO) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA, 'HPRD_PRECO_CUSTO',
                :OLD.HPRD_PRECO_CUSTO, :NEW.HPRD_PRECO_CUSTO,
                V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
            );
        END IF;

        IF (:OLD.HPRD_PRECO_VENDA <> :NEW.HPRD_PRECO_VENDA) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA, 'HPRD_PRECO_VENDA',
                :OLD.HPRD_PRECO_VENDA, :NEW.HPRD_PRECO_VENDA,
                V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
            );
        END IF;

        IF (:OLD.HPRD_DT_ENTRADA <> :NEW.HPRD_DT_ENTRADA) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA, 'HPRD_DT_ENTRADA',
                :OLD.HPRD_DT_ENTRADA, :NEW.HPRD_DT_ENTRADA,
                V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
            );
        END IF;
    END IF;
END;
ALTER TRIGGER "APP_AUDIT"."TG_AUD_HPRD" ENABLE;

--------------------------------------------------------
--  DDL for Trigger TG_AUD_HVDA
--------------------------------------------------------
CREATE OR REPLACE NONEDITIONABLE TRIGGER "APP_AUDIT"."TG_AUD_HVDA"
BEFORE DELETE OR UPDATE ON APP.H_VENDA
FOR EACH ROW
DECLARE
    V_TABELA VARCHAR(100) := 'H_VENDA';
    V_USU_BD VARCHAR(30);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;

    IF DELETING THEN
        V_TP_OPERACAO := 'D';

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA, 'HVDA_ID',
            :OLD.HVDA_ID, NULL,
            V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
        );

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA, 'HVDA_DATA_HORA_VENDA',
            :OLD.HVDA_DATA_HORA_VENDA, NULL,
            V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
        );

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA, 'HVDA_VALOR_TOTAL',
            :OLD.HVDA_VALOR_TOTAL, NULL,
            V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
        );

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA, 'HVDA_DT_ENTRADA',
            :OLD.HVDA_DT_ENTRADA, NULL,
            V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
        );

    ELSE
        V_TP_OPERACAO := 'U';

        IF (:OLD.HVDA_ID <> :NEW.HVDA_ID) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA, 'HVDA_ID',
                :OLD.HVDA_ID, :NEW.HVDA_ID,
                V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
            );
        END IF;

        IF (:OLD.HVDA_DATA_HORA_VENDA <> :NEW.HVDA_DATA_HORA_VENDA) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA, 'HVDA_DATA_HORA_VENDA',
                :OLD.HVDA_DATA_HORA_VENDA, :NEW.HVDA_DATA_HORA_VENDA,
                V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
            );
        END IF;

        IF (:OLD.HVDA_VALOR_TOTAL <> :NEW.HVDA_VALOR_TOTAL) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA, 'HVDA_VALOR_TOTAL',
                :OLD.HVDA_VALOR_TOTAL, :NEW.HVDA_VALOR_TOTAL,
                V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
            );
        END IF;

        IF (:OLD.HVDA_DT_ENTRADA <> :NEW.HVDA_DT_ENTRADA) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA, 'HVDA_DT_ENTRADA',
                :OLD.HVDA_DT_ENTRADA, :NEW.HVDA_DT_ENTRADA,
                V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
            );
        END IF;
    END IF;
END;
ALTER TRIGGER "APP_AUDIT"."TG_AUD_HVDA" ENABLE;

--------------------------------------------------------
--  DDL for Trigger TG_AUD_HITV
--------------------------------------------------------
CREATE OR REPLACE NONEDITIONABLE TRIGGER "APP_AUDIT"."TG_AUD_HITV"
BEFORE DELETE OR UPDATE ON APP.H_ITEM_VENDA
FOR EACH ROW
DECLARE
    V_TABELA VARCHAR(100) := 'H_ITEM_VENDA';
    V_USU_BD VARCHAR(30);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;

    IF DELETING THEN
        V_TP_OPERACAO := 'D';

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA, 'HITV_ID',
            :OLD.HITV_ID, NULL,
            V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
        );

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA, 'HITV_VDA_ID',
            :OLD.HITV_VDA_ID, NULL,
            V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
        );

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA, 'HITV_PRD_ID',
            :OLD.HITV_PRD_ID, NULL,
            V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
        );

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA, 'HITV_QUANTIDADE',
            :OLD.HITV_QUANTIDADE, NULL,
            V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
        );

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA, 'HITV_PRECO_VENDA',
            :OLD.HITV_PRECO_VENDA, NULL,
            V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
        );

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA, 'HITV_DT_ENTRADA',
            :OLD.HITV_DT_ENTRADA, NULL,
            V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
        );

    ELSE
        V_TP_OPERACAO := 'U';

        IF (:OLD.HITV_ID <> :NEW.HITV_ID) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA, 'HITV_ID',
                :OLD.HITV_ID, :NEW.HITV_ID,
                V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
            );
        END IF;

        IF (:OLD.HITV_VDA_ID <> :NEW.HITV_VDA_ID) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA, 'HITV_VDA_ID',
                :OLD.HITV_VDA_ID, :NEW.HITV_VDA_ID,
                V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
            );
        END IF;

        IF (:OLD.HITV_PRD_ID <> :NEW.HITV_PRD_ID) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA, 'HITV_PRD_ID',
                :OLD.HITV_PRD_ID, :NEW.HITV_PRD_ID,
                V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
            );
        END IF;

        IF (:OLD.HITV_QUANTIDADE <> :NEW.HITV_QUANTIDADE) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA, 'HITV_QUANTIDADE',
                :OLD.HITV_QUANTIDADE, :NEW.HITV_QUANTIDADE,
                V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
            );
        END IF;

        IF (:OLD.HITV_PRECO_VENDA <> :NEW.HITV_PRECO_VENDA) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA, 'HITV_PRECO_VENDA',
                :OLD.HITV_PRECO_VENDA, :NEW.HITV_PRECO_VENDA,
                V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
            );
        END IF;

        IF (:OLD.HITV_DT_ENTRADA <> :NEW.HITV_DT_ENTRADA) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA, 'HITV_DT_ENTRADA',
                :OLD.HITV_DT_ENTRADA, :NEW.HITV_DT_ENTRADA,
                V_TP_OPERACAO, SYSDATE, V_USU_BD, V_USU_SO
            );
        END IF;
    END IF;
END;
ALTER TRIGGER "APP_AUDIT"."TG_AUD_HITV" ENABLE;

--------------------------------------------------------
--  DDL for Trigger TG_AUD_HFPG
--------------------------------------------------------
CREATE OR REPLACE NONEDITIONABLE TRIGGER "APP_AUDIT"."TG_AUD_HFPG"
BEFORE DELETE OR UPDATE ON APP.H_FORMA_PAGAMENTO
FOR EACH ROW
DECLARE
    V_TABELA VARCHAR(100) := 'H_FORMA_PAGAMENTO';
    V_USU_BD VARCHAR(30);
    V_USU_SO VARCHAR(255) := SYS_CONTEXT('USERENV','OS_USER');
    V_TP_OPERACAO CHAR(1);
BEGIN
    SELECT USER INTO V_USU_BD FROM DUAL;

    IF DELETING THEN
        V_TP_OPERACAO := 'D';

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA,
            'HFPG_ID',
            :OLD.HFPG_ID,
            NULL,
            V_TP_OPERACAO,
            SYSDATE,
            V_USU_BD,
            V_USU_SO
        );

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA,
            'HFPG_NOME',
            :OLD.HFPG_NOME,
            NULL,
            V_TP_OPERACAO,
            SYSDATE,
            V_USU_BD,
            V_USU_SO
        );

        APP_AUDIT.PR_INSERE_AUDITORIA(
            V_TABELA,
            'HFPG_DT_ENTRADA',
            :OLD.HFPG_DT_ENTRADA,
            NULL,
            V_TP_OPERACAO,
            SYSDATE,
            V_USU_BD,
            V_USU_SO
        );

    ELSE
        V_TP_OPERACAO := 'U';

        IF (:OLD.HFPG_ID <> :NEW.HFPG_ID) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA,
                'HFPG_ID',
                :OLD.HFPG_ID,
                :NEW.HFPG_ID,
                V_TP_OPERACAO,
                SYSDATE,
                V_USU_BD,
                V_USU_SO
            );
        END IF;

        IF (:OLD.HFPG_NOME <> :NEW.HFPG_NOME) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA,
                'HFPG_NOME',
                :OLD.HFPG_NOME,
                :NEW.HFPG_NOME,
                V_TP_OPERACAO,
                SYSDATE,
                V_USU_BD,
                V_USU_SO
            );
        END IF;

        IF (:OLD.HFPG_DT_ENTRADA <> :NEW.HFPG_DT_ENTRADA) THEN
            APP_AUDIT.PR_INSERE_AUDITORIA(
                V_TABELA,
                'HFPG_DT_ENTRADA',
                :OLD.HFPG_DT_ENTRADA,
                :NEW.HFPG_DT_ENTRADA,
                V_TP_OPERACAO,
                SYSDATE,
                V_USU_BD,
                V_USU_SO
            );
        END IF;

    END IF;
END;
ALTER TRIGGER "APP_AUDIT"."TG_AUD_HFPG" ENABLE;