--   condominio.pessoa.sql

create table condominio.pessoa (
        pessoa_id     integer
      , nome          varchar2(100)
      , nr_cad_unico  varchar2(30)
      , dt_nascimento date
      , dt_insert     date default sysdate
);
-- chave prim�ria
alter table condominio.pessoa
add constraint pessoa_pk primary key (pessoa_id);

-- comentarios
comment on column condominio.pessoa.pessoa_id     is 'Identificador �nico da tabela.';
comment on column condominio.pessoa.nome          is 'Nome da pessoa.';
comment on column condominio.pessoa.nr_cad_unico  is 'N�mero do cadastro �nico da pessoa.';
comment on column condominio.pessoa.dt_nascimento is 'Data de nascimento.';
comment on column condominio.pessoa.dt_insert     is 'Data de inser��o do registro na tabela.';
 
-- sequence
create sequence condominio.seq_pessoa;
 
