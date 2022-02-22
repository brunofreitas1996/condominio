-- condominio.condomino.sql
create table condominio.condomino (
         condomino_id         integer
       , apartamento_id       integer
       , pessoa_id            integer
       , dt_inicio            date
       , dt_fim               date
       , vl_porcent           number
       , tp_dond_tab_generica integer
       , dt_insert            date default sysdate
);
-- chave primaria
alter table condominio.condomino
add constraint condomino_pk primary key (condomino_id);

-- comentários
comment on column condominio.condomino.condomino_id         is 'Identificador único da tabela.';
comment on column condominio.condomino.apartamento_id       is 'Identificador da tabela apartamento.';
comment on column condominio.condomino.pessoa_id            is 'Identificador da tabela pessoa.';
comment on column condominio.condomino.dt_inicio            is 'Data de início do vinculo com o imóvel.';
comment on column condominio.condomino.dt_fim               is 'data de fim de vinculo com o imóvel.';
comment on column condominio.condomino.vl_porcent           is 'Valor de participação no imóvel.';
comment on column condominio.condomino.tp_dond_tab_generica is 'Tipo de vinculo com o imóvel.';
comment on column condominio.condomino.dt_insert            is 'Data de inserção do registro na tabela.';

-- sequence
create sequence condominio.condomino;
