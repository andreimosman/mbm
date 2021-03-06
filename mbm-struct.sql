--
-- PostgreSQL database dump
--

SET search_path = public, pg_catalog;

--
-- TOC entry 11 (OID 16979)
-- Name: ustb_admin; Type: TABLE; Schema: public; Owner: mbm
--

CREATE TABLE ustb_admin (
    uid serial NOT NULL,
    login character varying(20) NOT NULL,
    senha character varying(64) NOT NULL,
    tipo_conta character(1)
);


--
-- TOC entry 12 (OID 16984)
-- Name: lgtb_log; Type: TABLE; Schema: public; Owner: mbm
--

CREATE TABLE lgtb_log (
    lid serial NOT NULL,
    uid integer NOT NULL,
    data_hora timestamp with time zone DEFAULT now(),
    ipaddr inet,
    tipo_mensagem character varying(20),
    mensagem text
);


--
-- TOC entry 13 (OID 16991)
-- Name: bmtb_interface; Type: TABLE; Schema: public; Owner: mbm
--

CREATE TABLE bmtb_interface (
    interface character varying(10) NOT NULL,
    tipo_interface character(1) DEFAULT 'S',
    banda smallint DEFAULT 0,
    tipo_banda character(1)
);


--
-- TOC entry 14 (OID 16995)
-- Name: bmtb_ip; Type: TABLE; Schema: public; Owner: mbm
--

CREATE TABLE bmtb_ip (
    ipaddr inet NOT NULL,
    interface_externa character varying(10) NOT NULL,
    banda_up smallint NOT NULL,
    tipo_banda_up character(1),
    interface_interna character varying(10) NOT NULL,
    banda_down smallint,
    tipo_banda_down character(1)
);


--
-- TOC entry 15 (OID 17000)
-- Name: bmtb_cliente; Type: TABLE; Schema: public; Owner: mbm
--

CREATE TABLE bmtb_cliente (
    username character varying(15) NOT NULL,
    senha character varying(32),
    ipaddr inet NOT NULL,
    mac macaddr,
    status character(1) DEFAULT 'A',
    pppoe boolean
);


--
-- TOC entry 16 (OID 17006)
-- Name: bmtb_servico; Type: TABLE; Schema: public; Owner: mbm
--

CREATE TABLE bmtb_servico (
    servico character varying(15) NOT NULL,
    porta smallint
);


--
-- TOC entry 17 (OID 17008)
-- Name: bmtb_cliente_servico; Type: TABLE; Schema: public; Owner: mbm
--

CREATE TABLE bmtb_cliente_servico (
    username character varying(15) NOT NULL,
    servico character varying(15) NOT NULL,
    banda_up smallint,
    tipo_banda_up character(1),
    banda_down smallint,
    tipo_banda_down character(1)
);


--
-- TOC entry 18 (OID 17010)
-- Name: bmtb_cliente_info; Type: TABLE; Schema: public; Owner: mbm
--

CREATE TABLE bmtb_cliente_info (
    username character varying(15) NOT NULL,
    nome_razao character varying(50),
    tp_pessoa character(1),
    cpf_cnpj character varying(25),
    rg_ie character varying(25),
    logradouro character varying(25),
    numero character varying(8),
    complemento character varying(20),
    bairro character varying(25),
    cidade character varying(25),
    uf character(2),
    cep character(9),
    fone character(20),
    dt_ativacao date,
    resp_tecnico character varying(25),
    email character varying(255),
    flg_comodato boolean,
    flg_gw_isp boolean,
    tipo_conexao character(1),
    observacoes text
);


--
-- TOC entry 2 (OID 17015)
-- Name: rdtb_nas_id_seq; Type: SEQUENCE; Schema: public; Owner: mbm
--

CREATE SEQUENCE rdtb_nas_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 9223372036854775807
    MINVALUE 1
    CACHE 1;


--
-- TOC entry 19 (OID 17017)
-- Name: rdtb_nas; Type: TABLE; Schema: public; Owner: mbm
--

CREATE TABLE rdtb_nas (
    id integer DEFAULT nextval('"rdtb_nas_id_seq"'::text) NOT NULL,
    nasname character varying(128),
    shortname character varying(32),
    ipaddr character varying(15),
    "type" character varying(30),
    ports integer,
    secret character varying(60),
    community character varying(50),
    snmp character varying(10)
);


--
-- TOC entry 3 (OID 17020)
-- Name: rdtb_radacct_radacctid_seq; Type: SEQUENCE; Schema: public; Owner: mbm
--

CREATE SEQUENCE rdtb_radacct_radacctid_seq
    START 1
    INCREMENT 1
    MAXVALUE 9223372036854775807
    MINVALUE 1
    CACHE 1;


--
-- TOC entry 20 (OID 17022)
-- Name: rdtb_radacct; Type: TABLE; Schema: public; Owner: mbm
--

CREATE TABLE rdtb_radacct (
    radacctid integer DEFAULT nextval('"rdtb_radacct_radacctid_seq"'::text) NOT NULL,
    acctsessionid character varying(32) DEFAULT '' NOT NULL,
    acctuniqueid character varying(32) DEFAULT '' NOT NULL,
    username character varying(32) DEFAULT '' NOT NULL,
    realm character varying(30) DEFAULT '',
    nasipaddress character varying(15) DEFAULT '' NOT NULL,
    nasportid numeric(12,0),
    nasporttype character varying(32),
    acctstarttime timestamp without time zone,
    acctstoptime timestamp without time zone,
    acctsessiontime numeric(12,0),
    acctauthentic character varying(32),
    connectinfo_start character varying(32),
    connectinfo_stop character varying(32),
    acctinputoctets numeric(12,0),
    acctoutputoctets numeric(12,0),
    calledstationid character varying(10) DEFAULT '' NOT NULL,
    callingstationid character varying(10) DEFAULT '' NOT NULL,
    acctterminatecause character varying(32) DEFAULT '' NOT NULL,
    servicetype character varying(32),
    framedprotocol character varying(32),
    framedipaddress character varying(15) DEFAULT '' NOT NULL,
    acctstartdelay numeric(12,0),
    acctstopdelay numeric(12,0)
);


--
-- TOC entry 4 (OID 17034)
-- Name: rdtb_radcheck_id_seq; Type: SEQUENCE; Schema: public; Owner: mbm
--

CREATE SEQUENCE rdtb_radcheck_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 9223372036854775807
    MINVALUE 1
    CACHE 1;


--
-- TOC entry 21 (OID 17036)
-- Name: rdtb_radcheck; Type: TABLE; Schema: public; Owner: mbm
--

CREATE TABLE rdtb_radcheck (
    id integer DEFAULT nextval('"rdtb_radcheck_id_seq"'::text) NOT NULL,
    username character varying(30) DEFAULT '' NOT NULL,
    attribute character varying(30),
    op character varying(2) NOT NULL,
    value character varying(40)
);


--
-- TOC entry 5 (OID 17040)
-- Name: rdtb_radgroupcheck_id_seq; Type: SEQUENCE; Schema: public; Owner: mbm
--

CREATE SEQUENCE rdtb_radgroupcheck_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 9223372036854775807
    MINVALUE 1
    CACHE 1;


--
-- TOC entry 22 (OID 17042)
-- Name: rdtb_radgroupcheck; Type: TABLE; Schema: public; Owner: mbm
--

CREATE TABLE rdtb_radgroupcheck (
    id integer DEFAULT nextval('"rdtb_radgroupcheck_id_seq"'::text) NOT NULL,
    groupname character varying(20) DEFAULT '' NOT NULL,
    attribute character varying(40),
    op character varying(2) NOT NULL,
    value character varying(40)
);


--
-- TOC entry 6 (OID 17046)
-- Name: rdtb_radgroupreply_id_seq; Type: SEQUENCE; Schema: public; Owner: mbm
--

CREATE SEQUENCE rdtb_radgroupreply_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 9223372036854775807
    MINVALUE 1
    CACHE 1;


--
-- TOC entry 23 (OID 17048)
-- Name: rdtb_radgroupreply; Type: TABLE; Schema: public; Owner: mbm
--

CREATE TABLE rdtb_radgroupreply (
    id integer DEFAULT nextval('"rdtb_radgroupreply_id_seq"'::text) NOT NULL,
    groupname character varying(20) DEFAULT '' NOT NULL,
    attribute character varying(40),
    op character varying(2) NOT NULL,
    value character varying(40)
);


--
-- TOC entry 7 (OID 17052)
-- Name: rdtb_radreply_id_seq; Type: SEQUENCE; Schema: public; Owner: mbm
--

CREATE SEQUENCE rdtb_radreply_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 9223372036854775807
    MINVALUE 1
    CACHE 1;


--
-- TOC entry 24 (OID 17054)
-- Name: rdtb_radreply; Type: TABLE; Schema: public; Owner: mbm
--

CREATE TABLE rdtb_radreply (
    id integer DEFAULT nextval('"rdtb_radreply_id_seq"'::text) NOT NULL,
    username character varying(30) DEFAULT '' NOT NULL,
    attribute character varying(30),
    op character varying(2) NOT NULL,
    value character varying(40)
);


--
-- TOC entry 8 (OID 17058)
-- Name: rdtb_usergroup_id_seq; Type: SEQUENCE; Schema: public; Owner: mbm
--

CREATE SEQUENCE rdtb_usergroup_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 9223372036854775807
    MINVALUE 1
    CACHE 1;


--
-- TOC entry 25 (OID 17060)
-- Name: rdtb_usergroup; Type: TABLE; Schema: public; Owner: mbm
--

CREATE TABLE rdtb_usergroup (
    id integer DEFAULT nextval('"rdtb_usergroup_id_seq"'::text) NOT NULL,
    username character varying(30) DEFAULT '' NOT NULL,
    groupname character varying(30)
);


--
-- TOC entry 9 (OID 17064)
-- Name: rdtb_realmgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: mbm
--

CREATE SEQUENCE rdtb_realmgroup_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 9223372036854775807
    MINVALUE 1
    CACHE 1;


--
-- TOC entry 26 (OID 17066)
-- Name: rdtb_realmgroup; Type: TABLE; Schema: public; Owner: mbm
--

CREATE TABLE rdtb_realmgroup (
    id integer DEFAULT nextval('"rdtb_realmgroup_id_seq"'::text) NOT NULL,
    realmname character varying(30) DEFAULT '' NOT NULL,
    groupname character varying(30)
);


--
-- TOC entry 10 (OID 17070)
-- Name: rdtb_realms_id_seq; Type: SEQUENCE; Schema: public; Owner: mbm
--

CREATE SEQUENCE rdtb_realms_id_seq
    START 1
    INCREMENT 1
    MAXVALUE 9223372036854775807
    MINVALUE 1
    CACHE 1;


--
-- TOC entry 27 (OID 17072)
-- Name: rdtb_realms; Type: TABLE; Schema: public; Owner: mbm
--

CREATE TABLE rdtb_realms (
    id integer DEFAULT nextval('"rdtb_realms_id_seq"'::text) NOT NULL,
    realmname character varying(64),
    nas character varying(128),
    authport integer,
    options character varying(128) DEFAULT ''
);


--
-- TOC entry 28 (OID 17076)
-- Name: bmtb_ip_alternativo; Type: TABLE; Schema: public; Owner: mbm
--

CREATE TABLE bmtb_ip_alternativo (
    ipaddr inet NOT NULL,
    banda_up smallint NOT NULL,
    tipo_banda_up character(1),
    banda_down smallint,
    tipo_banda_down character(1)
);


--
-- TOC entry 29 (OID 17081)
-- Name: bmtb_log_acesso; Type: TABLE; Schema: public; Owner: mbm
--

CREATE TABLE bmtb_log_acesso (
    session_id character(30) NOT NULL,
    username character varying(255),
    login timestamp with time zone,
    logout timestamp with time zone,
    tempo integer,
    telefone character varying(32),
    nas character varying(255),
    ip character varying(15)
);


--
-- TOC entry 30 (OID 17160)
-- Name: bmtb_rede; Type: TABLE; Schema: public; Owner: mbm
--

CREATE TABLE bmtb_rede (
    rede cidr NOT NULL,
    nome character varying(20),
    tipo character(1)
);


--
-- TOC entry 35 (OID 17083)
-- Name: bmtb_cliente_ipaddr_key; Type: INDEX; Schema: public; Owner: mbm
--

CREATE UNIQUE INDEX bmtb_cliente_ipaddr_key ON bmtb_cliente USING btree (ipaddr);


--
-- TOC entry 38 (OID 17084)
-- Name: bmtb_servico_porta_key; Type: INDEX; Schema: public; Owner: mbm
--

CREATE UNIQUE INDEX bmtb_servico_porta_key ON bmtb_servico USING btree (porta);


--
-- TOC entry 48 (OID 17085)
-- Name: radacct_username; Type: INDEX; Schema: public; Owner: mbm
--

CREATE INDEX radacct_username ON rdtb_radacct USING btree (username);


--
-- TOC entry 42 (OID 17086)
-- Name: radacct_acctsessionid; Type: INDEX; Schema: public; Owner: mbm
--

CREATE INDEX radacct_acctsessionid ON rdtb_radacct USING btree (acctsessionid);


--
-- TOC entry 45 (OID 17087)
-- Name: radacct_acctuniqueid; Type: INDEX; Schema: public; Owner: mbm
--

CREATE INDEX radacct_acctuniqueid ON rdtb_radacct USING btree (acctuniqueid);


--
-- TOC entry 46 (OID 17088)
-- Name: radacct_framedipaddress; Type: INDEX; Schema: public; Owner: mbm
--

CREATE INDEX radacct_framedipaddress ON rdtb_radacct USING btree (framedipaddress);


--
-- TOC entry 47 (OID 17089)
-- Name: radacct_nasipaddress; Type: INDEX; Schema: public; Owner: mbm
--

CREATE INDEX radacct_nasipaddress ON rdtb_radacct USING btree (nasipaddress);


--
-- TOC entry 43 (OID 17090)
-- Name: radacct_acctstarttime; Type: INDEX; Schema: public; Owner: mbm
--

CREATE INDEX radacct_acctstarttime ON rdtb_radacct USING btree (acctstarttime);


--
-- TOC entry 44 (OID 17091)
-- Name: radacct_acctstoptime; Type: INDEX; Schema: public; Owner: mbm
--

CREATE INDEX radacct_acctstoptime ON rdtb_radacct USING btree (acctstoptime);


--
-- TOC entry 50 (OID 17092)
-- Name: radcheck_username; Type: INDEX; Schema: public; Owner: mbm
--

CREATE INDEX radcheck_username ON rdtb_radcheck USING btree (username, attribute);


--
-- TOC entry 53 (OID 17093)
-- Name: radgroupreply_groupname; Type: INDEX; Schema: public; Owner: mbm
--

CREATE INDEX radgroupreply_groupname ON rdtb_radgroupreply USING btree (groupname, attribute);


--
-- TOC entry 55 (OID 17094)
-- Name: radreply_username; Type: INDEX; Schema: public; Owner: mbm
--

CREATE INDEX radreply_username ON rdtb_radreply USING btree (username, attribute);


--
-- TOC entry 58 (OID 17095)
-- Name: usergroup_username; Type: INDEX; Schema: public; Owner: mbm
--

CREATE INDEX usergroup_username ON rdtb_usergroup USING btree (username);


--
-- TOC entry 60 (OID 17096)
-- Name: realmgroup_realmname; Type: INDEX; Schema: public; Owner: mbm
--

CREATE INDEX realmgroup_realmname ON rdtb_realmgroup USING btree (realmname);


--
-- TOC entry 63 (OID 17097)
-- Name: isix_log_acesso_lin_lout; Type: INDEX; Schema: public; Owner: mbm
--

CREATE INDEX isix_log_acesso_lin_lout ON bmtb_log_acesso USING btree (username, login, logout);


--
-- TOC entry 31 (OID 17098)
-- Name: ustb_admin_pkey; Type: CONSTRAINT; Schema: public; Owner: mbm
--

ALTER TABLE ONLY ustb_admin
    ADD CONSTRAINT ustb_admin_pkey PRIMARY KEY (uid);


--
-- TOC entry 32 (OID 17100)
-- Name: lgtb_log_pkey; Type: CONSTRAINT; Schema: public; Owner: mbm
--

ALTER TABLE ONLY lgtb_log
    ADD CONSTRAINT lgtb_log_pkey PRIMARY KEY (lid);


--
-- TOC entry 64 (OID 17102)
-- Name: $1; Type: CONSTRAINT; Schema: public; Owner: mbm
--

ALTER TABLE ONLY lgtb_log
    ADD CONSTRAINT "$1" FOREIGN KEY (uid) REFERENCES ustb_admin(uid) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 33 (OID 17106)
-- Name: bmtb_interface_pkey; Type: CONSTRAINT; Schema: public; Owner: mbm
--

ALTER TABLE ONLY bmtb_interface
    ADD CONSTRAINT bmtb_interface_pkey PRIMARY KEY (interface);


--
-- TOC entry 34 (OID 17108)
-- Name: bmtb_ip_pkey; Type: CONSTRAINT; Schema: public; Owner: mbm
--

ALTER TABLE ONLY bmtb_ip
    ADD CONSTRAINT bmtb_ip_pkey PRIMARY KEY (ipaddr);


--
-- TOC entry 36 (OID 17110)
-- Name: bmtb_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: mbm
--

ALTER TABLE ONLY bmtb_cliente
    ADD CONSTRAINT bmtb_cliente_pkey PRIMARY KEY (username);


--
-- TOC entry 37 (OID 17112)
-- Name: bmtb_servico_pkey; Type: CONSTRAINT; Schema: public; Owner: mbm
--

ALTER TABLE ONLY bmtb_servico
    ADD CONSTRAINT bmtb_servico_pkey PRIMARY KEY (servico);


--
-- TOC entry 39 (OID 17114)
-- Name: bmtb_cliente_servico_pkey; Type: CONSTRAINT; Schema: public; Owner: mbm
--

ALTER TABLE ONLY bmtb_cliente_servico
    ADD CONSTRAINT bmtb_cliente_servico_pkey PRIMARY KEY (username, servico);


--
-- TOC entry 40 (OID 17116)
-- Name: bmtb_cliente_info_pkey; Type: CONSTRAINT; Schema: public; Owner: mbm
--

ALTER TABLE ONLY bmtb_cliente_info
    ADD CONSTRAINT bmtb_cliente_info_pkey PRIMARY KEY (username);


--
-- TOC entry 41 (OID 17118)
-- Name: rdtb_nas_pkey; Type: CONSTRAINT; Schema: public; Owner: mbm
--

ALTER TABLE ONLY rdtb_nas
    ADD CONSTRAINT rdtb_nas_pkey PRIMARY KEY (id);


--
-- TOC entry 49 (OID 17120)
-- Name: rdtb_radacct_pkey; Type: CONSTRAINT; Schema: public; Owner: mbm
--

ALTER TABLE ONLY rdtb_radacct
    ADD CONSTRAINT rdtb_radacct_pkey PRIMARY KEY (radacctid);


--
-- TOC entry 51 (OID 17122)
-- Name: rdtb_radcheck_pkey; Type: CONSTRAINT; Schema: public; Owner: mbm
--

ALTER TABLE ONLY rdtb_radcheck
    ADD CONSTRAINT rdtb_radcheck_pkey PRIMARY KEY (id);


--
-- TOC entry 52 (OID 17124)
-- Name: rdtb_radgroupcheck_pkey; Type: CONSTRAINT; Schema: public; Owner: mbm
--

ALTER TABLE ONLY rdtb_radgroupcheck
    ADD CONSTRAINT rdtb_radgroupcheck_pkey PRIMARY KEY (id);


--
-- TOC entry 54 (OID 17126)
-- Name: rdtb_radgroupreply_pkey; Type: CONSTRAINT; Schema: public; Owner: mbm
--

ALTER TABLE ONLY rdtb_radgroupreply
    ADD CONSTRAINT rdtb_radgroupreply_pkey PRIMARY KEY (id);


--
-- TOC entry 56 (OID 17128)
-- Name: rdtb_radreply_pkey; Type: CONSTRAINT; Schema: public; Owner: mbm
--

ALTER TABLE ONLY rdtb_radreply
    ADD CONSTRAINT rdtb_radreply_pkey PRIMARY KEY (id);


--
-- TOC entry 57 (OID 17130)
-- Name: rdtb_usergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: mbm
--

ALTER TABLE ONLY rdtb_usergroup
    ADD CONSTRAINT rdtb_usergroup_pkey PRIMARY KEY (id);


--
-- TOC entry 59 (OID 17132)
-- Name: rdtb_realmgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: mbm
--

ALTER TABLE ONLY rdtb_realmgroup
    ADD CONSTRAINT rdtb_realmgroup_pkey PRIMARY KEY (id);


--
-- TOC entry 61 (OID 17134)
-- Name: rdtb_realms_pkey; Type: CONSTRAINT; Schema: public; Owner: mbm
--

ALTER TABLE ONLY rdtb_realms
    ADD CONSTRAINT rdtb_realms_pkey PRIMARY KEY (id);


--
-- TOC entry 62 (OID 17136)
-- Name: bmtb_ip_alternativo_pkey; Type: CONSTRAINT; Schema: public; Owner: mbm
--

ALTER TABLE ONLY bmtb_ip_alternativo
    ADD CONSTRAINT bmtb_ip_alternativo_pkey PRIMARY KEY (ipaddr);


--
-- TOC entry 69 (OID 17138)
-- Name: RI_ConstraintTrigger_17138; Type: TRIGGER; Schema: public; Owner: mbm
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON bmtb_ip
    FROM bmtb_interface
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins" ('<unnamed>', 'bmtb_ip', 'bmtb_interface', 'UNSPECIFIED', 'interface_externa', 'interface');


--
-- TOC entry 65 (OID 17139)
-- Name: RI_ConstraintTrigger_17139; Type: TRIGGER; Schema: public; Owner: mbm
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON bmtb_interface
    FROM bmtb_ip
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_restrict_del" ('<unnamed>', 'bmtb_ip', 'bmtb_interface', 'UNSPECIFIED', 'interface_externa', 'interface');


--
-- TOC entry 66 (OID 17140)
-- Name: RI_ConstraintTrigger_17140; Type: TRIGGER; Schema: public; Owner: mbm
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON bmtb_interface
    FROM bmtb_ip
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_restrict_upd" ('<unnamed>', 'bmtb_ip', 'bmtb_interface', 'UNSPECIFIED', 'interface_externa', 'interface');


--
-- TOC entry 70 (OID 17141)
-- Name: RI_ConstraintTrigger_17141; Type: TRIGGER; Schema: public; Owner: mbm
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON bmtb_ip
    FROM bmtb_interface
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins" ('<unnamed>', 'bmtb_ip', 'bmtb_interface', 'UNSPECIFIED', 'interface_interna', 'interface');


--
-- TOC entry 67 (OID 17142)
-- Name: RI_ConstraintTrigger_17142; Type: TRIGGER; Schema: public; Owner: mbm
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON bmtb_interface
    FROM bmtb_ip
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_restrict_del" ('<unnamed>', 'bmtb_ip', 'bmtb_interface', 'UNSPECIFIED', 'interface_interna', 'interface');


--
-- TOC entry 68 (OID 17143)
-- Name: RI_ConstraintTrigger_17143; Type: TRIGGER; Schema: public; Owner: mbm
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON bmtb_interface
    FROM bmtb_ip
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_restrict_upd" ('<unnamed>', 'bmtb_ip', 'bmtb_interface', 'UNSPECIFIED', 'interface_interna', 'interface');


--
-- TOC entry 73 (OID 17144)
-- Name: RI_ConstraintTrigger_17144; Type: TRIGGER; Schema: public; Owner: mbm
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON bmtb_cliente
    FROM bmtb_ip
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins" ('<unnamed>', 'bmtb_cliente', 'bmtb_ip', 'UNSPECIFIED', 'ipaddr', 'ipaddr');


--
-- TOC entry 71 (OID 17145)
-- Name: RI_ConstraintTrigger_17145; Type: TRIGGER; Schema: public; Owner: mbm
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON bmtb_ip
    FROM bmtb_cliente
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_restrict_del" ('<unnamed>', 'bmtb_cliente', 'bmtb_ip', 'UNSPECIFIED', 'ipaddr', 'ipaddr');


--
-- TOC entry 72 (OID 17146)
-- Name: RI_ConstraintTrigger_17146; Type: TRIGGER; Schema: public; Owner: mbm
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON bmtb_ip
    FROM bmtb_cliente
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_restrict_upd" ('<unnamed>', 'bmtb_cliente', 'bmtb_ip', 'UNSPECIFIED', 'ipaddr', 'ipaddr');


--
-- TOC entry 80 (OID 17147)
-- Name: RI_ConstraintTrigger_17147; Type: TRIGGER; Schema: public; Owner: mbm
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON bmtb_cliente_servico
    FROM bmtb_cliente
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins" ('<unnamed>', 'bmtb_cliente_servico', 'bmtb_cliente', 'UNSPECIFIED', 'username', 'username');


--
-- TOC entry 74 (OID 17148)
-- Name: RI_ConstraintTrigger_17148; Type: TRIGGER; Schema: public; Owner: mbm
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON bmtb_cliente
    FROM bmtb_cliente_servico
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_restrict_del" ('<unnamed>', 'bmtb_cliente_servico', 'bmtb_cliente', 'UNSPECIFIED', 'username', 'username');


--
-- TOC entry 75 (OID 17149)
-- Name: RI_ConstraintTrigger_17149; Type: TRIGGER; Schema: public; Owner: mbm
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON bmtb_cliente
    FROM bmtb_cliente_servico
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_restrict_upd" ('<unnamed>', 'bmtb_cliente_servico', 'bmtb_cliente', 'UNSPECIFIED', 'username', 'username');


--
-- TOC entry 82 (OID 17150)
-- Name: RI_ConstraintTrigger_17150; Type: TRIGGER; Schema: public; Owner: mbm
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON bmtb_cliente_info
    FROM bmtb_cliente
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins" ('<unnamed>', 'bmtb_cliente_info', 'bmtb_cliente', 'UNSPECIFIED', 'username', 'username');


--
-- TOC entry 76 (OID 17151)
-- Name: RI_ConstraintTrigger_17151; Type: TRIGGER; Schema: public; Owner: mbm
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON bmtb_cliente
    FROM bmtb_cliente_info
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_restrict_del" ('<unnamed>', 'bmtb_cliente_info', 'bmtb_cliente', 'UNSPECIFIED', 'username', 'username');


--
-- TOC entry 77 (OID 17152)
-- Name: RI_ConstraintTrigger_17152; Type: TRIGGER; Schema: public; Owner: mbm
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON bmtb_cliente
    FROM bmtb_cliente_info
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_restrict_upd" ('<unnamed>', 'bmtb_cliente_info', 'bmtb_cliente', 'UNSPECIFIED', 'username', 'username');


--
-- TOC entry 81 (OID 17153)
-- Name: RI_ConstraintTrigger_17153; Type: TRIGGER; Schema: public; Owner: mbm
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER INSERT OR UPDATE ON bmtb_cliente_servico
    FROM bmtb_servico
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_check_ins" ('<unnamed>', 'bmtb_cliente_servico', 'bmtb_servico', 'UNSPECIFIED', 'servico', 'servico');


--
-- TOC entry 78 (OID 17154)
-- Name: RI_ConstraintTrigger_17154; Type: TRIGGER; Schema: public; Owner: mbm
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER DELETE ON bmtb_servico
    FROM bmtb_cliente_servico
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_restrict_del" ('<unnamed>', 'bmtb_cliente_servico', 'bmtb_servico', 'UNSPECIFIED', 'servico', 'servico');


--
-- TOC entry 79 (OID 17155)
-- Name: RI_ConstraintTrigger_17155; Type: TRIGGER; Schema: public; Owner: mbm
--

CREATE CONSTRAINT TRIGGER "<unnamed>"
    AFTER UPDATE ON bmtb_servico
    FROM bmtb_cliente_servico
    NOT DEFERRABLE INITIALLY IMMEDIATE
    FOR EACH ROW
    EXECUTE PROCEDURE "RI_FKey_restrict_upd" ('<unnamed>', 'bmtb_cliente_servico', 'bmtb_servico', 'UNSPECIFIED', 'servico', 'servico');


