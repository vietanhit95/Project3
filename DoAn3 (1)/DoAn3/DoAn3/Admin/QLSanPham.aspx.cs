using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAn3.Utility;

namespace DoAn3.Admin
{
    public partial class QLSanPham : System.Web.UI.Page
    {
        Connect kn = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                load();
            }
        }
        private void load()
        {
            GrvSanPham.DataSource = kn.getDataTable(@"select Ma_SP , TenSP , TenLoaiSP,TenHSX,TenNCC,GiaBan,Image,MoTa,BaoHanh,SoLuong,NgayNhapKho,KhuyenMai,GioiThieu
                                                      from SANPHAM,LOAISP,HANGSANXUAT,NHACUNGCAP
                                                      where SANPHAM.Ma_HSX = HANGSANXUAT.Ma_HSX and SANPHAM.Ma_LoaiSP = LOAISP.Ma_LoaiSP and SANPHAM.Ma_NCC=NHACUNGCAP.Ma_NCC");
            GrvSanPham.DataBind();
        }
        protected void btTimKiem_Click(object sender, EventArgs e)
        {
            string caulenh = string.Format(@"select Ma_SP , TenSP , TenLoaiSP,TenHSX,TenNCC,GiaBan,Image,MoTa,BaoHanh,SoLuong,NgayNhapKho,KhuyenMai 
                                                      from SANPHAM,LOAISP,HANGSANXUAT,NHACUNGCAP
                                                      where SANPHAM.Ma_HSX = HANGSANXUAT.Ma_HSX and SANPHAM.Ma_LoaiSP = LOAISP.Ma_LoaiSP and SANPHAM.Ma_NCC=NHACUNGCAP.Ma_NCC and (Ma_SP like '%{0}%' or TenSP like N'%{1}%' or TenLoaiSP like N'%{2}%' or TenHSX like N'%{3}%' or TenNCC like N'%{4}%' or GiaBan like '%{5}%' or BaoHanh like '%{6}%' or SoLuong like '%{7}%' or NgayNhapKho like '%{8}%' or KhuyenMai like '%{9}%')", txtTimKiem.Text, txtTimKiem.Text, txtTimKiem.Text, txtTimKiem.Text, txtTimKiem.Text, txtTimKiem.Text, txtTimKiem.Text, txtTimKiem.Text, txtTimKiem.Text, txtTimKiem.Text);
            GrvSanPham.DataSource = kn.getDataTable(caulenh);
            GrvSanPham.DataBind();
        }

        protected void btthem_Click(object sender, EventArgs e)
        {
            Response.Redirect("ThemSanPham.aspx");
        }

        protected void GrvSanPham_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrvSanPham.PageIndex = e.NewPageIndex;
            load();
        }

        protected void GrvSanPham_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string masp = e.Values["Ma_SP"].ToString();
            int kq = kn.Caulenh("Delete from SANPHAM where Ma_SP=" + masp);
            if (kq > 0)
            {
                Response.Write("<scrip>aleft('Xóa thành công :)')</scrip>");
                load();
            }
            else
            {
                Response.Write("<scrip>aleft('Xóa thất bạn :(')</scrip>");
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Label lb1 = e.Item.FindControl("lbMa_LoaiSP") as Label;
            if (e.CommandName == "btDienThoai")
            {

                GrvSanPham.DataSource = kn.getDataTable(@"select Ma_SP , TenSP , TenLoaiSP,TenHSX,TenNCC,GiaBan,Image,MoTa,BaoHanh,SoLuong,NgayNhapKho,KhuyenMai 
                                                      from SANPHAM,LOAISP,HANGSANXUAT,NHACUNGCAP
                                                      where SANPHAM.Ma_HSX = HANGSANXUAT.Ma_HSX and SANPHAM.Ma_LoaiSP = LOAISP.Ma_LoaiSP and SANPHAM.Ma_NCC=NHACUNGCAP.Ma_NCC and SANPHAM.Ma_LoaiSP =" + lb1.Text);
                GrvSanPham.DataBind();
            }
        }

        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Label lb2 = e.Item.FindControl("lbMa_LoaiSP2") as Label;
            if (e.CommandName == "btPhuKien")
            {

                GrvSanPham.DataSource = kn.getDataTable(@"select Ma_SP , TenSP , TenLoaiSP,TenHSX,TenNCC,GiaBan,Image,MoTa,BaoHanh,SoLuong,NgayNhapKho,KhuyenMai 
                                                      from SANPHAM,LOAISP,HANGSANXUAT,NHACUNGCAP
                                                      where SANPHAM.Ma_HSX = HANGSANXUAT.Ma_HSX and SANPHAM.Ma_LoaiSP = LOAISP.Ma_LoaiSP and SANPHAM.Ma_NCC=NHACUNGCAP.Ma_NCC and SANPHAM.Ma_LoaiSP =" + lb2.Text);
                GrvSanPham.DataBind();
            }
        }
    }
}