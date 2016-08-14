<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemDonHang.aspx.cs" Inherits="DoAn3.Admin.HoaDon.ThemDonHang" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        *
        {
            margin:0;
            padding:0;
            }
        .style1
        {
            text-align: center;
        }
        .style2
        {
            text-align: center;
            height: 38px;
            color: #FFFFFF;
            background-color: #555;
        }
        
        .style4
        {
            text-align: center;
            width: 262px;
            height: 32px;
        }
      
         td
         {
             padding-left:70px;
             padding-top:4px;
             padding-bottom:4px;
             border-left:1px dotted black;
             border-bottom:1px dotted black;
             border-right:1px dotted black;
             }
        .style5
        {
            text-align: center;
            width: 262px;
            height: 33px;
        }
        .style6
        {
            height: 33px;
        }
     
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div style=" width: 775px;border: 0;">
            <table cellpadding="0" cellspacing="0" style="width:100%; height: 147px;">
                <tr>
                    <td class="style2" colspan="2">
                       THÊM ĐƠN HÀNG</td>
                </tr>
                <tr>
                    <td class="style4">
                        Tên tài khoản </td>
                    <td>
                        <asp:DropDownList ID="drtentk" runat="server" 
                            DataSourceID="SqlDataSource2" DataTextField="UserName" DataValueField="Ma_TV" 
                            Height="25px" Width="188px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:DoAn3ConnectionString %>" 
                            SelectCommand="SELECT [Ma_TV], [UserName] FROM [THANHVIEN]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        Tên sản phẩm </td>
                    <td class="style6">
                        <asp:DropDownList ID="drTensp" runat="server" 
                            DataSourceID="SqlDataSource1" DataTextField="TenSP" DataValueField="Ma_SP" 
                            Height="22px" Width="188px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:DoAn3ConnectionString %>" 
                            SelectCommand="SELECT [Ma_SP], [TenSP] FROM [SANPHAM]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Số lượng</td>
                    <td>
                        <asp:TextBox ID="txtSoLuong" runat="server" Width="118px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="txtSoLuong" ErrorMessage="Bạn chưa nhập số lượng" 
                            ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Ngày đặt hàng</td>
                    <td>
                        <asp:TextBox ID="txtNgayDatHang" runat="server" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        Hình thức thanh toán</td>
                    <td>
                        <asp:DropDownList ID="drHTTT" runat="server" Height="19px" Width="124px">
                            <asp:ListItem>online</asp:ListItem>
                            <asp:ListItem>Tiền mặt</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style1" colspan="2">
                        <div style="float:left ; margin-left:224px">
                            <asp:Button ID="Them" runat="server" 
                            Text="Thêm" onclick="Them_Click" />
                        &nbsp;<input id="Reset1" type="reset" value="reset" />
                            </div>
                        </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
