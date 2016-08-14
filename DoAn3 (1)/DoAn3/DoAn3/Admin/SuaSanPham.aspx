<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/QuanTri.Master" AutoEventWireup="true" CodeBehind="SuaSanPham.aspx.cs" Inherits="DoAn3.Admin.SuaSanPham" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            text-align: center;
        }
        .style4 {
            height: 36px;
            text-align: center;
            color: white;
            background-color: #555;
            font-size: 15px;
        }
         .table
         {
            /* border:1px solid black;--%>
             */border-collapse:collapse;
             width: 774px;
             border-right:1px solid black;
             border-left:1px solid black;
             border-bottom:1px solid black;
             }
         .table td
         {
             padding-left:20px;
             padding-top:4px;
             padding-bottom:4px;
              border-left:1px dotted black;
             border-bottom:1px dotted black;
             
             }
         .style7
         {
             width: 275px;
         }
         .Hdtext
   {
             background-color: #222222;
             width: 178px;
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
        <div id="content-left">
            <div class="Hdtext">QUẢN LÝ SẢN PHẨM</div>
            <br />
            <div>
                <img src="imange/towred1-r.gif" style="float: left" /><a href="ThemSanPham.aspx" class="Link">Thêm sản phẩm mới</a>
            </div>
            <br />
            <div>
                <a href="QLSanPham.aspx" class="Link">
                    <img src="imange/towred1-r.gif" style="float: left" />Danh sách sản phẩm</a><br />
                <br />
            </div>
            <br />
        </div>
        <div id="content-right">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="Ma_SP" DefaultMode="Edit" Width="155px" DataSourceID="SqlDataSource1">
                <EditItemTemplate>
                    <table class="table" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="style4" colspan="2">SỬA SẢN PHẨM</td>
                        </tr>
                        <tr>
                            <td class="style7">Mã sản phẩm&nbsp;&nbsp;&nbsp; </td>
                            <td>
                                <asp:Label ID="Ma_SPLabel1" runat="server" Text='<%# Eval("Ma_SP") %>' />
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style7">Tên sản phẩm&nbsp;&nbsp; </td>
                            <td>
                                <asp:TextBox ID="TenSPTextBox" runat="server" Text='<%# Bind("TenSP") %>' />
                               <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="TenSPTextBox" ErrorMessage="Bạn chưa nhập tên sản phẩm" 
                            ForeColor="Red" Display="Dynamic" Enabled="False"></asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">Loại sản phẩm&nbsp; </td>
                            <td>
                                <asp:DropDownList ID="drLoaiSP" runat="server" DataSourceID="SqlDataSource3" 
                            DataTextField="TenLoaiSP" DataValueField="Ma_LoaiSP" 
                            SelectedValue='<%# Bind("Ma_LoaiSP") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:DoAn3ConnectionString %>" 
                            SelectCommand="SELECT [Ma_LoaiSP], [TenLoaiSP] FROM [LOAISP]">
                        </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">Hãng sản phẩm </td>
                            <td>
                                <asp:DropDownList ID="drHSX" runat="server" DataSourceID="SqlDataSource2"
                                    DataTextField="TenHSX" DataValueField="Ma_HSX"
                                    SelectedValue='<%# Bind("Ma_HSX") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:DoAn3ConnectionString %>"
                                    SelectCommand="SELECT * FROM [HANGSANXUAT]"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">Nhà cung cấp&nbsp;&nbsp; </td>
                            <td>
                                <asp:DropDownList ID="drNCC" runat="server" DataSourceID="SqlDataSource1"
                                    DataTextField="TenNCC" DataValueField="Ma_NCC"
                                    SelectedValue='<%# Bind("Ma_NCC") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:DoAn3ConnectionString %>"
                                    SelectCommand="SELECT [Ma_NCC], [TenNCC] FROM [NHACUNGCAP]"></asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">Ảnh&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td>
                                <div style="float: left">
                                    <asp:Image ID="Image1" runat="server" Height="68px"
                                        Width="66px" ImageUrl='<%# Eval("Image", "~/IMG/{0}") %>' />
                                </div>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Image") %>'
                                    Visible="False"></asp:Label>
                                &nbsp; &nbsp;<asp:FileUpload ID="FileUpload1" runat="server" />
                                <br />
                                <br />
                                &nbsp; &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style7">Giá bán&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td>
                                <asp:TextBox ID="GiaBanTextBox" runat="server" Text='<%# Bind("GiaBan") %>'
                                    ForeColor="Red" />
                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="GiaBanTextBox" ErrorMessage="Bạn chưa nhập giá bán" 
                            ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">Mô tả&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td>
                                <CKEditor:CKEditorControl ID="CKEditorControl2" runat="server"
                                    Text='<%# Bind("MoTa") %>' Width="">
                                </CKEditor:CKEditorControl>
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="CKEditorControl2" ErrorMessage="Bạn chưa nhập mô tả" 
                            ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">Bảo hành&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td>
                                <asp:TextBox ID="BaoHanhTextBox" runat="server" Text='<%# Bind("BaoHanh") %>' />
                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="BaoHanhTextBox" ErrorMessage="Bạn chưa nhập bảo hành" 
                            ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">Số lượng&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td>
                                <asp:TextBox ID="SoLuongTextBox" runat="server" Text='<%# Bind("SoLuong") %>' />
                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="SoLuongTextBox" ErrorMessage="Bạn chưa nhập số lượng" 
                            ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">Ngày nhập kho </td>
                            <td>
                                <asp:TextBox ID="NgayNhapKhoTextBox" runat="server"
                                    Text='<%# Bind("NgayNhapKho") %>' Height="19px" Width="96px"></asp:TextBox>
                                <asp:ListBox ID="LbxNgay" runat="server" Rows="1" Width="98px" Height="23px">
                                    <asp:ListItem Value="0">Chọn ngày</asp:ListItem>
                                </asp:ListBox>
                                &nbsp;/&nbsp;<asp:ListBox ID="LbxThang" runat="server" Rows="1">
                                    <asp:ListItem Value="0">Chọn tháng</asp:ListItem>
                                </asp:ListBox>
                                &nbsp;/&nbsp;<asp:ListBox ID="LbxNam" runat="server" Rows="1">
                                    <asp:ListItem Value="0">Chọn năm</asp:ListItem>
                                </asp:ListBox>

                            </td>
                        </tr>
                        <tr>
                            <td class="style7">Khuyến mãi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td>
                                <asp:TextBox ID="KhuyenMaiTextBox" runat="server"
                                    Text='<%# Bind("KhuyenMai") %>' />
                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ControlToValidate="KhuyenMaiTextBox" 
                            ErrorMessage="Bạn chưa nhập phần trăm khuyến mãi" ForeColor="Red" 
                            Display="Dynamic"></asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">Giới thiệu<td>
                                <CKEditor:CKEditorControl ID="CKEditorControl1" runat="server"
                                    Text='<%# Bind("GioiThieu") %>' Width="">
                                </CKEditor:CKEditorControl>
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                ControlToValidate="CKEditorControl1" ErrorMessage="Bạn chưa nhập giơi thiệu" 
                                ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="style2" colspan="2">
                                <asp:LinkButton ID="Update" runat="server" OnClick="Update_Click">Update</asp:LinkButton>&nbsp;
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                            CommandName="Cancel" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <InsertItemTemplate>
                    Mã sản phẩm :
            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Ma_SP") %>'></asp:TextBox>
                    <br />
                    Ma_HSX:
            <asp:TextBox ID="Ma_HSXTextBox" runat="server" Text='<%# Bind("Ma_HSX") %>' />
                    <br />
                    Ma_NCC:
            <asp:TextBox ID="Ma_NCCTextBox" runat="server" Text='<%# Bind("Ma_NCC") %>' />
                    <br />
                    TenSP:
            <asp:TextBox ID="TenSPTextBox" runat="server" Text='<%# Bind("TenSP") %>' />
                    <br />
                    Image:
            <asp:TextBox ID="ImageTextBox" runat="server" Text='<%# Bind("Image") %>' />
                    <br />
                    GiaBan:
            <asp:TextBox ID="GiaBanTextBox" runat="server" Text='<%# Bind("GiaBan") %>' />
                    <br />
                    MoTa:
            <asp:TextBox ID="MoTaTextBox" runat="server" Text='<%# Bind("MoTa") %>' />
                    <br />
                    BaoHanh:
            <asp:TextBox ID="BaoHanhTextBox" runat="server" Text='<%# Bind("BaoHanh") %>' />
                    <br />
                    SoLuong:
            <asp:TextBox ID="SoLuongTextBox" runat="server" Text='<%# Bind("SoLuong") %>' />
                    <br />
                    NgayNhapKho:
            <asp:TextBox ID="NgayNhapKhoTextBox" runat="server"
                Text='<%# Bind("NgayNhapKho") %>' />
                    <br />
                    KhuyenMai:
            <asp:TextBox ID="KhuyenMaiTextBox" runat="server"
                Text='<%# Bind("KhuyenMai") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                        CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                        CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>

                <ItemTemplate>
                    Ma_SP:<asp:Label ID="Ma_SPLabel1" runat="server" Text='<%# Eval("Ma_SP") %>'></asp:Label>
                    <br />
                    Ma_LoaiSP:<asp:Label ID="Ma_LoaiSPLabel" runat="server" Text='<%# Eval("Ma_LoaiSP") %>'></asp:Label>
                    <br />
                    Ma_HSX:<asp:Label ID="Ma_HSXLabel" runat="server" Text='<%# Eval("Ma_HSX") %>'></asp:Label>
                    <br />
                    Ma_NCC:<asp:Label ID="Ma_NCCLabel" runat="server" Text='<%# Eval("Ma_NCC") %>'></asp:Label>
                    <br />
                    TenSP:<asp:Label ID="TenSPLabel" runat="server" Text='<%# Eval("TenSP") %>'></asp:Label>
                    <br />
                    Image:<asp:Label ID="ImageLabel" runat="server" Text='<%# Eval("Image") %>'></asp:Label>
                    <br />
                    GiaBan:<asp:Label ID="GiaBanLabel" runat="server" Text='<%# Eval("GiaBan") %>'></asp:Label>
                    <br />
                    MoTa:<asp:Label ID="MoTaLabel" runat="server" Text='<%# Eval("MoTa") %>'></asp:Label>
                    <br />
                    BaoHanh:<asp:Label ID="BaoHanhLabel" runat="server" Text='<%# Eval("BaoHanh") %>'></asp:Label>
                    <br />
                    SoLuong:<asp:Label ID="SoLuongLabel" runat="server" Text='<%# Eval("SoLuong") %>'></asp:Label>
                    <br />
                    NgayNhapKho:<asp:Label ID="NgayNhapKhoLabel" runat="server" Text='<%# Eval("NgayNhapKho") %>'></asp:Label>
                    <br />
                    KhuyenMai:<asp:Label ID="KhuyenMaiLabel" runat="server" Text='<%# Eval("KhuyenMai") %>'></asp:Label>
                </ItemTemplate>


            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DoAn3ConnectionString %>"
                 SelectCommand="SELECT * FROM [SANPHAM] WHERE ([Ma_SP] = @Ma_SP)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Ma_SP" QueryStringField="Ma_SP" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
