using Agendamento.App_Code.MySQL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Forms_Consultas_Vagas_Default : System.Web.UI.Page
{
    int vagas;

    protected void Page_Load(object sender, EventArgs e)
    {

       
        if (!IsPostBack)
        {
            CarregaClinica();
        }
    }


    private void CarregaClinica()
    {

        ddlclinica.DataSource = Clinica.Select("","");
        ddlclinica.DataBind();
        ddlclinica.Items.Insert(0, "-- SELECIONE --");

    }

    private void BuscaVagas()
    {
        var qtatendimento = 0;
        
        var clinica = ddlclinica.SelectedValue.Trim();
        if(clinica == "") { return; }

        var data = txtDataInicial.Text;
        var ds = Agenda.BuscaVaga(data, int.Parse(clinica));
        foreach (DataRow rows in ds.Tables[0].Rows)
        {
            qtatendimento = Convert.ToInt32(ds.Tables[0].Rows[0]["QTATENDIMENTOS"]);
        }
        ds.Clear();
        ds.Dispose();

        vagas = 20 - qtatendimento;
        txtvagas.Text = vagas.ToString();
        
    }

    protected void BtnBuscarClick(object sender, EventArgs e)
    {
        BuscaVagas();
       
    }

    
}