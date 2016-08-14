using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAn3.Utility;

namespace DoAn3.Admin.HoaDon
{
    public partial class QLHoaDonBan : System.Web.UI.Page
    {
        Connect kn = new Connect();
        private void load()
        {

            grvHDB.DataSource = kn.getDataTable(@"select HOADONBAN.ID, NgayGiaoHang,UserName, HoTen, SoLuongSP , TongTien
                                                  from THANHVIEN , HOADONBAN
                                                  where HOADONBAN.Ma_TV  = THANHVIEN.Ma_TV ");
            grvHDB.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                load();
            }
        }


        protected void grvHDB_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string ID = e.Values["ID"].ToString();
            int kq = kn.Caulenh("Delete From HOADONBAN WHERE ID =" + ID);
            if (kq > 0)
            {

                Response.Write("<Script>alert('Xóa thành công :)')</Script>");
                load();
            }
            else
            {
                Response.Write("<Script>alert('Xóa thất bại :(')</Script>");
            }
        }

        protected void grvHDB_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvHDB.PageIndex = e.NewPageIndex;
            load();
        }
    }
}