using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAn3.Utility;

namespace DoAn3.Admin.ThanhVien
{
    public partial class QLThanhVien : System.Web.UI.Page
    {
        Connect kn = new Connect();
        
        private void load()
        {
            grvTV.DataSource = kn.getDataTable("Select * from THANHVIEN, PHANQUYEN where THANHVIEN.Ma_PQ=PHANQUYEN.Ma_PQ");
            grvTV.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack==false)
            {
                load();
            }
        }

        protected void btTimKiem_Click(object sender, EventArgs e)
        {
            string caulenh = string.Format("select * from THANHVIEN where Ma_TV like '%{0}%' or UserName like N'%{1}%' or HoTen like N'%{2}%' or GioiTinh like N'%{3}%' or Email like N'%{4}%' or SoDT like '%{5}%' or DiaChi like N'%{6}%' or NgaySinh like '%{7}%' ", 
                txtTimKiem.Text, txtTimKiem.Text, txtTimKiem.Text, txtTimKiem.Text, txtTimKiem.Text, txtTimKiem.Text, txtTimKiem.Text, txtTimKiem.Text);
            grvTV.DataSource = kn.getDataTable(caulenh);
            grvTV.DataBind();
        }

        protected void grvTV_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string matv = e.Values["Ma_TV"].ToString();
            if(CongCu.Kiemtra(matv,"GIOHANG","MaTV")>0)
                Response.Write("<Script>alert('Thành viên này đang đặt mua hàng !')</Script>");
            else
            {
                int kq = kn.Caulenh("delete from THANHVIEN where Ma_TV=" + matv);
                if(kq>0)
                {
                    Response.Write("<script>alert('Xóa thành công :)')</script>");
                    load();
                }
                else
                {
                    Response.Write("<script>alert('Xóa thất bại :)')</script>");
                }
            }
        }

        protected void grvTV_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvTV.PageIndex = e.NewPageIndex;
            load();
        }
    }
}