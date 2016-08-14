using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class show_products : System.Web.UI.Page
{
    String strcon = "server = .\\sqlexpress;database = northwind ;integrated security = true";
    private void load_data()
    {
        SqlConnection con = new SqlConnection(strcon);
        SqlDataAdapter da = new SqlDataAdapter("select * from products",con);
        DataTable dt = new DataTable;
        da.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
     }
    static DataTable tbgiohang = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            tbGioHang.Rows.Clear();
            tbGioHang.Columns.Clear();
            tbGioHang.Columns.Add("ProductID", typeof(int));
            tbGioHang.Columns.Add("Productname", typeof(string));
            tbGioHang.Columns.Add("Unitprice", typeof(float));
            tbGioHang.Columns.Add("Quantity", typeof(int));

            tbGioHang.Columns.Add("SubTotal", typeof(double), "Quantity*Unitprice");
            Session ["count"] = 0; //khai bao bien session dem mat hang mua
           
            load_data();
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("show_giohang.aspx");
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "buyit")
        {
            int productid=int.Parse(e.CommandArgument.ToString());
            string productname = "";
            float unitprice = 0;

            SqlConnection con = new SqlConnection(strcon);
            SqlCommand cm = new SqlCommand("select * from products where productid = ",con);
            SqlDataReader dr = null;
            dr = cm.EndExecuteNonQuery();
        }
    }
}
