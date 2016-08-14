<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/QuanTri.Master" AutoEventWireup="true" CodeBehind="ThemNhomSP.aspx.cs" Inherits="DoAn3.Admin.ThemNhomSP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
            .style2
    {
        
        text-align: right;
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
        <div id="contenright">
            <div style="text-align: center; color: white; background-color: #555; margin-left: 180px; margin-top: 25px; height: 20px; padding-top: 10px; width: 81%;">
                THÊM NHÓM SẢN PHẨM
            </div>
            <br />
            <table style="width: 81%; margin-left:180px;">
                <tr>
                    <td class="style2" style="text-align: center">Mã Nhóm</td>
                    <td>
                        <asp:TextBox ID="txtMaNhom" runat="server" Width="170px"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td class="style2" style="text-align: center">Tên Nhóm</td>
                    <td>
                        <asp:TextBox ID="txtTenNhom" runat="server" Width="170px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Button ID="Button1" runat="server" Text="Thêm" OnClick="Button1_Click" />
                        <input id="Reset1" type="reset" value="Làm Mới" />
                    </td>

                </tr>
            </table>
        </div>
    </div>
</asp:Content>
