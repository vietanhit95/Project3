<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/QuanTri.Master" AutoEventWireup="true" CodeBehind="ThemLoaiSP.aspx.cs" Inherits="DoAn3.Admin.ThemLoaiSP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
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
            width: 170px;
            border-left: 1px solid #CCC;
            border-right: 1px solid #CCC;
            border-bottom: 1px solid #CCC;
        }
        td
        {
            height: 32px;
        }
        .style2
        {
            text-align: center;
            height: 32px;
            color: #FFFFFF;
            background-color: #555;
            margin-left:170px;
            
        }
        .style4
        {
            width: 344px;
            text-align: center;
        }
        .auto-style2 {
            width: 597px;
        }
        .auto-style3 {
            width: 344px;
            text-align: center;
            height: 32px;
        }
        .auto-style4 {
            width: 597px;
            height: 32px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main">
         <div id="content-left">
            <div class="Hdtext">LOẠI SP</div>
            <br />
            <div>
                <img src="imange/towred1-r.gif" style="float: left" /><a href="ThemLoaiSP.aspx" class="Link">Thêm loại sản phẩm</a>
            </div>
            <br />
            <div>
                <img src="imange/towred1-r.gif" style="float: left" /><a href="QLLoaiSP.aspx" class="Link">Danh 
            sách loại sp</a>
            </div>
            <br />
            <div class="Hdtext">NHÓM SP</div>
            <br />
            <div>
                <img src="imange/towred1-r.gif" style="float: left" /><a href="ThemNhomSP.aspx" class="Link">Thêm 
            nhóm sản phẩm</a>
            </div>
            <br />
            <div>
                <img src="imange/towred1-r.gif" style="float: left" /><a href="QLNhomSP.aspx" class="Link">Danh 
            sách nhóm sp</a>
            </div>
            <br />
            <div class="Hdtext">Loại sản phẩm theo nhóm </div>
             <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                  <ItemTemplate>
                    <br />
                    <div style="width: 148px; margin-left: 30px">
                        <img src="imange/file_uf.gif"
                            style="height: 15px; width: 18px; float: left" />
                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="Link"
                         NavigateUrl='<%# Eval("Ma_NhomSP", "QLLoaiSP.aspx?Ma_NhomSP={0}") %>' 
                         Text='<%# Eval("TenNhom") %>'></asp:HyperLink>
                        <br />
                </ItemTemplate>
                 
             </asp:DataList>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DoAn3ConnectionString %>" 
                 SelectCommand="select [TenNhom], [Ma_NhomSP] from [NHOMSP]"></asp:SqlDataSource>
    </div>
        <div id="content-right">
            <table style="width:82%; height:147px; margin-left:175px; border:1px solid silver;">
                 <tr>
            <td class="style2" colspan="2">
                THÊM LOẠI SẢN PHẨM MỚI</td>
        </tr>
        <tr>
            <td class="auto-style3">
                Nhóm sản phẩm&nbsp;&nbsp; :</td>
            <td class="auto-style4">
                <asp:DropDownList ID="DrNhomSP" runat="server" DataSourceID="SqlDataSource1" 
                    DataTextField="TenNhom" DataValueField="Ma_NhomSP" Width="183px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DoAn3ConnectionString %>" 
                    SelectCommand="SELECT * FROM [NHOMSP]"></asp:SqlDataSource>
                </td>
            </tr>
                 <tr>
            <td class="style4">
                Tên loại sản phẩm :</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtTenLoaiSP" runat="server" Width="183px"></asp:TextBox>
                </td>
                     </tr>
                 <tr >
            <td colspan="2">
              <div  style="text-align:center">
                <asp:Button ID="Them" runat="server" Text="Thêm" onclick="Them_Click" />
                &nbsp;<input id="Reset1" type="reset" value="reset" />
                 </div>
                </td>
               
        </tr>
            </table>
        </div>
        </div>
</asp:Content>
