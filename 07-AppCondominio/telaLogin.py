from tkinter import *
from tkinter import ttk
from tkinter import messagebox
from turtle import bgcolor, color

from click import style
from BDconection import *
from Colors import *

root = Tk()

class Utils():
    def format_date(self, event = None):
        if self.indtnasc.get() != '':
            self.text = self.indtnasc.get().replace('/','').replace('-','')[:8]
        
        self.new_text = ''

        if event.keysym.lower() == 'backspace': return
        for i in range(len(self.text)):
            if not self.text[i] in '0123456789': continue
            if i in [1,3]: self.new_text += self.text[i] + '/'
            else: self.new_text += self.text[i]
        
        if self.indtnasc.get() != '': self.indtnasc.delete(0, 'end'); self.indtnasc.insert(0, self.new_text)

class Banco(banco_de_dados):
    def insereUsuario(self):
        self.nome  = self.innome.get()
        self.nrcad = self.innrcad.get()
        self.dtnas = self.indtnasc.get()
        self.senha = self.insenha.get()

        if self.nome.replace(' ', '').isalpha() == False:
            messagebox.showinfo("ERROR!", "No campo Nome só permite letras.")

        elif self.nrcad.isdigit() == False:
            messagebox.showinfo("ERROR!", "CPF/CNPJ só permite números.")
            
        else:
            print(len(self.nrcad))
            if len(self.nrcad) not in [11, 14]:
                messagebox.showinfo("ERROR!", "CPF/CNPJ incorreto.")

            elif len(self.nrcad) == 11 or len(self.nrcad) == 14:

                if (self.nome == '') and (self.nrcad == '') and (self.dtnas == '') and (self.senha == ''):
                    messagebox.showinfo("Alerta!", "Todos os campos são obrigatórios.")

                elif (self.nome == ''):
                    messagebox.showinfo("Alerta!", "Campo NOME é obrigatório.")
                
                elif (self.nrcad == ''):
                    messagebox.showinfo("Alerta!", "Campo CPF/CNPJ é obrigatório.")

                elif (self.dtnas == ''):
                    messagebox.showinfo("Alerta!", "Campo DATA DE NASCIMENTO é obrigatório.")

                elif (self.senha == ''):
                    messagebox.showinfo("Alerta!", "Campo SENHA é obrigatório.")
                else:
                    try:
                        self.insUsuario(self.nome, self.nrcad, self.dtnas, self.senha)
                        messagebox.showinfo("Info!", "Usuário inserido com sucesso.")

                    except cx_Oracle.DatabaseError as e:
                        code, mesg = e.args[0].message[:-1].split(': ', 1)
                        messagebox.showinfo("ERROR!", "{}\n{}".format(code, mesg))

    def valLogin(self):
        self.user  = self.username.get()
        self.senha = self.password.get()

        if self.user.isdigit() == True:

            if len(self.user) == 11 or len(self.user) == 14:
                if self.user == '' and self.senha == '':
                    messagebox.showinfo("Alerta!", "Todos os campos são obrigatórios.")            
                elif self.user == '':
                    messagebox.showinfo("Alerta!", "Campo Usuário em branco")

                elif self.senha == '':
                    messagebox.showinfo("Alerta!", "Campo Senha em branco")

                else:
                    self.resultado = self.validaLogin(self.user, self.senha)

                    if self.resultado == 0:
                        messagebox.showinfo("Alerta!", "Acesso Negado: Usuário incorreto.")
                    elif self.resultado == 1:
                        messagebox.showinfo("Info!", "Acesso Liberado...")
                        self.frlogin.destroy()
                        self.menuTela()

                    elif self.resultado == 9:
                        messagebox.showinfo("Alerta!", "Acesso Negado: Senha Incorreta.")
            else:
                messagebox.showinfo("ERROR!", "Usuário é o seu número de CPF/CNPJ.")
        else:
            messagebox.showinfo("ERROR!", "Usuário: apenas números.")

    def alteraSenha(self):
        self.cpf_cnpj = self.inaltnrcad.get()
        self.dt_nasc = self.indtnasc.get()
        self.novasenha = self.innovasenha.get()

        if self.cpf_cnpj == '' and self.dt_nasc == '' and self.novasenha == '':
            messagebox.showinfo("Alerta!", "Todos os campos são obrigatórios.")
        elif self.cpf_cnpj == '':
            messagebox.showinfo("Alerta!", "Campo CPF/CNPJ é obrigatório.")                        
        elif self.dt_nasc == '':
            messagebox.showinfo("Alerta!", "Campo DATA DE NASCIMENTO é obrigatório.")
        elif self.novasenha == '':
            messagebox.showinfo("Alerta!", "Campo NOVA SENHA é obrigatório.")
        else:                            
            self.resultado = self.altSenha(self.cpf_cnpj, self.dt_nasc, self.novasenha)
            if self.resultado == 0:
                messagebox.showinfo("Alerta!", "Informações erradas.")
            else:
                messagebox.showinfo("Info!", "Senha alterada com sucesso.")

class Application(Banco, Utils, Colors):
    def __init__(self):
        self.root = root
        self.configTela()
        #self.Login()
        self.menuTela()

        self.root.mainloop()

    def configTela(self):
        self.root.title('Condominio')
        self.root.configure(bg=self.bg)
        self.root.resizable(False,False)
        self.root.iconbitmap('images/icons/icon.ico')
        #dimensão da janela
        self.largura = 700
        self.altura  = 500
        #resolução do sistema
        self.largura_screen = self.root.winfo_screenwidth()
        self.altura_screen = self.root.winfo_screenheight()
        self.posix = (self.largura_screen/2) - (self.largura/2)
        self.posiy = (self.altura_screen/2) - (self.altura/2)
        self.root.geometry('{}x{}+{}+{}'.format(self.largura, self.altura, int(self.posix), int(self.posiy)))
        
    def Login(self):
        self.frlogin = Frame(self.root, bd=1, bg=self.bg1)
        self.frlogin.place(relx=0.01, rely=0.01, relwidth=0.4, relheight=0.98)
        self.canvas_user = Canvas(self.frlogin, bg=self.bg1, borderwidth=-2)
        self.canvas_user.place(relx=0.002, rely=0.01, relwidth=0.99, relheight=0.98)

        #Caixas de entrada

        self.lblUser  = Label(self.frlogin, bg=self.bg1, text='Usuário', fg=self.fgText)
        self.lblUser.place(relx=0.10, rely=0.31)
        self.posicao = [27.2, 186, 245.4, 186]# pos_1 = x_esquerdo, pos_2= y_esquerco, pos_3= x_direito, pos_4= y_direito
        self.canvas_user.create_line(self.posicao, fill=self.bg, width=5)
        self.username = Entry(self.frlogin, bg=self.bg, fg=self.btnText, width=36,bd=0)
        self.username.place(relx=0.10, rely=0.35)

        self.lblPass = Label(self.frlogin, bg=self.bg1, text='Senha', fg=self.fgText)
        self.lblPass.place(relx=0.10, rely=0.43)
        self.posicao = [27.2, 244, 245.4, 244]
        self.canvas_user.create_line(self.posicao, fill=self.bg, width=5)
        self.password = Entry(self.frlogin, show="*", bg=self.bg, fg=self.btnText, width=36,bd=0)
        self.password.place(relx=0.10, rely=0.47)

        self.btnCadastro = Button(master=self.frlogin,bd=0, text='Cadastrar',font=5, fg=self.btnText,bg=self.bg, width=10, 
                               activebackground=self.bg1, command=self.Cadastro)
        self.btnCadastro.place(relx=0.10, rely=0.59)
        self.btnLogar = Button(master=self.frlogin,bd=0, text='Entrar',font=5, fg=self.btnText, bg=self.bg, width=10,
                               activebackground=self.bg1, command=self.valLogin)
        self.btnLogar.place(relx=0.54, rely=0.59)

        self.recuperarsenha = Button(master=self.frlogin, text='Recuperar senha', bd=0, bg=self.bg1, fg=self.bg,
                                     activebackground=self.bg1, command=self.resetSenha)
        self.recuperarsenha.place(relx=0.32, rely=0.70)

    def Cadastro(self):
        #--
        self.frlogin.destroy()
        #--
        self.frcadastro = Frame(self.root, bd=1, bg=self.bg1)
        self.frcadastro.place(relx=0.01, rely=0.01, relwidth=0.4, relheight=0.98)
        self.canvas_cadastro = Canvas(self.frcadastro, bg=self.bg1, borderwidth=-2)
        self.canvas_cadastro.place(relx=0.002, rely=0.01, relwidth=0.99, relheight=0.98)

        #Caixas de entrada
        self.lblNome  = Label(self.frcadastro, bg=self.bg1, text='Nome completo', fg=self.fgText)
        self.lblNome.place(relx=0.10, rely=0.07)
        self.posicao = [27.2, 70, 245.4, 70]
        self.canvas_cadastro.create_line(self.posicao, fill=self.bg, width=5)        
        self.innome = Entry(self.frcadastro, bg=self.bg, fg=self.btnText, width=36,bd=0)
        self.innome.place(relx=0.10, rely=0.113)
        
        self.lblnrcad = Label(self.frcadastro, bg=self.bg1, text='CPF/CNPJ', fg=self.fgText)
        self.lblnrcad.place(relx=0.10, rely=0.19)
        self.posicao = [27.2, 128, 245.4, 128]
        self.canvas_cadastro.create_line(self.posicao, fill=self.bg, width=5)        
        self.innrcad = Entry(self.frcadastro, bg=self.bg, fg=self.btnText, width=36,bd=0)
        self.innrcad.place(relx=0.10, rely=0.231)

        self.lbldtnasc  = Label(self.frcadastro, bg=self.bg1, text='Data nascimento', fg=self.fgText)
        self.lbldtnasc.place(relx=0.10, rely=0.31)
        self.posicao = [27.2, 186, 245.4, 186]# pos_1 = x_esquerdo, pos_2= y_esquerco, pos_3= x_direito, pos_4= y_direito
        self.canvas_cadastro.create_line(self.posicao, fill=self.bg, width=5)
        self.indtnasc = Entry(self.frcadastro, bg=self.bg, fg=self.btnText, width=36,bd=0)
        self.indtnasc.bind('<KeyRelease>', self.format_date)
        self.indtnasc.place(relx=0.10, rely=0.35)

        self.lblSenha = Label(self.frcadastro, bg=self.bg1, text='Senha', fg=self.fgText)
        self.lblSenha.place(relx=0.10, rely=0.43)
        self.posicao = [27.2, 244, 245.4, 244]
        self.canvas_cadastro.create_line(self.posicao, fill=self.bg, width=5)
        self.insenha = Entry(self.frcadastro, bg=self.bg, fg=self.btnText, width=36,bd=0)
        self.insenha.place(relx=0.10, rely=0.47)

        def voltalogin():
            self.frcadastro.destroy()
            self.Login()
        
        def duvidas():
            messagebox.showinfo("Info!", "O usuário é o número do CPF/CNPJ.")
            
        self.btnVoltar = Button(master=self.frcadastro,bd=0, text='Voltar',font=5, fg=self.btnText,bg=self.bg, width=10, 
                                activebackground=self.bg1, command=voltalogin)
        self.btnVoltar.place(relx=0.10, rely=0.59)
        self.btnCadastrar = Button(master=self.frcadastro,bd=0, text='Cadastrar',font=5, fg=self.btnText, bg=self.bg, width=10, 
                                   activebackground=self.bg1, command=self.insereUsuario)
        self.btnCadastrar.place(relx=0.54, rely=0.59)

        self.lblDuvida = Button(master=self.frcadastro, text='Dúvidas', bd=0, bg=self.bg1, fg=self.fgText,
                                activebackground=self.bg1, command=duvidas)
        self.lblDuvida.place(relx=0.40, rely=0.70)

    def resetSenha(self):
        #--
        self.frlogin.destroy()
        #--  
        self.frresetSenha = Frame(self.root, bd=1, bg=self.bg1)
        self.frresetSenha.place(relx=0.01, rely=0.01, relwidth=0.4, relheight=0.98)
        self.canvas_reset = Canvas(self.frresetSenha, bg=self.bg1, borderwidth=-2)
        self.canvas_reset.place(relx=0.002, rely=0.01, relwidth=0.99, relheight=0.98)
        #Caixas de entrada
        
        self.lblaltnrcad = Label(self.frresetSenha, bg=self.bg1, text='CPF/CNPJ', fg=self.fgText)
        self.lblaltnrcad.place(relx=0.10, rely=0.19)
        self.posicao = [27.2, 128, 245.4, 128]
        self.canvas_reset.create_line(self.posicao, fill=self.bg, width=5)        
        self.inaltnrcad = Entry(self.frresetSenha, bg=self.bg, fg=self.btnText, width=36,bd=0)
        self.inaltnrcad.place(relx=0.10, rely=0.231)

        self.lblaltdtnasc  = Label(self.frresetSenha, bg=self.bg1, text='Data nascimento', fg=self.fgText)
        self.lblaltdtnasc.place(relx=0.10, rely=0.31)
        self.posicao = [27.2, 186, 245.4, 186]
        self.canvas_reset.create_line(self.posicao, fill=self.bg, width=5)        
        self.indtnasc = Entry(self.frresetSenha, bg=self.bg, fg=self.btnText, width=36,bd=0)
        self.indtnasc.bind('<KeyRelease>', self.format_date)
        self.indtnasc.place(relx=0.10, rely=0.35)

        self.lblNovaSenha = Label(self.frresetSenha, bg=self.bg1, text='Nova Senha', fg=self.fgText)
        self.lblNovaSenha.place(relx=0.10, rely=0.43)
        self.posicao = [27.2, 244, 245.4, 244]
        self.canvas_reset.create_line(self.posicao, fill=self.bg, width=5)        
        self.innovasenha = Entry(self.frresetSenha, bg=self.bg, fg=self.btnText, width=36,bd=0)
        self.innovasenha.place(relx=0.10, rely=0.47)

        def voltalogin():
            self.frresetSenha.destroy()
            self.Login()
            
        self.btnVoltar = Button(master=self.frresetSenha,bd=0, text='Voltar',font=5, fg=self.btnText,bg=self.bg, width=10, 
                                activebackground=self.bg1, command=voltalogin)
        self.btnVoltar.place(relx=0.10, rely=0.59)
        self.btnCadastrar = Button(master=self.frresetSenha,bd=0, text='Alterar',font=5, fg=self.btnText, bg=self.bg, width=10, 
                                   activebackground=self.bg1, command=self.alteraSenha)
        self.btnCadastrar.place(relx=0.54, rely=0.59)

    def menuTela(self):
    
        self.menu1 = Frame(self.root,bd=1, bg=self.bg1)
        self.menu1.place(relx=0.01, rely=0.01, relwidth=0.98, relheight=0.98)
        
        self.bar = Menu(self.root)
        self.root.config(menu=self.bar)
        self.bar1 = Menu(self.bar)
        self.bar2 = Menu(self.bar)
        self.bar3 = Menu(self.bar)

        def quit(): self.root.destroy()

        self.bar.add_cascade(label='Cadastros', menu=self.bar1)
        self.bar.add_cascade(label='Listas', menu=self.bar2)
        self.bar.add_cascade(label='Sair', menu=self.bar3)

        self.bar1.add_command(label='Cadastro apartamento')
        self.bar1.add_command(label='Cadastro município')
        self.bar1.add_command(label='Cadastro condomínio', command=self.cadCondominio)
        self.bar1.add_command(label='Cadastro tab. genérica')
        
        self.bar3.add_command(label='Sair', command=quit)        

    def cadCondominio(self):
        self.frcadcondominio = Frame(self.root,bd=1, bg=self.bg1)
        self.frcadcondominio.place(relx=0.01, rely=0.01, relwidth=0.98, relheight=0.98)
        self.cvcadcondominio = Canvas(self.frcadcondominio, bg=self.bg1, borderwidth=-2)
        self.cvcadcondominio.place(x=0.002, rely=0.01, relwidth=0.99, relheight=0.98)

        self.style= ttk.Style()
        self.style.theme_use('clam')
        self.style.configure("TCombobox", fieldbackground= self.bg,foreground=self.btnText)
        self.style.configure("Treeview", fieldbackground= self.bg,foreground=self.btnText)
        self.style.configure("Vertical.TScrollbar", fieldbackground= self.bg,foreground=self.btnText)
        

        self.lblCabecalho = Label(self.frcadcondominio, fg=self.bg, bg=self.bg1, text='Cadastro de Condomínio')
        self.lblCabecalho.place(x=10,y=10)
        self.cvposicao = [10, 35, 670, 35]
        self.cvcadcondominio.create_line(self.cvposicao, fill=self.bg, width=2)

        self.lblcnpj = Label(self.frcadcondominio, text='CNPJ', fg=self.bg, bg=self.bg1)
        self.lblcnpj.place(x=10, y=60)
        self.entcnpj = Entry(self.frcadcondominio, width=20, bg=self.bg, fg=self.btnText).place(x=10,y=80)
        self.pos_y_cnpj = 95
        self.cvposicao = [10, self.pos_y_cnpj, 133, self.pos_y_cnpj]
        self.cvcadcondominio.create_line(self.cvposicao, fill=self.bg, width=2)
        
        self.lblnome = Label(self.frcadcondominio, text='Nome', fg=self.bg, bg=self.bg1)
        self.lblnome.place(x=150, y=60)
        self.entnome = Entry(self.frcadcondominio, width=60, bg=self.bg, fg=self.btnText).place(x=150,y=80)
        self.pos_y_nome = 95
        self.cvposicao = [150, self.pos_y_nome, 513, self.pos_y_nome]
        self.cvcadcondominio.create_line(self.cvposicao, fill=self.bg, width=2)        

        self.lblnumero = Label(self.frcadcondominio, text='Nº', fg=self.bg, bg=self.bg1)
        self.lblnumero.place(x=530, y=60)
        self.entnumero = Entry(self.frcadcondominio, width=10, bg=self.bg, fg=self.btnText).place(x=530,y=80)

        self.lblmunicipio = Label(self.frcadcondominio, text='Município', fg=self.bg, bg=self.bg1)
        self.lblmunicipio.place(x=10, y=110)
        self.cbmunicipio = ttk.Combobox(self.frcadcondominio, background=self.bg1,
                            values=["1 valor","2  valor"])
        self.cbmunicipio.set("-- Selecione --")
        self.cbmunicipio.place(x=10, y=130)

        self.lbllogradouro = Label(self.frcadcondominio, text='Logradouro', fg=self.bg, bg=self.bg1)
        self.lbllogradouro.place(x=165, y=110)
        self.entlogradouro = Entry(self.frcadcondominio, width=60, bg=self.bg, fg=self.btnText).place(x=165,y=130)

        self.lbltipolog = Label(self.frcadcondominio, text='Tipo Log.', fg=self.bg, bg=self.bg1)
        self.lbltipolog.place(x=540, y=110)
        self.tipolog = ttk.Combobox(self.frcadcondominio, background=self.bg1,width=7,
                            values=["Rua","Av."])
        self.tipolog.set("...")
        self.tipolog.place(x=540,y=130)

        self.lblbairro = Label(self.frcadcondominio, text='Bairro', fg=self.bg, bg=self.bg1)
        self.lblbairro.place(x=10, y=160)
        self.entbairro = Entry(self.frcadcondominio, width=40, bg=self.bg, fg=self.btnText).place(x=10, y=180)

        self.lblcep = Label(self.frcadcondominio, text='CEP', fg=self.bg, bg=self.bg1)
        self.lblcep.place(x=270, y=160)
        self.entcep = Entry(self.frcadcondominio, width=10, bg=self.bg, fg=self.btnText).place(x=270, y=180)

        self.lbluf = Label(self.frcadcondominio, text='UF', fg=self.bg, bg=self.bg1)
        self.lbluf.place(x=350, y=160)
        self.entuf = Entry(self.frcadcondominio, width=3, bg=self.bg, fg=self.btnText).place(x=350, y=180)


        self.btnCadastrar = Button(self.frcadcondominio, text='Cadastrar', bg=self.bg, fg=self.btnText).place(x=400,y=180)

        self.btnAtualizar = Button(self.frcadcondominio, text='Atualizar', bg=self.bg, fg=self.btnText).place(x=480,y=180)

        self.btnDeletar = Button(self.frcadcondominio, text='Deletar', bg=self.bg, fg=self.btnText).place(x=555,y=180)


        self.listacondominio = ttk.Treeview(self.frcadcondominio, height=3, column=('col1','col2','col3','col4'))
        self.listacondominio.heading('#0',text='')
        self.listacondominio.heading('#1', text='CNPJ')
        self.listacondominio.heading('#2', text='Nome')
        self.listacondominio.heading('#3', text='Nº')
        self.listacondominio.heading('#4', text='Endereço')

        self.listacondominio.column('#0', width=1)
        self.listacondominio.column('#1', width=50)
        self.listacondominio.column('#2', width=100)
        self.listacondominio.column('#3', width=30)
        self.listacondominio.column('#4', width=200)

        self.listacondominio.place(x=10, y=230, width=640, height=225)

        self.scroollista = Scrollbar(self.frcadcondominio, orient='vertical')
        self.listacondominio.configure(yscroll=self.scroollista.set)
        self.scroollista.place(x=650, y=230, width=20, height=225)
        #self.listacondominio.bind('<Double-1>', self.ondoubleclick)       

Application()