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
    SqlConnection con = null;
    SqlDataAdapter da = null;
    DataTable dt = null;
 
    private void load_data()
    {
        con = new SqlConnection("server=.\\sqlexpress;database=northwind;integrated security = true");
        da = new SqlDataAdapter("select * from products", con);
        dt = new DataTable();
        da.Fill(dt);
        DataList1.DataSource = dt;
        DataList1.DataBind();


        ////hien thi gio hang cung trang nay luon 
        //if (Session["giohang"] != null) //&&(tbGiohang != null)
        //{
        //    tbGioHang = (DataTable)Session["Giohang"];
        //    GridView1.DataSource = tbGioHang;
        //    GridView1.DataBind();
        //    string strnumber = tbGioHang.Compute("sum(Subtotal)", "").ToString();
        //    Label4.Text = "Tong tien la " + strnumber;
        //}
    }
    static DataTable tbGioHang = new DataTable(); // ta chon thuoc tinh static de khi ta bo hang vao gio thi 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            tbGioHang.Rows.Clear();
            tbGioHang.Columns.Clear();
            tbGioHang.Columns.Add("ProductID",typeof(int));
            tbGioHang.Columns.Add("Productname",typeof(string));
            tbGioHang.Columns.Add("Unitprice",typeof(float));
            tbGioHang.Columns.Add("Quantity", typeof(int));

            tbGioHang.Columns.Add("SubTotal",typeof(double),"Quantity*Unitprice");
            load_data();
        }
            
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "BuyIt")
        {
            int intProductID = int.Parse(DataList1.DataKeys[e.Item.ItemIndex].ToString());
            string strProductName = ((Label)e.Item.FindControl("Label2")).Text;
            float flUnitPrice = float.Parse(((Label)e.Item.FindControl("Label3")).Text);
            int intQuantity = 1; // int.Parse(((Label)e.Item.FindControl("txtUnitsInStock")).Text)
            
            //add vao gio hang
            foreach (DataRow row in tbGioHang.Rows)
            {
                // kiem tra neu mat hang da chon co roi thi cong so luong len 1
                if ((int)row["ProductID"] == intProductID)
                {
                    row["Quantity"] = (int)row["Quantity"] + 1;
                    goto Giohang;
                }
            }
            tbGioHang.Rows.Add(intProductID, strProductName, flUnitPrice, intQuantity);
        Giohang:
            Session["Giohang"] = tbGioHang;// gan gio hang vao bien session de khi ta luot qua cac mat hang, thi gio hang cua ta van con
            // Session la bien object co the chua ba?ng
            load_data();
        }
    }
  

    protected void Button1_Click1(object sender, EventArgs e)
    {
         Response.Redirect("show_giohang.aspx");
    }
}
