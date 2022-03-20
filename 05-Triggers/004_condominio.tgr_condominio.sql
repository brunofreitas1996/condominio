-- condominio.tgr_condominio.sql
create or replace trigger condominio.tgr_condominio  
   before insert on condominio.condominio
   for each row 
begin  
   if inserting then 
      if :NEW.condominio_id is null then 
         select condominio.seq_condominio.nextval into :NEW.condominio_id from dual; 
      end if; 
   end if; 
end;
/
