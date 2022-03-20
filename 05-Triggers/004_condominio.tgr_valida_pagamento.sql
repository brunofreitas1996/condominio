-- condominio.tgr_valida_pagamento.sql
create or replace trigger condominio.tgr_valida_pagamento  
   before insert on condominio.valida_pagamento
   for each row 
begin  
   if inserting then 
      if :NEW.valida_pagamento_id is null then 
         select condominio.seq_valida_pagamento.nextval into :NEW.valida_pagamento_id from dual; 
      end if; 
   end if; 
end;
/
