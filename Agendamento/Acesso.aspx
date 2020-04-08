<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Acesso.aspx.cs" Inherits="Acesso" %>
<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=3.5.60501.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link href="/App_Themes/Tema/Estilo.css" rel="stylesheet" type="text/css" />
</head>
<body>
   
    <form id="form1" runat="server" style="margin: 0; width: 100%;">
        <div id="divLoginB">
            <div id="divLogin">
                <h3 style="margin-top: -2px; color: midnightblue">Clinica<asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </h3>
                <asp:Label ID="Label3" runat="server" Text="Empresa" Font-Bold="True" ForeColor="#000099"></asp:Label>
                <asp:DropDownList ID="ddlEmpresa" runat="server" Width="96%" Height="29px"  DataTextField="NOME" DataValueField="CODEMPRESA"></asp:DropDownList>
           
                <br />
                 <br />
                <asp:Label ID="Label1" runat="server" Text="Usuario" Font-Bold="True" ForeColor="#000099"></asp:Label>
                <asp:TextBox runat="server" ID="txtUsuario" Width="96%"></asp:TextBox><br />
              
                <br />
                <asp:Label ID="Label2" runat="server" Text="Senha" Font-Bold="True" ForeColor="#000099"></asp:Label>
                <asp:TextBox runat="server" ID="txtSenha" Width="96%" TextMode="Password"></asp:TextBox><br />
               
                <br />
                 <br />
                <div id="divBotaoLogin">
                    <div class="esq">
                        <%--<asp:LinkButton runat="server" ID="linkEsqueceuSenha"
                            Text="Esqueceu sua senha?" OnClick="LinkEsqueceuSenhaClick"></asp:LinkButton>--%>
                    </div>
                    <div class="dir">
                        <asp:Button runat="server" ID="btnAcessar" Text="Acessar" Height="35"
                            CssClass="g-button g-button-red" OnClick="BtnAcessarClick" />
                    </div>
                </div>
                <br />
                <br />
            </div>
        </div>
        <br />
        <br />
        <div id="DivMensagem" runat="server" visible="false">
            <div id="DivMensagemInt">
                <br />
                <asp:Label ID="lblMensagem" runat="server" Font-Size="13px"><b>Usuário e/ou Senha Inválidos! <br />Tente Novamente.</b></asp:Label>
                <br />
                <br />
            </div>
        </div>
    </form>
</body>
</html>
