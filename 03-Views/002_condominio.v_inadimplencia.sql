-- condominio.v_inadimplencia.sql
create or replace view condominio.v_inadimplencia as
select inadimplencia_id
     , arrec_id
     , vl_taxa
     , vl_multa
     , vl_juros
     , vl_total
     , dt_vencimento
     , st_pagamento
     , apartamento_id
     , dt_insert 
  from condominio.inadimplencia;
