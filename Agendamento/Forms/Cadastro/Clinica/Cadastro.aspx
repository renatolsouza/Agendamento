<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cadastro.aspx.cs" Inherits="Forms_Cadastro_Clinica_Cadastro" %>
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
            <h1>Clinica</h1>
            <br />
            <a>Código</a><br />
            <asp:TextBox runat="server" ID="txtCodigo" Enabled="false"></asp:TextBox>
            <br />
            <br />
            <a>Nome Clinica</a><br />
            <asp:TextBox runat="server" ID="txtNomeClinica" Width="600"></asp:TextBox>
            <br />
            <br />
            Endereço<br />
            <asp:TextBox runat="server" ID="txtEndereco" Width="600px"></asp:TextBox>
            <br />
            <br />
            <a>Cnpj</a><br />
            <asp:TextBox runat="server" ID="txtCnpj" Width="600" MaxLength="18" onkeypress="Mascara(this,Cnpj);" ValidationGroup="gravar"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ID="r3" ControlToValidate="txtCnpj" ValidationGroup="gravar"
                SetFocusOnError="true" ErrorMessage="Campo obrigatório! " Display="None"></asp:RequiredFieldValidator>
            <ajax:ValidatorCalloutExtender runat="server" ID="v3" TargetControlID="r3" Width="300px"
                PopupPosition="Right" />
            <br />
            <br />
            Telefone
            <br />
            <asp:TextBox runat="server" ID="txtTelefone" Width="600px" onkeypress="Mascara(this,Telefone);"
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
