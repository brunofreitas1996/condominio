-- tabela condominio.condominio
create table condominio.condominio (
     condominio_id number
    ,cnpj          varchar2(20)
    ,nm_condominio varchar2(200)
    ,nr_condominio varchar2(50)
    ,complemento   varchar2(200)
    ,endereco_id   number           
    ,dt_insert     date default sysdate
);
-- chave primária
alter table condominio.condominio
add constraint pk primary key(condominio_id);
-- comentários
comment on column condominio.condominio.condominio_id is 'Identificador da tabela';
comment on column condominio.condominio.cnpj          is 'CNPJ do condomínio';
comment on column condominio.condominio.nm_condominio is 'Nome do condomínio';
comment on column condominio.condominio.nr_condominio is 'N�mero do logradouro do condomínio';
comment on column condominio.condominio.complemento   is 'Complemento do endereço';
comment on column condominio.condominio.endereco_id   is 'Identificador da tabela endereço';
comment on column condominio.condominio.dt_insert     is 'Data que foi inserido o registro na tabela.';
-- sequence
create sequence condominio.seq_condominio;
