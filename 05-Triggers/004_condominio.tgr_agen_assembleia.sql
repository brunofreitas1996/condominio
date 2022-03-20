-- condominio.tgr_agen_assembleia.sql
create or replace trigger condominio.tgr_agen_assembleia  
   before insert on condominio.agen_assembleia
   for each row 
begin  
   if inserting then 
      if :NEW.agen_assem_id is null then 
         select condominio.seq_agen_assembleia.nextval into :NEW.agen_assem_id from dual; 
      end if; 
   end if; 
end;
/
