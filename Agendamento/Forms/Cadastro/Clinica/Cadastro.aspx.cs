﻿using Agendamento.App_Code.Funcoes;
using Agendamento.App_Code.MySQL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Forms_Cadastro_Clinica_Cadastro : System.Web.UI.Page
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
        var dr = Clinica.Select(int.Parse(id));
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                txtCodigo.Text = dr.GetInt32(dr.GetOrdinal("CODCLINICA")).ToString();
                txtNomeClinica.Text = dr.GetString(dr.GetOrdinal("NOME"));
                txtEndereco.Text = dr.GetString(dr.GetOrdinal("ENDERECO"));
                txtCnpj.Text = dr.GetString(dr.GetOrdinal("CNPJ"));
                txtTelefone.Text = dr.GetString(dr.GetOrdinal("TELEFONE"));

            }
        }
        dr.Dispose();
        dr.Close();
    }

    protected void BtnGravarClick(object sender, EventArgs e)
    {


        //if (txtCnpj.Text.Trim() != "")
        //{
        //    if (Validacao.Cnpj(txtCnpj.Text) == false)
        //    {
        //        ScriptManager.RegisterStartupScript(Page, Page.GetType(), Guid.NewGuid().ToString(), "alert('CNPJ não é válido');", true);
        //        txtCnpj.Focus();
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

        var codclinica = codigo;
        var nomeclinica = txtNomeClinica.Text.Trim();
        var endereco = txtEndereco.Text.Trim();
        var cnpj = txtCnpj.Text.Trim();
        var telefone = txtTelefone.Text.Trim();
       

        var respinclusao = Session["nome"];
        var datainclusao = hoje.ToString();
        var respalteracao = Session["nome"];
        var dataalteracao = hoje.ToString();
       

        try
        {
            var m = new Clinica(codigo, nomeclinica, endereco, cnpj, telefone);
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
        Response.Redirect("~/Forms/Cadastro/clinica/Default.aspx");
    }
   
}