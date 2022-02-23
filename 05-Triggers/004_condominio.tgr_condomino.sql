-- condominio.tgr_condomino.sql
create or replace trigger condominio.tgr_condomino  
   before insert on condominio.condomino
   for each row 
begin  
   if inserting then 
      if :NEW.condomino_id is null then 
         select condominio.seq_condomino.nextval into :NEW.condomino_id from dual; 
      end if; 
   end if; 
end;
/
