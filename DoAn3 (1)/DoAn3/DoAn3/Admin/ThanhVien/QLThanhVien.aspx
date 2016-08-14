<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QLThanhVien.aspx.cs" Inherits="DoAn3.Admin.ThanhVien.QLThanhVien" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .button {
            width: 81px;
            background-image: url(../button-o.gif);
            background-repeat: no-repeat;
            border: 0;
            font: Tahoma;
            color: #FFFFFF;
            height: 26px;
            margin-left: -3px;
        }
        .txtTK {
            font-size: 13px;
            color: #000000;
            height: 22px;
            border: 1px solid #999;
            width: 286px;
            margin-left: 30px;
            margin-top: 9px;
            border-radius: 5px;
            z-index: 11;
            padding-left: 4px;
        }
        
        #form1 {
            width: 777px;
            margin:auto;
        }
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
    <div style="height:28px; padding:14px;width:700px;font-size:20px;margin-left:12px;">
    <strong>QUẢN LÝ THÀNH VIÊN</strong>
        <asp:TextBox ID="txtTimKiem" runat="server" CssClass="txtTK"></asp:TextBox>
        <asp:Button ID="btTimKiem" runat="server" Text="Tìm Kiếm" CssClass="button" OnClick="btTimKiem_Click" />
    </div>
        <div style="width:780px; height:25px; text-align:center;padding-top:10px;background-color:#555;color:white;">DANH SÁCH THÀNH VIÊN</div>
        <asp:GridView ID="grvTV" runat="server" AutoGenerateColumns="False" 
            OnRowDeleting="grvTV_RowDeleting" OnPageIndexChanging="grvTV_PageIndexChanging"
             AllowPaging="True" Width="780px" CellPadding="0" Font-Size="15px">
            <Columns>
                <asp:TemplateField HeaderText="Mã TV">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Ma_TV") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Ma_TV") %>'></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quyền">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="TenQuyen" 
                            DataValueField="Ma_PQ" DataSourceID="SqlDataSource1"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:DoAn3ConnectionString %>" 
                            SelectCommand="SELECT * FROM [PHANQUYEN]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên đăng nhập">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Họ tên">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("HoTen") %>'>'></asp:TextBox>
                    </EditItemTemplate>
                        
                        <ItemTemplate>
                     <asp:Label ID="Label4" runat="server" Text='<%# Bind("HoTen") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Giới tính">
                     <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server">
                            <asp:ListItem>Nam</asp:ListItem>
                            <asp:ListItem>Nữ</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("GioiTinh") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email"> 
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SĐT">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("SoDT") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("SoDT") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Địa chỉ">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("DiaChi") %>' 
                            Height="60px" TextMode="MultiLine" Width="170px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("DiaChi") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sửa">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Ma_TV", "SuaTV.aspx?Ma_TV={0}") %>' Text="Edit"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Xóa">
                    <ItemTemplate>
                        <asp:LinkButton ID="LbXoa" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete" OnClientClick='return confirm ("Bạn muốn xóa thành viên này ?");'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>
    </form>
        
</body>
</html>
