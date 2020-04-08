<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Forms_Cadastro_Plano_Default" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=3.5.60501.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../../../App_Themes/Tema/Estilo.css" rel="stylesheet" />


    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }

        .auto-style2 {
            text-align: left;
        }

        .auto-style3 {
            margin-left: 121px;
            margin-right: 248px;
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
        <div class="auto-style3">

            <div class="auto-style1">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <h1 class="auto-style2">Plano de Saúde</h1>
                        <div class="auto-style1">
                            <br />
                        </div>
                        <div class="auto-style1">

                            <asp:Button runat="server" ID="btnNovo" PostBackUrl="Cadastro.aspx" Text="Novo" Width="100px" Height="30"
                                CssClass="g-button g-button-red" />
                            <br />
                            <br style="font-size: 5px;" />
                            <asp:DropDownList runat="server" ID="txtPor">
                                <asp:ListItem Value="todos">TODOS</asp:ListItem>
                                <asp:ListItem Value="nome">NOME</asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox runat="server" ID="txtBuscar" Width="653" AutoPostBack="true" OnTextChanged="TxtBuscarTextChanged"></asp:TextBox>
                            <asp:Button runat="server" ID="btnBuscar" Text="Buscar" CssClass="g-button g-button-red"
                                Width="100px" Height="30" OnClick="BtnBuscarClick" />
                            <br />
                            <br style="font-size: 5px;" />
                            <asp:Button runat="server" ID="btnCancelar" PostBackUrl="../../Default.aspx" Text="Cancelar" Width="100px" Height="30"
                                CssClass="g-button g-button-red" />
                        </div>
                        <div class="auto-style1">
                            <br style="font-size: 5px;" />
                        </div>

                        <div class="auto-style2">
                            <asp:GridView runat="server" ID="Grid_Plano" CssClass="Grid GridLimpoNot" GridLines="0" AllowPaging="true" PageSize="10"
                                OnPageIndexChanging="GridPlanoPageIndexChanging"
                                AutoGenerateColumns="false" OnRowCommand="GridPlanoRowCommand">
                                <Columns>
                                    <asp:BoundField DataField="codplano" HeaderText="CÓDIGO">
                                        <ItemStyle Width="100px"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nome" HeaderText="NOME">
                                        <ItemStyle Width="200px"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="descricao" HeaderText="DESCRIÇÃO">
                                        <ItemStyle Width="300px"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="numeroplano" HeaderText="NÚMERO">
                                        <ItemStyle Width="110px"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div style="padding: 10px;">
                                        SUA CONSULTA NÃO RETORNOU NENHUM PROCEDIMENTO CADASTRADO!
                            <br />
                                    </div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

        </div>


    </form>
</body>
</html>
