-- condominio.tgr_espera_arrecadacao.sql
create or replace trigger condominio.tgr_espera_arrecadacao  
   before insert on condominio.espera_arrecadacao
   for each row 
begin  
   if inserting then 
      if :NEW.espera_arrecadacao_id is null then 
         select condominio.seq_espera_arrecadacao.nextval into :NEW.espera_arrecadacao_id from dual; 
      end if; 
   end if; 
end;
/
