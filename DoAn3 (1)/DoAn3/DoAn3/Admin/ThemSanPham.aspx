<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/QuanTri.Master" AutoEventWireup="true" CodeBehind="ThemSanPham.aspx.cs" Inherits="DoAn3.Admin.WebForm1" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2 {
            text-align: center;
        }
        .style2:hover{
            border:1px solid red;
        }
        .style4 {
            height: 36px;
            text-align: center;
            color: white;
            background-color: #555;
            font-size: 15px;
        }

        .style5 {
            width: 212px;
        }

        .table {
            /* border:1px solid black;--%>
             */ border-collapse: collapse;
            width: 775px;
            border-right: 1px solid black;
            border-left: 1px solid black;
            border-bottom: 1px solid black;
        }

            .table td {
                padding-left: 70px;
                padding-top: 4px;
                padding-bottom: 4px;
                border-left: 1px dotted black;
                border-bottom: 1px dotted black;
            }

        .Hdtext {
            background-color: #222222;
            width: 168px;
            height: 26px;
            text-align: center;
            padding-top: 8px;
            color: white;
        }

        #content-left {
            float: left;
            width: 178px;
            border-left: 1px solid #CCC;
            border-right: 1px solid #CCC;
            border-bottom: 1px solid #CCC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main">
        <div id="content-left" style="width: 168px">
            <div class="Hdtext">QUẢN LÝ SẢN PHẨM</div>
            <br />
            <div>
                <img src="imange/towred1-r.gif" style="float: left" /><a href="ThemSanPham.aspx" class="Link">Thêm sản phẩm mới</a>
            </div>
            <br />
            <div>
                <img src="imange/towred1-r.gif" style="float: left" /><a href="QLSanPham.aspx" class="Link">Danh sách sản phẩm</a><br />
                <br />
            </div>
            <br />
        </div>
        <div id="content-right">
            <form id="frmthemsp" action="" method="post">
                
                <table cellpadding="0" class="table" cellspacing="0">
                    <tr>
                        <td class="style4" colspan="2">THÊM SẢN PHẨM MỚI</td>
                    </tr>
                    <tr>
                        <td class="style5">Tên sản phẩm&nbsp;&nbsp; </td>
                        <td>
                            <asp:TextBox ID="TenSPTextBox" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ErrorMessage="Bạn chưa nhập tên sản phẩm" ForeColor="Red" ControlToValidate="TenSPTextBox"
                                Display="Dynamic" Enabled="False"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td class="style5">Loại sản phẩm&nbsp; </td>
                        <td>
                            <asp:DropDownList ID="drLoaiSP" runat="server"
                                DataTextField="TenLoaiSP" DataValueField="Ma_LoaiSP"
                                DataSourceID="SqlDataSource1">
                                <asp:ListItem Value="0">-Chọn loai sp-</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:DoAn3ConnectionString %>" SelectCommand="SELECT * FROM [LOAISP]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">Hãng sản phẩm </td>
                        <td>
                            <asp:DropDownList ID="drHSX" runat="server"
                                DataTextField="TenHSX" DataValueField="Ma_HSX"
                                DataSourceID="SqlDataSource2">
                                <asp:ListItem Value="0">-Chọn HSX-</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                ConnectionString="<%$ ConnectionStrings:DoAn3ConnectionString %>"
                                SelectCommand="SELECT * FROM [HANGSANXUAT]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">Nhà cung cấp&nbsp;&nbsp; </td>
                        <td>
                            <asp:DropDownList ID="drNCC" runat="server"
                                DataTextField="TenNCC" DataValueField="Ma_NCC"
                                DataSourceID="SqlDataSource3">
                                <asp:ListItem Value="0">-Chọn NCC-</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                ConnectionString="<%$ ConnectionStrings:DoAn3ConnectionString %>" SelectCommand="SELECT * FROM [NHACUNGCAP]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">Ảnh&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                        <td>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ErrorMessage="Bạn chưa chọn file ảnh" ControlToValidate="FileUpload1"
                                Display="Dynamic" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td class="style5">Giá bán&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                        <td>
                            <asp:TextBox ID="GiaBanTextBox" runat="server"
                                ForeColor="Red" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                ErrorMessage="Bạn chưa nhập giá bán" ControlToValidate="GiaBanTextBox"
                                Display="Dynamic" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td class="style5">Mô tả&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                        <td>
                            <CKEditor:CKEditorControl ID="MoTaTextBox" runat="server"></CKEditor:CKEditorControl>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                ErrorMessage="Bạn chưa nhập mô tả" ControlToValidate="MoTaTextBox"
                                Display="Dynamic" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td class="style5">Bảo hành&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                        <td>
                            <asp:TextBox ID="BaoHanhTextBox" runat="server" ForeColor="Red" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                ErrorMessage="Bạn chưa nhập bảo hành" ControlToValidate="BaoHanhTextBox"
                                Display="Dynamic" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td class="style5">Số lượng&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                        <td>
                            <asp:TextBox ID="SoLuongTextBox" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                ErrorMessage="Bạn chưa nhập số lượng" Display="Dynamic" ControlToValidate="SoLuongTextBox"
                                ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td class="style5">Ngày nhập kho </td>
                        <td>
                            <asp:TextBox ID="NgayNhapKhoTextBox" runat="server" Enabled="False" ForeColor="Red"></asp:TextBox>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style5">Khuyến mãi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                        <td>
                            <asp:TextBox ID="KhuyenMaiTextBox" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                ErrorMessage="Bạn chưa nhập khuyến mại" ControlToValidate="KhuyenMaiTextBox"
                                Display="Dynamic" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td class="style5">Giới thiệu sản phẩm</td>
                        <td>
                            <CKEditor:CKEditorControl ID="CKEditorControl1" runat="server"></CKEditor:CKEditorControl>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                ErrorMessage="Bạn chưa nhập gioiwsi thiệu sản phẩm" ControlToValidate="CKEditorControl1"
                                Display="Dynamic" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td class="style2" colspan="2">
                            <asp:LinkButton ID="Insert" runat="server" OnClick="Insert_Click"
                                ForeColor="Blue" BorderStyle="Inset">Insert</asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="Reset" runat="server" OnClick="Reset_Click"
                                ForeColor="Blue" BorderStyle="Inset">Reset</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</asp:Content>
