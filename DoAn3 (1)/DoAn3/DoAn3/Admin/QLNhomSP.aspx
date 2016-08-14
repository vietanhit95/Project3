<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/QuanTri.Master" AutoEventWireup="true" CodeBehind="QLNhomSP.aspx.cs" Inherits="DoAn3.Admin.QLNhomSP" %>

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
            <div class="Hdtext">Loại Sản Phẩm</div>
            <br />
            <div>
                <img src="imange/towred1-r.gif" style="float: left" /><a href="ThemLoaiSP.aspx" class="Link">Thêm Loại Sản phẩm</a>
            </div>
            <br />
            <div>
                <img src="imange/towred1-r.gif" style="float: left" /><a href="QLLoaiSP.aspx" class="Link">Danh Sách Loại SP</a>
            </div>
            <br />
            <div class="Hdtext">Nhóm Sản Phẩm</div>
            <br />
            <div>
                <img src="imange/towred1-r.gif" style="float: left" /><a href="ThemNhomSP.aspx" class="Link">Thêm Nhóm Sản Phẩm</a>
            </div>
            <br />
            <div>
                <img src="imange/towred1-r.gif" style="float: left" /><a href="QLNhomSP.aspx" class="Link">Danh Sách Nhóm SP</a>
            </div>
            <br />
        </div>

        <div id="content-right">
            <div style="text-align: center; color: white; background-color: #555;margin-left:180px; margin-top:25px; height: 20px; padding-top: 10px; width: 81%;">
                DANH SÁCH NHÓM SẢN PHẨM
            </div>
            <asp:GridView ID="GrvNhomSP" runat="server" AutoGenerateColumns="False"
                Style="text-align: center; margin-left:180px;" Width="81%" Font-Size="13px" DataKeyNames="Ma_NhomSP" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Ma_NhomSP" HeaderText="Mã Nhóm" SortExpression="Ma_NhomSP" ReadOnly="True" />
                    <asp:BoundField DataField="TenNhom" HeaderText="Tên Nhóm" SortExpression="TenNhom" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DoAn3ConnectionString %>"
                DeleteCommand="delete from [NHOMSP] where [Ma_NhomSP]=@Ma_NhomSP"
                InsertCommand="Insert into [NHOMSP] ([Ma_NhomSP], [TenNhom]) values (@Ma_NhomSP, @TenNhom)"
                SelectCommand="select * from [NHOMSP]"
                UpdateCommand="Update [NHOMSP] set [TenNhom]=@TenNhom where [Ma_NhomSP]=@Ma_NhomSP">
                <DeleteParameters>
                    <asp:Parameter Name="Ma_NhomSP" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Ma_NhomSP" />
                    <asp:Parameter Name="TenNhom" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TenNhom" />
                    <asp:Parameter Name="Ma_NhomSP" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>

</asp:Content>
