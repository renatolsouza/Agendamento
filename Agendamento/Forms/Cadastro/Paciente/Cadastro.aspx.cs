using Agendamento.App_Code.Funcoes;
using Agendamento.App_Code.MySQL;
using System;
using System.Web.UI;

public partial class Forms_Cadastro_Paciente_Cadastro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            var queryId = Request.QueryString["ID"];
            if (queryId != null)
            {
                var id = Criptografia.Decifra(queryId);
                txtCodigo.Text = id;

                Carrega(id);
            }
            else
            {
                txtCodigo.Text = "0";

            }
        }
    }

    private void Carrega(string id)
    {
        var dr = Paciente.Select(int.Parse(id));
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                txtCodigo.Text = dr.GetInt32(dr.GetOrdinal("CODCLINICA")).ToString();
                txtNome.Text = dr.GetString(dr.GetOrdinal("NOME"));
                txtEndereco.Text = dr.GetString(dr.GetOrdinal("ENDERECO"));
                txtTelefone.Text = dr.GetString(dr.GetOrdinal("TELEFONE"));
                txtCpf.Text = dr.GetString(dr.GetOrdinal("Cpf"));

            }
        }
        dr.Dispose();
        dr.Close();
    }

    protected void BtnGravarClick(object sender, EventArgs e)
    {


        //if (txtCpf.Text.Trim() != "")
        //{
        //    if (Validacao.Cpf(txtCpf.Text) == false)
        //    {
        //        ScriptManager.RegisterStartupScript(Page, Page.GetType(), Guid.NewGuid().ToString(), "alert('Cpf não é válido');", true);
        //        txtCpf.Focus();
        //        return;
        //    }
        //}




        if (txtCodigo.Text.Trim() == "0")
        {

            Gravar(true, 0);

        }
        else
        {

            Gravar(false, int.Parse(txtCodigo.Text.Trim()));

        }

    }

    private void Gravar(bool novo, int codigo)
    {

        var hoje = DateTime.Now;

        var cod = codigo;
        var nome = txtNome.Text.Trim();
        var endereco = txtEndereco.Text.Trim();
        var telefone = txtTelefone.Text.Trim();
        var Cpf = txtCpf.Text.Trim();
        


        var respinclusao = Session["nome"];
        var datainclusao = hoje.ToString();
        var respalteracao = Session["nome"];
        var dataalteracao = hoje.ToString();


        try
        {
            var m = new Paciente(codigo, nome, endereco, telefone, Cpf);
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

    protected void BtnCancelarClick(object sender, EventArgs e)
    {
        Response.Redirect("~/Forms/Cadastro/Paciente/Default.aspx");
    }

}