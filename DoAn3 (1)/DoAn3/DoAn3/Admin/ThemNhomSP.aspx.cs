using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAn3.Utility;

namespace DoAn3.Admin
{
    public partial class ThemNhomSP : System.Web.UI.Page
    {
        Connect kn = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            float n2 = 0;
            if (Utility.CongCu.Kiemtra(txtTenNhom.Text, "NHOMSP", "TenNhom") > 0 || Utility.CongCu.Kiemtra(txtMaNhom.Text, "NHOMSP", "Ma_NhomSP") > 0)
                Response.Write("<script>alert('Nhóm SP này đã tồn tại :(')</script>");
            else if (txtMaNhom.Text == "")
                Response.Write("<script>alert('Mã không được trống :(')</script>");
            else if (txtTenNhom.Text == "")
                Response.Write("<script>alert('Tên không được trống :(')</script>");
            //else if (float.TryParse(txtMaNhom.Text, out n2) == false)
            //    Response.Write("<script>alert('Mã nhóm sản phẩm là số :(')</script>");
            else
            {
                string sql = string.Format("insert into NHOMSP(Ma_NhomSP, TenNhom) values({0},N'{1}')", txtMaNhom.Text, txtTenNhom.Text);
                int kq = kn.Caulenh(sql);
                if (kq > 0)
                {
                    Response.Redirect("QLNhomSP.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Thêm thất bại :(')</script>");
                }
            }
        }
    }
}