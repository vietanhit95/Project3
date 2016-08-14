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

public partial class show_giohang : System.Web.UI.Page
{
    //khai bao datatable
    static DataTable tbGioHang = new DataTable();
    private void data_load()
    {
        tbGioHang = (DataTable)Session["Giohang"];
        GridView1.DataSource = tbGioHang;
        GridView1.DataBind();
        // sau khi edit xoa thi gan nguoc tro lai session
        Session["Giohang"] = tbGioHang;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if(IsPostBack ==false)
            if (Session["Giohang"] != null)
            {
                tbGioHang = (DataTable)Session["Giohang"];
                GridView1.DataSource = tbGioHang;
                GridView1.DataBind();
                string strnumber = tbGioHang.Compute("sum(Subtotal)", "").ToString();
                Label1.Text = "Tong tien la : " + strnumber;

            }
    }


    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        data_load();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int intquantity = int.Parse((GridView1.Rows[e.RowIndex].Cells[3].Controls[0] as TextBox).Text);
        tbGioHang.Rows[e.RowIndex]["Quantity"] = intquantity;
        GridView1.EditIndex = -1;
        data_load();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        System.Windows.Forms.DialogResult kq =
        tbGioHang.Rows.RemoveAt(e.RowIndex);
        GridView1.EditIndex = -1;
        data_load();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        data_load();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
