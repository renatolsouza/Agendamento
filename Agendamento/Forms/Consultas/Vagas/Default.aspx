<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Agendamento.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Forms_Consultas_Vagas_Default" %>

<%@ Register Assembly="AjaxControlToolkit, Version=3.5.60501.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }

        .auto-style2 {
            text-align: justify;
        }

        .auto-style15 {
            width: 395px;
            height: 13px;
        }

        .auto-style16 {
            width: 395px;
            text-align: left;
            height: 30px;
        }

        .auto-style17 {
            width: 245px;
            height: 30px;
        }

        .auto-style18 {
            height: 30px;
        }

        .auto-style21 {
            width: 395px;
            text-align: left;
            height: 14px;
        }

        .auto-style22 {
            height: 14px;
        }
        .auto-style24 {
            width: 395px;
            text-align: left;
        }
        .auto-style25 {
            width: 245px;
            text-align: left;
        }
        .auto-style26 {
            width: 245px;
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
                            <td class="auto-style24">Data Inicial</td>
                            <td class="auto-style25">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style24">
                                <asp:TextBox ID="txtDataInicial" runat="server" AutoPostBack="true" TabIndex="1" ValidationGroup="Gravar" Width="170px"></asp:TextBox>
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
                            <td class="auto-style25">
                                &nbsp;</td>
                            <td>
                                <asp:Button ID="btnCancelar" runat="server" CssClass="g-button g-button-red" Height="30" PostBackUrl="../../Default.aspx" Text="Cancelar" Width="100px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style15"></td>
                            <td class="auto-style26"></td>
                            <td>
                                <asp:Button ID="btnBuscar" runat="server" CssClass="g-button g-button-red" Height="30" OnClick="BtnBuscarClick" Text="Buscar" Width="100px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style21">Clinica</td>
                            <td class="auto-style26"></td>
                            <td class="auto-style22"></td>
                        </tr>
                        <tr>
                            <td class="auto-style16">
                                <asp:DropDownList ID="ddlclinica" runat="server" DataTextField="NOME" DataValueField="CODCLINICA" Height="27px" Width="282px">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style17">
                                &nbsp;</td>
                            <td class="auto-style18">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style16">&nbsp;</td>
                            <td class="auto-style17">&nbsp;</td>
                            <td class="auto-style18">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style16">Vagas Disponíveis -
                                <asp:TextBox ID="txtvagas" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style17">&nbsp;</td>
                            <td class="auto-style18">&nbsp;</td>
                        </tr>
                    </table>
                    <br style="font-size: 5px;" />
                    <br />
                    <br style="font-size: 5px;" />
                </div>
               
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
