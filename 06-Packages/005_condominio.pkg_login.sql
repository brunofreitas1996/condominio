create or replace package condominio.pkg_login is

procedure prc_valida_login(p_usuario in condominio.usuarios.username%type
                          ,p_senha   in varchar2
                          ,p_result  out integer);

procedure prc_alt_senha(p_cpf_cnpj      in condominio.usuarios.username%type
                       ,p_dt_nascimento in varchar2
                       ,p_nova_senha    in condominio.usuarios.password%type
                       ,P_result        out integer);

end;
/
create or replace package body condominio.pkg_login is

procedure prc_valida_login(p_usuario in condominio.usuarios.username%type
                          ,p_senha   in varchar2
                          ,p_result  out integer)
is
 v_user  integer := 0;
 v_senha condominio.usuarios.password%type;
begin

   select count(1) 
     into v_user
     from condominio.usuarios u
    where u.username = p_usuario;
 
 if v_user > 0 then
   begin
     select u.password
       into v_senha
       from condominio.usuarios u
      where u.username = p_usuario;
   end;
   if p_senha = v_senha then
     p_result := 1;
   else
     p_result := 9;
   end if;
 else
   p_result := 0;
 end if;
end;

procedure prc_alt_senha(p_cpf_cnpj      in condominio.usuarios.username%type
                       ,p_dt_nascimento in varchar2
                       ,p_nova_senha    in condominio.usuarios.password%type
                       ,P_result        out integer                       )
is
v_dt_nascimento date    := to_date(p_dt_nascimento, 'dd/mm/yyyy');
v_user          integer := 0;
v_dt_nasc       integer := 0;

begin
   p_result := 0;
   
   select count(1) 
     into v_user
     from condominio.usuarios u
    where u.username = p_cpf_cnpj;
    
    if v_user > 0 then
     select count(1)
       into v_dt_nasc
       from condominio.pessoa p
      where p.dt_nascimento = v_dt_nascimento
        and p.nr_cad_unico  = p_cpf_cnpj;
        
        if v_dt_nasc > 0 then
          update condominio.usuarios
             set password = p_nova_senha
           where username = p_cpf_cnpj;
           p_result := 1;
        end if;
        
    end if;
end;

end;
/
