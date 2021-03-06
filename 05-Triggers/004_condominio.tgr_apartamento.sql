-- condominio.tgr_apartamento.sql
create or replace trigger condominio.tgr_apartamento  
   before insert on condominio.apartamento
   for each row 
begin  
   if inserting then 
      if :NEW.apartamento_id is null then 
         select condominio.seq_apartamento.nextval into :NEW.apartamento_id from dual; 
      end if; 
   end if; 
end;
/
