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

            Mysql = Mysql + " DATAAGENDA, CODCLINICA, NUMEROATENDIMENTO, CODPACIENTE, CODPLANO, SITUACAOAGENDA ";
            Mysql = Mysql + ")";

            Mysql = Mysql + " VALUES (";
            Mysql = Mysql + " @DATAAGENDA, @CODCLINICA, @NUMEROATENDIMENTO, @CODPACIENTE, @CODPLANO, @SITUACAOAGENDA ";
            Mysql = Mysql + ");";

            // RETORNA O ULTIMO ITEM ADICIONADO 
            const string select = " SELECT MAX(CODAGENDA) FROM agenda ";

            db.CommandText = Mysql + select;

            db.AddParameter("@CODAGENDA", Codagenda);
            db.AddParameter("@DATAAGENDA", Convert.ToDateTime(Data));
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
            Mysql = Mysql + " DATAAGENDA = @DATAAGENDA, CODCLINICA = @CODCLINICA, NUMEROATENDIMENTO = @NUMEROATENDIMENTO, ";
            Mysql = Mysql + " CODPACIENTE = @CODPACIENTE, CODPLANO = @CODPLANO, SITUACAOAGENDA = @SITUACAOAGENDA  ";

            Mysql = Mysql + " WHERE CODAGENDA = @CODAGENDA;";
            db.CommandText = Mysql;

            db.AddParameter("@CODAGENDA", Codagenda);
            db.AddParameter("@DATAAGENDA", Convert.ToDateTime(Data));
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
        public static DataSet AgendaPacientes(string por, string dtinicial, string dtfinal, int situacao)
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

            Mysql = Mysql + " WHERE A.DATAAGENDA BETWEEN @DATAINICIAL AND @DATAFINAL ";
            if (situacao != 0) { Mysql = Mysql + " AND A.SITUACAOAGENDA = @SITUACAOAGENDA "; }

            Mysql = Mysql + " ORDER BY A.DATAAGENDA, A.CODCLINICA, A.NUMEROATENDIMENTO; ";

            db.CommandText = Mysql;

            db.AddParameter("@DATAINICIAL", Convert.ToDateTime(dtinicial));
            db.AddParameter("@DATAFINAL", Convert.ToDateTime(dtfinal));
            db.AddParameter("@SITUACAOAGENDA", situacao);
            var ds = db.ExecuteDataSet();
            return ds;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static DataSet BuscaVaga(string data, int clinica)
        {
            var db = new DBAcess();
            var Mysql = "SELECT COUNT(A.NUMEROATENDIMENTO) AS QTATENDIMENTOS ";
            Mysql = Mysql + " FROM agenda A ";
            Mysql = Mysql + " WHERE A.DATAAGENDA = @DATAAGENDA ";
            if (clinica != 0) { Mysql = Mysql + " AND A.CODCLINICA = @CODCLINICA "; }

            db.CommandText = Mysql;

            db.AddParameter("@DATAAGENDA", Convert.ToDateTime(data));
            db.AddParameter("@CODCLINICA", clinica);

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
            Mysql = Mysql + " ORDER BY A.CODAGENDA; ";

            db.CommandText = Mysql;
            db.AddParameter("@DATAAGENDA", Convert.ToDateTime(data));
            var ds = db.ExecuteDataSet();
            return ds;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static DataSet Select(string data, int codclinica)
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
            Mysql = Mysql + " AND A.CODCLINICA = @CODCLINICA ";

            Mysql = Mysql + " ORDER BY A.CODAGENDA; ";

            db.CommandText = Mysql;
            db.AddParameter("@DATAAGENDA", Convert.ToDateTime(data));
            db.AddParameter("@CODCLINICA", codclinica);
            var ds = db.ExecuteDataSet();
            return ds;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static MySqlDataReader Select(int numero, string data)
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
            Mysql = Mysql + " AND A.NUMEROATENDIMENTO = @NUMEROATENDIMENTO ";


            Mysql = Mysql + " ORDER BY A.CODAGENDA; ";

            db.CommandText = Mysql;
            db.AddParameter("@NUMEROATENDIMENTO", numero);
            db.AddParameter("@DATAAGENDA", Convert.ToDateTime(data));

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

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static MySqlDataReader NovoNumero(string data, int codclinica)
        {
            var db = new DBAcess();
            var Mysql = " SELECT MAX(A.NUMEROATENDIMENTO) AS ULTIMO ";
            Mysql = Mysql + " FROM agenda A ";

            Mysql = Mysql + " WHERE A.DATAAGENDA = @DATAAGENDA ";
            Mysql = Mysql + " AND A.CODCLINICA = @CODCLINICA ";

            db.CommandText = Mysql;
            db.AddParameter("@DATAAGENDA", Convert.ToDateTime(data));
            db.AddParameter("@CODCLINICA", codclinica);

            var dr = (MySqlDataReader)db.ExecuteReader();
            return dr;
        }

        public bool TemPaciente(string data, int codpaciente)
        {
            bool status = false;
            int retorno;

            var db = new DBAcess();
            var Mysql = " SELECT A.CODAGENDA ";
            Mysql = Mysql + " FROM agenda A ";

            Mysql = Mysql + " WHERE A.DATAAGENDA = @DATAAGENDA ";
          
            Mysql = Mysql + " AND A.CODPACIENTE = @CODPACIENTE ";

            db.CommandText = Mysql;
            db.AddParameter("@DATAAGENDA", Convert.ToDateTime(data));
           
            db.AddParameter("@CODPACIENTE", codpaciente);


            retorno = Convert.ToInt32(db.ExecuteScalar());
            if (retorno > 0)
                status = true;
            return status;


        }


    }
}