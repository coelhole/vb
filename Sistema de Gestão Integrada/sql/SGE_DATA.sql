-- SQL Manager for PostgreSQL 5.9.5.52424
-- ---------------------------------------
-- Host      : localhost
-- Database  : SGE
-- Version   : PostgreSQL 9.3.25, compiled by Visual C++ build 1600, 32-bit



SET search_path = "LC", pg_catalog;
--
-- Data for table "LC"."001AR05" (LIMIT 0,6)
--
INSERT INTO "001AR05" ("RID", "NUM3", "AL3", "AL2", "GNMID", "NUM3M49", "NUM3ISO", "AL3ISO", "AL2ISO", "ACTV", "T")
VALUES (1, '002', 'FFF', 'FF', 6255146, true, false, false, false, true, '2023-06-03 22:08:51.989');

INSERT INTO "001AR05" ("RID", "NUM3", "AL3", "AL2", "GNMID", "NUM3M49", "NUM3ISO", "AL3ISO", "AL2ISO", "ACTV", "T")
VALUES (2, '009', 'UUU', 'UU', 6255151, true, false, false, false, true, '2023-06-03 22:08:51.989');

INSERT INTO "001AR05" ("RID", "NUM3", "AL3", "AL2", "GNMID", "NUM3M49", "NUM3ISO", "AL3ISO", "AL2ISO", "ACTV", "T")
VALUES (3, '010', 'ATA', 'AQ', 6255152, true, true, true, true, true, '2023-06-03 22:08:51.989');

INSERT INTO "001AR05" ("RID", "NUM3", "AL3", "AL2", "GNMID", "NUM3M49", "NUM3ISO", "AL3ISO", "AL2ISO", "ACTV", "T")
VALUES (4, '019', 'AME', 'AA', 10861432, true, false, false, false, true, '2023-06-03 22:08:51.989');

INSERT INTO "001AR05" ("RID", "NUM3", "AL3", "AL2", "GNMID", "NUM3M49", "NUM3ISO", "AL3ISO", "AL2ISO", "ACTV", "T")
VALUES (5, '142', 'ABB', 'AB', 6255147, true, false, false, false, true, '2023-06-03 22:08:51.989');

INSERT INTO "001AR05" ("RID", "NUM3", "AL3", "AL2", "GNMID", "NUM3M49", "NUM3ISO", "AL3ISO", "AL2ISO", "ACTV", "T")
VALUES (6, '150', 'EEE', 'EB', 6255148, true, false, false, false, true, '2023-06-03 22:08:51.989');

SET search_path = "USR", pg_catalog;
--
-- Data for table "USR"."001" (LIMIT 0,1)
--
INSERT INTO "001" ("USRID", "USRNM", "PWDHSH", "ACTV", "T")
VALUES (1, 'dba', 'e076b520fa688ac2b7d0815613ef2d0c5ef26445', true, '2023-06-03 16:52:56');

--
-- Data for sequence "LC"."001AR05_RID_seq"
--
SET search_path = "LC", pg_catalog;
SELECT pg_catalog.setval('"001AR05_RID_seq"', 6, true);
--
-- Data for sequence "USR"."001_USRID_seq"
--
SET search_path = "USR", pg_catalog;
SELECT pg_catalog.setval('"001_USRID_seq"', 2, false);
