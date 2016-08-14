<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QLDonHang.aspx.cs" Inherits="DoAn3.Admin.HoaDon.QLDonHang" %>

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
        <div style="width: 775px; height: 25px; text-align: center; padding-top: 10px; background-color: #555; color: white">
            DANH SÁCH ĐƠN HÀNG CHƯA HOÀN THÀNH
        </div>
        <asp:GridView ID="grvDH" runat="server" AutoGenerateColumns="False" OnRowDeleting="grvDH_RowDeleting"
            Width="775px" CellPadding="0" Font-Size="14px" OnSelectedIndexChanging="grvDH_SelectedIndexChanging"
            AllowPaging="True" OnPageIndexChanging="grvDH_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="lbID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ngày đặt hàng">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("NgayDatHang") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("NgayDatHang") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Khách hàng">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("HoTen") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("HoTen") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tài khoản">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LbTaiKhoan" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="SĐT" DataField="SoDT" />
                <asp:TemplateField HeaderText="Tên sản phẩm">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("TenSP") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("TenSP") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Số lượng">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("SoLuongMua") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LbSoLuongSP" runat="server" Text='<%# Bind("SoLuongMua") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tổng tiền">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ThanhTien") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LbTongtien" runat="server" Text='<%# Bind("ThanhTien") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Thanh toán">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server"
                            Text='<%# Bind("HinhThucThanhToan") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("HinhThucThanhToan") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False" HeaderText="">
                    <ItemTemplate>
                        <asp:LinkButton ID="giaiquyet" runat="server" CausesValidation="False"
                            CommandName="Select" Text="Hoàn Thành" OnClientClick='return confirm ("Bạn có muốn giải quyết hóa đơn này ?");'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="delete" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete" OnClientClick='return confirm ("Bạn có muốn xóa hóa đơn này ?");'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle Height="200px" />
            <RowStyle Height="30px" />
        </asp:GridView>
    </form>
</body>
</html>
