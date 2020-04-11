<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Agendamento.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Forms_Consultas_Pacientes_Default" %>

<%@ Register Assembly="AjaxControlToolkit, Version=3.5.60501.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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

        .auto-style12 {
            width: 302px;
            text-align: left;
        }

        .auto-style13 {
            width: 302px;
            height: 14px;
        }

        .auto-style14 {
            width: 289px;
            text-align: left;
        }

        .auto-style15 {
            width: 289px;
            height: 13px;
        }

        .auto-style16 {
            width: 289px;
            text-align: left;
            height: 30px;
        }

        .auto-style17 {
            width: 302px;
            height: 30px;
        }

        .auto-style18 {
            height: 30px;
        }

        .auto-style21 {
            width: 289px;
            text-align: left;
            height: 14px;
        }

        .auto-style22 {
            height: 14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="auto-style1">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <h1 class="auto-style2">Consulta de Pacientes</h1>
                <div class="auto-style1">
                    <br />
                </div>
                <div class="auto-style1">

                    <br />
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style14">Data Inicial</td>
                            <td class="auto-style12">Data Final</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style14">
                                <asp:TextBox ID="txtDataInicial" runat="server" AutoPostBack="true" TabIndex="1" ValidationGroup="Gravar" Width="170px" OnTextChanged="txtDataInicial_TextChanged"></asp:TextBox>
                                <ajax:CalendarExtender ID="Calendar1" runat="server" FirstDayOfWeek="Sunday" Format="dd/MM/yyyy" PopupButtonID="btnCalendarnasc" PopupPosition="BottomRight" TargetControlID="txtDataInicial">
                                </ajax:CalendarExtender>
                                <ajax:MaskedEditExtender ID="mkDataInicial" runat="server" ClearMaskOnLostFocus="false" InputDirection="LeftToRight" Mask="99/99/9999" MaskType="Date" TargetControlID="txtDataInicial">
                                </ajax:MaskedEditExtender>
                                <asp:ImageButton ID="btnCalendarnasc" runat="server" CssClass="BotaoCalendar" Height="26px" ImageUrl="~/Forms/Imagens/calendar2.png" />
                                <br />
                                <asp:RangeValidator ID="rvDataInicial" runat="server" ControlToValidate="txtDataInicial" Display="None" ErrorMessage="A Data Informada é Inválida!" MaximumValue="31/12/2050" MinimumValue="01/01/1900" SetFocusOnError="true" Type="Date" ValidationGroup="Gravar"></asp:RangeValidator>
                                <ajax:ValidatorCalloutExtender ID="v1DataInicial" runat="server" HighlightCssClass="campoObrigatorio" TargetControlID="rvDataInicial" Width="265px">
                                </ajax:ValidatorCalloutExtender>
                                <asp:RequiredFieldValidator ID="rDataInicial" runat="server" ControlToValidate="txtDataInicial" Display="None" ErrorMessage="Campo Obrigatório!" InitialValue="__/__/____" SetFocusOnError="true" ValidationGroup="Gravar"></asp:RequiredFieldValidator>
                                <ajax:ValidatorCalloutExtender ID="vDataInicial" runat="server" HighlightCssClass="campoObrigatorio" TargetControlID="rDataInicial" Width="256px">
                                </ajax:ValidatorCalloutExtender>
                                &nbsp; </td>
                            <td class="auto-style12">
                                <asp:TextBox ID="txtDataFinal" runat="server" AutoPostBack="true" TabIndex="1" ValidationGroup="Gravar" Width="170px" OnTextChanged="txtDataFinal_TextChanged"></asp:TextBox>
                                <ajax:CalendarExtender ID="Calendar2" runat="server" FirstDayOfWeek="Sunday" Format="dd/MM/yyyy" PopupButtonID="btnCalendarnasc0" PopupPosition="BottomRight" TargetControlID="txtDataFinal">
                                </ajax:CalendarExtender>
                                <ajax:MaskedEditExtender ID="mkDataFinal" runat="server" ClearMaskOnLostFocus="false" InputDirection="LeftToRight" Mask="99/99/9999" MaskType="Date" TargetControlID="txtDataFinal">
                                </ajax:MaskedEditExtender>
                                <asp:ImageButton ID="btnCalendarnasc0" runat="server" CssClass="BotaoCalendar" Height="26px" ImageUrl="~/Forms/Imagens/calendar2.png" />
                                <br />
                                <asp:RangeValidator ID="rvDataFinal" runat="server" ControlToValidate="txtDataFinal" Display="None" ErrorMessage="A Data Informada é Inválida!" MaximumValue="31/12/2050" MinimumValue="01/01/1900" SetFocusOnError="true" Type="Date" ValidationGroup="Gravar"></asp:RangeValidator>
                                <ajax:ValidatorCalloutExtender ID="v1DataFinal" runat="server" HighlightCssClass="campoObrigatorio" TargetControlID="rvDataFinal" Width="265px">
                                </ajax:ValidatorCalloutExtender>
                                <asp:RequiredFieldValidator ID="rDataFinal" runat="server" ControlToValidate="txtDataFinal" Display="None" ErrorMessage="Campo Obrigatório!" InitialValue="__/__/____" SetFocusOnError="true" ValidationGroup="Gravar"></asp:RequiredFieldValidator>
                                <ajax:ValidatorCalloutExtender ID="vDataFinal" runat="server" HighlightCssClass="campoObrigatorio" TargetControlID="rDataFinal" Width="256px">
                                </ajax:ValidatorCalloutExtender>
                                &nbsp; </td>
                            <td>
                                <asp:Button ID="btnCancelar" runat="server" CssClass="g-button g-button-red" Height="30" PostBackUrl="../../Default.aspx" Text="Cancelar" Width="100px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style15"></td>
                            <td class="auto-style13"></td>
                            <td>
                                <asp:Button ID="btnBuscar" runat="server" CssClass="g-button g-button-red" Height="30" OnClick="BtnBuscarClick" Text="Buscar" Width="100px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style21">Status</td>
                            <td class="auto-style13"></td>
                            <td class="auto-style22"></td>
                        </tr>
                        <tr>
                            <td class="auto-style16">
                                <asp:DropDownList ID="ddlSituacaoagenda" runat="server" Height="29px" TabIndex="3" Width="241px">
                                    <asp:ListItem Value="0">Selecione</asp:ListItem>
                                    <asp:ListItem Value="1">Aguardando atendimento</asp:ListItem>
                                    <asp:ListItem Value="2">Atendido</asp:ListItem>
                                    <asp:ListItem Value="3">Não compareceu</asp:ListItem>
                                    <asp:ListItem Value="4">Cancelado pelo Usuário</asp:ListItem>
                                    <asp:ListItem Value="5">Cancelado pela Clínica</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style17"></td>
                            <td class="auto-style18"></td>
                        </tr>
                    </table>
                    <br style="font-size: 5px;" />
                    <br />
                    <br style="font-size: 5px;" />
                </div>
                
                <div class="auto-style1">
                    <br style="font-size: 5px;" />
                </div>
                <div class="auto-style3">
                    <asp:GridView runat="server" ID="Grid_Paciente" CssClass="Grid GridLimpoNot" GridLines="0" AllowPaging="true" PageSize="20"
                        OnPageIndexChanging="GridPacientePageIndexChanging"
                        AutoGenerateColumns="false" OnRowCommand="GridPacienteRowCommand">
                        <Columns>
                            <asp:BoundField DataField="CODAGENDA" HeaderText="CÓDIGO" Visible="False">
                                <ItemStyle Width="50px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="DATAAGENDA" HeaderText="Data">
                                <HeaderStyle />
                                <ItemStyle Width="50px" HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                             <asp:BoundField DataField="NUMEROATENDIMENTO" HeaderText="N°">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle Width="50px" HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="NOMEPACIENTE" HeaderText="Paciente">
                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="NOMECLINICA" HeaderText="Clinica">
                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="NOMEPLANO" HeaderText="Plano">
                                <ItemStyle Width="100px"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="NOMESITUACAO" HeaderText="Status">
                                <ItemStyle Width="100px"></ItemStyle>
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

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>

