using System;
using System.Data.SqlClient;

namespace JWieczorek.Libraries.WebServices.Database.Common
{
    public abstract class DataProviderBase
    {
        /// <summary>
        /// Thred locker.
        /// </summary>
        protected Object Locker { get; set; }

        /// <summary>
        /// Connection string.
        /// </summary>
        protected SqlConnection Connection { get; set; }


        /// <summary>
        /// Constructor.
        /// </summary>
        /// <param name="connectionString"></param>
        public DataProviderBase(String connectionString)
        {
            Locker = new Object();
            Connection = new SqlConnection(connectionString);
        }


        /// <summary>
        /// Close the database connection.
        /// </summary>
        protected void Close()
        {
            if (Connection != null && Connection.State == System.Data.ConnectionState.Open)
                Connection.Close();
        }


        /// <summary>
        /// Open the database connection.
        /// </summary>
        protected void Open()
        {
            if (Connection != null && Connection.State == System.Data.ConnectionState.Closed)
                Connection.Open();
        }
    }
}