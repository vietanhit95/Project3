using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAn3.Utility;

namespace DoAn3.Admin.HoaDon
{
    public partial class QLDonHang : System.Web.UI.Page
    {
        Connect kn = new Connect();
        private void load()
        {

            grvDH.DataSource = kn.getDataTable(@"select ID,HoTen,UserName,NgayDatHang,TenSP,SoLuongMua,SoDT,GiaBan,ThanhTien , HinhThucThanhToan 
                                                 from SANPHAM , GIOHANG ,THANHVIEN 
                                                 where SANPHAM.Ma_SP=GIOHANG.Ma_SP and GIOHANG.MaTV=THANHVIEN.Ma_TV and TinhTrang = 'dathang'");
            grvDH.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                load();
            }
        }

        protected void grvDH_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string ID = e.Values["ID"].ToString();
            int kq = kn.Caulenh("Delete From GIOHANG WHERE ID =" + ID);
            if (kq > 0)
            {

                Response.Write("<Script>alert('Xóa thành công !')</Script>");
                load();
            }
            else
            {
                Response.Write("<Script>alert('Xóa thất bại !')</Script>");
            }
        }

        protected void grvDH_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int dong;
            dong = e.NewSelectedIndex;
            Label lbID = (Label)grvDH.Rows[dong].FindControl("lbID");
            Label lbtentv = (Label)grvDH.Rows[dong].FindControl("LbTaiKhoan");
            Label lbsoluongsp = (Label)grvDH.Rows[dong].FindControl("LbSoLuongSP");
            string matv = CongCu.Laymatheoten(lbtentv.Text, "Ma_TV", "UserName", "THANHVIEN");
            Label lbtongtien = (Label)grvDH.Rows[dong].FindControl("LbTongtien");
            string sql = string.Format(@"Insert into HOADONBAN(Ma_TV , SoLuongSP , NgayGiaoHang , TongTien) VALUES ({0},{1},'{2}',{3})", matv, lbsoluongsp.Text, DateTime.Now.ToShortDateString(), lbtongtien.Text);
            string sql2 = string.Format(@"Insert into KHACHHANG(Ma_TV , SoLanMua) VALUES ({0},{1})", matv, 1);
            string sql3 = string.Format(@"update KHACHHANG set SoLanMua = SoLanMua +1 where Ma_TV = " + matv);
            int kq = kn.Caulenh(sql);
            int kq2;
            if (CongCu.Kiemtra(matv, "KHACHHANG", "Ma_TV") > 0)
            {
                kq2 = kn.Caulenh(sql3);
            }
            else
            { kq2 = kn.Caulenh(sql2); }
            if (kq > 0 && kq2 > 0)
            {

                Response.Write("<Script>alert('Đơn hàng đã được giải quyết !')</Script>");
                kn.Caulenh("Update GIOHANG set tinhtrang = 'damua' WHERE ID =" + lbID.Text);
                load();
            }
            else
            {
                Response.Write("<Script>alert('Đã có lỗi chưa giải quyết đơn hàng này !')</Script>");
            }
        }

        protected void grvDH_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            grvDH.PageIndex = e.NewPageIndex;
            load();
        }
    }
}