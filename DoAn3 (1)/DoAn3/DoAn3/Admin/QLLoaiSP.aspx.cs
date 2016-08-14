using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAn3.Utility;

namespace DoAn3.Admin
{
    public partial class QLLoaiSP : System.Web.UI.Page
    {
        Connect kn = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack==false)
            {
                load();
            }
        }
        private void load()
        {
            GrvLoaiSP.DataSource = kn.getDataTable("select Ma_LoaiSP, TenNhom,TenLoaiSP from LOAISP, NHOMSP where NHOMSP.Ma_NhomSP=LOAISP.Ma_NhomSP");
            GrvLoaiSP.DataBind();
        }
        protected void btTimKiem_Click(object sender, EventArgs e)
        {
            string caulenh = "select Ma_LoaiSP, TenNhom, TenLoaiSP from NHOMSP,LOAISP where LOAISP.Ma_NhomSP=NHOMSP.Ma_NhomSP and(Ma_LoaiSP like'%" + txtTimKiem.Text + "%' or TenNhom like '%" + txtTimKiem.Text + "%' or TenLoaiSP like '%" + txtTimKiem.Text + "%')";
            GrvLoaiSP.DataSource = kn.getDataTable(caulenh);
            GrvLoaiSP.DataBind();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Label lbl = e.Item.FindControl("lbMa_NhomSP") as Label;
            if (e.CommandName == "btNhomSP")
            {

                GrvLoaiSP.DataSource = kn.getDataTable("select Ma_LoaiSP , TenNhom , TenLoaiSP from LOAISP , NHOMSP where LOAISP.Ma_NhomSP = NHOMSP.Ma_NhomSP and NHOMSP.Ma_NhomSP =" + lbl.Text);
                GrvLoaiSP.DataBind();
            }
        }

        protected void Unnamed_Click1(object sender, EventArgs e)
        {
            Response.Redirect("ThemLoaiSP.aspx");
        }

        protected void GrvLoaiSP_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GrvLoaiSP.EditIndex = -1;
            load();
        }

        protected void GrvLoaiSP_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GrvLoaiSP.EditIndex = e.NewEditIndex;
            load();
        }

        protected void GrvLoaiSP_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int dong;
            dong = e.RowIndex;
            DropDownList drTennhom = (DropDownList)GrvLoaiSP.Rows[dong].FindControl("DropDownList1");
            string maloai = e.NewValues["Ma_LoaiSP"].ToString();
            TextBox tenloaisp = (TextBox)GrvLoaiSP.Rows[dong].FindControl("TextBox3");
            if(tenloaisp.Text.Trim()=="" || tenloaisp.Text.Count()==0)
                Response.Write("<Script>alert('Bạn chưa nhập tên loại sản phẩm mới :(')</Script>");
            else
            {
                int kq = kn.Caulenh("Update LOAISP set Ma_NhomSP=" + drTennhom.SelectedValue + ",TenLoaiSP=N'" + tenloaisp.Text + "' where Ma_LoaiSP=" + maloai);
                if(kq>0)
                {
                    Response.Write("<Script>alert('Sửa thành công :)')</Script>");
                    GrvLoaiSP.EditIndex = -1;
                    load();
                }
                else
                {
                    Response.Write("<Script>alert('Sửa thất bại :(')</Script>");
                }
            }
        }

        protected void GrvLoaiSP_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string maloai = e.Values["Ma_LoaiSP"].ToString();
            if(CongCu.Kiemtra(maloai,"SANPHAM","Ma_LoaiSP")>0)
                Response.Write("<Script>alert('Loại sản phẩm này hiện vẫn còn sản phẩm. Không thể xóa :(')</Script>");
            else
            {
                int kq = kn.Caulenh("Delete from  LOAISP where Ma_LoaiSP=" + maloai);
                if(kq>0)
                {
                    Response.Write("<Script>alert('Xóa thành công :)')</Script>");
                    load();
                }
                else
                {
                    Response.Write("<Script>alert('Xóa thất bại :(')</Script>");
                }
            }
        }
    }
}