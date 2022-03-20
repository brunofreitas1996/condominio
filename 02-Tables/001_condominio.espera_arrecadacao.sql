-- condominio.espera_arrecadacao.sql
create table condominio.espera_arrecadacao (
     arrec_id           number
    ,apartamento_id     number
    ,vl_taxa            number(20,2)
    ,dt_vencimento      date
    ,st_pagamento       number(1,0)
    ,tp_tab_generica_id number
    ,dt_insert          date default sysdate
);
--
alter table condominio.espera_arrecadacao
add constraint espera_arrecadacao_pk primary key (arrec_id);
--
comment on column condominio.espera_arrecadacao.arrec_id           is 'Identificador da tabela';
comment on column condominio.espera_arrecadacao.apartamento_id     is 'Identificador da tabela apartamento';
comment on column condominio.espera_arrecadacao.vl_taxa            is 'Valor da taxa de condomínio';
comment on column condominio.espera_arrecadacao.dt_vencimento      is 'Data de vencimento';
comment on column condominio.espera_arrecadacao.st_pagamento       is '0 - Não pagou, 1 - pagou';
comment on column condominio.espera_arrecadacao.tp_tab_generica_id is 'Identificação da tabela tipo arrecadação';
comment on column condominio.espera_arrecadacao.dt_insert          is 'Data que foi inserido o registro na tabela.';
--
create sequence condominio.seq_espera_arrecadacao;
