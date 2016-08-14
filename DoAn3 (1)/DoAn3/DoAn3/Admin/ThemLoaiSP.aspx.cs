using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAn3.Utility;

namespace DoAn3.Admin
{
    public partial class ThemLoaiSP : System.Web.UI.Page
    {
        Connect kn = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Them_Click(object sender, EventArgs e)
        {
            if (CongCu.Kiemtra(txtTenLoaiSP.Text, "LOAISP", "TenLoaiSP") > 0)
                Response.Write("<Script>alert('Loại sản phẩm này đã tồn tại !')</Script>");
            else if (txtTenLoaiSP.Text == "") Response.Write("<script>alert('Bạn chưa nhập tên loại SP :(')</script>");
            else
            {
                string sql = string.Format("INSERT INTO LOAISP(Ma_NhomSP , TenLoaiSP) VALUES ({0},N'{1}')", DrNhomSP.SelectedValue, txtTenLoaiSP.Text);
                int kq = kn.Caulenh(sql);
                if (kq > 0)
                {
                    txtTenLoaiSP.Text = "";
                    Response.Redirect("QLLoaiSP.aspx");
                }
                else
                {
                    Response.Write("<Script>alert('Đã có lỗi thêm không thành công !')</Script>");
                }
            }
        }
    }
}