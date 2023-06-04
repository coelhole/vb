﻿-- SQL Manager for PostgreSQL 5.9.5.52424
-- ---------------------------------------
-- Host      : localhost
-- Database  : SGE
-- Version   : PostgreSQL 9.3.25, compiled by Visual C++ build 1600, 32-bit



CREATE SCHEMA "LC" AUTHORIZATION postgres;
CREATE SCHEMA "USR" AUTHORIZATION postgres;
SET check_function_bodies = false;
--
-- Definition for function 001_before_trg_func : 
--
SET search_path = "USR", pg_catalog;
CREATE FUNCTION "USR"."001_before_trg_func" (
)
RETURNS trigger
AS 
$body$
BEGIN
	IF (TG_OP = 'UPDATE') THEN
    	IF (NEW."USRID" <> OLD."USRID") THEN
        	RAISE EXCEPTION 'O campo USRID é imutável!';
        END IF;

    	IF (NEW."USRNM" <> OLD."USRNM") THEN
        	RAISE EXCEPTION 'O campo USRNM é imutável!';
        END IF;
    
    	IF (NEW."PWDHSH" <> OLD."PWDHSH") OR (NEW."ACTV" <> OLD."ACTV") THEN
        	NEW."T" = NOW();
        END IF;
    END IF;
    
    RETURN NEW;
END;
$body$
LANGUAGE plpgsql;
--
-- Definition for function 001AR05_before_trg_func : 
--
SET search_path = "LC", pg_catalog;
CREATE FUNCTION "LC"."001AR05_before_trg_func" (
)
RETURNS trigger
AS 
$body$
BEGIN
	IF (TG_OP = 'INSERT') THEN
		INSERT INTO "LC"."001AR01"("NUM3","AL3","AL2","GNMID","NUM3SPR","NUM3M49","NUM3ISO","AL3ISO","AL2ISO","ARTP","ACTV")
		VALUES (NEW."NUM3",NEW."AL3",NEW."AL2",NEW."GNMID",'001',NEW."NUM3M49",NEW."NUM3ISO",NEW."AL3ISO",NEW."AL2ISO",1,NEW."ACTV");
	END IF;

	IF (TG_OP = 'UPDATE') THEN
		IF NEW."RID"<>OLD."RID" THEN
			RAISE EXCEPTION 'O campo RID é imutável!';
        END IF;

		IF NEW."NUM3"<>OLD."NUM3" THEN
			RAISE EXCEPTION 'O campo NUM3 é imutável!';
        END IF;

		IF NEW."AL3"<>OLD."AL3" THEN
			RAISE EXCEPTION 'O campo AL3 é imutável!';
        END IF;

		IF NEW."AL2"<>OLD."AL2" THEN
			RAISE EXCEPTION 'O campo AL2 é imutável!';
        END IF;
    
  		NEW."T" = NOW();
    
		UPDATE
        	"LC"."001AR01"
        SET
    		"GNMID" = NEW."GNMID",
    		"NUM3M49" = NEW."NUM3M49",
    		"NUM3ISO" = NEW."NUM3ISO",
    		"AL3ISO" = NEW."AL3ISO",
    		"AL2ISO" = NEW."AL2ISO",
    		"ACTV" = NEW."ACTV",
            "T" = NEW."T"
    	WHERE
    		"NUM3" = OLD."NUM3";
  	END IF;
    
    RETURN NEW;
END;
$body$
LANGUAGE plpgsql;
--
-- Structure for table 001AR01 : 
--
CREATE TABLE "LC"."001AR01" (
    "RID" integer DEFAULT nextval(('"LC"."001AR01_RID_seq"'::text)::regclass) NOT NULL,
    "NUM3" char(3) NOT NULL,
    "AL3" char(3) NOT NULL,
    "AL2" char(2) NOT NULL,
    "GNMID" integer,
    "NUM3SPR" char(3) NOT NULL,
    "NUM3M49" boolean NOT NULL,
    "NUM3ISO" boolean NOT NULL,
    "AL3ISO" boolean NOT NULL,
    "AL2ISO" boolean NOT NULL,
    "ARTP" smallint NOT NULL,
    "ACTV" boolean NOT NULL,
    "T" timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT "CHK01_LC001AR01" CHECK ((("ARTP" > 0) AND ("ARTP" < 4)))
)
WITH (oids = false);
--
-- Structure for table 001AR05 : 
--
CREATE TABLE "LC"."001AR05" (
    "RID" integer DEFAULT nextval(('"LC"."001AR05_RID_seq"'::text)::regclass) NOT NULL,
    "NUM3" char(3) NOT NULL,
    "AL3" char(3) NOT NULL,
    "AL2" char(2) NOT NULL,
    "GNMID" integer,
    "NUM3M49" boolean NOT NULL,
    "NUM3ISO" boolean NOT NULL,
    "AL3ISO" boolean NOT NULL,
    "AL2ISO" boolean NOT NULL,
    "ACTV" boolean NOT NULL,
    "T" timestamp without time zone DEFAULT now() NOT NULL
)
WITH (oids = false);
--
-- Definition for sequence 001AR01_RID_seq : 
--
CREATE SEQUENCE "LC"."001AR01_RID_seq"
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence 001AR05_RID_seq : 
--
CREATE SEQUENCE "LC"."001AR05_RID_seq"
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 2147483647
    NO MINVALUE
    CACHE 1;
--
-- Structure for table 001 : 
--
SET search_path = "USR", pg_catalog;
CREATE TABLE "USR"."001" (
    "USRID" serial NOT NULL,
    "USRNM" varchar(32) NOT NULL,
    "PWDHSH" char(40) NOT NULL,
    "ACTV" boolean DEFAULT true NOT NULL,
    "T" timestamp(0) without time zone DEFAULT now() NOT NULL
)
WITH (oids = false);
--
-- Definition for index PK_LC001AR01 : 
--
SET search_path = "LC", pg_catalog;
ALTER TABLE ONLY "001AR01"
    ADD CONSTRAINT "PK_LC001AR01"
    PRIMARY KEY ("NUM3");
--
-- Definition for index PK_LC001AR05 : 
--
ALTER TABLE ONLY "001AR05"
    ADD CONSTRAINT "PK_LC001AR05"
    PRIMARY KEY ("NUM3");
--
-- Definition for index UQ01_LC001AR01 : 
--
ALTER TABLE ONLY "001AR01"
    ADD CONSTRAINT "UQ01_LC001AR01"
    UNIQUE ("RID");
--
-- Definition for index UQ01_LC001AR05 : 
--
ALTER TABLE ONLY "001AR05"
    ADD CONSTRAINT "UQ01_LC001AR05"
    UNIQUE ("RID");
--
-- Definition for index PK_USR001 : 
--
SET search_path = "USR", pg_catalog;
ALTER TABLE ONLY "001"
    ADD CONSTRAINT "PK_USR001"
    PRIMARY KEY ("USRID");
--
-- Definition for index UQ01_USR001 : 
--
ALTER TABLE ONLY "001"
    ADD CONSTRAINT "UQ01_USR001"
    UNIQUE ("USRNM");
--
-- Definition for trigger LC001AR05_BFR_TRG : 
--
SET search_path = "LC", pg_catalog;
CREATE TRIGGER "LC001AR05_BFR_TRG"
    BEFORE INSERT OR UPDATE OF "RID", "NUM3", "AL3", "AL2", "GNMID", "NUM3M49", "NUM3ISO", "AL3ISO", "AL2ISO", "ACTV" ON "001AR05"
    FOR EACH ROW
    EXECUTE PROCEDURE "001AR05_before_trg_func" ();
--
-- Definition for trigger USR001_BFR_TRG : 
--
SET search_path = "USR", pg_catalog;
CREATE TRIGGER "USR001_BFR_TRG"
    BEFORE UPDATE OF "USRID", "USRNM", "PWDHSH", "ACTV" ON "001"
    FOR EACH ROW
    EXECUTE PROCEDURE "001_before_trg_func" ();
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
COMMENT ON SCHEMA "LC" IS 'locale info [informações de localização]';
SET search_path = "LC", pg_catalog;
COMMENT ON TABLE "LC"."001AR01" IS 'country or area codes [códigos para países ou áreas geográficas]';
COMMENT ON COLUMN "LC"."001AR01"."RID" IS 'row identifier [identificador (ID) da linha]';
COMMENT ON COLUMN "LC"."001AR01"."NUM3" IS 'country or area numeric-3 code [código de país ou área de 3 dígitos numéricos]';
COMMENT ON COLUMN "LC"."001AR01"."AL3" IS 'alpha-3 code [código de país ou área de 3 letras]';
COMMENT ON COLUMN "LC"."001AR01"."AL2" IS 'alpha-2 code [código de país ou área de 2 letras]';
COMMENT ON COLUMN "LC"."001AR01"."GNMID" IS 'geoname ID [ID do nome geográfico]';
COMMENT ON COLUMN "LC"."001AR01"."NUM3SPR" IS 'super region numeric-3 code [código de país ou área, de 3 dígitos numéricos, da super-região]';
COMMENT ON COLUMN "LC"."001AR01"."NUM3M49" IS 'is numeric-3 key an UN-M49 code? [o código de 3 dígitos numéricos é um código M49-ONU?]';
COMMENT ON COLUMN "LC"."001AR01"."NUM3ISO" IS 'is numeric-3 key an ISO 3166-1 numeric code? [o código de 3 dígitos numéricos é um código ISO 3166-1 numérico?]';
COMMENT ON COLUMN "LC"."001AR01"."AL3ISO" IS 'is alpha-3 key an ISO 3166-1 alpha-3 code? [o código de 3 letras é um código ISO 3166-1 de 3 letras?]';
COMMENT ON COLUMN "LC"."001AR01"."AL2ISO" IS 'is alpha-2 key an ISO 3166-1 alpha-2 code? [o código de 2 letras é um código ISO 3166-1 de 2 letras?]';
COMMENT ON COLUMN "LC"."001AR01"."ARTP" IS 'area type [tipo de área]

1 = continente
2 = subcontinente
3 = país/território';
COMMENT ON COLUMN "LC"."001AR01"."ACTV" IS 'active [ativo]';
COMMENT ON COLUMN "LC"."001AR01"."T" IS 'timestamp [marca de tempo]';
COMMENT ON TABLE "LC"."001AR05" IS 'continent codes [códigos para continentes]';
COMMENT ON COLUMN "LC"."001AR05"."RID" IS 'row identifier [identificador (ID) da linha]';
COMMENT ON COLUMN "LC"."001AR05"."NUM3" IS 'continent numeric-3 code [código de 3 dígitos numéricos para o continente]';
COMMENT ON COLUMN "LC"."001AR05"."AL3" IS 'continent alpha-3 code [código de 3 letras para o continente]';
COMMENT ON COLUMN "LC"."001AR05"."AL2" IS 'continent alpha-2 code [código de 2 letras para o continente]';
COMMENT ON COLUMN "LC"."001AR05"."GNMID" IS 'geoname ID [ID do nome geográfico]';
COMMENT ON COLUMN "LC"."001AR05"."NUM3M49" IS 'is numeric-3 key an UN-M49 code? [o código de 3 dígitos numéricos é um código M49-ONU?]';
COMMENT ON COLUMN "LC"."001AR05"."NUM3ISO" IS 'is numeric-3 key an ISO 3166-1 numeric code? [o código de 3 dígitos numéricos é um código ISO 3166-1 numérico?]';
COMMENT ON COLUMN "LC"."001AR05"."AL3ISO" IS 'is alpha-3 key an ISO 3166-1 alpha-3 code? [o código de 3 letras é um código ISO 3166-1 de 3 letras?]';
COMMENT ON COLUMN "LC"."001AR05"."AL2ISO" IS 'is alpha-2 key an ISO 3166-1 alpha-2 code? [o código de 2 letras é um código ISO 3166-1 de 2 letras?]';
COMMENT ON COLUMN "LC"."001AR05"."ACTV" IS 'active [ativo]';
COMMENT ON COLUMN "LC"."001AR05"."T" IS 'timestamp [marca de tempo]';
COMMENT ON CONSTRAINT "CHK01_LC001AR01" ON "001AR01" IS '1 = continent
2 = subcontinent
3 = country/territory';
COMMENT ON SCHEMA "USR" IS 'user info [informações de usuário]';
SET search_path = "USR", pg_catalog;
COMMENT ON TABLE "USR"."001" IS 'user login data [dados de login do usuário]';
COMMENT ON COLUMN "USR"."001"."USRID" IS 'user ID [número ID (identificador) do usuário]';
COMMENT ON COLUMN "USR"."001"."USRNM" IS 'username [nome de usuário]';
COMMENT ON COLUMN "USR"."001"."PWDHSH" IS 'password SHA-1 hash [hash SHA-1 da senha]';
COMMENT ON COLUMN "USR"."001"."ACTV" IS 'active [o usuário está ativo?]';
COMMENT ON COLUMN "USR"."001"."T" IS 'insert/last update timestamp [marca temporal da inserção/última atualização]';
