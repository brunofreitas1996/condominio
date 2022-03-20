-- condominio.municipio
create table condominio.municipio (
     municipio_id number
    ,nm_municipio varchar2(200)
    ,uf           char(4)
    ,pais         varchar2(100)           
    ,dt_insert    date default sysdate
);
--
alter table condominio.municipio
add constraint municipio_pk primary key (municipio_id);
--
comment on column condominio.municipio.municipio_id is 'Identificador da tabela';
comment on column condominio.municipio.nm_municipio is 'Nome do município';
comment on column condominio.municipio.uf           is 'UF';
comment on column condominio.municipio.pais         is 'Nome País';
comment on column condominio.municipio.dt_insert    is 'Data que foi inserido o registro na tabela.';
--
create sequence condominio.seq_municipio;
