-- condominio.apartamento.sql
create table condominio.apartamento (
         apartamento_id     integer
       , bloco_id           integer
       , nr_andar           varchar2(10)
       , nr_apartamento     integer
       , tp_tab_generica_id integer
       , endereco_id        integer
       , complemento        varchar2(100)
       , dt_insert          date default sysdate
);
-- chave primária
alter table condominio.apartamento
add constraint apartamento_pk primary key (apartamento_id);

--comentários
comment on column condominio.apartamento.apartamento_id     is 'Identificador único da tabela.';
comment on column condominio.apartamento.bloco_id           is 'Indentificador do bloco.';
comment on column condominio.apartamento.nr_andar           is 'Número do andar';
comment on column condominio.apartamento.nr_apartamento     is 'Número ou Letra do apartamento.';
comment on column condominio.apartamento.tp_tab_generica_id is 'Tipo do apartamento, código: 1.';
comment on column condominio.apartamento.endereco_id        is 'Identificador do endereço.';
comment on column condominio.apartamento.complemento        is 'Complemento do endereço';
comment on column condominio.apartamento.dt_insert          is 'Data que foi inserido o registro na tabela.';

-- sequence
create sequence condominio.seq_apartamento;
