-- condominio.tgr_bloco.sql
create or replace trigger condominio.tgr_bloco  
   before insert on condominio.bloco
   for each row 
begin  
   if inserting then 
      if :NEW.bloco_id is null then 
         select condominio.seq_bloco.nextval into :NEW.bloco_id from dual; 
      end if; 
   end if; 
end;
/
