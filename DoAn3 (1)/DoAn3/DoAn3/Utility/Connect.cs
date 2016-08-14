using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace DoAn3.Utility
{
    public class Connect
    {
        static string s = WebConfigurationManager.ConnectionStrings["DOAN3ConnectionString"].ToString();
        public static SqlConnection TaoketnoiSQL()
        {
            return new SqlConnection(s);
        }
        public DataTable getDataTable(string sql)
        {
            SqlConnection con = TaoketnoiSQL();
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public int Caulenh(string sql)
        {
            int kq = 0;
            try
            {
                SqlConnection con = TaoketnoiSQL();
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                kq = cmd.ExecuteNonQuery();//trả về giá trị
                cmd.Dispose();
                cmd.Clone();
            }
            catch
            {
                kq = 0;
            }
            return kq;
        }
        public static object get(string sql) 
        {
            SqlConnection con = TaoketnoiSQL();
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            return cmd.ExecuteScalar();
        }
    }
}