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

public partial class product_show_images : System.Web.UI.Page
{
    SqlConnection con;
    SqlDataAdapter da;
    DataTable tb;
    private void load_data()
    {
        con = new SqlConnection("server=.; database=northwind; integrated security=true;");
        da = new SqlDataAdapter("select * from products", con);
        tb = new DataTable();
        da.Fill(tb);
        DataList1.DataSource = tb;
        DataList1.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
            load_data();
    }
}
