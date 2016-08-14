using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using DoAn3.Utility;

namespace DoAn3.Admin
{
    public partial class SuaSanPham : System.Web.UI.Page
    {
        Connect kn = new Connect();
        #region Kiểm tra định dạng ảnh
        bool CheckFileType(string fileName)
        {

            string ext = Path.GetExtension(fileName);
            switch (ext.ToLower())
            {
                case ".gif":
                    return true;
                case ".png":
                    return true;
                case ".jpg":
                    return true;
                case ".jpeg":
                    return true;
                default:
                    return false;
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadListbox();
        }
        public void LoadListbox()
        {
            ListBox lbxNgay = (ListBox)FormView1.FindControl("LbxNgay");
            for (int i = 1; i <= 31; i++)
             lbxNgay.Items.Add(i.ToString()); 
            ListBox lbxThang = (ListBox)FormView1.FindControl("LbxThang");
            for (int i = 1; i <= 12; i++)
             lbxThang.Items.Add(i.ToString()); 
            ListBox lbxNam = (ListBox)FormView1.FindControl("LbxNam");
            for (int i = 2014; i >= 1990; i--)
             lbxNam.Items.Add(i.ToString()); 

        }
        protected void Update_Click(object sender, EventArgs e)
        {
            #region Khởi tạo
            Label masp = (Label)FormView1.FindControl("Ma_SPLabel1");
            TextBox tensp = (TextBox)FormView1.FindControl("TenSPTextBox");
            DropDownList loaisp = (DropDownList)FormView1.FindControl("drLoaiSP");
            DropDownList hangsx = (DropDownList)FormView1.FindControl("drHSX");
            DropDownList nhacc = (DropDownList)FormView1.FindControl("drNCC");
            FileUpload fileanh = (FileUpload)FormView1.FindControl("FileUpload1");
            TextBox giaban = (TextBox)FormView1.FindControl("GiaBanTextBox");
            CKEditor.NET.CKEditorControl mota = (CKEditor.NET.CKEditorControl)FormView1.FindControl("CKEditorControl2");
            TextBox soluong = (TextBox)FormView1.FindControl("SoLuongTextBox");
            TextBox baohanh = (TextBox)FormView1.FindControl("BaoHanhTextBox");
            TextBox ngaynhapkho = (TextBox)FormView1.FindControl("NgayNhapKhoTextBox");
            TextBox khuyenmai = (TextBox)FormView1.FindControl("KhuyenMaiTextBox");
            ListBox ngay = (ListBox)FormView1.FindControl("lbxNgay");
            ListBox thang = (ListBox)FormView1.FindControl("lbxThang");
            ListBox nam = (ListBox)FormView1.FindControl("lbxNam");
            Label lb = (Label)FormView1.FindControl("Label1");
            CKEditor.NET.CKEditorControl ck = (CKEditor.NET.CKEditorControl)FormView1.FindControl("CKEditorControl1");
            if (fileanh.FileName != "")
            {
                lb.Text = fileanh.FileName;
            }
            else lb.Text = lb.Text;
            #endregion
            #region UploadAnh
            if (fileanh.HasFile && Page.IsValid)
                if (CheckFileType(fileanh.FileName))
                {
                    string fileName = "~/IMG/" + fileanh.FileName;
                    string filePath = MapPath(fileName);
                    fileanh.SaveAs(filePath);
                }
                else
                {
                    Response.Write("<script>alert('Bạn chọn sai định dạng ảnh :(')</script>");
                }
            #endregion
            #region ngày nhập kho
            if (ngay.SelectedValue != "0" && thang.SelectedValue != "0" && nam.SelectedValue != "0")
            {
                ngaynhapkho.Text = nam.SelectedValue + "/" + thang.SelectedValue + "/" + ngay.SelectedValue;
            }
            else
            {
                ngaynhapkho.Text = ngaynhapkho.Text;
            }
            #endregion
            #region Bắt lỗi
            float n = 0;
            if (int.Parse(soluong.Text) <= 0)
                Response.Write("<Script>alert('Số lượng sản phẩm phải lớn hơn 0!')</Script>");
            else if (float.TryParse(soluong.Text, out n) == false)
                Response.Write("<Script>alert('Số lượng là số :(')</Script>");
            else if (float.TryParse(giaban.Text, out n) == false)
                Response.Write("<Script>alert('Giá bán là số :(')</Script>");
            else if (tensp.Text == "")
                Response.Write("<script>alert('Tên sản phẩm không được trống :(')</script>");
            else if (giaban.Text == "")
                Response.Write("<script>alert('Giá không được trống :(')</script>");
            else if (mota.Text == "")
                Response.Write("<script>alert('Mô tả không được trống :(')</script>");
            else if (baohanh.Text == "")
                Response.Write("<script>alert('Bảo hành không được trống :(')</script>");
            else if (soluong.Text == "")
                Response.Write("<script>alert('Số lượng không được trống :(')</script>");
            else if (khuyenmai.Text == "")
                Response.Write("<script>alert('Khuyến mại không được trống :(')</script>");
            else if (ck.Text == "")
                Response.Write("<script>alert('Giới thiệu không được trống :(')</script>");
            else if (int.Parse(giaban.Text) <= 0)
                Response.Write("<Script>alert('Giá bán sản phẩm phải lớn hơn 0!')</Script>");
            //else if (int.Parse(khuyenmai.Text) <= 0)
            //    Response.Write("<Script>alert('Khuyến mãi phải lớn hơn 0!')</Script>");
            else if (float.TryParse(khuyenmai.Text, out n) == false)
                Response.Write("<Script>alert('Khuyến mãi là số !')</Script>");

            else
            {
            #endregion
                string sql = string.Format(@"Update SANPHAM 
                                         set Ma_LoaiSP =" + loaisp.SelectedValue + ",TenSP = N'" + tensp.Text + "', Ma_NCC = " + nhacc.SelectedValue + ",Ma_HSX = " + hangsx.SelectedValue + ",Image='" + lb.Text + "',GiaBan=" + giaban.Text + ",MoTa=N'" + mota.Text + "',BaoHanh='" + baohanh.Text + "',SoLuong=" + soluong.Text + ",NgayNhapKho ='" + ngaynhapkho.Text + "',KhuyenMai=" + khuyenmai.Text + ", GioiThieu = N'" + ck.Text +
                                             "' WHERE Ma_SP =" + masp.Text);
                int kq = kn.Caulenh(sql);

                if (kq > 0)
                {

                    Response.Write("<Script>alert('Sửa thành công :)')</Script>");
                    Response.Redirect("QLSanPham.aspx");
                }
                else
                {
                    Response.Write("<Script>alert('Sửa thất bại :(')</Script>");
                }
            }
        }
    }
}