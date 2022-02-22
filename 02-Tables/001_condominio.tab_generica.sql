-- condominio.tab_generica.sql
create table condominio.tab_generica (
         tab_generica_id integer
       , codigo          integer
       , descricao       varchar2(100)
       , dt_insert       date default sysdate
);
-- chave primaria
alter table condominio.tab_generica
add constraint tab_generica_pk primary key (tab_generica_id);

--comentários
comment on column condominio.tab_generica.tab_generica_id is 'Identificador único da tabela.';
comment on column condominio.tab_generica.codigo          is 'Código único para cada tipo genérico.';
comment on column condominio.tab_generica.descricao       is 'Descrição.';
comment on column condominio.tab_generica.dt_insert       is 'Data que o registro foi inserido.';

-- sequence
create sequence condominio.seq_tab_generica;
