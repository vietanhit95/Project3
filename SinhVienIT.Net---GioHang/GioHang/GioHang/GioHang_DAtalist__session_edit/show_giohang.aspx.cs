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


public partial class show_giohang : System.Web.UI.Page
{
    static DataTable tbGioHang = new DataTable();

    private void load_data()
    {
        tbGioHang = (DataTable)Session["GioHang"];
        GridView1.DataSource = tbGioHang;
        GridView1.DataBind();

        string strnumber = tbGioHang.Compute("Sum(Subtotal)", "").ToString();
        Label1.Text = "Tong Tien La:  " + strnumber;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
            load_data();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        load_data();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int intquantity = int.Parse((GridView1.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text);
        tbGioHang.Rows[e.RowIndex]["Quantity"] = intquantity;
        GridView1.EditIndex = -1;
        load_data();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //cua thu vien windows forms
        System.Windows.Forms.DialogResult kq = System.Windows.Forms.MessageBox.Show("Ban co muon xoa SP nay?", "Thong Bao", System.Windows.Forms.MessageBoxButtons.YesNo);

        if (kq == System.Windows.Forms.DialogResult.Yes)
        {
            tbGioHang.Rows.RemoveAt(e.RowIndex);
            GridView1.EditIndex = -1;
            load_data();
        }
    }
}
