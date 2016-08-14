using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAn3.Utility;

namespace DoAn3
{
    public partial class ThemTV : System.Web.UI.Page
    {
        Connect kn = new Connect();
        public void LoadDrl()
        {
            for (int i = 0; i <= 31; i++)
                drNgay.Items.Add(i.ToString());
            for (int i = 1; i <= 12; i++)
                drThang.Items.Add(i.ToString());
            for (int i = 2015; i >= 1990; i--)
                drNam.Items.Add(i.ToString());
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadDrl();
        }

        protected void Them_Click(object sender, EventArgs e)
        {
            float n = 0;
            if (CongCu.Kiemtra(txtTenTK.Text, "THANHVIEN", "UserName") > 0)
                Response.Write("<Script>alert('Tài khoản này đã tồn tại rồi !')</Script>");
            else if (txtHoTen.Text == "") Response.Write("<script>alert('Họ tên không được trống :)')</script>");
            else if (txtTenTK.Text == "") Response.Write("<script>alert('Tài khoản không được trống :)')</script>");
            else if (txtMatKhau.Text == "") Response.Write("<script>alert('Mật khẩu không được trống :)')</script>");
            else if (txtSDT.Text == "") Response.Write("<script>alert('SĐT không được trống :)')</script>");
            else if (txtEmail.Text == "") Response.Write("<script>alert('Email không được trống :)')</script>");
            else if (txtDiaChi.Text == "") Response.Write("<script>alert('Địa chỉ không được trống :)')</script>");
            else
                if (CongCu.KiemtraSDT(txtSDT.Text) == false || float.TryParse(txtSDT.Text, out n) == false)
                    Response.Write("<Script>alert('Sai định dạng SĐT !')</Script>");
                else if (drNam.SelectedValue == "0" || drNgay.SelectedValue == "0" || drThang.SelectedValue == "0")
                    Response.Write("<Script>alert('Không được bỏ trống ngày, tháng, năm :)')</Script>");
                else
                {
                    string ngaysinh = drNam.SelectedValue + "/" + drThang.SelectedValue + "/" + drNgay.SelectedValue;
                    string sql = string.Format("INSERT INTO THANHVIEN([Ma_PQ] ,[UserName],[Pass] ,[HoTen] ,[GioiTinh] ,[Email] ,[SoDT],[DiaChi],[NgaySinh]) VALUES({0},'{1}','{2}',N'{3}',N'{4}',N'{5}','{6}',N'{7}','{8}')", drPhanQuyen.SelectedValue, txtTenTK.Text, txtMatKhau.Text, txtHoTen.Text, drGioiTinh.SelectedValue, txtEmail.Text, txtSDT.Text, txtDiaChi.Text, ngaysinh);
                    int kq = kn.Caulenh(sql);
                    if (kq > 0)
                    {
                        Response.Redirect("QLThanhVien.aspx");
                    }
                    else
                    {
                        Response.Write("<Script>alert('Đã có lỗi thêm không thành công :(')</Script>");
                    }
                }

        }
    }
}