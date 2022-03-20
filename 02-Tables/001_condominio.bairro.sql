-- condominio.bairro.sql
create table condominio.bairro(
     bairro_id number
    ,nm_bairro varchar2(200)
    ,dt_insert date default sysdate
);
--
alter table condominio.bairro
add constraint bairro_pk primary key (bairro_id);
--
comment on column condominio.bairro.bairro_id is 'Identificador da tabela';
comment on column condominio.bairro.nm_bairro is 'Nome do bairro';
comment on column condominio.bairro.dt_insert is 'Data que foi inserido o registro na tabela.';
--
create sequence condominio.seq_bairro;
