using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAn3.Utility;

namespace DoAn3.Admin.HoaDon
{
    public partial class ThemDonHang : System.Web.UI.Page
    {
        Connect kn = new Connect();

        protected void Page_Load(object sender, EventArgs e)
        {
            txtNgayDatHang.Text = DateTime.Now.ToShortDateString();
        }

        protected void Them_Click(object sender, EventArgs e)
        {
            float n2 = 0;
            if (float.TryParse(txtSoLuong.Text, out n2) == false)
                Response.Write("<Script>alert('Số lượng phải là số !')</Script>");
            else if (int.Parse(txtSoLuong.Text) <= 0)
                Response.Write("<Script>alert('Số lượng sản phẩm phải lớn hơn 0!')</Script>");
            else
            {
                double tongtien = double.Parse(txtSoLuong.Text) * double.Parse(CongCu.Laygiasptheoma(drTensp.SelectedValue));
                string sql = string.Format("INSERT INTO GIOHANG(MA_SP , MATV , SOLUONGMUA , THANHTIEN , NGAYDATHANG , HinhThucThanhToan , TinhTrang) VALUES({0},{1},{2},{3},{4},N'{5}','{6}')", drTensp.SelectedValue, drtentk.SelectedValue, txtSoLuong.Text, tongtien, txtNgayDatHang.Text, drHTTT.SelectedValue, "dathang");
                int kq = kn.Caulenh(sql);
                if (kq > 0)
                {
                    Response.Redirect("QLDonHang.aspx");
                }
                else
                {
                    Response.Write("<Script>alert('Thêm Thất Bạn :'(')</Script>");
                }
            }
        }
    }
}