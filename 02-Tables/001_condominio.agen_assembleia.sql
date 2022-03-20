-- condominio.agen_assembleia
create table condominio.agen_assembleia (
      agen_assem_id number
    , dt_prevista   date
    , hr_prevista   varchar2(10)
    , sindico_id    number
    , dt_insert     date default sysdate
);
--
alter table condominio.agen_assembleia
add constraint agen_assembleia_pk primary key (agen_assem_id);
--
comment on column condominio.agen_assembleia.agen_assem_id is 'Identificador da tabela';
comment on column condominio.agen_assembleia.dt_prevista   is 'Data prevista para acontecer a assembleia';
comment on column condominio.agen_assembleia.hr_prevista   is 'Hora prevista para iniciar a asembleia';
comment on column condominio.agen_assembleia.sindico_id    is 'Identificador do síndico';
comment on column condominio.agen_assembleia.dt_insert     is 'Data que foi inserido o registro na tabela.';
--
create sequence condominio.seq_agen_assembleia;
