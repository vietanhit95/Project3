<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QLHoaDonBan.aspx.cs" Inherits="DoAn3.Admin.HoaDon.QLHoaDonBan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        *
        {
            margin:0;
            padding:0;
            text-align: center;
        }
        a:hover{
            text-decoration:underline;
        color:red;
        cursor:pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style = "width:775px;height : 25px; text-align:center ; padding-top:10px; background-color: #555;color:white" >
            DANH SÁCH ĐƠN HÀNG ĐÃ GIẢI QUYẾT</div>
        <asp:GridView ID="grvHDB" runat="server" AutoGenerateColumns="False" onrowdeleting="grvHDB_RowDeleting" 
            Width="775px" CellPadding="0" Font-Size="14px" 
        onpageindexchanging="grvHDB_PageIndexChanging" AllowPaging="True" >
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LbID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Khách Hàng">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HoTen") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("HoTen") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="UserName" HeaderText="Tài khoản" />
                <asp:TemplateField HeaderText="Ngày giao hàng">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("NgayGiaoHang") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("NgayGiaoHang") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="SoLuongSP" HeaderText="Số lượng" />
                <asp:BoundField DataField="TongTien" HeaderText="Thành tiền" />
                <asp:TemplateField HeaderText="Xóa" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="delete" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete" OnClientClick='return confirm ("Bạn chắc chắn xóa hóa đơn này không ?");'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle Height="200px" />
            <RowStyle Height="30px" />
        </asp:GridView>
    </form>
</body>
</html>
