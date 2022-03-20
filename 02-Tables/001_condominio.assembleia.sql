-- condominio.assembleia
create table condominio.assembleia (
      assembleia_id   integer
    , dt_assembleia   date
    , hr_inicio       varchar2(10)
    , hr_fim          varchar2(10)
    , qtd_condominos  integer
    , agen_assem_id   integer
    , desc_assembleia clob
    , dt_insert       date default sysdate
    
);
-- chave prim�ria
alter table condominio.assembleia
add constraint assembleia_pk primary key(assembleia_id);

-- coment�rios
comment on column condominio.assembleia.assembleia_id   is 'Identificador da tabela';
comment on column condominio.assembleia.dt_assembleia   is 'Data da assembleia';
comment on column condominio.assembleia.hr_inicio       is 'Hora de in�cio da assembleia';
comment on column condominio.assembleia.hr_fim          is 'Hora do t�rmino a assembleia';
comment on column condominio.assembleia.qtd_condominos  is 'Quantidade de participantes';
comment on column condominio.assembleia.agen_assem_id   is 'Identificador da tabela de agenda';
comment on column condominio.assembleia.desc_assembleia is 'Assuntos tratados';
-- sequence
create sequence condominio.seq_assembleia;
