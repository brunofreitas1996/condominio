-- condominio.inadimplencia.sql
create table condominio.inadimplencia (
     inadimplencia_id number
    ,arrec_id     number
    ,vl_taxa          number(20,2)
    ,vl_multa         number(20,2)
    ,vl_juros         number(20,2)
    ,vl_total         number(20,2)
    ,dt_vencimento    date
    ,st_pagamento     number(1,0)
    ,apartamento_id   number
    ,dt_insert        date default sysdate
);
--
alter table condominio.inadimplencia
add constraint inadimplencia_pk primary key(inadimplencia_id);
--
comment on column condominio.inadimplencia.inadimplencia_id is 'Identificador da tabela';
comment on column condominio.inadimplencia.arrec_id         is 'Identificador da tabela arrecada��o';
comment on column condominio.inadimplencia.vl_taxa          is 'Valor da taxa do condomínio';
comment on column condominio.inadimplencia.vl_multa         is 'Valor da multa';
comment on column condominio.inadimplencia.vl_juros         is 'Valor dos juros';
comment on column condominio.inadimplencia.vl_total         is 'Valor total';
comment on column condominio.inadimplencia.dt_vencimento    is 'Data de vencimento';
comment on column condominio.inadimplencia.st_pagamento     is '0 - Não pagou, 1 - Pagou';
comment on column condominio.inadimplencia.apartamento_id   is 'Identificador da tabela apartamento';
comment on column condominio.inadimplencia.dt_insert        is 'Data que foi inserido o registro na tabela.';
--
create sequence condominio.seq_inadimplencia;
