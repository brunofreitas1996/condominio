from tkinter import *
from Colors import *

root = Tk()

class Application(Colors):
    def __init__(self):
        self.root = root
        self.configTela()
        self.frLogin()


        root.mainloop()

    def configTela(self):
        self.root.title('Login')
        self.root.configure(bg=self.bg)
        self.root.geometry('700x500')
        self.root.resizable(True,True)
        self.root.maxsize(width=700, height=500)
        self.root.minsize(width=500, height=300)

    def frLogin(self):
        self.frlogin = Frame(self.root, bd=1, bg=self.bg1)
        self.frlogin.place(relx=0.01, rely=0.01, relwidth=0.4, relheight=0.98)

        #Caixas de entrada
        self.lblUser  = Label(self.frlogin, bg=self.bg1, text='Usuário', fg=self.fgText)
        self.lblUser.place(relx=0.10, rely=0.31)
        self.username = Entry(self.frlogin, bg=self.bg, fg=self.fgText, width=36,bd=0)
        self.username.place(relx=0.10, rely=0.35)

        self.lblPass = Label(self.frlogin, bg=self.bg1, text='Senha', fg=self.fgText)
        self.lblPass.place(relx=0.10, rely=0.43)
        self.password = Entry(self.frlogin, bg=self.bg, fg=self.fgText, width=36,bd=0)
        self.password.place(relx=0.10, rely=0.47)

        self.btnCadastrar = Button(master=self.frlogin,bd=0, text='Cadastrar',font=5, fg=self.fgText,bg=self.bg, width=10)
        self.btnCadastrar.place(relx=0.10, rely=0.59)
        self.btnLogar = Button(master=self.frlogin,bd=0, text='Entrar',font=5, fg=self.fgText, bg=self.bg, width=10)
        self.btnLogar.place(relx=0.54, rely=0.59)

        self.recuperarsenha = Label(master=self.frlogin, text='Recuperar senha', bg=self.bg1, fg=self.fgText)
        self.recuperarsenha.place(relx=0.32, rely=0.70)
Application()