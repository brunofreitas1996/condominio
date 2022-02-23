-- condominio.tgr_pessoa.sql
create or replace trigger condominio.tgr_pessoa  
   before insert on condominio.pessoa
   for each row 
begin  
   if inserting then 
      if :NEW.pessoa_id is null then 
         select condominio.seq_pessoa.nextval into :NEW.pessoa_id from dual; 
      end if; 
   end if; 
end;
/
