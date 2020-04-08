<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cadastro.aspx.cs" Inherits="Forms_Cadastro_Plano_Cadastro" %>
<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=3.5.60501.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 80px;
            margin-right: 50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <ajax:ToolkitScriptManager ID="SmGeral" runat="server" EnableScriptGlobalization="true">
            <Scripts>
                <asp:ScriptReference Path="~/Mascaras.js" />
            </Scripts>
        </ajax:ToolkitScriptManager>

        <div class="auto-style1">
             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <h1>Plano</h1>
            <br />
            <a>Código</a><br />
            <asp:TextBox runat="server" ID="txtCodigo" Enabled="false"></asp:TextBox>
            <br />
            <br />
            <a>Nome</a><br />
            <asp:TextBox runat="server" ID="txtNome" Width="600"></asp:TextBox>
            <br />
            <br />
            Descrição<br />
            <asp:TextBox runat="server" ID="txtDescricao" Width="600px"></asp:TextBox>
            <br />
            <br />
            Número Plano
            <br />
            <asp:TextBox runat="server" ID="txtNumero" Width="600px" onkeypress="Mascara(this,Telefone);"
                MaxLength="13"></asp:TextBox>
            <br />
            <br />
            <br />
            <div>
                <asp:Button runat="server" ID="btnGravar" Text="Gravar"
                    CssClass="g-button g-button-red" OnClick="BtnGravarClick" Width="99px" />
                <asp:Button runat="server" ID="btnCancelar" Text="Cancelar" CssClass="g-button g-button-red"
                    OnClick="BtnCancelarClick" Width="99px" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
