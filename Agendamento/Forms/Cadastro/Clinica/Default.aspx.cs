using Agendamento.App_Code.Funcoes;
using Agendamento.App_Code.MySQL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Forms_Cadasreo_Clinica_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Carrega();
    }

    private void Carrega()
    {
        Grid_Clinica.DataSource = Clinica.Select(txtPor.SelectedValue.Trim(), txtBuscar.Text.Trim());
        Grid_Clinica.DataBind();
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

    protected void GridClinicaRowCommand(object sender, GridViewCommandEventArgs e)
    {
        var index = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "editar")
        {
            var id = Grid_Clinica.Rows[index].Cells[0].Text.Trim();
            Response.Redirect("~/Forms/Cadastro/Clinica/Cadastro.aspx?Id=" + Criptografia.Cifra(id));
        }
    }

    protected void GridClinicaPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_Clinica.PageIndex = e.NewPageIndex;
        Carrega();
    }
}
