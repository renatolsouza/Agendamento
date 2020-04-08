using System;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace Agendamento.App_Code.DAL
{

    public class DBAcess : IDisposable
    {
        readonly ConnectionStringSettings _conexao = ConfigurationManager.ConnectionStrings["MySqlLocal"];
        private MySqlCommand _cmd = new MySqlCommand();
        private string _strConnectionString = "";
        private bool _handleErrors;
        private string _strLastError = "";
        public CommandType Tipo = CommandType.Text;

        public bool CloseConnection()
        {

            try
            {
                var cnn = new MySqlConnection { ConnectionString = _strConnectionString };
                MySqlConnection.ClearPool(cnn);
            }
            catch
            {
                return false;
            }
            return true;
        }

        public DBAcess()
        {

            try
            {
                var objConnectionStringSettings = _conexao;
                _strConnectionString = objConnectionStringSettings.ConnectionString;
                var cnn = new MySqlConnection { ConnectionString = _strConnectionString };
                _cmd.Connection = cnn;
                _cmd.CommandType = Tipo;
                cnn.Close(); cnn.Dispose();
            }
            catch (Exception)
            {
                return;
            }


        }

        public DBAcess(CommandType tipo)
        {
            try
            {
                var objConnectionStringSettings = _conexao;
                _strConnectionString = objConnectionStringSettings.ConnectionString;
                var cnn = new MySqlConnection { ConnectionString = _strConnectionString };
                _cmd.Connection = cnn;
                _cmd.CommandType = tipo;
                cnn.Close(); cnn.Dispose();
            }
            catch (Exception)
            {
                return;
            }
        }

        public void TipoMuda(CommandType tipo)
        {
            _cmd.CommandType = tipo;
        }

        public IDataReader ExecuteReader()
        {
            IDataReader reader = null;
            try
            {
                Open();
                reader = _cmd.ExecuteReader(CommandBehavior.CloseConnection);
            }
            catch (Exception ex)
            {
                if (_handleErrors)
                    _strLastError = ex.Message;

                else
                    throw;

            }

            return reader;
        }

        public IDataReader ExecuteReader(string commandtext)
        {
            IDataReader reader = null;
            try
            {
                _cmd.CommandText = commandtext;
                reader = ExecuteReader();
            }
            catch (Exception ex)
            {
                if (_handleErrors)
                    _strLastError = ex.Message;
                else
                    throw;
            }

            return reader;
        }

        public object ExecuteScalar()
        {
            object obj = null;
            try
            {
                Open();
                obj = _cmd.ExecuteScalar();
                Close();
            }
            catch (Exception ex)
            {
                if (_handleErrors)
                    _strLastError = ex.Message;
                else
                    throw;
            }


            return obj;
        }

        public object ExecuteScalar(string commandtext)
        {
            object obj = null;
            try
            {
                _cmd.CommandText = commandtext;
                obj = ExecuteScalar();
            }
            catch (Exception ex)
            {
                if (_handleErrors)
                    _strLastError = ex.Message;
                else
                    throw;
            }


            return obj;
        }

        public int ExecuteNonQuery()
        {
            int i = -1;
            try
            {
                Open();
                i = _cmd.ExecuteNonQuery();
                Close();
            }
            catch (Exception ex)
            {
                if (_handleErrors)
                    _strLastError = ex.Message;
                else
                    throw;
            }


            return i;
        }

        public int ExecuteNonQuery(string commandtext)
        {
            int i = -1;
            try
            {
                _cmd.CommandText = commandtext;
                i = ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                if (_handleErrors)
                    _strLastError = ex.Message;
                else
                    throw;
            }

            return i;
        }

        public DataSet ExecuteDataSet()
        {
            MySqlDataAdapter da = null;
            DataSet ds = null;
            try
            {
                da = new MySqlDataAdapter();
                da.SelectCommand = (MySqlCommand)_cmd;
                ds = new DataSet();
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                if (_handleErrors)
                    _strLastError = ex.Message;
                else
                    throw;
            }


            return ds;
        }

        public DataSet ExecuteDataSet(string commandtext)
        {
            DataSet ds = null;
            try
            {
                _cmd.CommandText = commandtext;
                ds = ExecuteDataSet();
            }
            catch (Exception ex)
            {
                if (_handleErrors)
                    _strLastError = ex.Message;
                else
                    throw;
            }

            return ds;
        }

        public DataSet ExecuteDataSet(MySqlCommand commandtext)
        {
            DataSet ds = null;
            try
            {
                _cmd = commandtext;
                ds = ExecuteDataSet();
            }
            catch (Exception ex)
            {
                if (_handleErrors)
                    _strLastError = ex.Message;
                else
                    throw;
            }
            return ds;
        }

        public string CommandText
        {
            get
            {
                return _cmd.CommandText;
            }
            set
            {
                _cmd.CommandText = value;
                _cmd.Parameters.Clear();
            }
        }

        public IDataParameterCollection Parameters
        {
            get
            {
                return _cmd.Parameters;
            }
        }

        public void AddParameter(string paramname, object paramvalue)
        {
            try
            {
                var param = new MySqlParameter(paramname, paramvalue);
                _cmd.Parameters.Add(param);
            }
            catch
            {
                throw;
            }
        }

        public void AddParameter(IDataParameter param)
        {
            _cmd.Parameters.Add(param);
        }


        public string ConnectionString
        {
            get
            {
                return _strConnectionString;
            }
            set
            {
                _strConnectionString = value;
            }
        }

        private void Open()
        {
            _cmd.Connection.Open();
        }

        private void Close()
        {
            _cmd.Connection.Close();
        }

        public bool HandleExceptions
        {
            get
            {
                return _handleErrors;
            }
            set
            {
                _handleErrors = value;
            }
        }

        public string LastError
        {
            get
            {
                return _strLastError;
            }
        }

        public void Dispose()
        {
            _cmd.Dispose();

            CloseConnection();
        }




    }

}
