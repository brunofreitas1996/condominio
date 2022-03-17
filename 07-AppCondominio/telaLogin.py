from tkinter import *
from tkinter import messagebox
from BDconection import *
from Colors import *

root = Tk()

class Banco(banco_de_dados):
    def insereUsuario(self):
        self.nome = self.innome.get()
        self.nrcad = self.innrcad.get()
        self.dtnas = self.indtnasc.get()
        self.senha = self.insenha.get()

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
                self.root.destroy()

            elif self.resultado == 9:
                messagebox.showinfo("Alerta!", "Acesso Negado: Senha Incorreta.")

    def alteraSenha(self):
        self.cpf_cnpj = self.inaltnrcad.get()
        self.dt_nasc = self.inaltdtnasc.get()
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

class Application(Colors, Banco):
    def __init__(self):
        self.root = root
        self.configTela()
        self.Login()

        root.mainloop()

    def configTela(self):
        self.root.title('Condominio')
        self.root.iconbitmap('images/icons/icon.ico')
        self.root.configure(bg=self.bg)
        self.root.resizable(False,False)
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

        #Caixas de entrada

        self.lblUser  = Label(self.frlogin, bg=self.bg1, text='Usuário', fg=self.fgText)
        self.lblUser.place(relx=0.10, rely=0.31)
        self.canvas_user = Canvas(self.frlogin, bd=0, bg=self.bg)
        self.canvas_user.place(relx=0.095, rely=0.384, relwidth=0.797, relheight=0.02)
        self.username = Entry(self.frlogin, bg=self.bg, fg=self.fgText, width=36,bd=0)
        self.username.place(relx=0.10, rely=0.35)

        self.lblPass = Label(self.frlogin, bg=self.bg1, text='Senha', fg=self.fgText)
        self.lblPass.place(relx=0.10, rely=0.43)
        self.canvas_pass = Canvas(self.frlogin, bd=0, bg=self.bg)
        self.canvas_pass.place(relx=0.095, rely=0.502, relwidth=0.797, relheight=0.02)
        self.password = Entry(self.frlogin, bg=self.bg, fg=self.fgText, width=36,bd=0)
        self.password.place(relx=0.10, rely=0.47)

        self.btnCadastro = Button(master=self.frlogin,bd=0, text='Cadastrar',font=5, fg=self.fgText,bg=self.bg, width=10, command=self.Cadastro)
        self.btnCadastro.place(relx=0.10, rely=0.59)
        self.btnLogar = Button(master=self.frlogin,bd=0, text='Entrar',font=5, fg=self.fgText, bg=self.bg, width=10, command=self.valLogin)
        self.btnLogar.place(relx=0.54, rely=0.59)

        self.recuperarsenha = Button(master=self.frlogin, text='Recuperar senha', bd=0, bg=self.bg1, fg=self.fgText, command=self.resetSenha)
        self.recuperarsenha.place(relx=0.32, rely=0.70)

    def Cadastro(self):
        #--
        self.frlogin.destroy()
        #--
        self.frcadastro = Frame(self.root, bd=1, bg=self.bg1)
        self.frcadastro.place(relx=0.01, rely=0.01, relwidth=0.4, relheight=0.98)

        #Caixas de entrada

        self.lblNome  = Label(self.frcadastro, bg=self.bg1, text='Nome completo', fg=self.fgText)
        self.lblNome.place(relx=0.10, rely=0.07)
        self.canvas_nome = Canvas(self.frcadastro, bd=0, bg=self.bg)
        self.canvas_nome.place(relx=0.095, rely=0.145, relwidth=0.797, relheight=0.02)
        self.innome = Entry(self.frcadastro, bg=self.bg, fg=self.fgText, width=36,bd=0)
        self.innome.place(relx=0.10, rely=0.113)
        
        self.lblnrcad = Label(self.frcadastro, bg=self.bg1, text='CPF/CNPJ', fg=self.fgText)
        self.lblnrcad.place(relx=0.10, rely=0.19)
        self.canvas_nrcad = Canvas(self.frcadastro, bd=0, bg=self.bg)
        self.canvas_nrcad.place(relx=0.095, rely=0.265, relwidth=0.797, relheight=0.02)
        self.innrcad = Entry(self.frcadastro, bg=self.bg, fg=self.fgText, width=36,bd=0)
        self.innrcad.place(relx=0.10, rely=0.231)

        self.lbldtnasc  = Label(self.frcadastro, bg=self.bg1, text='Data nascimento', fg=self.fgText)
        self.lbldtnasc.place(relx=0.10, rely=0.31)
        self.canvas_dtnasc = Canvas(self.frcadastro, bd=0, bg=self.bg)
        self.canvas_dtnasc.place(relx=0.095, rely=0.384, relwidth=0.797, relheight=0.02)
        self.indtnasc = Entry(self.frcadastro, bg=self.bg, fg=self.fgText, width=36,bd=0)
        self.indtnasc.place(relx=0.10, rely=0.35)

        self.lblSenha = Label(self.frcadastro, bg=self.bg1, text='Senha', fg=self.fgText)
        self.lblSenha.place(relx=0.10, rely=0.43)
        self.canvas_senha = Canvas(self.frcadastro, bd=0, bg=self.bg)
        self.canvas_senha.place(relx=0.095, rely=0.502, relwidth=0.797, relheight=0.02)
        self.insenha = Entry(self.frcadastro, bg=self.bg, fg=self.fgText, width=36,bd=0)
        self.insenha.place(relx=0.10, rely=0.47)

        def voltalogin():
            self.frcadastro.destroy()
            self.Login()
        
        def duvidas():
            messagebox.showinfo("Info!", "O usuário é o número do CPF/CNPJ.\n"+
                                         "Formato do campo: Data de nascimento:\n"+
                                         "DD/MM/YYYY = DIA/MÊS/ANO")
            
        self.btnVoltar = Button(master=self.frcadastro,bd=0, text='Voltar',font=5, fg=self.fgText,bg=self.bg, width=10, command=voltalogin)
        self.btnVoltar.place(relx=0.10, rely=0.59)
        self.btnCadastrar = Button(master=self.frcadastro,bd=0, text='Cadastrar',font=5, fg=self.fgText, bg=self.bg, width=10, command=self.insereUsuario)
        self.btnCadastrar.place(relx=0.54, rely=0.59)

        self.lblDuvida = Button(master=self.frcadastro, text='Dúvidas', bd=0, bg=self.bg1, fg=self.fgText, command=duvidas)
        self.lblDuvida.place(relx=0.40, rely=0.70)

    def resetSenha(self):
        #--
        self.frlogin.destroy()
        #--  
        self.frresetSenha = Frame(self.root, bd=1, bg=self.bg1)
        self.frresetSenha.place(relx=0.01, rely=0.01, relwidth=0.4, relheight=0.98)

        #Caixas de entrada
        
        self.lblaltnrcad = Label(self.frresetSenha, bg=self.bg1, text='CPF/CNPJ', fg=self.fgText)
        self.lblaltnrcad.place(relx=0.10, rely=0.19)
        self.canvas_altnrcad = Canvas(self.frresetSenha, bd=0, bg=self.bg)
        self.canvas_altnrcad.place(relx=0.095, rely=0.265, relwidth=0.797, relheight=0.02)
        self.inaltnrcad = Entry(self.frresetSenha, bg=self.bg, fg=self.fgText, width=36,bd=0)
        self.inaltnrcad.place(relx=0.10, rely=0.231)

        self.lblaltdtnasc  = Label(self.frresetSenha, bg=self.bg1, text='Data nascimento', fg=self.fgText)
        self.lblaltdtnasc.place(relx=0.10, rely=0.31)
        self.canvas_altdtnasc = Canvas(self.frresetSenha, bd=0, bg=self.bg)
        self.canvas_altdtnasc.place(relx=0.095, rely=0.384, relwidth=0.797, relheight=0.02)
        self.inaltdtnasc = Entry(self.frresetSenha, bg=self.bg, fg=self.fgText, width=36,bd=0)
        self.inaltdtnasc.place(relx=0.10, rely=0.35)

        self.lblNovaSenha = Label(self.frresetSenha, bg=self.bg1, text='Nova Senha', fg=self.fgText)
        self.lblNovaSenha.place(relx=0.10, rely=0.43)
        self.canvas_novasenha = Canvas(self.frresetSenha, bd=0, bg=self.bg)
        self.canvas_novasenha.place(relx=0.095, rely=0.502, relwidth=0.797, relheight=0.02)
        self.innovasenha = Entry(self.frresetSenha, bg=self.bg, fg=self.fgText, width=36,bd=0)
        self.innovasenha.place(relx=0.10, rely=0.47)

        def voltalogin():
            self.frresetSenha.destroy()
            self.Login()
            
        self.btnVoltar = Button(master=self.frresetSenha,bd=0, text='Voltar',font=5, fg=self.fgText,bg=self.bg, width=10, command=voltalogin)
        self.btnVoltar.place(relx=0.10, rely=0.59)
        self.btnCadastrar = Button(master=self.frresetSenha,bd=0, text='Alterar',font=5, fg=self.fgText, bg=self.bg, width=10, command=self.alteraSenha)
        self.btnCadastrar.place(relx=0.54, rely=0.59)

Application()