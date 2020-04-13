<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Agendamento.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Forms_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>
        <div style="text-align: left;">
            <a style="font-size: 40px; color: #2e68b0;">Clinica</a><br />
            <br />
            <a style="font-size: 16px; font-weight: bold; color: #908383;">Sistema Gerencial</a>
        </div>
        <table width="100%">
            <tr id="Linha1">
                <td id="Clinica" style="width: 450px;">
                    <asp:HyperLink runat="server" ToolTip="Clique para Cadastrar Clinica" CssClass="linkInicioIcones" ID="linkAtendimento" NavigateUrl="~/Forms/Cadastro/Clinica/Default.aspx">
                    <div class="divInicioIcones">
                        <table width="100%">
                            <tr>
                                <td style="width: 64px;">
                                     <div class="divImgInicio">
                                        <asp:Image runat="server" ImageUrl="~/Forms/Imagens/Menu/Clinica.png"/>
                                    </div>
                                </td>
                                <td style="color:darkblue">
                                    <b>Clinica</b>
                                </td>
                            </tr>
                        </table>
                    </div>
                    </asp:HyperLink>
                </td>
                <td id="Agenda">
                    <asp:HyperLink runat="server" ToolTip="Clique para Efetuar um Agendamento" CssClass="linkInicioIcones" ID="HyperLink1" NavigateUrl="~/Forms/Movimento/Default.aspx">
                    <div class="divInicioIcones">
                        <table width="100%">
                            <tr>
                                <td style="width: 64px;">
                                     <div class="divImgInicio">
                                        <asp:Image runat="server" ImageUrl="~/Forms/Imagens/Menu/Agendamento.png"/>
                                    </div>
                                </td>
                                <td style="color:darkblue">
                                    <b>Agenda</b>
                                </td>
                            </tr>
                        </table>
                    </div>
                    </asp:HyperLink>
                </td>
            </tr>
            <tr id="Linha2">
                <td id="Paciente" style="width: 450px;">
                    <asp:HyperLink runat="server" ToolTip="Clique para Cadastrar Paciente" CssClass="linkInicioIcones" ID="HyperLink2" NavigateUrl="~/Forms/Cadastro/Paciente/Default.aspx">
                    <div class="divInicioIcones">
                        <table width="100%">
                            <tr>
                                <td style="width: 64px;">
                                     <div class="divImgInicio">
                                        <asp:Image runat="server" ImageUrl="~/Forms/Imagens/Menu/Paciente.png"/>
                                    </div>
                                </td>
                                <td style="color:darkblue">
                                    <b>Paciente</b>
                                </td>
                            </tr>
                        </table>
                    </div>
                    </asp:HyperLink>
                </td>
                <td id="ConsPacientes" style="width: 450px;">
                    <asp:HyperLink runat="server" ToolTip="Clique para Efetuar Consulta de Paciente" CssClass="linkInicioIcones" ID="HyperLink5" NavigateUrl="~/Forms/Consultas/Pacientes/Default.aspx">
                        <div class="divInicioIcones">
                            <table width="100%">
                                <tr>
                                    <td style="width: 64px;">
                                     <div class="divImgInicio">
                                        <asp:Image runat="server" ImageUrl="~/Forms/Imagens/Menu/ConsPacientes.png"/>
                                    </div>
                                </td>
                                <td style="color:darkblue">
                                    <b>Consulta de Paciente</b>
                                </td>
                                </tr>
                            </table>
                        </div>
                    </asp:HyperLink>
                </td>
            </tr>
            <tr id="Linha3">

                <td id="Plano">
                    <asp:HyperLink runat="server" ToolTip="Clique para Cadastrar Plano de Saúde" CssClass="linkInicioIcones" ID="HyperLink6" NavigateUrl="~/Forms/Cadastro/Plano/Default.aspx">
                    <div class="divInicioIcones">
                        <table width="100%">
                            <tr>
                                <td style="width: 64px;">
                                     <div class="divImgInicio">
                                        <asp:Image runat="server" ImageUrl="~/Forms/Imagens/Menu/Plano.png"/>
                                    </div>
                                </td>
                                <td style="color:darkblue">
                                    <b>Plano</b>
                                </td>
                            </tr>
                        </table>
                    </div>
                    </asp:HyperLink>
                </td>
                <td id="Vagas">
                    <asp:HyperLink runat="server" ToolTip="Clique para Consultar Vagas" CssClass="linkInicioIcones" ID="HyperLink3" NavigateUrl="~/Forms/Consultas/Vagas/Default.aspx">
                    <div class="divInicioIcones">
                        <table width="100%">
                            <tr>
                                <td style="width: 64px;">
                                     <div class="divImgInicio">
                                        <asp:Image runat="server" ImageUrl="~/Forms/Imagens/Menu/ConsVagas.png"/>
                                    </div>
                                </td>
                                <td style="color:darkblue">
                                    <b>Consulta de Vagas</b>
                                </td>
                            </tr>
                        </table>
                    </div>
                    </asp:HyperLink>
                </td>
            </tr>
        </table>
        <br />
        <div class="divMensInicio">
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="../Acesso.aspx">Sair</asp:HyperLink>
        </div>
        <br />
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>

