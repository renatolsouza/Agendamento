using Agendamento.App_Code.DAL;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;


namespace Agendamento.App_Code.MySQL
{

    [DataObject(true)]
    public class Agenda
    {

        private int Codagenda { get; set; }
        private string Data { get; set; }
        private int Codclinica { get; set; }
        private int Numeroatendimento { get; set; }
        private int Codpaciente { get; set; }
        private int Codplano { get; set; }
        private int Situacaoagenda { get; set; }

        public Agenda(int codagenda, string data, int codclinica, int numeroatendimento, int codpaciente, int codplano, int situacaoagenda)
        {
            Codagenda = codagenda;
            Data = data;
            Codclinica = codclinica;
            Numeroatendimento = numeroatendimento;
            Codpaciente = codpaciente;
            Codplano = codplano;
            Situacaoagenda = situacaoagenda;

        }

        public Agenda()
        {

        }



        public int Insert()
        {
            var db = new DBAcess();
            var Mysql = " INSERT INTO agenda(";

            Mysql = Mysql + " DATA, CODCLINICA, NUMEROATENDIMENTO, CODPACIENTE, CODPLANO, SITUACAOAGENDA ";
            Mysql = Mysql + ")";

            Mysql = Mysql + " VALUES (";
            Mysql = Mysql + " @DATA, @CODCLINICA, @NUMEROATENDIMENTO, @CODPACIENTE, @CODPLANO, @SITUACAOAGENDA ";
            Mysql = Mysql + ");";

            // RETORNA O ULTIMO ITEM ADICIONADO 
            const string select = " SELECT MAX(CODAGENDA) FROM agenda ";

            db.CommandText = Mysql + select;

            db.AddParameter("@CODAGENDA", Codagenda);
            db.AddParameter("@DATA", Convert.ToDateTime(Data));
            db.AddParameter("@CODCLINICA", Codclinica);
            db.AddParameter("@NUMEROATENDIMENTO", Numeroatendimento);
            db.AddParameter("@CODPACIENTE", Codpaciente);
            db.AddParameter("@CODPLANO", Codplano);
            db.AddParameter("@SITUACAOAGENDA", Situacaoagenda);


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
            var Mysql = " UPDATE agenda ";

            Mysql = Mysql + "SET ";
            Mysql = Mysql + " DATA = @DATA, CODCLINICA = @CODCLINICA, NUMEROATENDIMENTO = @NUMEROATENDIMENTO, ";
            Mysql = Mysql + " CODPACIENTE = @CODPACIENTE, CODPLANO = @CODPLANO, SITUACAOAGENDA = @SITUACAOAGENDA  ";

            Mysql = Mysql + " WHERE CODAGENDA = @CODAGENDA;";
            db.CommandText = Mysql;

            db.AddParameter("@CODAGENDA", Codagenda);
            db.AddParameter("@DATA", Convert.ToDateTime(Data));
            db.AddParameter("@CODCLINICA", Codclinica);
            db.AddParameter("@NUMEROATENDIMENTO", Numeroatendimento);
            db.AddParameter("@CODPACIENTE", Codpaciente);
            db.AddParameter("@CODPLANO", Codplano);
            db.AddParameter("@SITUACAOAGENDA", Situacaoagenda);


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
            Mysql = Mysql + " FROM agenda ";

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
        public static DataSet Select(string data)
        {
            var db = new DBAcess();
            var Mysql = " SELECT A.CODAGENDA, DATE_FORMAT(A.DATAAGENDA, '%d/%m/%Y') AS DATAAGENDA, A.NUMEROATENDIMENTO, A.CODPACIENTE, P.NOME AS NOMEPACIENTE, ";
            Mysql = Mysql + " A.CODCLINICA, C.NOME AS NOMECLINICA, A.CODPLANO, PL.NOME AS NOMEPLANO, ";
            Mysql = Mysql + " A.SITUACAOAGENDA, S.NOME AS NOMESITUACAO ";
            Mysql = Mysql + " FROM agenda A ";
            Mysql = Mysql + " INNER JOIN paciente P ON P.CODPACIENTE = A.CODPACIENTE ";
            Mysql = Mysql + " INNER JOIN clinica C ON C.CODCLINICA = A.CODCLINICA ";
            Mysql = Mysql + " INNER JOIN plano PL ON PL.CODPLANO = A.CODPLANO ";
            Mysql = Mysql + " INNER JOIN situacao S ON S.CODSITUACAO = A.SITUACAOAGENDA   ";

            Mysql = Mysql + " WHERE A.DATAAGENDA = @DATAAGENDA ";

            db.CommandText = Mysql;
            db.AddParameter("@DATAAGENDA", Convert.ToDateTime(data));
            var ds = db.ExecuteDataSet();
            return ds;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static MySqlDataReader Select(int codagenda)
        {
            var db = new DBAcess();
            const string select = " SELECT * ";
            const string from = " FROM agenda ";
            const string where = " WHERE CODAGENDA = @CODAGENDA ";
            db.CommandText = select + from + where;
            db.AddParameter("@CODAGENDA", codagenda);

            var dr = (MySqlDataReader)db.ExecuteReader();
            return dr;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static MySqlDataReader NovoNumero(string data)
        {
            var db = new DBAcess();
            var Mysql = " SELECT MAX(A.NUMEROATENDIMENTO) AS ULTIMO ";
            Mysql = Mysql + " FROM agenda A ";
           
            Mysql = Mysql + " WHERE A.DATAAGENDA = @DATAAGENDA ";

            db.CommandText = Mysql;
            db.AddParameter("@DATAAGENDA", Convert.ToDateTime(data));

            var dr = (MySqlDataReader)db.ExecuteReader();
            return dr;
        }

    }
}