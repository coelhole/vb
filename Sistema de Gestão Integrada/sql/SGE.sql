-- SQL Manager for PostgreSQL 5.9.5.52424
-- ---------------------------------------
-- Host      : localhost
-- Database  : SGE
-- Version   : PostgreSQL 9.3.25, compiled by Visual C++ build 1600, 32-bit



CREATE SCHEMA lc AUTHORIZATION postgres;
CREATE SCHEMA usr AUTHORIZATION postgres;
SET check_function_bodies = false;
--
-- Definition for type AL2 : 
--
SET search_path = public, pg_catalog;
CREATE DOMAIN public."AL2" AS 
  char(2)
    CONSTRAINT "AL2_CHK" CHECK ((VALUE ~ '[A-Z][A-Z]'::text));
--
-- Definition for type AL3 : 
--
CREATE DOMAIN public."AL3" AS 
  char(3)
    CONSTRAINT "AL3_CHK" CHECK ((VALUE ~ '[A-Z][A-Z][A-Z]'::text));
--
-- Definition for type num3 : 
--
CREATE DOMAIN public.num3 AS 
  char(3)
    CONSTRAINT num3_chk CHECK ((VALUE ~ '[0-9][0-9][0-9]'::text));
--
-- Definition for type ALNUM2 : 
--
CREATE DOMAIN public."ALNUM2" AS 
  char(2)
    CONSTRAINT "ALNUM2_CHK" CHECK ((VALUE ~ '[0-9A-Z][0-9A-Z]'::text));
--
-- Definition for type positive : 
--
CREATE DOMAIN public.positive AS 
  integer
    CONSTRAINT positive_chk CHECK ((VALUE > 0));
--
-- Definition for function t001_bfr_trg_func : 
--
SET search_path = usr, pg_catalog;
CREATE FUNCTION usr.t001_bfr_trg_func (
)
RETURNS trigger
AS 
$body$
BEGIN
	IF (TG_OP = 'UPDATE') THEN
    	IF (NEW.usrid <> OLD.usrid) THEN
        	RAISE EXCEPTION 'O campo usrid é imutável!';
        END IF;

    	IF (NEW.usrnm <> OLD.usrnm) THEN
        	RAISE EXCEPTION 'O campo usrnm é imutável!';
        END IF;
    
    	IF (NEW.pwdhsh <> OLD.pwdhsh) OR (NEW.actv <> OLD.actv) THEN
        	NEW.t = NOW();
        END IF;
    END IF;
    
    RETURN NEW;
END;
$body$
LANGUAGE plpgsql;
--
-- Definition for function t001ar05_bfr_trg_func : 
--
SET search_path = lc, pg_catalog;
CREATE FUNCTION lc.t001ar05_bfr_trg_func (
)
RETURNS trigger
AS 
$body$
BEGIN
	IF (TG_OP = 'INSERT') THEN
		INSERT INTO lc.t001ar01(num3,al3,al2,num3spr,num3m49,num3iso,al3iso,al2iso,gnmid,marc,artp,actv,t)
		VALUES (NEW.num3,NEW.al3,NEW.al2,'001',NEW.num3m49,NEW.num3iso,NEW.al3iso,NEW.al2iso,NEW.gnmid,NEW.marc,1,NEW.actv,NEW.t);
	END IF;

	IF (TG_OP = 'UPDATE') THEN
		IF NEW.rid<>OLD.rid THEN
			RAISE EXCEPTION 'O campo rid é imutável!';
        END IF;

		IF NEW.num3<>OLD.num3 THEN
			RAISE EXCEPTION 'O campo num3 é imutável!';
        END IF;

		IF NEW.al3<>OLD.al3 THEN
			RAISE EXCEPTION 'O campo al3 é imutável!';
        END IF;

		IF NEW.al2<>OLD.al2 THEN
			RAISE EXCEPTION 'O campo al2 é imutável!';
        END IF;
    
  		NEW.t = NOW();
    
		UPDATE
        	lc.t001ar01
        SET
    		num3m49 = NEW.num3m49,
    		num3iso = NEW.num3iso,
    		al3iso = NEW.al3iso,
    		al2iso = NEW.al2iso,
            gnmid = NEW.gnmid,
            marc = NEW.marc,
    		actv = NEW.actv,
            t = NEW.t
    	WHERE
    		num3 = OLD.num3;
  	END IF;
    
    RETURN NEW;
END;
$body$
LANGUAGE plpgsql;
--
-- Definition for function t001ar09_11_bfr_trg_func : 
--
CREATE FUNCTION lc.t001ar09_11_bfr_trg_func (
)
RETURNS trigger
AS 
$body$
BEGIN
	IF (TG_OP = 'INSERT') THEN
		INSERT INTO lc.t001ar07(num3,al3,al2,num3spr,num3m49,num3iso,al3iso,al2iso,gnmid,marc,actv,t)
		VALUES (NEW.num3,NEW.al3,NEW.al2,NEW.num3spr,NEW.num3m49,NEW.num3iso,NEW.al3iso,NEW.al2iso,NEW.gnmid,NEW.marc,NEW.actv,NEW.t);

		INSERT INTO lc.t001ar01(num3,al3,al2,num3spr,num3m49,num3iso,al3iso,al2iso,gnmid,artp,actv,t)
		VALUES (NEW.num3,NEW.al3,NEW.al2,NEW.num3spr,NEW.num3m49,NEW.num3iso,NEW.al3iso,NEW.al2iso,NEW.gnmid,2,NEW.actv,NEW.t);
	END IF;

	IF (TG_OP = 'UPDATE') THEN
		IF NEW.rid<>OLD.rid THEN
			RAISE EXCEPTION 'O campo rid é imutável!';
        END IF;

		IF NEW.num3<>OLD.num3 THEN
			RAISE EXCEPTION 'O campo num3 é imutável!';
        END IF;

		IF NEW.al3<>OLD.al3 THEN
			RAISE EXCEPTION 'O campo al3 é imutável!';
        END IF;

		IF NEW.al2<>OLD.al2 THEN
			RAISE EXCEPTION 'O campo al2 é imutável!';
        END IF;

		NEW.t = NOW();

		UPDATE
        	lc.t001AR07
		SET
    		num3spr = NEW.num3spr,
    		num3m49 = NEW.num3m49,
    		num3iso = NEW.num3iso,
    		al3iso = NEW.al3iso,
    		al2iso = NEW.al2iso,
    		gnmid = NEW.gnmid,
            marc = NEW.marc,
    		actv = NEW.actv,
        	t = NEW.t
    	WHERE
    		num3 = OLD.num3;

		UPDATE
        	lc.t001ar01
		SET
    		num3spr = NEW.num3spr,
    		num3m49 = NEW.num3m49,
    		num3iso = NEW.num3iso,
    		al3iso = NEW.al3iso,
    		al2iso = NEW.al2iso,
            gnmid = NEW.gnmid,
            marc = NEW.marc,
    		actv = NEW.actv,
        	t = NEW.t
    	WHERE
    		num3 = OLD.num3;
	END IF;

	RETURN NEW;
END;
$body$
LANGUAGE plpgsql;
--
-- Definition for function t001ar15_17_bfr_trg_func : 
--
CREATE FUNCTION lc.t001ar15_17_bfr_trg_func (
)
RETURNS trigger
AS 
$body$
BEGIN
	IF (TG_OP = 'INSERT') THEN
		INSERT INTO lc.t001ar13(num3,al3,al2,num3spr,num3m49,num3iso,al3iso,al2iso,gnmid,marc,edgar,actv,t)
		VALUES (NEW.num3,NEW.al3,NEW.al2,NEW.num3spr,NEW.num3m49,NEW.num3iso,NEW.al3iso,NEW.al2iso,NEW.gnmid,NEW.marc,NEW.edgar,NEW.actv, NEW.t);

		INSERT INTO lc.t001ar01(num3,al3,al2,num3spr,num3m49,num3iso,al3iso,al2iso,gnmid,marc,edgar,artp,actv,t)
		VALUES (NEW.num3,NEW.al3,NEW.al2,NEW.num3spr,NEW.num3m49,NEW.num3iso,NEW.al3iso,NEW.al2iso,NEW.gnmid,NEW.marc,NEW.edgar,3,NEW.actv,NEW.t);
	END IF;

	IF (TG_OP = 'UPDATE') THEN
		IF NEW.rid<>OLD.rid THEN
			RAISE EXCEPTION 'O campo rid é imutável!';
        END IF;

		IF NEW.num3<>OLD.num3 THEN
			RAISE EXCEPTION 'O campo num3 é imutável!';
        END IF;

		IF NEW.al3<>OLD.al3 THEN
			RAISE EXCEPTION 'O campo al3 é imutável!';
        END IF;

		IF NEW.al2<>OLD.al2 THEN
			RAISE EXCEPTION 'O campo al2 é imutável!';
        END IF;

		NEW.t = NOW();

		UPDATE lc.t001AR13 SET
			num3spr = NEW.num3spr,
			num3m49 = NEW.num3m49,
			num3iso = NEW.num3iso,
			al3iso = NEW.al3iso,
			al2iso = NEW.al2iso,
			gnmid = NEW.gnmid,
            marc = NEW.marc,
            edgar = NEW.edgar,
			actv = NEW.actv,
			t = NEW.t
		WHERE
			num3 = OLD.num3;

		UPDATE
        	lc.t001ar01
		SET
    		num3spr = NEW.num3spr,
    		num3m49 = NEW.num3m49,
    		num3iso = NEW.num3iso,
    		al3iso = NEW.al3iso,
    		al2iso = NEW.al2iso,
            gnmid = NEW.gnmid,
            marc = NEW.marc,
            edgar = NEW.edgar,
    		actv = NEW.actv,
        	t = NEW.t
    	WHERE
    		num3 = OLD.num3;
	END IF;
	
    RETURN NEW;
END;
$body$
LANGUAGE plpgsql;
--
-- Structure for table t001ar01 : 
--
CREATE TABLE lc.t001ar01 (
    rid integer DEFAULT nextval(('lc.seq_t001ar01_rid'::text)::regclass) NOT NULL,
    num3 public.num3 NOT NULL,
    al3 public."AL3" NOT NULL,
    al2 public."AL2" NOT NULL,
    num3spr public.num3 NOT NULL,
    num3m49 boolean NOT NULL,
    num3iso boolean NOT NULL,
    al3iso boolean NOT NULL,
    al2iso boolean NOT NULL,
	gnmid public.positive,
    marc char(8),
    edgar public."ALNUM2",
    artp smallint NOT NULL,
    actv boolean NOT NULL,
    t timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT chk01_lc_t001ar01 CHECK (((artp > 0) AND (artp < 4)))
)
WITH (oids = false);
--
-- Definition for sequence seq_t001ar01_rid : 
--
CREATE SEQUENCE lc.seq_t001ar01_rid
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;
--
-- Structure for table t001 : 
--
SET search_path = usr, pg_catalog;
CREATE TABLE usr.t001 (
    usrid integer DEFAULT nextval(('usr.seq_t001_usrid'::text)::regclass) NOT NULL,
    usrnm varchar(32) NOT NULL,
    pwdhsh char(40) NOT NULL,
    actv boolean DEFAULT true NOT NULL,
    t timestamp(0) without time zone DEFAULT now() NOT NULL
)
WITH (oids = false);
--
-- Definition for sequence seq_t001_usrid : 
--
CREATE SEQUENCE usr.seq_t001_usrid
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;
--
-- Structure for table t001ar13 : 
--
SET search_path = lc, pg_catalog;
CREATE TABLE lc.t001ar13 (
    rid integer DEFAULT nextval(('lc.seq_t001ar13_rid'::text)::regclass) NOT NULL,
    num3 public.num3 NOT NULL,
    al3 public."AL3" NOT NULL,
    al2 public."AL2" NOT NULL,
    num3spr public.num3 NOT NULL,
    num3m49 boolean NOT NULL,
    num3iso boolean NOT NULL,
    al3iso boolean NOT NULL,
    al2iso boolean NOT NULL,
    gnmid public.positive,
    marc char(3),
    edgar public."ALNUM2",
    actv boolean NOT NULL,
    t timestamp without time zone DEFAULT now() NOT NULL
)
WITH (oids = false);
--
-- Definition for sequence seq_t001ar13_rid : 
--
CREATE SEQUENCE lc.seq_t001ar13_rid
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;
--
-- Structure for table t840ar01 : 
--
CREATE TABLE lc.t840ar01 (
    rid integer DEFAULT nextval(('lc.seq_t840ar01_rid'::text)::regclass) NOT NULL,
    edgar public."ALNUM2" NOT NULL,
    actv boolean NOT NULL,
    t timestamp without time zone DEFAULT now() NOT NULL
)
WITH (oids = false);
--
-- Definition for sequence seq_t840ar01_rid : 
--
CREATE SEQUENCE lc.seq_t840ar01_rid
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;
--
-- Structure for table t001ar05 : 
--
CREATE TABLE lc.t001ar05 (
    rid integer DEFAULT nextval(('lc.seq_t001ar05_rid'::text)::regclass) NOT NULL,
    num3 public.num3 NOT NULL,
    al3 public."AL3" NOT NULL,
    al2 public."AL2" NOT NULL,
    num3m49 boolean NOT NULL,
    num3iso boolean NOT NULL,
    al3iso boolean NOT NULL,
    al2iso boolean NOT NULL,
    gnmid public.positive,
    marc char(2),
    actv boolean NOT NULL,
    t timestamp without time zone DEFAULT now() NOT NULL
)
WITH (oids = false);
--
-- Definition for sequence seq_t001ar05_rid : 
--
CREATE SEQUENCE lc.seq_t001ar05_rid
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;
--
-- Structure for table t001ar07 : 
--
CREATE TABLE lc.t001ar07 (
    rid integer DEFAULT nextval(('lc.seq_t001ar07_rid'::text)::regclass) NOT NULL,
    num3 public.num3 NOT NULL,
    al3 public."AL3" NOT NULL,
    al2 public."AL2" NOT NULL,
    num3spr public.num3 NOT NULL,
    num3m49 boolean NOT NULL,
    num3iso boolean NOT NULL,
    al3iso boolean NOT NULL,
    al2iso boolean NOT NULL,
    gnmid public.positive,
    marc char(2),
    actv boolean NOT NULL,
    t timestamp without time zone DEFAULT now() NOT NULL
)
WITH (oids = false);
--
-- Definition for sequence seq_t001ar07_rid : 
--
CREATE SEQUENCE lc.seq_t001ar07_rid
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;
--
-- Structure for table t001ar09 : 
--
CREATE TABLE lc.t001ar09 (
    rid integer DEFAULT nextval(('lc.seq_t001ar09_rid'::text)::regclass) NOT NULL,
    num3 public.num3 NOT NULL,
    al3 public."AL3" NOT NULL,
    al2 public."AL2" NOT NULL,
    num3spr public.num3 NOT NULL,
    num3m49 boolean NOT NULL,
    num3iso boolean NOT NULL,
    al3iso boolean NOT NULL,
    al2iso boolean NOT NULL,
    gnmid public.positive,
    marc char(2),
    actv boolean NOT NULL,
    t timestamp without time zone DEFAULT now() NOT NULL
)
WITH (oids = false);
--
-- Definition for sequence seq_t001ar09_rid : 
--
CREATE SEQUENCE lc.seq_t001ar09_rid
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;
--
-- Structure for table t001ar11 : 
--
CREATE TABLE lc.t001ar11 (
    rid integer DEFAULT nextval(('lc.seq_t001ar11_rid'::text)::regclass) NOT NULL,
    num3 public.num3 NOT NULL,
    al3 public."AL3" NOT NULL,
    al2 public."AL2" NOT NULL,
    num3spr public.num3 NOT NULL,
    num3m49 boolean NOT NULL,
    num3iso boolean NOT NULL,
    al3iso boolean NOT NULL,
    al2iso boolean NOT NULL,
    gnmid public.positive,
    marc char(2),
    actv boolean NOT NULL,
    t timestamp without time zone DEFAULT now() NOT NULL
)
WITH (oids = false);
--
-- Definition for sequence seq_t001ar11_rid : 
--
CREATE SEQUENCE lc.seq_t001ar11_rid
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;
--
-- Definition for view vcc : 
--
CREATE VIEW lc.vcc
AS
SELECT t001ar13.num3,
    t001ar13.al3,
    t001ar13.al2
FROM t001ar13
WHERE (t001ar13.actv = true)
ORDER BY t001ar13.num3;

--
-- Definition for view vedcc : 
--
CREATE VIEW lc.vedcc
AS
SELECT t001ar13.edgar,
    t001ar13.num3,
    t001ar13.al3,
    t001ar13.al2
FROM t001ar13
WHERE ((t001ar13.actv = true) AND (t001ar13.edgar IS NOT NULL))
ORDER BY t001ar13.edgar, t001ar13.num3;

--
-- Structure for table t001ar15 : 
--
CREATE TABLE lc.t001ar15 (
    rid integer DEFAULT nextval(('lc.seq_t001ar15_rid'::text)::regclass) NOT NULL,
    num3 public.num3 NOT NULL,
    al3 public."AL3" NOT NULL,
    al2 public."AL2" NOT NULL,
    num3spr public.num3 NOT NULL,
    num3m49 boolean NOT NULL,
    num3iso boolean NOT NULL,
    al3iso boolean NOT NULL,
    al2iso boolean NOT NULL,
    gnmid public.positive,
    marc char(3),
    edgar public."ALNUM2",
    actv boolean NOT NULL,
    t timestamp without time zone DEFAULT now() NOT NULL
)
WITH (oids = false);
--
-- Definition for sequence seq_t001ar15_rid : 
--
CREATE SEQUENCE lc.seq_t001ar15_rid
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;
--
-- Structure for table t001ar17 : 
--
CREATE TABLE lc.t001ar17 (
    rid integer DEFAULT nextval(('lc.seq_t001ar17_rid'::text)::regclass) NOT NULL,
    num3 public.num3 NOT NULL,
    al3 public."AL3" NOT NULL,
    al2 public."AL2" NOT NULL,
    num3spr public.num3 NOT NULL,
    num3m49 boolean NOT NULL,
    num3iso boolean NOT NULL,
    al3iso boolean NOT NULL,
    al2iso boolean NOT NULL,
    gnmid public.positive,
    marc char(3),
    edgar public."ALNUM2",
    actv boolean NOT NULL,
    t timestamp without time zone DEFAULT now() NOT NULL
)
WITH (oids = false);
--
-- Definition for sequence seq_t001ar17_rid : 
--
CREATE SEQUENCE lc.seq_t001ar17_rid
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;
--
-- Definition for type cctld : 
--
SET search_path = public, pg_catalog;
CREATE DOMAIN public.cctld AS 
  char(3)
    CONSTRAINT cctld_chk CHECK ((VALUE ~ '.[a-z][a-z]'::text));
--
-- Definition for view vmrccc : 
--
SET search_path = lc, pg_catalog;
CREATE VIEW lc.vmrccc
AS
SELECT t001ar13.marc,
    t001ar13.num3,
    t001ar13.al3,
    t001ar13.al2
FROM t001ar13
WHERE ((t001ar13.actv = true) AND (t001ar13.marc IS NOT NULL))
ORDER BY t001ar13.marc, t001ar13.num3;

--
-- Definition for view vmrcgc : 
--
CREATE VIEW lc.vmrcgc
AS
SELECT t001ar01.marc,
    t001ar01.num3,
    t001ar01.al3,
    t001ar01.al2
FROM t001ar01
WHERE ((t001ar01.actv = true) AND (t001ar01.marc IS NOT NULL))
ORDER BY t001ar01.marc, t001ar01.num3;

--
-- Definition for index u01_lc_t001ar01 : 
--
ALTER TABLE ONLY t001ar01
    ADD CONSTRAINT u01_lc_t001ar01
    UNIQUE (rid);
--
-- Definition for index pk_usr_t001 : 
--
SET search_path = usr, pg_catalog;
ALTER TABLE ONLY t001
    ADD CONSTRAINT pk_usr_t001
    PRIMARY KEY (usrid);
--
-- Definition for index u01_usr_t001 : 
--
ALTER TABLE ONLY t001
    ADD CONSTRAINT u01_usr_t001
    UNIQUE (usrnm);
--
-- Definition for index pk_lc_t001ar01 : 
--
SET search_path = lc, pg_catalog;
ALTER TABLE ONLY t001ar01
    ADD CONSTRAINT pk_lc_t001ar01
    PRIMARY KEY (num3);
--
-- Definition for index pk_lc_t001ar13 : 
--
ALTER TABLE ONLY t001ar13
    ADD CONSTRAINT pk_lc_t001ar13
    PRIMARY KEY (num3);
--
-- Definition for index u01_lc_t001ar13 : 
--
ALTER TABLE ONLY t001ar13
    ADD CONSTRAINT u01_lc_t001ar13
    UNIQUE (rid);
--
-- Definition for index pk_lc_t001ar05 : 
--
ALTER TABLE ONLY t001ar05
    ADD CONSTRAINT pk_lc_t001ar05
    PRIMARY KEY (num3);
--
-- Definition for index u01_lc_t001ar05 : 
--
ALTER TABLE ONLY t001ar05
    ADD CONSTRAINT u01_lc_t001ar05
    UNIQUE (rid);
--
-- Definition for index pk_lc_t001ar07 : 
--
ALTER TABLE ONLY t001ar07
    ADD CONSTRAINT pk_lc_t001ar07
    PRIMARY KEY (num3);
--
-- Definition for index u01_lc_t001ar07 : 
--
ALTER TABLE ONLY t001ar07
    ADD CONSTRAINT u01_lc_t001ar07
    UNIQUE (rid);
--
-- Definition for index pk_lc_t001ar09 : 
--
ALTER TABLE ONLY t001ar09
    ADD CONSTRAINT pk_lc_t001ar09
    PRIMARY KEY (num3);
--
-- Definition for index u01_lc_t001ar09 : 
--
ALTER TABLE ONLY t001ar09
    ADD CONSTRAINT u01_lc_t001ar09
    UNIQUE (rid);
--
-- Definition for index pk_lc_t001ar11 : 
--
ALTER TABLE ONLY t001ar11
    ADD CONSTRAINT pk_lc_t001ar11
    PRIMARY KEY (num3);
--
-- Definition for index u01_lc_t001ar11 : 
--
ALTER TABLE ONLY t001ar11
    ADD CONSTRAINT u01_lc_t001ar11
    UNIQUE (rid);
--
-- Definition for index pk_lc_t001ar15 : 
--
ALTER TABLE ONLY t001ar15
    ADD CONSTRAINT pk_lc_t001ar15
    PRIMARY KEY (num3);
--
-- Definition for index u01_lc_t001ar15 : 
--
ALTER TABLE ONLY t001ar15
    ADD CONSTRAINT u01_lc_t001ar15
    UNIQUE (rid);
--
-- Definition for index pk_lc_t001ar17 : 
--
ALTER TABLE ONLY t001ar17
    ADD CONSTRAINT pk_lc_t001ar17
    PRIMARY KEY (num3);
--
-- Definition for index u01_lc_t001ar17 : 
--
ALTER TABLE ONLY t001ar17
    ADD CONSTRAINT u01_lc_t001ar17
    UNIQUE (rid);
--
-- Definition for index pk_lc_t840ar01 : 
--
ALTER TABLE ONLY t840ar01
    ADD CONSTRAINT pk_lc_t840ar01
    PRIMARY KEY (edgar);
--
-- Definition for index u01_t840ar01 : 
--
ALTER TABLE ONLY t840ar01
    ADD CONSTRAINT u01_t840ar01
    UNIQUE (rid);
--
-- Definition for trigger usr_t001_bfr_trg : 
--
SET search_path = usr, pg_catalog;
CREATE TRIGGER usr_t001_bfr_trg
    BEFORE UPDATE OF usrid, usrnm, pwdhsh, actv ON t001
    FOR EACH ROW
    EXECUTE PROCEDURE t001_bfr_trg_func ();
--
-- Definition for trigger lc_t001ar05_bfr_trg : 
--
SET search_path = lc, pg_catalog;
CREATE TRIGGER lc_t001ar05_bfr_trg
    BEFORE INSERT OR UPDATE OF rid, num3, al3, al2, gnmid, num3m49, num3iso, al3iso, al2iso, actv ON t001ar05
    FOR EACH ROW
    EXECUTE PROCEDURE t001ar05_bfr_trg_func ();
--
-- Definition for trigger lc_t001ar09_bfr_trg : 
--
CREATE TRIGGER lc_t001ar09_bfr_trg
    BEFORE INSERT OR UPDATE OF rid, num3, al3, al2, gnmid, num3spr, num3m49, num3iso, al3iso, al2iso, actv ON t001ar09
    FOR EACH ROW
    EXECUTE PROCEDURE t001ar09_11_bfr_trg_func ();
--
-- Definition for trigger lc_t001ar11_bfr_trg : 
--
CREATE TRIGGER lc_t001ar11_bfr_trg
    BEFORE INSERT OR UPDATE OF rid, num3, al3, al2, gnmid, num3spr, num3m49, num3iso, al3iso, al2iso, actv ON t001ar11
    FOR EACH ROW
    EXECUTE PROCEDURE t001ar09_11_bfr_trg_func ();
--
-- Definition for trigger lc_t001ar15_bfr_trg : 
--
CREATE TRIGGER lc_t001ar15_bfr_trg
    BEFORE INSERT OR UPDATE OF rid, num3, al3, al2, gnmid, num3spr, num3m49, num3iso, al3iso, al2iso, marc, edgar, actv ON t001ar15
    FOR EACH ROW
    EXECUTE PROCEDURE t001ar15_17_bfr_trg_func ();
--
-- Definition for trigger lc_t001ar17_bfr_trg : 
--
CREATE TRIGGER lc_t001ar17_bfr_trg
    BEFORE INSERT OR UPDATE OF rid, num3, al3, al2, gnmid, num3spr, num3m49, num3iso, al3iso, al2iso, marc, edgar, actv ON t001ar17
    FOR EACH ROW
    EXECUTE PROCEDURE t001ar15_17_bfr_trg_func ();
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
COMMENT ON SCHEMA lc IS 'locale info [informações de localização]';
COMMENT ON TABLE lc.t001ar01 IS 'country or area codes [códigos para países ou áreas geográficas]';
COMMENT ON COLUMN lc.t001ar01.rid IS 'row identifier [identificador (ID) da linha]';
COMMENT ON COLUMN lc.t001ar01.num3 IS 'country or area numeric-3 code [código de país ou área de 3 dígitos numéricos]';
COMMENT ON COLUMN lc.t001ar01.al3 IS 'alpha-3 code [código de país ou área de 3 letras]';
COMMENT ON COLUMN lc.t001ar01.al2 IS 'alpha-2 code [código de país ou área de 2 letras]';
COMMENT ON COLUMN lc.t001ar01.gnmid IS 'geoname ID [ID do nome geográfico]';
COMMENT ON COLUMN lc.t001ar01.num3spr IS 'super region numeric-3 code [código de país ou área, de 3 dígitos numéricos, da super-região]';
COMMENT ON COLUMN lc.t001ar01.num3m49 IS 'is numeric-3 key an UN-M49 code? [o código de 3 dígitos numéricos é um código M49-ONU?]';
COMMENT ON COLUMN lc.t001ar01.num3iso IS 'is numeric-3 key an ISO 3166-1 numeric code? [o código de 3 dígitos numéricos é um código ISO 3166-1 numérico?]';
COMMENT ON COLUMN lc.t001ar01.al3iso IS 'is alpha-3 key an ISO 3166-1 alpha-3 code? [o código de 3 letras é um código ISO 3166-1 de 3 letras?]';
COMMENT ON COLUMN lc.t001ar01.al2iso IS 'is alpha-2 key an ISO 3166-1 alpha-2 code? [o código de 2 letras é um código ISO 3166-1 de 2 letras?]';
COMMENT ON COLUMN lc.t001ar01.artp IS 'area type [tipo de área]

1 = continente
2 = subcontinente
3 = país/território';
COMMENT ON COLUMN lc.t001ar01.actv IS 'active [ativo]';
COMMENT ON COLUMN lc.t001ar01.t IS 'timestamp [marca de tempo]';
COMMENT ON COLUMN lc.t001ar01.marc IS 'MARC (Machine Readable Cataloging) code [código para catalogação legível por computador]';
COMMENT ON COLUMN lc.t001ar01.edgar IS 'EDGAR (Electronic Data Gathering, Analysis, and Retrieval) code [código para Coleta, Análise e Recuperação Eletrônica de Dados]';
COMMENT ON SCHEMA usr IS 'user info [informações de usuário]';
SET search_path = usr, pg_catalog;
COMMENT ON TABLE usr.t001 IS 'user login data [dados de login do usuário]';
COMMENT ON COLUMN usr.t001.usrid IS 'user ID [número ID (identificador) do usuário]';
COMMENT ON COLUMN usr.t001.usrnm IS 'username [nome de usuário]';
COMMENT ON COLUMN usr.t001.pwdhsh IS 'password SHA-1 hash [hash SHA-1 da senha]';
COMMENT ON COLUMN usr.t001.actv IS 'active [o usuário está ativo?]';
COMMENT ON COLUMN usr.t001.t IS 'insert/last update timestamp [marca temporal da inserção/última atualização]';
SET search_path = public, pg_catalog;
COMMENT ON DOMAIN "AL2" IS '2-upper case letters [duas letras em caixa alta]';
COMMENT ON DOMAIN "AL3" IS '3-upper case letters [3 letras em caixa alta]';
COMMENT ON DOMAIN num3 IS '3-numeric digit [3 dígitos numéricos]';
COMMENT ON DOMAIN "ALNUM2" IS '2-alphanumeric string [string alfanumérica de dois caracteres]';
SET search_path = lc, pg_catalog;
COMMENT ON TABLE lc.t001ar13 IS 'country/territory codes [códigos de países/territórios]';
COMMENT ON COLUMN lc.t001ar13.rid IS 'row identifier [identificador (ID) da linha]';
COMMENT ON COLUMN lc.t001ar13.num3 IS 'country/territory numeric-3 code [código de 3 dígitos numéricos para o país/território]';
COMMENT ON COLUMN lc.t001ar13.al3 IS 'country/territory alpha-3 code [código de 3 letras para o país/território]';
COMMENT ON COLUMN lc.t001ar13.al2 IS 'country/territory alpha-2 code [código de 2 letras para o país/território]';
COMMENT ON COLUMN lc.t001ar13.num3spr IS 'super region numeric-3 code [código de 3 dígitos numéricos da super-região]';
COMMENT ON COLUMN lc.t001ar13.num3m49 IS 'is numeric-3 key an UN-M49 code? [o código de 3 dígitos numéricos é um código M49-ONU?]';
COMMENT ON COLUMN lc.t001ar13.num3iso IS 'is numeric-3 key an ISO 3166-1 numeric code? [o código de 3 dígitos numéricos é um código ISO 3166-1 numérico?]';
COMMENT ON COLUMN lc.t001ar13.al3iso IS 'is alpha-3 key an ISO 3166-1 alpha-3 code? [o código de 3 letras é um código ISO 3166-1 de 3 letras?]';
COMMENT ON COLUMN lc.t001ar13.al2iso IS 'is alpha-2 key an ISO 3166-1 alpha-2 code? [o código de 2 letras é um código ISO 3166-1 de 2 letras?]';
COMMENT ON COLUMN lc.t001ar13.gnmid IS 'geoname ID [ID do nome geográfico]';
COMMENT ON COLUMN lc.t001ar13.marc IS 'MARC (Machine Readable Cataloging) code [código para catalogação legível por computador]';
COMMENT ON COLUMN lc.t001ar13.edgar IS 'EDGAR (Electronic Data Gathering, Analysis, and Retrieval) code [código para Coleta, Análise e Recuperação Eletrônica de Dados]';
COMMENT ON COLUMN lc.t001ar13.actv IS 'active [ativo]';
COMMENT ON COLUMN lc.t001ar13.t IS 'timestamp [marca de tempo]';
COMMENT ON TABLE lc.t840ar01 IS 'EDGAR (Electronic Data Gathering, Analysis, and Retrieval) state and country codes [códigos EDGAR para estados e países]';
COMMENT ON COLUMN lc.t840ar01.rid IS 'row identifier [identificador (ID) da linha]';
COMMENT ON COLUMN lc.t840ar01.edgar IS 'EDGAR (Electronic Data Gathering, Analysis, and Retrieval) code [código para Coleta, Análise e Recuperação Eletrônica de Dados]';
COMMENT ON COLUMN lc.t840ar01.actv IS 'active [ativo]';
COMMENT ON COLUMN lc.t840ar01.t IS 'timestamp [marca de tempo]';
COMMENT ON TABLE lc.t001ar05 IS 'continent codes [códigos para continentes]';
COMMENT ON COLUMN lc.t001ar05.rid IS 'row identifier [identificador (ID) da linha]';
COMMENT ON COLUMN lc.t001ar05.num3 IS 'continent numeric-3 code [código de 3 dígitos numéricos para o continente]';
COMMENT ON COLUMN lc.t001ar05.al3 IS 'continent alpha-3 code [código de 3 letras para o continente]';
COMMENT ON COLUMN lc.t001ar05.al2 IS 'continent alpha-2 code [código de 2 letras para o continente]';
COMMENT ON COLUMN lc.t001ar05.num3m49 IS 'is numeric-3 key an UN-M49 code? [o código de 3 dígitos numéricos é um código M49-ONU?]';
COMMENT ON COLUMN lc.t001ar05.num3iso IS 'is numeric-3 key an ISO 3166-1 numeric code? [o código de 3 dígitos numéricos é um código ISO 3166-1 numérico?]';
COMMENT ON COLUMN lc.t001ar05.al3iso IS 'is alpha-3 key an ISO 3166-1 alpha-3 code? [o código de 3 letras é um código ISO 3166-1 de 3 letras?]';
COMMENT ON COLUMN lc.t001ar05.al2iso IS 'is alpha-2 key an ISO 3166-1 alpha-2 code? [o código de 2 letras é um código ISO 3166-1 de 2 letras?]';
COMMENT ON COLUMN lc.t001ar05.gnmid IS 'geoname ID [ID do nome geográfico]';
COMMENT ON COLUMN lc.t001ar05.marc IS 'MARC (Machine Readable Cataloging) code [código para catalogação legível por computador]';
COMMENT ON COLUMN lc.t001ar05.actv IS 'active [ativo]';
COMMENT ON COLUMN lc.t001ar05.t IS 'timestamp [marca de tempo]';
COMMENT ON TABLE lc.t001ar07 IS 'subcontinent codes [códigos para subcontinentes]';
COMMENT ON COLUMN lc.t001ar07.rid IS 'row identifier [identificador (ID) da linha]';
COMMENT ON COLUMN lc.t001ar07.num3 IS 'subcontinent numeric-3 code [código de 3 dígitos numéricos para o subcontinente]';
COMMENT ON COLUMN lc.t001ar07.al3 IS 'subcontinent alpha-3 code [código de 3 letras para o subcontinente]';
COMMENT ON COLUMN lc.t001ar07.al2 IS 'subcontinent alpha-2 code [código de 2 letras para o subcontinente]';
COMMENT ON COLUMN lc.t001ar07.num3spr IS 'super region numeric-3 code [código de 3 dígitos numéricos da super-região]';
COMMENT ON COLUMN lc.t001ar07.num3m49 IS 'is numeric-3 key an UN-M49 code? [o código de 3 dígitos numéricos é um código M49-ONU?]';
COMMENT ON COLUMN lc.t001ar07.num3iso IS 'is numeric-3 key an ISO 3166-1 numeric code? [o código de 3 dígitos numéricos é um código ISO 3166-1 numérico?]';
COMMENT ON COLUMN lc.t001ar07.al3iso IS 'is alpha-3 key an ISO 3166-1 alpha-3 code? [o código de 3 letras é um código ISO 3166-1 de 3 letras?]';
COMMENT ON COLUMN lc.t001ar07.al2iso IS 'is alpha-2 key an ISO 3166-1 alpha-2 code? [o código de 2 letras é um código ISO 3166-1 de 2 letras?]';
COMMENT ON COLUMN lc.t001ar07.gnmid IS 'geoname ID [ID do nome geográfico]';
COMMENT ON COLUMN lc.t001ar07.marc IS 'MARC (Machine Readable Cataloging) code [código para catalogação legível por computador]';
COMMENT ON COLUMN lc.t001ar07.actv IS 'active [ativo]';
COMMENT ON COLUMN lc.t001ar07.t IS 'timestamp [marca de tempo]';
COMMENT ON TABLE lc.t001ar09 IS 'subcontinent codes - table 1 [códigos para subcontinentes - tabela 1]';
COMMENT ON COLUMN lc.t001ar09.rid IS 'row identifier [identificador (ID) da linha]';
COMMENT ON COLUMN lc.t001ar09.num3 IS 'subcontinent numeric-3 code [código de 3 dígitos numéricos para o subcontinente]';
COMMENT ON COLUMN lc.t001ar09.al3 IS 'subcontinent alpha-3 code [código de 3 letras para o subcontinente]';
COMMENT ON COLUMN lc.t001ar09.al2 IS 'subcontinent alpha-2 code [código de 2 letras para o subcontinente]';
COMMENT ON COLUMN lc.t001ar09.num3spr IS 'super region numeric-3 code [código de 3 dígitos numéricos da super-região]';
COMMENT ON COLUMN lc.t001ar09.num3m49 IS 'is numeric-3 key an UN-M49 code? [o código de 3 dígitos numéricos é um código M49-ONU?]';
COMMENT ON COLUMN lc.t001ar09.num3iso IS 'is numeric-3 key an ISO 3166-1 numeric code? [o código de 3 dígitos numéricos é um código ISO 3166-1 numérico?]';
COMMENT ON COLUMN lc.t001ar09.al3iso IS 'is alpha-3 key an ISO 3166-1 alpha-3 code? [o código de 3 letras é um código ISO 3166-1 de 3 letras?]';
COMMENT ON COLUMN lc.t001ar09.al2iso IS 'is alpha-2 key an ISO 3166-1 alpha-2 code? [o código de 2 letras é um código ISO 3166-1 de 2 letras?]';
COMMENT ON COLUMN lc.t001ar09.gnmid IS 'geoname ID [ID do nome geográfico]';
COMMENT ON COLUMN lc.t001ar09.marc IS 'MARC (Machine Readable Cataloging) code [código para catalogação legível por computador]';
COMMENT ON COLUMN lc.t001ar09.actv IS 'active [ativo]';
COMMENT ON COLUMN lc.t001ar09.t IS 'timestamp [marca de tempo]';
COMMENT ON TABLE lc.t001ar11 IS 'subcontinent codes - table 2 [códigos para subcontinentes - tabela 2]';
COMMENT ON COLUMN lc.t001ar11.rid IS 'row identifier [identificador (ID) da linha]';
COMMENT ON COLUMN lc.t001ar11.num3 IS 'subcontinent numeric-3 code [código de 3 dígitos numéricos para o subcontinente]';
COMMENT ON COLUMN lc.t001ar11.al3 IS 'subcontinent alpha-3 code [código de 3 letras para o subcontinente]';
COMMENT ON COLUMN lc.t001ar11.al2 IS 'subcontinent alpha-2 code [código de 2 letras para o subcontinente]';
COMMENT ON COLUMN lc.t001ar11.num3spr IS 'super region numeric-3 code [código de 3 dígitos numéricos da super-região]';
COMMENT ON COLUMN lc.t001ar11.num3m49 IS 'is numeric-3 key an UN-M49 code? [o código de 3 dígitos numéricos é um código M49-ONU?]';
COMMENT ON COLUMN lc.t001ar11.num3iso IS 'is numeric-3 key an ISO 3166-1 numeric code? [o código de 3 dígitos numéricos é um código ISO 3166-1 numérico?]';
COMMENT ON COLUMN lc.t001ar11.al3iso IS 'is alpha-3 key an ISO 3166-1 alpha-3 code? [o código de 3 letras é um código ISO 3166-1 de 3 letras?]';
COMMENT ON COLUMN lc.t001ar11.al2iso IS 'is alpha-2 key an ISO 3166-1 alpha-2 code? [o código de 2 letras é um código ISO 3166-1 de 2 letras?]';
COMMENT ON COLUMN lc.t001ar11.gnmid IS 'geoname ID [ID do nome geográfico]';
COMMENT ON COLUMN lc.t001ar11.marc IS 'MARC (Machine Readable Cataloging) code [código para catalogação legível por computador]';
COMMENT ON COLUMN lc.t001ar11.actv IS 'active [ativo]';
COMMENT ON COLUMN lc.t001ar11.t IS 'timestamp [marca de tempo]';
COMMENT ON VIEW lc.vcc IS 'country and territory codes [código de países e territórios]';
COMMENT ON VIEW lc.vedcc IS 'EDGAR (Electronic Data Gathering, Analysis, and Retrieval) country codes';
SET search_path = public, pg_catalog;
COMMENT ON DOMAIN positive IS 'positive integer [inteiro positivo]';
SET search_path = lc, pg_catalog;
COMMENT ON TABLE lc.t001ar15 IS 'country or territory codes - table 1 [códigos de países ou territórios - tabela 1]';
COMMENT ON COLUMN lc.t001ar15.rid IS 'row identifier [identificador (ID) da linha]';
COMMENT ON COLUMN lc.t001ar15.num3 IS 'country/territory numeric-3 code [código de 3 dígitos numéricos para o país/território]';
COMMENT ON COLUMN lc.t001ar15.al3 IS 'country/territory alpha-3 code [código de 3 letras para o país/território]';
COMMENT ON COLUMN lc.t001ar15.al2 IS 'country/territory alpha-2 code [código de 2 letras para o país/território]';
COMMENT ON COLUMN lc.t001ar15.num3spr IS 'super region numeric-3 code [código de 3 dígitos numéricos da super-região]';
COMMENT ON COLUMN lc.t001ar15.num3m49 IS 'is numeric-3 key an UN-M49 code? [o código de 3 dígitos numéricos é um código M49-ONU?]';
COMMENT ON COLUMN lc.t001ar15.num3iso IS 'is numeric-3 key an ISO 3166-1 numeric code? [o código de 3 dígitos numéricos é um código ISO 3166-1 numérico?]';
COMMENT ON COLUMN lc.t001ar15.al3iso IS 'is alpha-3 key an ISO 3166-1 alpha-3 code? [o código de 3 letras é um código ISO 3166-1 de 3 letras?]';
COMMENT ON COLUMN lc.t001ar15.al2iso IS 'is alpha-2 key an ISO 3166-1 alpha-2 code? [o código de 2 letras é um código ISO 3166-1 de 2 letras?]';
COMMENT ON COLUMN lc.t001ar15.gnmid IS 'geoname ID [ID do nome geográfico]';
COMMENT ON COLUMN lc.t001ar15.marc IS 'MARC (Machine Readable Cataloging) code [código para catalogação legível por computador]';
COMMENT ON COLUMN lc.t001ar15.edgar IS 'EDGAR (Electronic Data Gathering, Analysis, and Retrieval) code [código para Coleta, Análise e Recuperação Eletrônica de Dados]';
COMMENT ON COLUMN lc.t001ar15.actv IS 'active [ativo]';
COMMENT ON COLUMN lc.t001ar15.t IS 'timestamp [marca de tempo]';
COMMENT ON TABLE lc.t001ar17 IS 'country or territory codes - table 2 [códigos de países ou territórios - tabela 2]';
COMMENT ON COLUMN lc.t001ar17.rid IS 'row identifier [identificador (ID) da linha]';
COMMENT ON COLUMN lc.t001ar17.num3 IS 'country/territory numeric-3 code [código de 3 dígitos numéricos para o país/território]';
COMMENT ON COLUMN lc.t001ar17.al3 IS 'country/territory alpha-3 code [código de 3 letras para o país/território]';
COMMENT ON COLUMN lc.t001ar17.al2 IS 'country/territory alpha-2 code [código de 2 letras para o país/território]';
COMMENT ON COLUMN lc.t001ar17.num3spr IS 'super region numeric-3 code [código de 3 dígitos numéricos da super-região]';
COMMENT ON COLUMN lc.t001ar17.num3m49 IS 'is numeric-3 key an UN-M49 code? [o código de 3 dígitos numéricos é um código M49-ONU?]';
COMMENT ON COLUMN lc.t001ar17.num3iso IS 'is numeric-3 key an ISO 3166-1 numeric code? [o código de 3 dígitos numéricos é um código ISO 3166-1 numérico?]';
COMMENT ON COLUMN lc.t001ar17.al3iso IS 'is alpha-3 key an ISO 3166-1 alpha-3 code? [o código de 3 letras é um código ISO 3166-1 de 3 letras?]';
COMMENT ON COLUMN lc.t001ar17.al2iso IS 'is alpha-2 key an ISO 3166-1 alpha-2 code? [o código de 2 letras é um código ISO 3166-1 de 2 letras?]';
COMMENT ON COLUMN lc.t001ar17.gnmid IS 'geoname ID [ID do nome geográfico]';
COMMENT ON COLUMN lc.t001ar17.marc IS 'MARC (Machine Readable Cataloging) code [código para catalogação legível por computador]';
COMMENT ON COLUMN lc.t001ar17.edgar IS 'EDGAR (Electronic Data Gathering, Analysis, and Retrieval) code [código para Coleta, Análise e Recuperação Eletrônica de Dados]';
COMMENT ON COLUMN lc.t001ar17.actv IS 'active [ativo]';
COMMENT ON COLUMN lc.t001ar17.t IS 'timestamp [marca de tempo]';
SET search_path = public, pg_catalog;
COMMENT ON DOMAIN cctld IS 'country code top-level domain (ccTLD) [domínio de nível superior, ou domínio de primeiro nível, nacional]';
SET search_path = lc, pg_catalog;
COMMENT ON VIEW lc.vmrccc IS 'MARC (Machine Readable Cataloging) country codes';
COMMENT ON VIEW lc.vmrcgc IS 'MARC (Machine Readable Cataloging) geographic area codes';
COMMENT ON CONSTRAINT chk01_lc_t001ar01 ON t001ar01 IS '1 = continent
2 = subcontinent
3 = country/territory';
