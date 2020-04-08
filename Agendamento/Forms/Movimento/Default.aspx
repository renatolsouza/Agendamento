<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Agendamento.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Forms_Movimento_Default" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=3.5.60501.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="Titulo" class="Campos">
                <h1>
                    Agendamento
                </h1>
                <br />
                <br />
            </div>
            <div class="conteudo">
                <table id="t1">
                    <tr>
                        <td class="style5">
                            Nº Agendamento
                        </td>
                        <td class="style13">
                            &nbsp;
                        </td>
                        <td class="style15">
                            Data do Agendamento
                        </td>
                        <td class="style26">
                            &nbsp;
                        </td>
                        <td class="style8">
                            &nbsp;
                        </td>
                        <td class="style11" align="center">
                            &nbsp; &nbsp; &nbsp; &nbsp;
                            </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            <asp:TextBox ID="txtNumeroPedido" runat="server" Width="84px"
                                AutoPostBack="true"></asp:TextBox>
                            <ajax:FilteredTextBoxExtender TargetControlID="txtNumeroPedido" runat="server" FilterMode="ValidChars"
                                FilterType="Custom" ValidChars="0123456789\,">
                            </ajax:FilteredTextBoxExtender>
                        </td>
                        <td class="style13">
                            <asp:ImageButton ID="ImgPPedido" runat="server" CssClass="BotaoCalendar" Height="26px"
                                ImageUrl="~/Forms/Imagens/lupa.png" />
                        </td>
                        <td class="style15" colspan="2">
                            <asp:TextBox runat="server" ID="txtDataPedido" Width="170px" ValidationGroup="Gravar"
                                TabIndex="1"></asp:TextBox>
                            <asp:ImageButton runat="server" ID="btnCalendarnasc" ImageUrl="~/Forms/Imagens/calendar2.png"
                                Height="26px" CssClass="BotaoCalendar" /><br />
                            <asp:RangeValidator runat="server" ID="rvDataPedido" Display="None" SetFocusOnError="true"
                                ControlToValidate="txtDataPedido" ValidationGroup="Gravar" Type="Date" MinimumValue="01/01/1900"
                                MaximumValue="31/12/2050" ErrorMessage="A Data Informada é Inválida!"></asp:RangeValidator>
                            <ajax:ValidatorCalloutExtender runat="server" ID="v1DataPedido" Width="265px" TargetControlID="rvDataPedido"
                                HighlightCssClass="campoObrigatorio">
                            </ajax:ValidatorCalloutExtender>
                            <ajax:CalendarExtender runat="server" ID="Calendar1" TargetControlID="txtDataPedido"
                                FirstDayOfWeek="Sunday" PopupPosition="BottomRight" PopupButtonID="btnCalendarnasc"
                                Format="dd/MM/yyyy">
                            </ajax:CalendarExtender>
                            <ajax:MaskedEditExtender runat="server" ID="mkDataCadastro" MaskType="Date" Mask="99/99/9999"
                                InputDirection="LeftToRight" TargetControlID="txtDataPedido" ClearMaskOnLostFocus="false">
                            </ajax:MaskedEditExtender>
                            <asp:RequiredFieldValidator runat="server" ID="rDataPedido" ValidationGroup="Gravar"
                                InitialValue="__/__/____" ControlToValidate="txtDataPedido" SetFocusOnError="true"
                                Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                            <ajax:ValidatorCalloutExtender runat="server" ID="vDataPedido" TargetControlID="rDataPedido"
                                Width="256px" HighlightCssClass="campoObrigatorio">
                            </ajax:ValidatorCalloutExtender>
                            &nbsp;
                        </td>
                        <td class="style8">
                            &nbsp;
                            <asp:TextBox ID="txtCodigo" runat="server" Visible="False" Width="84px">0</asp:TextBox>
                        </td>
                        <td align="center" class="style11">
                            &nbsp;
                        </td>
                        <td class="style10">
                            &nbsp;
                        </td>
                        <td class="style10">
                            &nbsp;
                        </td>
                        <td class="style10">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style28">
                        </td>
                        <td class="style29">
                        </td>
                        <td class="auto-style16">
                        </td>
                        <td class="style31">
                        </td>
                        <td class="style32">
                        </td>
                        <td align="center" class="style32">
                        </td>
                        <td class="style32">
                        </td>
                        <td class="style32">
                        </td>
                        <td class="style32">
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            Codigo
                        </td>
                        <td class="style13">
                            &nbsp;
                        </td>
                        <td class="style15">
                            Paciente
                        </td>
                        <td class="style26">
                            &nbsp;
                        </td>
                        <td class="style8">
                            &nbsp;
                        </td>
                        <td align="center" class="style11" colspan="3">
                            &nbsp; &nbsp;</td>
                        <td class="style10">
                            &nbsp;
                            </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            <asp:TextBox ID="txtCodigoUnidade" runat="server" Width="84px" TabIndex="2"
                                AutoPostBack="true"></asp:TextBox>
                        </td>
                        <td class="style13">
                            <asp:ImageButton ID="ImgPUnidade" runat="server" CssClass="BotaoCalendar" Height="26px"
                                ImageUrl="~/Forms/Imagens/lupa.png"  />
                        </td>
                        <td class="style15" colspan="3">
                            <asp:TextBox ID="txtNomeUnidade" runat="server" Width="245px" Enabled="False"></asp:TextBox>
                        </td>
                        <td align="center" class="style11" colspan="3">
                            &nbsp; &nbsp; &nbsp;
                            </td>
                        <td class="style10">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style33">
                        </td>
                        <td class="style34">
                        </td>
                        <td>
                        </td>
                        <td class="style26">
                        </td>
                        <td class="style8">
                        </td>
                        <td align="center" class="style8">
                        </td>
                        <td class="style8">
                        </td>
                        <td class="style8">
                        </td>
                        <td class="style8">
                        </td>
                    </tr>
                    <tr>
                        <td class="style33">Codigo</td>
                        <td class="style34">&nbsp;</td>
                        <td>Plano de Saúde</td>
                        <td class="style26">&nbsp;</td>
                        <td class="style8">&nbsp;</td>
                        <td align="center" class="style8">&nbsp;</td>
                        <td class="style8">&nbsp;</td>
                        <td class="style8">&nbsp;</td>
                        <td class="style8">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style33">
                            <asp:TextBox ID="txtCodigoUnidade0" runat="server" AutoPostBack="true" TabIndex="2" Width="84px"></asp:TextBox>
                        </td>
                        <td class="style34">
                            <asp:ImageButton ID="ImgPUnidade0" runat="server" CssClass="BotaoCalendar" Height="26px" ImageUrl="~/Forms/Imagens/lupa.png" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtNomeUnidade0" runat="server" Enabled="False" Width="245px"></asp:TextBox>
                        </td>
                        <td class="style26">&nbsp;</td>
                        <td class="style8">&nbsp;</td>
                        <td align="center" class="style8">&nbsp;</td>
                        <td class="style8">&nbsp;</td>
                        <td class="style8">&nbsp;</td>
                        <td class="style8">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style33">&nbsp;</td>
                        <td class="style34">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="style26">&nbsp;</td>
                        <td class="style8">&nbsp;</td>
                        <td align="center" class="style8">&nbsp;</td>
                        <td class="style8">&nbsp;</td>
                        <td class="style8">&nbsp;</td>
                        <td class="style8">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">
                            Codigo
                        </td>
                        <td class="style13">
                            &nbsp;
                        </td>
                        <td class="style15" colspan="3">
                            Clinica</td>
                        <td align="center" class="style11">
                            &nbsp;</td>
                        <td class="style10">
                            &nbsp;
                        </td>
                        <td class="style10">
                            &nbsp;</td>
                        <td class="style10">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            <asp:TextBox ID="txtCodigoProduto" runat="server" Width="84px" AutoPostBack="true"
                               ></asp:TextBox>
                        </td>
                        <td class="style13">
                            <asp:ImageButton ID="ImgPProdutos" runat="server" CssClass="BotaoCalendar" Height="26px"
                                ImageUrl="~/Forms/Imagens/lupa.png" />
                        </td>
                        <td class="style15" colspan="4">
                            <asp:TextBox ID="txtNomeProduto" runat="server" Width="430px" Enabled="False"></asp:TextBox>
                        </td>
                        <td class="style10">
                            &nbsp;</td>
                        <td class="style10">
                            <asp:ImageButton ID="Button1" runat="server" ImageUrl="~/Forms/Imagens/adicionar.png"  Text="Adicionar" Width="28px" />
                        </td>
                        <td class="style10">
                            &nbsp;
                            </td>
                    </tr>
                    <caption>
                    </caption>
                </table>
            </div>
            <div class="divGrid">
                <asp:GridView runat="server" ID="Grid_Agendamento" CssClass="Grid GridLimpoNot" GridLines="None"
                    AllowPaging="True" PageSize="20" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="CODPRODUTO" HeaderText="CÓDIGO">
                            <ItemStyle Width="90px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="DESCRICAO" HeaderText="PACIENTE">
                            <ItemStyle Width="200px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="LOTE" HeaderText="PLANO">
                            <ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="QUANTIDADE" HeaderText="CLINICA">
                            <ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
                        <asp:ButtonField ButtonType="Image" CommandName="editar" ImageUrl="~/Forms/Imagens/checkmark.png">
                            <ItemStyle Width="30px"></ItemStyle>
                        </asp:ButtonField>
                        <asp:ButtonField ButtonType="Image" CommandName="excluir" ImageUrl="~/Forms/Imagens/excluir.png">
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
            <div id="divBotao" class="conteudo">
                <br />
                <asp:Button runat="server" ID="btnGravar" ValidationGroup="gravar" Text="Gravar"
                    CssClass="g-button g-button-red" Width="99px" />
                <asp:Button runat="server" ID="btnCancelar" Text="Cancelar" CssClass="g-button g-button-red"
                    Width="99px"  style="left: -12px; top: -3px; width: 113px" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>

