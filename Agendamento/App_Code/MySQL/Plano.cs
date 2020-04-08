using Agendamento.App_Code.DAL;
using System;
using System.ComponentModel;
using System.Data;
using MySql.Data.MySqlClient;

namespace Agendamento.App_Code.MySQL
{

    [DataObject(true)]
    public class Plano
    {

        private int Codplano { get; set; }
        private string Nome { get; set; }
        private string Descricao { get; set; }
        private string Numeroplano { get; set; }
       

        public Plano(int codplano, string nome, string descricao, string numeroplano)
        {

            Codplano = codplano;
            Nome = nome;
            Descricao = descricao;
            Numeroplano = numeroplano;

        }

        public Plano()
        {

        }


        public int Insert()
        {
            var db = new DBAcess();
            var Mysql = " INSERT INTO plano(";

            Mysql = Mysql + " NOME, DESCRICAO, NUMEROPLANO ";
            Mysql = Mysql + ")";

            Mysql = Mysql + " VALUES (";
            Mysql = Mysql + " @NOME, @DESCRICAO, @NUMEROPLANO ";
            Mysql = Mysql + ");";

            // RETORNA O ULTIMO ITEM ADICIONADO 
            const string select = " SELECT MAX(CODPLANO) FROM Plano ";

            db.CommandText = Mysql + select;

            db.AddParameter("@CODPLANO", Codplano);
            db.AddParameter("@NOME", Nome);
            db.AddParameter("@DESCRICAO", Descricao);
            db.AddParameter("@NUMEROPLANO", Numeroplano);
           

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
            var Mysql = " UPDATE plano ";

            Mysql = Mysql + "SET ";
            Mysql = Mysql + " CODPLANO = @CODPLANO, NOME = @NOME, DESCRICAO = @DESCRICAO, NUMEROPLANO = @NUMEROPLANO ";

            Mysql = Mysql + " WHERE CODPLANO = @CODPLANO;";
            db.CommandText = Mysql;

            db.AddParameter("@CODPLANO", Codplano);
            db.AddParameter("@NOME", Nome);
            db.AddParameter("@DESCRICAO", Descricao);
            db.AddParameter("@NUMEROPLANO", Numeroplano);

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
            Mysql = Mysql + " FROM plano ";

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
        public static MySqlDataReader Select(int codplano)
        {
            var db = new DBAcess();
            const string select = " SELECT * ";
            const string from = " FROM plano ";
            const string where = " WHERE CODPLANO = @CODPLANO ";
            db.CommandText = select + from + where;
            db.AddParameter("@CODPLANO", codplano);

            var dr = (MySqlDataReader)db.ExecuteReader();
            return dr;
        }

    }
}