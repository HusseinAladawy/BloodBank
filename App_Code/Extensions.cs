using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Methods
/// </summary>
public static class Methods
{
	
    public static int ToInt32(this string no)
    {
        if (no=="")
        {
            no = "0";
        }
       

        return Convert.ToInt32(no);
    }
  
    public static int? ToNullInt32(this string no)
    {
        int? No = null;
        if (no != "")
        {
            No =no.ToInt32() ;
        }


        return  No;
    }
    public static DateTime ToDate(this string no)
    {

        return Convert.ToDateTime(no);
    }
    public static bool ToBool(this string no)
    {

        return Convert.ToBoolean(no);
    }
    public static char ToChar(this string no)
    {

        return Convert.ToChar(no);
    }
    //public static DataTable selectPlayerSports(string CountryID)
    //{

    //    DataTable dt = new DataTable();
    //    SqlDataReader dr;
    //    using (SqlConnection connection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DalwahConnectionString"].ConnectionString))
    //    {

    //        connection.Open();
    //        using (SqlCommand command = new SqlCommand())
    //        {
    //            command.CommandText = "City_Hotels";
    //            command.CommandType = CommandType.StoredProcedure;
    //            command.Connection = connection;
    //            command.Parameters.Add("@CountryID", SqlDbType.Int).Value = CountryID;
    //            dr = command.ExecuteReader();
    //            dt.Load(dr);
    //        }
    //        return dt;
    //    }
    //}
}