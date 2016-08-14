using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using DoAn3.Utility;

namespace DoAn3.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        Connect kn = new Connect();
        protected void Page_Load(object sender, EventArgs e)
        {
            NgayNhapKhoTextBox.Text = DateTime.Now.ToString();
        }

        protected void Insert_Click(object sender, EventArgs e)
        {
             #region UpLoadAnh
            if (FileUpload1.HasFile && Page.IsValid)
                if (CheckFileType(FileUpload1.FileName))
                {
                    string fileName = "~/IMG/"+ FileUpload1.FileName;
                    string filePath = MapPath(fileName);
                    FileUpload1.SaveAs(filePath);
                }
                else
                    Response.Write("<script>alert('Bạn chọn sai định dạng ảnh !')</script>");
             #endregion
                       #region Bắt lỗi
            float n2 = 0;
            if (Utility.CongCu.Kiemtra(TenSPTextBox.Text, "SANPHAM", "TenSP") > 0)
                Response.Write("<Script>alert('Tên sản phẩm này đã tồn tại :(')</Script>");
            //else if (int.Parse(SoLuongTextBox.Text) <= 0)
            //    Response.Write("<Script>alert('Số lượng sản phẩm phải lớn hơn 0!')</Script>");
            else if (TenSPTextBox.Text == "")
                Response.Write("<Script>alert('Tên sản phẩm không được trống :(')</Script>");
            else if (GiaBanTextBox.Text == "")
                Response.Write("<Script>alert('Giá không được trống :(')</Script>");
            else if (MoTaTextBox.Text == "")
                Response.Write("<Script>alert('Mô tả không được trống :(')</Script>");
            else if (KhuyenMaiTextBox.Text == "")
                Response.Write("<Script>alert('Khuyến mại không được trống :(')</Script>");
            else if (SoLuongTextBox.Text == "")
                Response.Write("<Script>alert('Số lượng không được trống :(')</Script>");
            else if (CKEditorControl1.Text == "")
                Response.Write("<Script>alert('Giới thiệu SP không được trống :(')</Script>");
            else if (float.TryParse(SoLuongTextBox.Text, out n2) == false)
                Response.Write("<Script>alert('Số lượng phải là số :(')</Script>");
            else if (drHSX.SelectedValue == "0")
                Response.Write("<Script>alert('Bạn chưa chọn hãng sản xuất :(')</Script>");
            else if (drLoaiSP.SelectedValue == "0")
                Response.Write("<Script>alert('Bạn chưa chọn loại sản phẩm :(')</Script>");
            else if (drNCC.SelectedValue == "0")
                Response.Write("<Script>alert('Bạn chưa chọn nhà cung cấp :(')</Script>");
            else if (int.Parse(KhuyenMaiTextBox.Text) < 0)
                Response.Write("<Script>alert('Khuyến mãi không được nhỏ hơn 0 :(')</Script>");
            else if (float.TryParse(KhuyenMaiTextBox.Text, out n2) == false)
                Response.Write("<Script>alert('Khuyến mãi phải là 1 số !')</Script>");
            else if (int.Parse(GiaBanTextBox.Text) < 0)
                Response.Write("<Script>alert('Giá bán không được nhỏ hơn 0 !')</Script>");
            else if (float.TryParse(GiaBanTextBox.Text, out n2) == false)
                Response.Write("<Script>alert('Giá bán phải là số !')</Script>");
            else
            {
                       #endregion
                string sql = string.Format(@"insert into SANPHAM(Ma_LoaiSP,TenSP,Ma_NCC,Ma_HSX,Image,GiaBan,MoTa,BaoHanh,SoLuong,NgayNhapKho,
KhuyenMai,GioiThieu) values({0},N'{1}',{2},{3},N'{4}',{5},N'{6}',N'{7}',{8},'{9}',{10},N'{11}')",
    drLoaiSP.SelectedValue, TenSPTextBox.Text, drNCC.SelectedValue, drHSX.SelectedValue, FileUpload1.FileName, GiaBanTextBox.Text, MoTaTextBox.Text, BaoHanhTextBox.Text, SoLuongTextBox.Text, NgayNhapKhoTextBox.Text, KhuyenMaiTextBox.Text, CKEditorControl1.Text);
                int kq = kn.Caulenh(sql);
                if (kq > 0)
                {
                    Response.Write("<script>alert('Thêm thành công !')</script>");
                    Response.Redirect("QLSanPham.aspx");
                }
                else
                {
                    Response.Write("<script>aleft('Thêm thất bại !')</script>");
                }
            }

        }

        protected void Reset_Click(object sender, EventArgs e)
        {
            TenSPTextBox.Text = "";
            SoLuongTextBox.Text = "";
            GiaBanTextBox.Text = "";
            BaoHanhTextBox.Text = "";
            KhuyenMaiTextBox.Text = "";
            MoTaTextBox.Text = "";
        }
        #region Kiểm tra định dạng ảnh
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

    }
}