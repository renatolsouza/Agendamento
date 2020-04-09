using Agendamento.App_Code.Funcoes;
using Agendamento.App_Code.MySQL;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Forms_Movimento_Default : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {

                var queryId = Request.QueryString["ID"];
                if (queryId != null)
                {

                    var id = queryId;
                    txtCodigo.Text = id;
                    Carrega(id);
                }
                else
                {
                    txtCodigo.Text = "0";




                    var hoje = DateTime.Now;
                    txtDataAgendamento.Text = hoje.ToShortDateString();
                    CarregaAgenda();
                }
            }
            catch
            {


            }


        }


    }

    private void Carrega(string id)
    {
        var dr = Agenda.Select(int.Parse(id));
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                txtCodigo.Text = dr.GetInt32(dr.GetOrdinal("id")).ToString();
                //txtCodPlano.Text = dr.GetString(dr.GetOrdinal("NUMEROPlano"));
                txtDataAgendamento.Text = dr.GetString(dr.GetOrdinal("DATAENTREGA")).ToString();
                // txtCodigoUnidade.Text = dr.GetInt32(dr.GetOrdinal("CODUNIDADE")).ToString();
                BuscaPaciente(dr.GetInt32(dr.GetOrdinal("CODUNIDADE")));

                //ddlTipoPlano.SelectedIndex = int.Parse(dr.GetString(dr.GetOrdinal("TIPOENTREGA")));

            }
        }
        dr.Dispose();
        dr.Close();
    }

    protected void ImgPPlano_Click(object sender, ImageClickEventArgs e)
    {
        Modal_Plano.Show();
        CarregaPlano();

    }

    protected void ImgPUnidade_Click(object sender, ImageClickEventArgs e)
    {
        Modal_Paciente.Show();
        CarregaPaciente();


    }

    protected void ImgPClinica_Click(object sender, ImageClickEventArgs e)
    {
        Modal_Clinica.Show();
        CarregaClinica();
    }


    public void NovoNumero()
    {
        btnAdiciona.Enabled = true;
        txtNumero.Text = "1";
        var data = txtDataAgendamento.Text;
        var dr = Agenda.NovoNumero(data);
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                if (!dr.IsDBNull(dr.GetOrdinal("ULTIMO")))
                {
                    var ultimo = dr.GetString(dr.GetOrdinal("ULTIMO"));
                    ultimo = (int.Parse(ultimo) + 1).ToString();
                    txtNumero.Text = ultimo;
                    
                    //if (int.Parse(ultimo) <= 3)
                    //{
                    //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), Guid.NewGuid().ToString(), "alert('Numero de Agendamentos diarios foi Esgotado');", true);
                    //    btnAdiciona.Enabled = false;
                    //}
                }
            }
        }
        dr.Dispose();
        dr.Close();
    }

    public void BuscaPlano()
    {

        var dr = Plano.Select(int.Parse(txtCodPlano.Text));
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                txtCodPlano.Text = dr.GetInt32(dr.GetOrdinal("CODPLANO")).ToString().Trim();
                txtNomePlano.Text = dr.GetString(dr.GetOrdinal("NOME")).Trim();

            }
        }
        dr.Dispose();
        dr.Close();

    }

    private void BuscaPaciente(int codigo)
    {
        var dr = Paciente.Select(codigo);

        if (dr.HasRows)
        {
            while (dr.Read())
            {
                txtCodPaciente.Text = dr.GetInt32(dr.GetOrdinal("CODPACIENTE")).ToString().Trim();
                txtNomePaciente.Text = dr.GetString(dr.GetOrdinal("NOME")).Trim();
            }
        }
        dr.Close();
    }

    private void BuscaClinica(string codigo)
    {

        codigo = txtCodClinica.Text;

        var dr = Clinica.Select(int.Parse(codigo));
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                txtCodClinica.Text = dr.GetInt32(dr.GetOrdinal("CODCLINICA")).ToString();
                txtNomeClinica.Text = dr.GetString(dr.GetOrdinal("NOME")).ToString();
            }
        }
        dr.Dispose();
        dr.Close();
    }


    private void Gravar(bool novo, int codigo, int sequencial)
    {

        var hoje = DateTime.Now;
        var dataagenda = txtDataAgendamento.Text.Trim();

        var numeroatendimento = sequencial;

        var codclinica = txtCodClinica.Text.Trim();
        var codpaciente = txtCodPaciente.Text.Trim();
        var codplano = txtCodPlano.Text.Trim();
        var situacaoagenda = ddlSituacaoagenda.SelectedValue;

        try
        {
            var m = new Agenda(codigo, dataagenda, int.Parse(codclinica), numeroatendimento, int.Parse(codpaciente), int.Parse(codplano), int.Parse(situacaoagenda));
            if (novo)
                m.Insert();
            else
                m.Update();

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), Guid.NewGuid().ToString(), "alert('Registro gravado com sucesso!');", true);
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), Guid.NewGuid().ToString(), "window.location = 'Default.aspx'", true);
        }
        catch (Exception erro)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), Guid.NewGuid().ToString(),
            "alert('Erro ao tentar solicitação! Erro: " + erro + ".');", true);
        }


    }

    protected void BtnGravarClick(object sender, EventArgs e)
    {


    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Session["dt"] = null;
        Grid_Agenda.DataSource = null; //Remover a datasource
        Grid_Agenda.Columns.Clear(); //Remover as colunas

        Response.Redirect("~/Forms/Default.aspx?");
    }

    public string VerPaciente()
    {
        int total = 0;
        int i;
        var Tem_no_Dia = "N";
        var NomePaciente = "";

        total = Grid_Agenda.Rows.Count;

        for (i = 0; i < total; i++)
        {
            if (Grid_Agenda.Rows[i].RowType == DataControlRowType.DataRow)
            {
                NomePaciente = Grid_Agenda.Rows[i].Cells[1].Text;
                if(NomePaciente.Trim() == txtNomePaciente.Text.Trim())
                {
                    Tem_no_Dia = "S";
                }
            }
        }
        return Tem_no_Dia;
    }

    protected void btnAdiciona_Click(object sender, ImageClickEventArgs e)
    {
        var Paciente_Tem_no_Dia = VerPaciente();

        if (int.Parse(txtNumero.Text) >= 21)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), Guid.NewGuid().ToString(), "alert('Numero de Agendamentos diarios foi Esgotado');", true);
            return;
        }
        if (Paciente_Tem_no_Dia == "S")
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), Guid.NewGuid().ToString(), "alert('Paciente já foi agendado para esse dia ');", true);
            return;
        }


    }

    private void CarregaAgenda()
    {
        var data = txtDataAgendamento.Text;
        Grid_Agenda.DataSource = Agenda.Select(data);
        Grid_Agenda.DataBind();
        NovoNumero();
    }

    protected void Grid_Agenda_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        var index = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "editar")
        {
            var id = Grid_Agenda.Rows[index].Cells[0].Text.Trim();

        }


    }

    //ESSE AQUI É DA PESQUISA SUSPENSA
    private void CarregaPlano()
    {

        GridView_Busca_Plano.DataSource = Plano.Select(txtPor.SelectedValue.Trim(), txtValor.Text.Trim());
        GridView_Busca_Plano.DataBind();
        txtPor.Focus();

    }

    private void CarregaPaciente()
    {

        GridView_Busca_Paciente.DataSource = Paciente.Select(txtPorU.SelectedValue.Trim(), txtValorU.Text.Trim());
        GridView_Busca_Paciente.DataBind();
        txtValorU.Focus();
    }

    private void CarregaClinica()
    {
        GridView_Busca_Clinica.DataSource = Clinica.Select(txtPorP.SelectedValue.Trim(), txtValorP.Text.Trim());
        GridView_Busca_Clinica.DataBind();
        txtValorP.Focus();

    }


    protected void btnBuscar_Click(object sender, EventArgs e)
    {

    }
    protected void btnBuscarU_Click(object sender, EventArgs e)
    {

    }
    protected void btnBuscarP_Click(object sender, EventArgs e)
    {

    }

    protected void txtPor_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void txtPorU_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void txtPorP_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void txtValor_TextChanged(object sender, EventArgs e)
    {
        CarregaPlano();
    }
    protected void txtValorU_TextChanged(object sender, EventArgs e)
    {
        CarregaPaciente();
    }
    protected void txtValorP_TextChanged(object sender, EventArgs e)
    {
        CarregaClinica();
    }

    protected void GridView_Busca_Plano_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView_Busca_Plano.PageIndex = e.NewPageIndex;
        CarregaPlano();
    }
    protected void GridView_Busca_Plano_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "Inserir")
        {

            var id = GridView_Busca_Plano.Rows[index].Cells[0].Text.Trim();

            if (id != "")
            {
                txtCodPlano.Text = id.ToString();
                BuscaPlano();
                Modal_Plano.Hide();
            }
        }

    }
    protected void GridView_Busca_Plano_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void GridView_Busca_Plano_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView_Busca_Paciente_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView_Busca_Paciente.PageIndex = e.NewPageIndex;
        CarregaPaciente();
    }
    protected void GridView_Busca_Paciente_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "Inserir")
        {

            var id = GridView_Busca_Paciente.Rows[index].Cells[0].Text.Trim();

            if (id != "")
            {
                txtCodPaciente.Text = id.ToString();
                BuscaPaciente(int.Parse(txtCodPaciente.Text));
                Modal_Paciente.Hide();
            }
        }
    }
    protected void GridView_Busca_Paciente_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void GridView_Busca_Paciente_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView_Busca_Clinica_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "Inserir")
        {

            var id = GridView_Busca_Clinica.Rows[index].Cells[0].Text.Trim();

            if (id != "")
            {
                txtCodClinica.Text = id.ToString();
                BuscaClinica(txtCodClinica.Text);
                Modal_Clinica.Hide();
            }
        }
    }
    protected void GridView_Busca_Clinica_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void GridView_Busca_Clinica_SelectedIndexChanged(object sender, EventArgs e)
    {

    }



    protected void txtDataAgendamento_TextChanged(object sender, EventArgs e)
    {
        CarregaAgenda();
    }
    protected void txtCodPaciente_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txtCodPlano_TextChanged(object sender, EventArgs e)
    {
        //BuscaPlano();
        //CarregaItemPlano();
    }
    protected void txtCodClinica_TextChanged(object sender, EventArgs e)
    {
        //if (txtCodClinica.Text != "")
        //{
        //    BuscaClinica(txtCodClinica.Text);
        //}
    }





}