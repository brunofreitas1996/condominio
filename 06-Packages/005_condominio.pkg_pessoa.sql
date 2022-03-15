create or replace package condominio.pkg_pessoa is

procedure prc_ins_pessoa ( p_pessoa_id     out condominio.pessoa.pessoa_id%type
                         , p_nome          in  condominio.pessoa.nome%type
                         , p_nr_cad_unico  in  condominio.pessoa.nr_cad_unico%type
                         , p_dt_nascimento in  varchar2
                         );

procedure prc_alt_pessoa ( p_pessoa_id     in  condominio.pessoa.pessoa_id%type
                         , p_nome          in  condominio.pessoa.nome%type
                         , p_nr_cad_unico  in  condominio.pessoa.nr_cad_unico%type
                         , p_dt_nascimento in  varchar2
                         );

procedure prc_del_pessoa ( p_pessoa_id     in  condominio.pessoa.pessoa_id%type);

end;
/
create or replace package body condominio.pkg_pessoa is

procedure prc_ins_pessoa ( p_pessoa_id     out condominio.pessoa.pessoa_id%type
                         , p_nome          in  condominio.pessoa.nome%type
                         , p_nr_cad_unico  in  condominio.pessoa.nr_cad_unico%type
                         , p_dt_nascimento in  varchar2
                         )
is 
v_existe_pessoa integer;
v_dt_nascimento condominio.pessoa.dt_nascimento%type := to_date(p_dt_nascimento);
begin

v_existe_pessoa := condominio.pkg_verifica.fnc_existe_pessoa(p_nr_cad_unico);

 if v_existe_pessoa = 0 then
  insert into condominio.v_pessoa
              (nome, nr_cad_unico, dt_nascimento)
              values
              (upper(p_nome), p_nr_cad_unico, v_dt_nascimento)
              returning pessoa_id into p_pessoa_id;
 else
  raise_application_error(-20000, 'J� existe registro com o N�mero: '||p_nr_cad_unico||' informado.');
 end if;

exception
  when others then
    raise_application_error(-20000, 'N�o foi possivel inserir o registro');
end;

procedure prc_alt_pessoa ( p_pessoa_id     in  condominio.pessoa.pessoa_id%type
                         , p_nome          in  condominio.pessoa.nome%type
                         , p_nr_cad_unico  in  condominio.pessoa.nr_cad_unico%type
                         , p_dt_nascimento in  varchar2
                         )
is
v_dt_nascimento condominio.pessoa.dt_nascimento%type := to_date(p_dt_nascimento);
begin

update condominio.v_pessoa
   set nome          = upper(p_nome) 
     , nr_cad_unico  = p_nr_cad_unico
     , dt_nascimento = v_dt_nascimento
 where pessoa_id = p_pessoa_id;
 
exception
  when no_data_found then
       raise_application_error(-20000, 'Registro com ID: '||p_pessoa_id||', n�o foi encontrado.');
  when others then
       raise_application_error(-20000, 'N�o foi possivel alterar o registro');
end;

procedure prc_del_pessoa ( p_pessoa_id     in  condominio.pessoa.pessoa_id%type)
is
begin
  delete condominio.v_pessoa 
   where pessoa_id = p_pessoa_id;
end;  

end;
/
