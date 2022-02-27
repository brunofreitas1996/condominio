PL/SQL Developer Report

[SQL]
-- condominio.v_usuarios.sql
create or replace view condominio.v_usuarios as
select 
       usuarios_id
     , username
     , password
     , st_tab_generica_id
     , tp_tab_generica_id
     , dt_insert
 from condominio.usuarios;

[Options]
Connect=False
Username=
Password=2546
Database=
ConnectAs=
LockMode=0
LockedPassword=2460
BkgColor=-16777211
BkgImage=
FormLayout=False
OnlyNBSP=False
LeftMargin=0
TopMargin=0
PageBreak=0
AddSQL=False
HandleTags=True

[Styles]

{Title}
Enabled=True
Name=Report Title
Description=
Style=
HeaderStyle=
Align=0
Break=0
Function=0
Format=

{Param}
Enabled=True
Name=Variables
Description=
Style=
HeaderStyle=
Align=0
Break=0
Function=0
Format=

{Table}
Enabled=True
Name=Tabular Tables
Description=
Style=
HeaderStyle=
Align=0
Break=0
Function=0
Format=

{Form}
Enabled=True
Name=Form Tables
Description=
Style=
HeaderStyle=
Align=0
Break=0
Function=0
Format=

{Field}
Enabled=True
Name=Default Field
Description=
Style=
HeaderStyle=
Align=0
Break=0
Function=0
Format=



[CSS]

