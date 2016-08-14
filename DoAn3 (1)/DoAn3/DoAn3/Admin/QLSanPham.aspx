<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/QuanTri.Master" AutoEventWireup="true" CodeBehind="QLSanPham.aspx.cs" Inherits="DoAn3.Admin.QLSanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2:active{
                text-decoration:underline;
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
        a:link {	
	text-decoration: none;
	color:#000000;	
}
a:visited {
	text-decoration: none;
	color:#000000;
}
a:hover {
	text-decoration:underline;
	color:#FF0000;
}

a:active {
	text-decoration: none;
}
#main{
	width:960px;
	background-color:#FFF;
	margin-top:15px;
	height:357px;
}
#content-left{
float: left;
width: 178px;
border-left: 1px solid #CCC;
border-right: 1px solid #CCC;
border-bottom: 1px solid #CCC;
            /*height: 351px;
           margin-top:-15px;*/
        }
#content-right{
margin-left: 184px;
width: 775px;
border-left: 1px solid #CCC;
            height: 350px;
            margin-top:23px;
        }
#content{
	margin-left:200px;
	margin-right:200px;
	_display:inline;
}

    .timkiem-textbox {
        font-size:13px;
        color:#000000;
        height:22px;
        border:1px solid #999;
        width:286px;
        margin-left:30px;
        margin-top:9px;
        border-radius:5px;
        z-index:11;
        padding-left:4px;
    }
    .button{
        width:81px;
        background-image:url(button-2-o.gif);
        background-repeat:no-repeat;
        border:0px;
        color:white;
        height:26px;
        margin-left:-3px;
    }
    .xem:hover{
        text-decoration:underline;
        color:red;
        cursor:pointer;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main">
        <div id="content-left">
            <div class="Hdtext">QUẢN LÝ SẢN PHẨM</div>
            <br />
           <div> <img src="imange/towred1-r.gif" style="float:left" /><a href="ThemSanPham.aspx" class="link">Thêm Sản Phẩm Mới</a></div>
            <br />
             <div>
            <img src="imange/towred1-r.gif" style="float:left" /><a href="QLSanPham.aspx" class="link">Danh Sách Sản Phẩm</a></div>
            <br />
            <div>
                <img src="imange/towred1-r.gif" style="float:left" />Danh Sách Loại Sản Phẩm
            </div>
             <br />
            <div>
                <img src="imange/file_uf.gif" style="float:left; padding-left:16px;" />ĐiệnThoại
            </div>
        <div>
            <asp:DataList ID="DataList1" runat="server" CellPadding="0" DataKeyField="Ma_LoaiSP" Width="133px" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand">
                <ItemTemplate>
                    <br/>
                    <div>
                        <img src="../IMG/file_c.gif" style="float:left; padding-left:16px;" />
                    <asp:Label ID="lbMa_LoaiSP" runat="server" Text='<%# Eval("Ma_LoaiSP") %>' Visible="False" />
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="btDienThoai" 
                            Text='<%# Eval("TenLoaiSP") %>'></asp:LinkButton>
                        </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DoAn3ConnectionString %>"
                 SelectCommand="SELECT [TenLoaiSP], [Ma_LoaiSP] FROM [LOAISP] WHERE [Ma_NhomSP] = 1"></asp:SqlDataSource>
        </div>
        <br />
        <div>
            <img src="imange/file_uf.gif" style="float:left; padding-left:16px;" />Phụ Kiện</div>
        <div>
            <asp:DataList ID="DataList2" runat="server" CellPadding="0" DataKeyField="Ma_LoaiSP" Width="133px" DataSourceID="SqlDataSource2" Height="48px" OnItemCommand="DataList2_ItemCommand">
                <ItemTemplate>
                    <asp:Label ID="lbMa_LoaiSP2" runat="server" Text='<%# Eval("Ma_LoaiSP") %>' Visible="False"></asp:Label>
                    <asp:LinkButton ID="LinkButton2" runat="server" Text='<%# Eval("TenLoaiSP") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DoAn3ConnectionString %>" SelectCommand="select [Ma_LoaiSP], [TenLoaiSP] from [LOAISP] where [Ma_NhomSP]=2"></asp:SqlDataSource>
        </div>
        </div>
           
    
    <div id="content-right">
       
        <div style="float: left;height: 31px; width: 692px;font-size: 20px;color: #FF3300; margin-top:20px;">
            <strong>QUẢN LÝ SẢN PHẨM</strong>
            <asp:TextBox ID="txtTimKiem" runat="server" CssClass="timkiem-textbox" Width="325px"></asp:TextBox>
            <asp:Button ID="btTimKiem" runat="server" Text="Tìm Kiếm" CssClass="button" OnClick="btTimKiem_Click"  />
        </div>
        <div style="padding-left:681px;">
            <asp:Button ID="btthem" runat="server" 
        style="background:url(imange/sg.jpg); width:55px; height:65px;" OnClick="btthem_Click" />
        </div>
        <div style="text-align: center;color: white;background-color: #222222;height: 27px; font-size:15px; padding-top: 9px; width: 100%;">DANH SÁCH SẢN PHẨM</div>
        <asp:GridView ID="GrvSanPham" runat="server" Width="750px" Font-Size="13px" PageSize="5" AutoGenerateColumns="false"
           AllowPaging="true" OnRowDeleting="GrvSanPham_RowDeleting" OnPageIndexChanging="GrvSanPham_PageIndexChanging" >
            <Columns>
                <asp:TemplateField HeaderText="Mã SP">
                    <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Ma_SP") %>'></asp:TextBox>
                </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbMaSP" runat="server" Text='<%# Bind("Ma_SP") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên SP">
                    <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TenSP") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("TenSP") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Loại SP">
                    <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("TenLoaiSP") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="HSX">
                     <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("TenHSX") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="NCC">
                    <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("TenNCC") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Giá Bán">
                     <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("GiaBan") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("GiaBan") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ảnh">
                     <EditItemTemplate>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="79px" 
                        ImageUrl='<%# Eval("Image", "~/IMG/{0}") %>' Width="79px" />
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mô Tả">
                    <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("MoTa") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>

                      <div class="xem" align="center" style="padding-left:3px; padding-right:3px;" onclick="var win=window.open('<%# Eval("Ma_SP", "MoTaSP.aspx?Ma_SP={0}") %>', 'open_window', 'width=570, height=320, left=0, top=0')">Xem mô tả</div>

                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bảo Hành">
                    <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("BaoHanh") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("BaoHanh") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Số Lượng">
                     <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("SoLuong") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("SoLuong") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ngày Nhập Kho">
                     <EditItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("NgayNhapKho") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("NgayNhapKho") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Khuyến Mại">
                     <EditItemTemplate>
                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("KhuyenMai") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("KhuyenMai") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Giới Thiệu">
                    <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <div class="xem" align="center" 
                        onclick='var win=window.open(&#039;<%# Eval("Ma_SP", "GioiThieuSP.aspx?Ma_SP={0}") %>&#039;, &#039;open_window&#039;, &#039;width=570, height=320, left=0, top=0&#039;)' 
                        style="padding-left:3px; padding-right:3px;">
                        Xem Giới Thiệu</div>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# Eval("Ma_SP", "SuaSanPham.aspx?Ma_SP={0}") %>'  Text="Edit"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="delete" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete" OnClientClick='return confirm("Bạn muốn xóa sản phẩm này ?");'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

            </Columns>
            

        </asp:GridView>
           
    </div>
</div>
</asp:Content>
