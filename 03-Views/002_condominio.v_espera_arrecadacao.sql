-- condominio.v_espera_arrecadacao.sql
create or replace view condominio.v_espera_arrecadacao as
select arrec_id
     , apartamento_id
     , vl_taxa
     , dt_vencimento
     , st_pagamento
     , tp_tab_generica_id
     , dt_insert 
  from condominio.espera_arrecadacao;
