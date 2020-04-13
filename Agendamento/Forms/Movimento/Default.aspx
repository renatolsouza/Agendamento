<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Agendamento.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Forms_Movimento_Default" %>

<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=3.5.60501.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style16 {
            height: 4px;
        }

        .style5 {
            height: 28px;
        }

        .style8 {
            width: 90px;
        }

        .style10 {
            width: 90px;
        }

        .style11 {
            text-align: left;
        }

        .style13 {
            height: 27px;
            width: 35px;
        }

        .style15 {
            height: 26px;
        }
        /*Ajax*/
        .ModalBackGround {
            z-index: 111 !important;
            background-color: black;
            filter: alpha(opacity=90);
            opacity: 0.90;
        }

        .ModalBackGround2 {
            z-index: 1151 !important;
            background-color: black;
            filter: alpha(opacity=90);
            opacity: 0.90;
        }

        .ModalPopUp {
            border: solid 3px #18467d;
            font-size: 12px;
            background-color: #FFF;
            -moz-border-radius: 15px;
            border-radius: 15px;
            z-index: 110;
        }

        .ModalPopUp2 {
            border: solid 3px #18467d;
            font-size: 12px;
            background-color: #FFF;
            -moz-border-radius: 15px;
            border-radius: 15px;
            z-index: 1150;
        }

        .ModalTitulo {
            width: 99%;
            margin: 5px;
            text-align: right;
        }

        .FecharModal {
            border: solid 2px #18467d;
            font-weight: bold;
            padding-left: 5px;
            padding-right: 5px;
        }

            .FecharModal:hover {
                background-color: Red;
                color: #FFFFFF;
            }

        .style26 {
            width: 164px;
        }

        .style28 {
            height: 4px;
            width: 91px;
        }

        .style29 {
            height: 4px;
            width: 35px;
        }

        .style31 {
            width: 164px;
            height: 4px;
        }

        .style32 {
            width: 90px;
            height: 4px;
        }

        .style33 {
            width: 91px;
        }

        .style34 {
            width: 35px;
        }

        .auto-style18 {
            width: 78px;
            height: 4px;
        }

        .auto-style19 {
            width: 78px;
        }

        .auto-style20 {
            width: 91px;
            height: 18px;
        }

        .auto-style21 {
            width: 35px;
            height: 18px;
        }

        .auto-style22 {
            height: 18px;
        }

        .auto-style23 {
            width: 78px;
            height: 18px;
        }

        .auto-style24 {
            width: 90px;
            height: 18px;
        }

        .auto-style30 {
            height: 7px;
        }

        .auto-style31 {
            width: 78px;
            height: 7px;
        }

        .auto-style32 {
            width: 90px;
            height: 7px;
        }

        .auto-style33 {
            text-align: left;
            height: 7px;
        }

        .auto-style34 {
            height: 7px;
            width: 35px;
        }

        .auto-style35 {
            width: 91px;
            height: 6px;
        }

        .auto-style36 {
            width: 35px;
            height: 6px;
        }

        .auto-style37 {
            height: 6px;
        }

        .auto-style38 {
            width: 78px;
            height: 6px;
        }

        .auto-style39 {
            width: 90px;
            height: 6px;
        }
    </style>

    <script>
        /**************************************************************************
        Função para simular um Tab quando for pressionado a tecla Enter
        Exemplo: onKeyDown="TABEnter()"
        Funciona em TEXT BOX,RADIO BUTTON, CHECK BOX e menu DROP-DOWN
        **************************************************************************/
        function TABEnter(oEvent) {
            var oEvent = (oEvent) ? oEvent : event;
            var oTarget = (oEvent.target) ? oEvent.target : oEvent.srcElement;
            if (oEvent.keyCode == 13)
                oEvent.keyCode = 9;
            if (oTarget.type == "text" && oEvent.keyCode == 13)
                //return false;
                oEvent.keyCode = 9;
            if (oTarget.type == "radio" && oEvent.keyCode == 13)
                oEvent.keyCode = 9;
        }
        //Usando Jquery

        textboxes = $("input, select, textarea");

        if ($.browser.mozilla) {
            $(textboxes).keypress(checkForEnter);
        } else {
            $(textboxes).keydown(checkForEnter);
        }

        function checkForEnter(event) {
            console.log(this);
            if (event.keyCode == 13) {
                currentBoxNumber = textboxes.index(this);

                if (textboxes[currentBoxNumber + 1] != null) {
                    nextBox = textboxes[currentBoxNumber + 1]
                    nextBox.focus();
                    event.preventDefault();
                    return false;
                }
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="Titulo" class="Campos">
                <h1>AGENDAMENTO
                </h1>
            </div>
            <div class="conteudo">
                <table id="t1">
                    <tr>
                        <td class="style5">&nbsp;</td>
                        <td class="style13">&nbsp;
                        </td>
                        <td class="style15">
                            <span style="color: rgb(0, 0, 0); font-family: arial, helvetica, freesans, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Data do Agendamento</span>
                        </td>
                        <td class="auto-style19">&nbsp;
                        </td>
                        <td class="style8">
                            <asp:TextBox ID="txtNumero" runat="server" Width="84px" Visible="False">0</asp:TextBox>
                        </td>
                        <td class="style11" align="center">&nbsp; &nbsp; &nbsp; &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">&nbsp;</td>
                        <td class="style13">&nbsp;</td>
                        <td class="style15" colspan="2">
                            <asp:TextBox runat="server" ID="txtDataAgendamento" Width="170px" ValidationGroup="Gravar" AutoPostBack="true"
                                TabIndex="1" OnTextChanged="txtDataAgendamento_TextChanged"></asp:TextBox>

                            <asp:ImageButton runat="server" ID="btnCalendarnasc" ImageUrl="~/Forms/Imagens/calendar2.png"
                                Height="26px" CssClass="BotaoCalendar" ToolTip="Clique para escolher a data " /><br />
                            <asp:RangeValidator runat="server" ID="rvDataAgendamento" Display="None" SetFocusOnError="true"
                                ControlToValidate="txtDataAgendamento" ValidationGroup="Gravar" Type="Date" MinimumValue="01/01/1900"
                                MaximumValue="31/12/2050" ErrorMessage="A Data Informada é Inválida!"></asp:RangeValidator>
                            <ajax:ValidatorCalloutExtender runat="server" ID="v1DataAgendamento" Width="265px" TargetControlID="rvDataAgendamento"
                                HighlightCssClass="campoObrigatorio">
                            </ajax:ValidatorCalloutExtender>
                            <ajax:CalendarExtender runat="server" ID="Calendar1" TargetControlID="txtDataAgendamento"
                                FirstDayOfWeek="Sunday" PopupPosition="BottomRight" PopupButtonID="btnCalendarnasc"
                                Format="dd/MM/yyyy">
                            </ajax:CalendarExtender>
                            <ajax:MaskedEditExtender runat="server" ID="mkDataCadastro" MaskType="Date" Mask="99/99/9999"
                                InputDirection="LeftToRight" TargetControlID="txtDataAgendamento" ClearMaskOnLostFocus="false">
                            </ajax:MaskedEditExtender>
                            <asp:RequiredFieldValidator runat="server" ID="rDataAgendamento" ValidationGroup="Gravar"
                                InitialValue="__/__/____" ControlToValidate="txtDataAgendamento" SetFocusOnError="true"
                                Display="None" ErrorMessage="Campo Obrigatório!"></asp:RequiredFieldValidator>
                            <ajax:ValidatorCalloutExtender runat="server" ID="vDataAgendamento" TargetControlID="rDataAgendamento"
                                Width="256px" HighlightCssClass="campoObrigatorio">
                            </ajax:ValidatorCalloutExtender>
                            &nbsp;
                        </td>
                        <td class="style8">&nbsp;
                            <asp:TextBox ID="txtCodigo" runat="server" Width="84px" Visible="False">0</asp:TextBox>
                        </td>
                        <td align="center" class="style11">&nbsp;
                        </td>
                        <td class="style10">&nbsp;
                        </td>
                        <td class="style10">&nbsp;
                        </td>
                        <td class="style10">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style28"></td>
                        <td class="style29"></td>
                        <td class="auto-style16"></td>
                        <td class="auto-style18"></td>
                        <td class="style32"></td>
                        <td align="center" class="style32"></td>
                        <td class="style32"></td>
                        <td class="style32"></td>
                        <td class="style32"></td>
                    </tr>
                    <tr>
                        <td class="style28">Código</td>
                        <td class="style29">&nbsp;</td>
                        <td class="auto-style16">Clinica</td>
                        <td class="auto-style18">&nbsp;</td>
                        <td class="style32">&nbsp;</td>
                        <td align="center" class="style32">&nbsp;</td>
                        <td class="style32">&nbsp;</td>
                        <td class="style32">&nbsp;</td>
                        <td class="style32">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style28">
                            <asp:TextBox ID="txtCodClinica" runat="server" AutoPostBack="true" OnTextChanged="txtCodClinica_TextChanged" Width="84px"></asp:TextBox>
                        </td>
                        <td class="style29">
                            <asp:ImageButton ID="ImgPClinica" runat="server" CssClass="BotaoCalendar" Height="26px" ImageUrl="~/Forms/Imagens/lupa.png" OnClick="ImgPClinica_Click" ToolTip="Clique para escolher a Clinica" />
                        </td>
                        <td class="auto-style16">
                            <asp:TextBox ID="txtNomeClinica" runat="server" Enabled="False" Width="247px"></asp:TextBox>
                        </td>
                        <td class="auto-style18">&nbsp;</td>
                        <td class="style32">&nbsp;</td>
                        <td align="center" class="style32">&nbsp;</td>
                        <td class="style32">&nbsp;</td>
                        <td class="style32">&nbsp;</td>
                        <td class="style32">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style33"></td>
                        <td class="style34"></td>
                        <td></td>
                        <td class="auto-style19"></td>
                        <td class="style8"></td>
                        <td align="center" class="style8"></td>
                        <td class="style8"></td>
                        <td class="style8"></td>
                        <td class="style8"></td>
                    </tr>
                    <tr>
                        <td class="auto-style30">Codigo
                        </td>
                        <td class="auto-style34">&nbsp;
                        </td>
                        <td class="auto-style30">
                            <span style="color: rgb(0, 0, 0); font-family: arial, helvetica, freesans, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Paciente</span></td>
                        <td class="auto-style31">&nbsp;
                        </td>
                        <td class="auto-style32">&nbsp; Status</td>
                        <td align="center" class="auto-style33"></td>
                        <td align="center" class="auto-style33"></td>
                        <td align="center" class="auto-style33"></td>
                        <td class="auto-style32">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            <asp:TextBox ID="txtCodPaciente" runat="server" AutoPostBack="true" OnTextChanged="txtCodPaciente_TextChanged" TabIndex="2" Width="84px"></asp:TextBox>
                        </td>
                        <td class="style13">
                            <asp:ImageButton ID="ImgPPaciente" runat="server" CssClass="BotaoCalendar" Height="26px" ImageUrl="~/Forms/Imagens/lupa.png" OnClick="ImgPUnidade_Click" ToolTip="Clique para escolher o Paciente" />
                        </td>
                        <td class="style15">
                            <asp:TextBox ID="txtNomePaciente" runat="server" Width="245px" Enabled="False"></asp:TextBox>
                        </td>
                        <td class="auto-style19">&nbsp;</td>
                        <td colspan="2">
                            <asp:DropDownList ID="ddlSituacaoagenda" runat="server" Height="29px" TabIndex="3" Width="241px" ToolTip="Clique para escolher o status ">
                                <asp:ListItem Value="0">Selecione</asp:ListItem>
                                <asp:ListItem Value="1">Aguardando atendimento</asp:ListItem>
                                <asp:ListItem Value="2">Atendido</asp:ListItem>
                                <asp:ListItem Value="3">Não compareceu</asp:ListItem>
                                <asp:ListItem Value="4">Cancelado pelo Usuário</asp:ListItem>
                                <asp:ListItem Value="5">Cancelado pela Clínica</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td align="center" class="style11">&nbsp;</td>
                        <td align="center" class="style11">&nbsp;</td>
                        <td class="style10">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style33"></td>
                        <td class="style34"></td>
                        <td></td>
                        <td class="auto-style19"></td>
                        <td class="style8"></td>
                        <td align="center" class="style8"></td>
                        <td class="style8"></td>
                        <td class="style8"></td>
                        <td class="style8"></td>
                    </tr>
                    <tr>
                        <td class="auto-style35">Código</td>
                        <td class="auto-style36"></td>
                        <td class="auto-style37"><span style="color: rgb(0, 0, 0); font-family: arial, helvetica, freesans, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Plano de Saúde</span></td>
                        <td class="auto-style38"></td>
                        <td class="auto-style39"></td>
                        <td align="center" class="auto-style39"></td>
                        <td class="auto-style39"></td>
                        <td class="auto-style39"></td>
                        <td class="auto-style39"></td>
                    </tr>
                    <tr>
                        <td class="style33">
                            <asp:TextBox ID="txtCodPlano" runat="server" AutoPostBack="true" OnTextChanged="txtCodPlano_TextChanged" TabIndex="2" Width="84px"></asp:TextBox>
                        </td>
                        <td class="style34">
                            <asp:ImageButton ID="ImgPPlano" runat="server" CssClass="BotaoCalendar" Height="26px" ImageUrl="~/Forms/Imagens/lupa.png" OnClick="ImgPPlano_Click" ToolTip="Clique para escolher  Plano de Saúde" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtNomePlano" runat="server" Enabled="False" Width="245px"></asp:TextBox>
                        </td>
                        <td class="auto-style19">
                            <asp:ImageButton ID="btnAdiciona" runat="server" ImageUrl="~/Forms/Imagens/adicionar.png" OnClick="btnAdiciona_Click" Text="Adicionar" Width="28px" ToolTip="Clique para Adicionar o Agendamento" />
                        </td>
                        <td class="style8">&nbsp;</td>
                        <td align="center" class="style8">&nbsp;</td>
                        <td class="style8">&nbsp;</td>
                        <td class="style8">&nbsp;</td>
                        <td class="style8">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style20"></td>
                        <td class="auto-style21"></td>
                        <td class="auto-style22"></td>
                        <td class="auto-style23"></td>
                        <td class="auto-style24"></td>
                        <td align="center" class="auto-style24"></td>
                        <td class="auto-style24"></td>
                        <td class="auto-style24"></td>
                        <td class="auto-style24"></td>
                    </tr>
                </table>
            </div>
            <div class="divGrid">
                <asp:GridView runat="server" ID="Grid_Agenda" CssClass="Grid GridLimpoNot" GridLines="None"
                    AllowPaging="True" PageSize="20" AutoGenerateColumns="False" OnRowCommand="Grid_Agenda_RowCommand" OnRowDataBound="Grid_Agenda_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="CODAGENDA" HeaderText="CÓDIGO" Visible="False">
                            <ItemStyle Width="50px" ></ItemStyle>
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
                <asp:Button runat="server" ID="btnCancelar" Text="Cancelar" CssClass="g-button g-button-red" OnClick="btnCancelar_Click" Style="left: -12px; top: -5px; width: 115px" ToolTip="Clique para retornar ao Menu" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>


    <%--Pesquisa Plano--%>
    <div id="DivModal_Plano" runat="server" class="ModalPopUp" style="width: 900px;">
        <div style="padding: 3px;">
            <div id="DivModal_Plano_Titulo" class="ModalTitulo">
                <asp:LinkButton ID="LinkFechar_Modal_Plano" runat="server" Text="X" CssClass="FecharModal"></asp:LinkButton>
            </div>
            <h1>Plano de Saúde</h1>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <center>
                        <div style="text-align: left;">
                            <b>Por</b><br />
                            <asp:DropDownList ID="txtPor" runat="server" AutoPostBack="true" OnSelectedIndexChanged="txtPor_SelectedIndexChanged">
                                <asp:ListItem Value="1" Text="Descrição"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Data"></asp:ListItem>
                                <asp:ListItem Value="3" Text="Numero"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="txtValor" runat="server" Width="660px" AutoPostBack="true" OnTextChanged="txtValor_TextChanged"></asp:TextBox>
                            <asp:Button ID="btnBuscar" runat="server" Text="Filtrar" Width="100px" OnClick="btnBuscar_Click" /><br />
                            <br />
                        </div>
                        <div class="DivGrid" style="width: 890px; text-align: left;">
                            <asp:GridView ID="GridView_Busca_Plano" runat="server" Width="100%" CssClass="Grid"
                                PageSize="20" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="GridView_Busca_Plano_PageIndexChanging"
                                OnRowCommand="GridView_Busca_Plano_RowCommand" OnRowDataBound="GridView_Busca_Plano_RowDataBound"
                                OnSelectedIndexChanged="GridView_Busca_Plano_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="CODPLANO" HeaderText="Código" ItemStyle-Width="60px"
                                        HeaderStyle-HorizontalAlign="Left">
                                        <ItemStyle Width="98px"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NOME" HeaderText="Nome" HeaderStyle-HorizontalAlign="Left">
                                        <ItemStyle Width="150px"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DESCRICAO" HeaderText="Descrição" HeaderStyle-HorizontalAlign="Left">
                                        <ItemStyle Width="300px"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NUMEROPLANO" HeaderText="Número Plano" HeaderStyle-HorizontalAlign="Left">
                                        <ItemStyle Width="100px"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:ButtonField ButtonType="Image" ImageUrl="~/Forms/Imagens/Adicionar.png" CommandName="Inserir"
                                        ItemStyle-HorizontalAlign="Center" />
                                </Columns>
                                <EmptyDataTemplate>
                                    A sua consulta não retornou Plano válido ou a base de dados não contém Plano cadastrados!
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:Panel ID="DivMensagem_Plano" runat="server" Visible="false" BackColor="#FFCCCC">
                                <br style="font-size: 0px;" />
                                <b>Info:&nbsp;&nbsp;</b><asp:Label ID="lblMensagem_Plano" runat="server"><b></b></asp:Label>
                            </asp:Panel>
                        </div>
                    </center>
                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <asp:LinkButton ID="LinkAbrir_Modal_Plano" runat="server" CssClass="None"></asp:LinkButton>
    <ajax:ModalPopupExtender ID="Modal_Plano" runat="server" PopupControlID="DivModal_Plano"
        PopupDragHandleControlID="DivModal_Plano_Titulo" TargetControlID="LinkAbrir_Modal_Plano"
        OkControlID="LinkFechar_Modal_Plano" BackgroundCssClass="ModalBackGround" Y="40">
    </ajax:ModalPopupExtender>


    <%--Pesquisa Paciente--%>
    <div id="DivModal_Paciente" runat="server" class="ModalPopUp" style="width: 900px;">
        <div style="padding: 3px;">
            <div id="DivModal_Paciente_Titulo" class="ModalTitulo">
                <asp:LinkButton ID="LinkFechar_Modal_Paciente" runat="server" Text="X" CssClass="FecharModal"></asp:LinkButton>
            </div>
            <h1>Paciente</h1>
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <center>
                        <div style="text-align: left;">
                            <b>Por</b><br />
                            <asp:DropDownList ID="txtPorU" runat="server" AutoPostBack="true" OnSelectedIndexChanged="txtPorU_SelectedIndexChanged">
                                <asp:ListItem Value="1" Text="Descrição"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Data"></asp:ListItem>
                                <asp:ListItem Value="3" Text="Numero"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="txtValorU" runat="server" Width="660px" AutoPostBack="true" OnTextChanged="txtValorU_TextChanged"></asp:TextBox>
                            <asp:Button ID="btnBuscarU" runat="server" Text="Filtrar" Width="100px" OnClick="btnBuscarU_Click" /><br />
                            <br />
                        </div>
                        <div class="DivGrid" style="width: 890px; text-align: left;">
                            <asp:GridView ID="GridView_Busca_Paciente" runat="server" Width="100%" CssClass="Grid"
                                PageSize="20" AllowPaging="true" AutoGenerateColumns="false" OnPageIndexChanging="GridView_Busca_Paciente_PageIndexChanging" OnRowCommand="GridView_Busca_Paciente_RowCommand"
                                OnRowDataBound="GridView_Busca_Paciente_RowDataBound" OnSelectedIndexChanged="GridView_Busca_Paciente_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="CODPaciente" HeaderText="CÓDIGO">
                                        <ItemStyle Width="100px"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NOME" HeaderText="NOME">
                                        <ItemStyle Width="350px"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TELEFONE" HeaderText="TELEFONE" />
                                    <asp:ButtonField ButtonType="Image" ImageUrl="~/Forms/Imagens/Adicionar.png" CommandName="Inserir"
                                        ItemStyle-HorizontalAlign="Center" />
                                </Columns>
                                <EmptyDataTemplate>
                                    A sua consulta não retornou Paciente válida ou a base de dados não contém Paciente
                                    cadastrados!
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:Panel ID="DivMensagem_Paciente" runat="server" Visible="false" BackColor="#FFCCCC">
                                <br style="font-size: 0px;" />
                                <b>Info:&nbsp;&nbsp;</b><asp:Label ID="lblMensagem_Paciente" runat="server"><b></b></asp:Label>
                            </asp:Panel>
                        </div>
                    </center>
                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <asp:LinkButton ID="LinkAbrir_Modal_Paciente" runat="server" CssClass="None"></asp:LinkButton>
    <ajax:ModalPopupExtender ID="Modal_Paciente" runat="server" PopupControlID="DivModal_Paciente"
        PopupDragHandleControlID="DivModal_Paciente_Titulo" TargetControlID="LinkAbrir_Modal_Paciente"
        OkControlID="LinkFechar_Modal_Paciente" BackgroundCssClass="ModalBackGround"
        Y="40">
    </ajax:ModalPopupExtender>

    <%--Pesquisa Clinica--%>
    <div id="DivModal_Clinica" runat="server" class="ModalPopUp" style="width: 900px;">
        <div style="padding: 3px;">
            <div id="DivModal_Clinica_Titulo" class="ModalTitulo">
                <asp:LinkButton ID="LinkFechar_Modal_Clinica" runat="server" Text="X" CssClass="FecharModal"></asp:LinkButton>
            </div>
            <h1>Clinica</h1>
            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                <ContentTemplate>
                    <center>
                        <div style="text-align: left;">
                            <b>Por</b><br />
                            <asp:DropDownList ID="txtPorP" runat="server" AutoPostBack="true" OnSelectedIndexChanged="txtPorP_SelectedIndexChanged">
                                <asp:ListItem Value="Nome">NOME</asp:ListItem>
                                <asp:ListItem Value="Grupo">GRUPO</asp:ListItem>
                                <asp:ListItem Value="Codigo">CODIGO</asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="txtValorP" runat="server" Width="660px" AutoPostBack="true" OnTextChanged="txtValorP_TextChanged"></asp:TextBox>
                            <asp:Button ID="btnBuscarP" runat="server" Text="Filtrar" Width="100px" OnClick="btnBuscarP_Click" /><br />
                            <br />
                        </div>
                        <div class="DivGrid" style="width: 890px; text-align: left;">
                            <asp:GridView ID="GridView_Busca_Clinica" runat="server" Width="100%" CssClass="Grid"
                                PageSize="20" AllowPaging="true" AutoGenerateColumns="false" OnRowCommand="GridView_Busca_Clinica_RowCommand"
                                OnRowDataBound="GridView_Busca_Clinica_RowDataBound" OnSelectedIndexChanged="GridView_Busca_Clinica_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="CODCLINICA" HeaderText="CÓDIGO">
                                        <ItemStyle Width="100px"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NOME" HeaderText="NOME">
                                        <ItemStyle Width="350px"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:ButtonField ButtonType="Image" ImageUrl="~/Forms/Imagens/Adicionar.png" CommandName="Inserir"
                                        ItemStyle-HorizontalAlign="Center" />
                                </Columns>
                                <EmptyDataTemplate>
                                    A sua consulta não retornou Clinica válidos ou a base de dados não contém Clinica
                                    cadastrados!
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:Panel ID="DivMensagem_Clinica" runat="server" Visible="false" BackColor="#FFCCCC">
                                <br style="font-size: 0px;" />
                                <b>Info:&nbsp;&nbsp;</b><asp:Label ID="lblMensagem_Clinica" runat="server"><b></b></asp:Label>
                            </asp:Panel>
                        </div>
                    </center>
                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <asp:LinkButton ID="LinkAbrir_Modal_Clinica" runat="server" CssClass="None"></asp:LinkButton>
    <ajax:ModalPopupExtender ID="Modal_Clinica" runat="server" PopupControlID="DivModal_Clinica"
        PopupDragHandleControlID="DivModal_Clinica_Titulo" TargetControlID="LinkAbrir_Modal_Clinica"
        OkControlID="LinkFechar_Modal_Clinica" BackgroundCssClass="ModalBackGround"
        Y="40">
    </ajax:ModalPopupExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>

