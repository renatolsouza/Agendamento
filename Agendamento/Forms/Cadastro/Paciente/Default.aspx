﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Agendamento.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Forms_Cadastro_Paciente_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }
        .auto-style2 {
            text-align: justify;
        }
        .auto-style3 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
            <div class="auto-style1">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <h1 class="auto-style2">Pacientes</h1>
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

                        <div class="auto-style3">
                            <asp:GridView runat="server" ID="Grid_Paciente" CssClass="Grid GridLimpoNot" GridLines="0" AllowPaging="true" PageSize="10"
                                OnPageIndexChanging="GridPacientePageIndexChanging"
                                AutoGenerateColumns="false" OnRowCommand="GridPacienteRowCommand">
                                <Columns>
                                    <asp:BoundField DataField="codPaciente" HeaderText="CÓDIGO">
                                        <ItemStyle Width="100px"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nome" HeaderText="NOME">
                                        <ItemStyle Width="200px"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="endereco" HeaderText="ENDEREÇO">
                                        <ItemStyle Width="300px"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="telefone" HeaderText="TELEFONE" />
                                    <asp:ButtonField ButtonType="Button" Text="EDITAR" CommandName="editar">
                                        <ItemStyle Width="30px"></ItemStyle>
                                    </asp:ButtonField>
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

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>

