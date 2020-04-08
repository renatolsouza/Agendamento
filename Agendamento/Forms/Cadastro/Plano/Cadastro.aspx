<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Agendamento.master" AutoEventWireup="true" CodeFile="Cadastro.aspx.cs" Inherits="Forms_Cadastro_Plano_Cadastro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>

