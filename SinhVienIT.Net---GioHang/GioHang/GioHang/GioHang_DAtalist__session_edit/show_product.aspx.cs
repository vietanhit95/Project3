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

public partial class show_product : System.Web.UI.Page
{
    SqlConnection con;
    SqlDataAdapter da;
    DataTable tb;
    private void load_data()
    {
        con = new SqlConnection("server=.; database=northwind; integrated security=true;");
        da = new SqlDataAdapter("select * from products",con);
        tb = new DataTable();
        da.Fill(tb);
        DataList1.DataSource = tb;
        DataList1.DataBind();
    }

    static DataTable tbGioHang = new DataTable();//khoi tao table chua gio hang


    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            tbGioHang.Rows.Clear();
            tbGioHang.Columns.Clear();
            tbGioHang.Columns.Add("ProductID",typeof(int));
            tbGioHang.Columns.Add("ProductName",typeof(string));
            tbGioHang.Columns.Add("UnitPrice", typeof(float));
            tbGioHang.Columns.Add("Quantity",typeof(int));
            tbGioHang.Columns.Add("SubTotal",typeof(double),"Quantity * UnitPrice");
            load_data();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("show_giohang.aspx");
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "buyit")
        {
            int intProductID = int.Parse(DataList1.DataKeys[e.Item.ItemIndex].ToString());
            string strProductName = ((Label)e.Item.FindControl("Label2")).Text;
            float flUnitPrice = float.Parse(((Label)e.Item.FindControl("Label3")).Text);
            int intQuantity = 1;
            //Add vao gio hang

            foreach (DataRow row in tbGioHang.Rows)
            {//Kiem tr neu mat hang da co roi thi tang so luong len 1
                if ((int)row["ProductID"] == intProductID)
                {
                    row["Quantity"] = (int)row["Quantity"] + 1;
                    goto GioHang;
                }
            }

            tbGioHang.Rows.Add(intProductID, strProductName, flUnitPrice, intQuantity);
        GioHang:
            Session["GioHang"] = tbGioHang;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
}
