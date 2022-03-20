-- condominio.valida_pagamento.sql
create table condominio.valida_pagamento (
     valida_pagamento_id number
    ,arrec_id            number
    ,vl_pago             number(20,2)
    ,dt_pagamento        date
    ,dt_insercao         timestamp
    ,apartamento_id      number
    ,dt_insert           date default sysdate
);
--
alter table condominio.valida_pagamento 
add constraint valida_pagamento_pk primary key (valida_pagamento_id);
--
comment on column condominio.valida_pagamento.valida_pagamento_id is 'Indentificador da tabela';
comment on column condominio.valida_pagamento.arrec_id            is 'Identificador da tabela espera arrecadação';
comment on column condominio.valida_pagamento.vl_pago             is 'Valor total pago';
comment on column condominio.valida_pagamento.dt_pagamento        is 'Data de pagamento';
comment on column condominio.valida_pagamento.dt_insercao         is 'Data de leitura do arquivo de arrecadação';
comment on column condominio.valida_pagamento.apartamento_id      is 'Identificador da tabela apartamento';
comment on column condominio.valida_pagamento.dt_insert           is 'Data que foi inserido o registro na tabela.';
--
create sequence condominio.seq_valida_pagamento;
