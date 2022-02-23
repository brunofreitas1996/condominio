create or replace package condominio.pkg_bloco is

procedure prc_ins_bloco ( p_bloco_id         out condominio.bloco.bloco_id%type
                        , p_nome             in  condominio.bloco.nome%type
                        , p_qtd_apartamentos in  condominio.bloco.qtd_apartamentos%type
                        , p_qtd_andares      in  condominio.bloco.qtd_andares%type
                        );

procedure prc_alt_bloco ( p_bloco_id         in  condominio.bloco.bloco_id%type
                        , p_nome             in  condominio.bloco.nome%type
                        , p_qtd_apartamentos in  condominio.bloco.qtd_apartamentos%type
                        , p_qtd_andares      in  condominio.bloco.qtd_andares%type
                         );

procedure prc_del_bloco ( p_bloco_id     in  condominio.bloco.bloco_id%type);

end;
/
create or replace package body condominio.pkg_bloco is

procedure prc_ins_bloco ( p_bloco_id        out condominio.bloco.bloco_id%type
                        , p_nome             in  condominio.bloco.nome%type
                        , p_qtd_apartamentos in  condominio.bloco.qtd_apartamentos%type
                        , p_qtd_andares      in  condominio.bloco.qtd_andares%type
                         )
is 
v_existe_bloco integer;
begin

v_existe_bloco := condominio.pkg_verifica.fnc_existe_bloco(p_nome);

 if v_existe_bloco = 0 then
  insert into condominio.v_bloco
              (nome, qtd_apartamentos, qtd_andares)
              values
              (upper(p_nome), p_qtd_apartamentos, p_qtd_andares)
              returning bloco_id into p_bloco_id;
 else
  raise_application_error(-20000, 'Já existe registro com o nome: '||p_nome||' informado.');
 end if;

exception
  when others then
    raise_application_error(-20000, 'Não foi possivel inserir o registro');
end;

procedure prc_alt_bloco ( p_bloco_id         in  condominio.bloco.bloco_id%type
                        , p_nome             in  condominio.bloco.nome%type
                        , p_qtd_apartamentos in  condominio.bloco.qtd_apartamentos%type
                        , p_qtd_andares      in  condominio.bloco.qtd_andares%type
                         )
is
begin

update condominio.v_bloco
   set nome          = upper(p_nome) 
     , qtd_apartamentos  = p_qtd_apartamentos
     , qtd_andares = p_qtd_andares
 where bloco_id = p_bloco_id;
 
exception
  when no_data_found then
       raise_application_error(-20000, 'Registro com ID: '||p_bloco_id||', não foi encontrado.');
  when others then
       raise_application_error(-20000, 'Não foi possivel alterar o registro');
end;

procedure prc_del_bloco ( p_bloco_id     in  condominio.bloco.bloco_id%type)
is
begin
  delete condominio.v_bloco 
   where bloco_id = p_bloco_id;
end;  

end;
/
