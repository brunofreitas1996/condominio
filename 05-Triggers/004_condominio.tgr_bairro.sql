-- condominio.tgr_bairro.sql
create or replace trigger condominio.tgr_bairro  
   before insert on condominio.bairro
   for each row 
begin  
   if inserting then 
      if :NEW.bairro_id is null then 
         select condominio.seq_bairro.nextval into :NEW.bairro_id from dual; 
      end if; 
   end if; 
end;
/
