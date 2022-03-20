-- condominio.tgr_assembleia.sql
create or replace trigger condominio.tgr_assembleia  
   before insert on condominio.assembleia
   for each row 
begin  
   if inserting then 
      if :NEW.assembleia_id is null then 
         select condominio.seq_assembleia.nextval into :NEW.assembleia_id from dual; 
      end if; 
   end if; 
end;
/
