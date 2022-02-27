create or replace noneditionable package condominio.pkg_verifica is

function fnc_existe_pessoa (p_nr_cad_unico condominio.pessoa.nr_cad_unico%type)
  return integer;

function fnc_existe_pessoa_id(p_pessoa_id condominio.pessoa.pessoa_id%type)
  return integer;

function fnc_existe_bloco(p_nome condominio.bloco.nome%type)
  return integer;

function fnc_existe_apartamento( p_bloco_id       condominio.apartamento.bloco_id%type
                               , p_nr_apartamento condominio.apartamento.nr_apartamento%type
                               , p_nr_andar       condominio.apartamento.nr_andar%type)
  return integer;

function fnc_existe_apartamento_id(p_apartamento_id condominio.apartamento.apartamento_id%type)
  return integer;

function fnc_existe_tipo(p_tp_tab_generico_id condominio.tab_generica.tab_generica_id%type)
  return integer;

function fnc_existe_usuario(p_username condominio.usuarios.username%type)
  return integer;

end;
/
create or replace noneditionable package body condominio.pkg_verifica is

function fnc_existe_pessoa (p_nr_cad_unico condominio.pessoa.nr_cad_unico%type)
  return integer is
v_qtd integer := 0;
begin
  select count(1)
    into v_qtd
    from condominio.v_pessoa pe
   where pe.nr_cad_unico = p_nr_cad_unico;

  return v_qtd;
end;

function fnc_existe_pessoa_id(p_pessoa_id condominio.pessoa.pessoa_id%type)
  return integer is
  v_qtd integer := 0;

begin
  select count(1)
    into v_qtd
    from condominio.pessoa ap
   where pessoa_id = p_pessoa_id;

   return v_qtd;
end;

function fnc_existe_bloco(p_nome condominio.bloco.nome%type)
  return integer is
v_qtd integer := 0;
begin
  select count(1)
    into v_qtd
    from condominio.v_bloco bl
   where bl.nome = p_nome;

  return v_qtd;
end;

function fnc_existe_apartamento( p_bloco_id       condominio.apartamento.bloco_id%type
                               , p_nr_apartamento condominio.apartamento.nr_apartamento%type
                               , p_nr_andar       condominio.apartamento.nr_andar%type)
  return integer is


v_qtd integer := 0;
begin
      select count(1)
        into v_qtd
        from condominio.apartamento ap
       where (    ap.bloco_id       = p_bloco_id
              and ap.nr_apartamento = p_nr_apartamento)
         or (     ap.nr_andar       = p_nr_andar
              and ap.nr_apartamento = p_nr_apartamento);

    return v_qtd;
end;

function fnc_existe_apartamento_id(p_apartamento_id condominio.apartamento.apartamento_id%type)
  return integer is
  v_qtd integer := 0;

begin
  select count(1)
    into v_qtd
    from condominio.apartamento ap
   where apartamento_id = p_apartamento_id;

   return v_qtd;
end;


function fnc_existe_tipo(p_tp_tab_generico_id condominio.tab_generica.tab_generica_id%type)
  return integer is
  v_qtd integer := 0;
begin
  select count(1)
    into v_qtd
    from condominio.tab_generica ge
   where tab_generica_id = p_tp_tab_generico_id;

   return v_qtd;
end;

function fnc_existe_usuario(p_username condominio.usuarios.username%type)
  return integer is
  v_qtd integer := 0;
begin
  select count(1)
    into v_qtd
    from condominio.usuarios ge
   where username = p_username;

   return v_qtd;
end;

end;
/
