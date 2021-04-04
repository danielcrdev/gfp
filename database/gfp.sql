-- ==========================================================================================
-- ==========================================================================================
-- ==========================================================================================
--
-- Bases Serviço: Orçamento
-- Schema		: DBORCA
--
-- ==========================================================================================
-- ==========================================================================================
-- ==========================================================================================

	SELECT * FROM DBORCA.ORCAM;
	SELECT * FROM DBORCA.LIN_ORCAM;
	SELECT * FROM DBORCA.LIN_ORCAM_DADO_ADCIO;
	
	SELECT * FROM DBORCA.LIBRC_LIN_ORCAM;
	SELECT * FROM DBORCA.LIBRC_LIN_ORCAM_RECTA;
	
	SELECT * FROM DBORCA.TPO_DADO_ADCIO;
	SELECT * FROM DBORCA.DSTNO_RECTA;
	SELECT * FROM DBORCA.PDRAO_PER_DSTNO_RECTA;
	
	-- Bases de Domínio
	SELECT * FROM DBORCA.NATUZ_LIN_ORCAM;
	SELECT * FROM DBORCA.NVEL_LIN_ORCAM;
	SELECT * FROM DBORCA.SIT_ORCAM;
	SELECT * FROM DBORCA.FORMT_DADO;

-- ==========================================================================================
--
-- Inserts das bases de Domínio - Orçamento
--
-- ==========================================================================================

	DELETE 	 FROM DBORCA.SIT_ORCAM;
	SELECT * FROM DBORCA.SIT_ORCAM;

	INSERT INTO DBORCA.SIT_ORCAM
	(ID_SIT_ORCAM, DES_SIT_ORCAM)
	VALUES
	('A', 'Orçamento Aberto'),
	('F', 'Orçamento Fechado');

	COMMIT;

---------------------------------------------------------------------------------------------

	DELETE   FROM DBORCA.NVEL_LIN_ORCAM;
	SELECT * FROM DBORCA.NVEL_LIN_ORCAM;

	INSERT INTO DBORCA.NVEL_LIN_ORCAM
	(ID_NVEL_LIN_ORCAM, DES_NVEL_LIN_ORCAM)
	VALUES
	('TP', 'Tópico'),
	('ST', 'Sub Tópico'),
	('LD', 'Linha Detalhe');

	COMMIT;

---------------------------------------------------------------------------------------------


	DELETE   FROM DBORCA.FORMT_DADO;
	SELECT * FROM DBORCA.FORMT_DADO;

	INSERT INTO DBORCA.FORMT_DADO
	(ID_FORMT_DADO, DES_FORMT_DADO, EXEMP_FORMT)
	VALUES
	(1, 'Texto', 'XXXXXXXX'),
	(2, 'Numero inteiro', '999999'),
	(3, 'Numero Decimal com 2 Casas Decimais', '99999,99'),
	(4, 'Data', '2021-01-01'),
	(5, 'Arquivo', 'host\loca\arquivo.doc'),
	(6, 'Link', 'https:\\url\arquivo.html'),
	(7, 'Imagem', 'host\loca\arquivo.jpg');

	COMMIT;

---------------------------------------------------------------------------------------------

	DELETE   FROM DBORCA.NATUZ_LIN_ORCAM;
	SELECT * FROM DBORCA.NATUZ_LIN_ORCAM;
	
	INSERT INTO DBORCA.NATUZ_LIN_ORCAM
	(COD_NATUZ_LIN_ORCAM, DES_NATUZ_LIN_ORCAM)
	VALUES
	('R', 'Receita'),
	('D', 'Despesa');

	COMMIT;

-- ==========================================================================================
--
-- Criação das bases
--
-- ==========================================================================================

DROP TABLE DBORCA.DSTNO_RECTA;

DROP TABLE DBORCA.FORMT_DADO;

DROP TABLE DBORCA.LIBRC_LIN_ORCAM;

DROP TABLE DBORCA.LIBRC_LIN_ORCAM_RECTA;

DROP TABLE DBORCA.LIN_ORCAM;

DROP TABLE DBORCA.LIN_ORCAM_DADO_ADCIO;

DROP TABLE DBORCA.NATUZ_LIN_ORCAM;

DROP TABLE DBORCA.NVEL_LIN_ORCAM;

DROP TABLE DBORCA.ORCAM;

DROP TABLE DBORCA.PDRAO_PER_DSTNO_RECTA;

DROP TABLE DBORCA.SIT_ORCAM;

DROP TABLE DBORCA.TPO_DADO_ADCIO;

CREATE TABLE DBORCA.DSTNO_RECTA (
		ID_ORCAM BIGINT NOT NULL, 
		ID_DSTNO_RECTA SMALLINT NOT NULL, 
		DES_DSTNO_RECTA VARCHAR(250) NOT NULL,
		PRIMARY KEY (ID_ORCAM, ID_DSTNO_RECTA)
	);

CREATE TABLE DBORCA.FORMT_DADO (
		ID_FORMT_DADO SMALLINT NOT NULL, 
		DES_FORMT_DADO VARCHAR(250) NOT NULL, 
		EXEMP_FORMT VARCHAR(250),
		PRIMARY KEY (ID_FORMT_DADO)
	);

CREATE TABLE DBORCA.LIBRC_LIN_ORCAM (
		ID_ORCAM BIGINT NOT NULL, 
		ID_LIN_ORCAM BIGINT NOT NULL, 
		DAT_LIN_ORCAM DATE NOT NULL, 
		VAL_LIN_ORCAM DECIMAL(15 , 2) NOT NULL, 
		DES_COMEN VARCHAR(250) NOT NULL,
		PRIMARY KEY (ID_ORCAM, ID_LIN_ORCAM, DAT_LIN_ORCAM)
	);

CREATE TABLE DBORCA.LIBRC_LIN_ORCAM_RECTA (
		ID_ORCAM BIGINT NOT NULL, 
		ID_LIN_ORCAM BIGINT NOT NULL, 
		DAT_LIN_ORCAM DATE NOT NULL, 
		ID_DSTNO_RECTA SMALLINT NOT NULL,
		PRIMARY KEY (ID_ORCAM, ID_LIN_ORCAM, DAT_LIN_ORCAM)
	);

CREATE TABLE DBORCA.LIN_ORCAM (
		ID_ORCAM BIGINT NOT NULL, 
		ID_LIN_ORCAM BIGINT NOT NULL, 
		ID_LIN_ORCAM_PAI BIGINT, 
		ID_NVEL_LIN_ORCAM VARCHAR(2) NOT NULL, 
		COD_NATUZ_LIN_ORCAM VARCHAR(1) NOT NULL, 
		COD_LIN_ORCAM VARCHAR(10) NOT NULL, 
		DES_LIN_ORCAM VARCHAR(250) NOT NULL,
		PRIMARY KEY (ID_ORCAM, ID_LIN_ORCAM)
	);

CREATE TABLE DBORCA.LIN_ORCAM_DADO_ADCIO (
		ID_ORCAM BIGINT NOT NULL, 
		ID_LIN_ORCAM BIGINT NOT NULL, 
		ID_TPO_DADO_ADCIO SMALLINT NOT NULL, 
		IND_DADO_OBRIG VARCHAR(1) NOT NULL,
		PRIMARY KEY (ID_ORCAM, ID_LIN_ORCAM, ID_TPO_DADO_ADCIO)
	);

CREATE TABLE DBORCA.NATUZ_LIN_ORCAM (
		COD_NATUZ_LIN_ORCAM VARCHAR(1) NOT NULL, 
		DES_NATUZ_LIN_ORCAM VARCHAR(250) NOT NULL,
		PRIMARY KEY (COD_NATUZ_LIN_ORCAM)
	);

CREATE TABLE DBORCA.NVEL_LIN_ORCAM (
		ID_NVEL_LIN_ORCAM VARCHAR(2) NOT NULL, 
		DES_NVEL_LIN_ORCAM VARCHAR(250) NOT NULL,
		PRIMARY KEY (ID_NVEL_LIN_ORCAM)
	);

CREATE TABLE DBORCA.ORCAM (
		ID_ORCAM BIGINT NOT NULL, 
		ID_SIT_ORCAM SMALLINT NOT NULL, 
		DES_ORCAM VARCHAR(250) NOT NULL, 
		DAT_INI_EXERC DATE NOT NULL, 
		DAT_FIM_EXERC DATE NOT NULL,
		PRIMARY KEY (ID_ORCAM)
	);

CREATE TABLE DBORCA.PDRAO_PER_DSTNO_RECTA (
		ID_ORCAM BIGINT NOT NULL, 
		ID_LIN_ORCAM BIGINT NOT NULL, 
		ID_DSTNO_RECTA SMALLINT NOT NULL, 
		VAL_PERC DECIMAL(5 , 2) NOT NULL,
		PRIMARY KEY (ID_ORCAM, ID_LIN_ORCAM, ID_DSTNO_RECTA)
	);

CREATE TABLE DBORCA.SIT_ORCAM (
		ID_SIT_ORCAM VARCHAR(2) NOT NULL, 
		DES_SIT_ORCAM VARCHAR(250) NOT NULL,
		PRIMARY KEY (ID_SIT_ORCAM)
	);

CREATE TABLE DBORCA.TPO_DADO_ADCIO (
		ID_ORCAM BIGINT NOT NULL, 
		ID_TPO_DADO_ADCIO SMALLINT NOT NULL, 
		ID_FORMT_DADO SMALLINT NOT NULL, 
		DES_TPO_DADO_ADCIO VARCHAR(250) NOT NULL,
		PRIMARY KEY (ID_ORCAM, ID_TPO_DADO_ADCIO)
	);





-- ==========================================================================================
-- ==========================================================================================
-- ==========================================================================================
--
-- Bases Serviço: Movimento Financeiro
-- Schema		: DBMVFN
--
-- ==========================================================================================
-- ==========================================================================================
-- ==========================================================================================

	SELECT * FROM DBMVFN.MOVTO_FINCR;
	SELECT * FROM DBMVFN.TRANS_MOVTO_FINCR;
	SELECT * FROM DBMVFN.VNCLO_TRANS_LIN_ORCAM;
	SELECT * FROM DBMVFN.VNCLO_TRANS_DADO_ADCIO;

	-- Transações não vinculadas
	SELECT T.* 
	FROM DBMVFN.TRANS_MOVTO_FINCR T
	LEFT JOIN	DBMVFN.VNCLO_TRANS_LIN_ORCAM V 
		   ON	V.ID_MOVTO_FINCR = T.ID_MOVTO_FINCR
		   AND	V.NR_SEQ_TRANS	 = T.NR_SEQ_TRANS
	WHERE V.ID_MOVTO_FINCR IS NULL
	;

	-- Bases de Domínio
	SELECT * FROM DBMVFN.SIT_TRANS;
	SELECT * FROM DBORCA.TPO_DADO_ADCIO;

-- ==========================================================================================
--
-- Inserts das bases de Domínio - Movimento Financeiro
--
-- ==========================================================================================

	DELETE 	 FROM DBMVFN.SIT_TRANS;
	SELECT * FROM DBMVFN.SIT_TRANS;

	INSERT INTO DBMVFN.SIT_TRANS
	(COD_SIT_TRANS, DES_SIT_TRANS)
	VALUES
	('P', 'Pendente'),
	('E', 'Efetivado');

	COMMIT;

-- ==========================================================================================
--
-- Criação das bases - Movimento Financeiro
--
-- ==========================================================================================

DROP TABLE DBMVFN.MOVTO_FINCR;

DROP TABLE DBMVFN.TRANS_MOVTO_FINCR;

DROP TABLE DBMVFN.VNCLO_TRANS_LIN_ORCAM;

DROP TABLE DBMVFN.VNCLO_TRANS_DADO_ADCIO;

DROP TABLE DBMVFN.SIT_TRANS;

CREATE TABLE DBMVFN.MOVTO_FINCR (
	ID_MOVTO_FINCR BIGINT NOT NULL,
	ID_ORCAM BIGINT NOT NULL,
	PRIMARY KEY (ID_MOVTO_FINCR)
);

CREATE TABLE DBMVFN.TRANS_MOVTO_FINCR (
	ID_MOVTO_FINCR BIGINT NOT NULL,
	NR_SEQ_TRANS BIGINT NOT NULL,
	COD_SIT_TRANS VARCHAR(2) NOT NULL,
	DES_TRANS VARCHAR(250) NOT NULL,
	VAL_TRANS DECIMAL(15 , 2) NOT NULL,
	DAT_TRANS DATE NOT NULL,
	DES_OBS_TRANS VARCHAR(250),
	PRIMARY KEY (ID_MOVTO_FINCR,NR_SEQ_TRANS)
);

CREATE TABLE DBMVFN.VNCLO_TRANS_LIN_ORCAM (
	ID_MOVTO_FINCR BIGINT NOT NULL,
	NR_SEQ_TRANS BIGINT NOT NULL,
	ID_ORCAM BIGINT NOT NULL,
	ID_LIN_ORCAM BIGINT NOT NULL,
	DAT_VNCLO DATE NOT NULL,
	PRIMARY KEY (ID_MOVTO_FINCR,NR_SEQ_TRANS,ID_ORCAM,ID_LIN_ORCAM)
);

CREATE TABLE DBMVFN.VNCLO_TRANS_DADO_ADCIO (
	ID_MOVTO_FINCR BIGINT NOT NULL,
	NR_SEQ_TRANS BIGINT NOT NULL,
	ID_ORCAM BIGINT NOT NULL,
	ID_LIN_ORCAM BIGINT NOT NULL,
	NR_SEQ_DADO_ADCIO INT NOT NULL,
	ID_TPO_DADO_ADCIO SMALLINT,
	VAL_TEXTO VARCHAR(250),
	VAL_INTEI BIGINT,
	VAL_DECML DECIMAL(15 , 2),
	VAL_DAT DATE,
	PRIMARY KEY (ID_MOVTO_FINCR,NR_SEQ_TRANS,ID_ORCAM,ID_LIN_ORCAM,NR_SEQ_DADO_ADCIO)
);

CREATE TABLE DBMVFN.SIT_TRANS (
	COD_SIT_TRANS VARCHAR(2) NOT NULL,
	DES_SIT_TRANS VARCHAR(250),
	PRIMARY KEY (COD_SIT_TRANS)
);












