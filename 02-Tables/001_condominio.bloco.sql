-- condominio.bloco.sql
create table condominio.bloco (
         bloco_id         integer
       , nome             varchar2(10)
       , qtd_apartamentos integer
       , qtd_andares      integer
       , dt_insert        date default sysdate
);
-- chave primária
alter table condominio.bloco
add constraint bloco_pk primary key (bloco_id);

-- comentários
comment on column condominio.bloco.bloco_id         is 'Identificador único da tabela.';
comment on column condominio.bloco.nome             is 'Nome do bloco.';
comment on column condominio.bloco.qtd_apartamentos is 'Quantidade de apartamentos no bloco.';
comment on column condominio.bloco.qtd_andares      is 'Quantidade de andares no bloco.';
comment on column condominio.bloco.dt_insert        is 'Data que o registro foi inserido na tabela.';

-- sequence
create sequence condominio.seq_bloco;
