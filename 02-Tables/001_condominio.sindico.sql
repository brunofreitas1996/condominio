-- condominio.sindico.sql
create table condominio.sindico (
     sindico_id number
    ,dt_inicio  date
    ,dt_fim     date
    ,pessoa_id  number
    ,dt_insert  date default sysdate
);
--
alter table condominio.sindico
add constraint sindico_pk primary key (sindico_id);
--
comment on column condominio.sindico.sindico_id is 'Identificador da tabela';
comment on column condominio.sindico.dt_inicio  is 'Data de início de vigência';
comment on column condominio.sindico.dt_fim     is 'Data de fim de vigência';
comment on column condominio.sindico.pessoa_id  is 'Identificador da tabela pessoa';
comment on column condominio.sindico.dt_insert  is 'Data que foi inserido o registro na tabela.';
--
create sequence condominio.seq_sindico;
