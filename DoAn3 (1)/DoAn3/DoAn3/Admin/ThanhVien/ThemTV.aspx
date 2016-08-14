<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemTV.aspx.cs" Inherits="DoAn3.ThemTV" %>

<!DOCTYPE html  PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style2
        {
            text-align: center;
            height: 38px;
            color: #FFFFFF;
            background-color: #555;
            font-size:20px;
        }
        .style1
        {
            text-align:center;
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
            width: 252px;
            height: 33px;
        }
        #form1{
            width:777px;
            margin:auto;
        }
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
    
    <div style="width:780px; border:0;">
        <table cellpadding="0" cellspacing="0" style="width:100%; height:147px;">
            <tr>
                <td class="style2" colspan="2">
                    THÊM THÀNH VIÊN
                </td>
            </tr>
            <tr>
                <td class="style5">Họ tên</td>
                <td class="style6">
                    <asp:TextBox ID="txtHoTen" Width="182px" MaxLength="50" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5">Tên đăng nhập</td>
                <td class="style6">
                    <asp:TextBox ID="txtTenTK" Width="182px" MaxLength="50" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                 <td class="style5">Mật khẩu</td>
                <td>
                    <asp:TextBox ID="txtMatKhau" Width="182px" MaxLength="50" TextMode="Password" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                 <td class="style5">Nhập Lại Mật khẩu</td>
                <td>
                    <asp:TextBox ID="txtNhapLaimk" Width="182px" MaxLength="50" TextMode="Password" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="cmpMk"  ErrorMessage="errormessage" ControlToValidate="txtNhapLaimk" runat="server" Text="Mật Khẩu Nhập Không Hợp Lệ" />
                </td>
            </tr>
            <tr>
                 <td class="style5">Giới tính</td>
                <td>
                    <asp:DropDownList ID="drGioiTinh" Height="22px" Width="63px" runat="server">
                        <asp:ListItem>Nam</asp:ListItem>
                        <asp:ListItem>Nu</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                 <td class="style5">Ngày sinh</td>
                <td>
                    <asp:DropDownList ID="drNgay" runat="server">
                        <asp:ListItem Value="0">Chọn ngày</asp:ListItem>
                    </asp:DropDownList> / 
                    <asp:DropDownList ID="drThang" runat="server">
                        <asp:ListItem Value="0">Chọn tháng</asp:ListItem>
                    </asp:DropDownList> / 
                    <asp:DropDownList ID="drNam" runat="server">
                        <asp:ListItem Value="0">Chọn năm</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style5">Số điện thoại</td>
                <td>
                    <asp:TextBox ID="txtSDT" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5">Email</td>
                <td>
                    <asp:TextBox ID="txtEmail" MaxLength="50" runat="server"></asp:TextBox>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Sai định dạng" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style5">Địa chỉ</td>
                <td>
                    <asp:TextBox ID="txtDiaChi" Height="74px" Width="182px" TextMode="MultiLine" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1" colspan="2">
                    <div style="float:left;margin-left:224px;">
                        <asp:Button ID="Them" runat="server" Text="Thêm" OnClick="Them_Click" />
                         &nbsp;<input type="reset" value="reset" id="Reset1" />
                    </div>
                </td>
            </tr>
        </table>
    </div>
   
    </form>
       
</body>
</html>
