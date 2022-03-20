-- condominio.v_valida_pagamento
create or replace view condominio.v_valida_pagamento as
select valida_pagamento_id
     , arrec_id
     , vl_pago
     , dt_pagamento
     , dt_insercao
     , apartamento_id
     , dt_insert 
  from condominio.valida_pagamento;
