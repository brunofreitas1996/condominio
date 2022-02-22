--
CREATE TABLESPACE Condominio
LOGGING DATAFILE 'Condominio.dbf'
SIZE 100m AUTOEXTEND ON NEXT 100m EXTENT MANAGEMENT LOCAL;
--
commit;
alter session set "_ORACLE_SCRIPT"=true;
--
CREATE USER condominio 
IDENTIFIED BY condominio
DEFAULT TABLESPACE Condominio
QUOTA UNLIMITED ON Condominio;
--
commit;
--
GRANT
create session,
alter session,
create table,
create procedure,
create view,
create materialized view,
create trigger,
create sequence,
create any directory,
create type,
create synonym
TO
condominio;
--
commit;
--
