using Agendamento.App_Code.Funcoes;
using Agendamento.App_Code.MySQL;
using System;
using System.Web.UI.WebControls;

public partial class Forms_Cadastro_Plano_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Carrega();
    }

    private void Carrega()
    {
        Grid_Plano.DataSource = Plano.Select(txtPor.SelectedValue.Trim(), txtBuscar.Text.Trim());
        Grid_Plano.DataBind();
        txtBuscar.Focus();
    }

    protected void TxtBuscarTextChanged(object sender, EventArgs e)
    {
        Carrega();
    }

    protected void BtnBuscarClick(object sender, EventArgs e)
    {
        Carrega();
    }

    protected void GridPlanoRowCommand(object sender, GridViewCommandEventArgs e)
    {
        var index = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "editar")
        {
            var id = Grid_Plano.Rows[index].Cells[0].Text.Trim();
            Response.Redirect("~/Forms/Cadastro/Plano/Cadastro.aspx?Id=" + Criptografia.Cifra(id));
        }
    }

    protected void GridPlanoPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_Plano.PageIndex = e.NewPageIndex;
        Carrega();
    }
}