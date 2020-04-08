using Agendamento.App_Code.DAL;
using System;
using System.ComponentModel;
using System.Data;
using MySql.Data.MySqlClient;

namespace Agendamento.App_Code.MySQL
{

    [DataObject(true)]
    public class Paciente
    {

        private int Codpaciente { get; set; }
        private string Nome { get; set; }
        private string Endereco { get; set; }
        private string Telefone { get; set; }
        private string Cpf { get; set; }


        public Paciente(int codpaciente, string nome, string endereco, string telefone, string cpf)
        {

            Codpaciente = codpaciente;
            Nome = nome;
            Endereco = endereco;
            Telefone = telefone;
            Cpf = cpf;

        }

        public Paciente()
        {

        }


        public int Insert()
        {
            var db = new DBAcess();
            var Mysql = " INSERT INTO Paciente(";

            Mysql = Mysql + " NOME, ENDERECO, TELEFONE, CPF ";
            Mysql = Mysql + ")";

            Mysql = Mysql + " VALUES (";
            Mysql = Mysql + " @NOME, @ENDERECO, @TELEFONE, @CPF ";
            Mysql = Mysql + ");";

            // RETORNA O ULTIMO ITEM ADICIONADO 
            const string select = " SELECT MAX(CODPACIENTE) FROM Paciente ";

            db.CommandText = Mysql + select;

            db.AddParameter("@CODPACIENTE", Codpaciente);
            db.AddParameter("@NOME", Nome);
            db.AddParameter("@ENDERECO", Endereco);
            db.AddParameter("@TELEFONE", Telefone);
            db.AddParameter("@CPF", Cpf);


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
            var Mysql = " UPDATE Paciente ";

            Mysql = Mysql + "SET ";
            Mysql = Mysql + " CODPACIENTE = @CODPACIENTE, NOME = @NOME, ENDERECO = @ENDERECO, TELEFONE = @TELEFONE, CPF = @CPF ";

            Mysql = Mysql + " WHERE CODPACIENTE = @CODPACIENTE;";
            db.CommandText = Mysql;

            db.AddParameter("@CODPACIENTE", Codpaciente);
            db.AddParameter("@NOME", Nome);
            db.AddParameter("@ENDERECO", Endereco);
            db.AddParameter("@TELEFONE", Telefone);
            db.AddParameter("@CPF", Cpf);

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
            Mysql = Mysql + " FROM Paciente ";

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
        public static MySqlDataReader Select(int codpaciente)
        {
            var db = new DBAcess();
            const string select = " SELECT * ";
            const string from = " FROM Paciente ";
            const string where = " WHERE CODPACIENTE = @CODPACIENTE ";
            db.CommandText = select + from + where;
            db.AddParameter("@CODPACIENTE", codpaciente);

            var dr = (MySqlDataReader)db.ExecuteReader();
            return dr;
        }

    }
}