using Agendamento.App_Code.DAL;
using System;
using System.ComponentModel;
using System.Data;
using MySql.Data.MySqlClient;

namespace Agendamento.App_Code.MySQL
{

    [DataObject(true)]
    public class Clinica
    {

        private int Codclinica { get; set; }
        private string Nome { get; set; }
        private string Endereco { get; set; }
        private string Cnpj { get; set; }
        private string Telefone { get; set; }

        public Clinica(int codclinica, string nome, string endereco, string cnpj, string telefone)
        {

            Codclinica = codclinica;
            Nome = nome;
            Endereco = endereco;
            Cnpj = cnpj;
            Telefone = telefone;


        }

        public Clinica()
        {

        }


        public int Insert()
        {
            var db = new DBAcess();
            var Mysql = " INSERT INTO clinica(";

            Mysql = Mysql + " NOME, ENDERECO, CNPJ, TELEFONE ";
            Mysql = Mysql + ")";

            Mysql = Mysql + " VALUES (";
            Mysql = Mysql + " @NOME, @ENDERECO, @CNPJ, @TELEFONE ";
            Mysql = Mysql + ");";

            // RETORNA O ULTIMO ITEM ADICIONADO 
            const string select = " SELECT MAX(CODCLINICA) FROM clinica ";

            db.CommandText = Mysql + select;

            db.AddParameter("@CODCLINICA", Codclinica);
            db.AddParameter("@NOME", Nome);
            db.AddParameter("@ENDERECO", Endereco);
            db.AddParameter("@CNPJ", Cnpj);
            db.AddParameter("@TELEFONE", Telefone);

            try
            {
                return Convert.ToInt32(db.ExecuteScalar());
            }
            finally
            {
                db.Dispose();
            }
        }

        public bool Update()
        {
            var db = new DBAcess();
            var Mysql = " UPDATE clinica ";

            Mysql = Mysql + "SET ";
            Mysql = Mysql + " CODCLINICA = @CODCLINICA, NOME = @NOME, ENDERECO = @ENDERECO, CNPJ = @CNPJ, TELEFONE = @TELEFONE  ";

            Mysql = Mysql + " WHERE CODCLINICA = @CODCLINICA;";
            db.CommandText = Mysql;

            db.AddParameter("@CODCLINICA", Codclinica);
            db.AddParameter("@NOME", Nome);
            db.AddParameter("@ENDERECO", Endereco);
            db.AddParameter("@CNPJ", Cnpj);
            db.AddParameter("@TELEFONE", Telefone);

            try
            {
                db.ExecuteNonQuery();
                return true;
            }
            finally
            {
                db.Dispose();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static DataSet Select(string por, string valor)
        {
            var db = new DBAcess();
            var Mysql = " SELECT * ";
            Mysql = Mysql + " FROM clinica ";

            switch (por)
            {
                case "nome":
                    {
                        Mysql = Mysql + " WHERE NOME LIKE CONCAT(@valor)";
                        valor = valor + "%";
                    }
                    break;



            }
            Mysql = Mysql + " ORDER BY NOME ASC; ";
            db.CommandText = Mysql;

            db.AddParameter("@valor", valor);
            var ds = db.ExecuteDataSet();
            return ds;
        }


        [DataObjectMethod(DataObjectMethodType.Select)]
        public static MySqlDataReader Select(int codclinica)
        {
            var db = new DBAcess();
            const string select = " SELECT * ";
            const string from = " FROM Clinica ";
            const string where = " WHERE CODCLINICA = @CODCLINICA ";
            db.CommandText = select + from + where;
            db.AddParameter("@CODCLINICA", codclinica);

            var dr = (MySqlDataReader)db.ExecuteReader();
            return dr;
        }

    }
}