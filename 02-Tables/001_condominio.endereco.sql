-- condominio.endereco
create table condominio.endereco (
     endereco_id   number
    ,municipio_id  number
    ,nm_logradouro varchar2(200)
    ,tp_logradouro varchar2(20)
    ,cep           varchar2(10)
    ,bairro_id     number
    ,dt_insert     date default sysdate    
);
--
alter table condominio.endereco
add constraint endereco_pk primary key (endereco_id);
--
comment on column condominio.endereco.endereco_id   is 'Identificador da tabela';
comment on column condominio.endereco.municipio_id  is 'Identificador da tabela município';
comment on column condominio.endereco.nm_logradouro is 'Nome do logradouro';
comment on column condominio.endereco.tp_logradouro is 'Tipo de logradouro';
comment on column condominio.endereco.cep           is 'CEP';
comment on column condominio.endereco.bairro_id     is 'Identificador da tabela bairro';
comment on column condominio.endereco.dt_insert     is 'Data que foi inserido o registro na tabela.';
--
create sequence condominio.seq_endereco;
