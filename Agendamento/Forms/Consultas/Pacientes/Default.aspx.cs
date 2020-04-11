using Agendamento.App_Code.Funcoes;
using Agendamento.App_Code.MySQL;
using System;
using System.Web.UI.WebControls;

public partial class Forms_Consultas_Pacientes_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Carrega();
    }

    private void Carrega()
    {
        var datainicial = txtDataInicial.Text;
        var datafinal = txtDataFinal.Text;
        var situacaoagenda = ddlSituacaoagenda.SelectedValue;
        // if (situacaoagenda == "0") { situacaoagenda = "1"; }

        Grid_Paciente.DataSource = Agenda.AgendaPacientes("", datainicial, datafinal, int.Parse(situacaoagenda));
        Grid_Paciente.DataBind();

    }

    protected void TxtBuscarTextChanged(object sender, EventArgs e)
    {
       
    }

    protected void BtnBuscarClick(object sender, EventArgs e)
    {
        Carrega();
    }

    protected void GridPacienteRowCommand(object sender, GridViewCommandEventArgs e)
    {
        var index = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "editar")
        {
            var id = Grid_Paciente.Rows[index].Cells[0].Text.Trim();
            Response.Redirect("~/Forms/Cadastro/Paciente/Cadastro.aspx?Id=" + Criptografia.Cifra(id));
        }
    }

    protected void GridPacientePageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_Paciente.PageIndex = e.NewPageIndex;
        Carrega();
    }

    protected void txtDataInicial_TextChanged(object sender, EventArgs e)
    {

    }

    protected void txtDataFinal_TextChanged(object sender, EventArgs e)
    {

    }
}