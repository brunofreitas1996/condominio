-- condominio.usuarios.sql

create table condominio.usuarios (
         usuarios_id         integer
       , username           varchar2(20)
       , password           varchar2(50)
       , st_tab_generica_id integer
       , tp_tab_generica_id integer
       , dt_insert          date default sysdate
);
-- chave primária
alter table condominio.usuarios
add constraint usuarios_pk primary key (usuarios_id);

--comentários
comment on column condominio.usuarios.usuarios_id         is 'Identificador único da tabela.';
comment on column condominio.usuarios.username           is 'CPF ou CNPJ da pessoa.';
comment on column condominio.usuarios.password           is 'Senha de acesso.';
comment on column condominio.usuarios.st_tab_generica_id is 'Situação do usuário.';
comment on column condominio.usuarios.tp_tab_generica_id is 'Tipo de usuário.';
comment on column condominio.usuarios.dt_insert          is 'Data que foi inserido o registro na tabela.';

-- sequence
create sequence condominio.seq_usuarios;
