<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuaTV.aspx.cs" Inherits="DoAn3.Admin.ThanhVien.SuaTV" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" >

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title></title>
    <style type="text/css">
        .style7
        {
            width: 256px;
            text-align: center;
        }
        
    </style>
   
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="Ma_TV" 
        DataSourceID="SqlDataSource1" DefaultMode="Edit" Width="896px" 
                HeaderText="SỬA THÀNH VIÊN" Height="475px">
        <EditItemTemplate>
            &nbsp;<asp:Label ID="Ma_TVLabel1" runat="server" Text='<%# Eval("Ma_TV") %>' 
                Visible="False" />
            <br />
            <table style="width:775px">
                <tr>
                    <td class="style7">
                        Phân quyền</td>
                    <td>
                        <asp:DropDownList ID="drPQ" runat="server" DataSourceID="SqlDataSource1" 
                            DataTextField="TenQuyen" DataValueField="Ma_PQ" Height="17px" 
                            SelectedValue='<%# Bind("Ma_PQ") %>' Width="135px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:D0An3ConnectionString %>" 
                            SelectCommand="SELECT * FROM [PHANQUYEN]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        Tên đăng nhập
                    </td>
                    <td>
                        <asp:TextBox ID="UserNameTextBox" runat="server" Enabled="False" 
                            Text='<%# Bind("UserName") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        Mật khẩu
                    </td>
                    <td>
                        <asp:TextBox ID="PassTextBox" runat="server" Text='<%# Bind("Pass") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="PassTextBox" Display="Dynamic" 
                            ErrorMessage="Không được bỏ trống"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        Họ tên</td>
                    <td>
                        <asp:TextBox ID="HoTenTextBox" runat="server" Text='<%# Bind("HoTen") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="HoTenTextBox" Display="Dynamic" 
                            ErrorMessage="Không được bỏ trống"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        Giới tính</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            SelectedValue='<%# Bind("GioiTinh") %>'>
                            <asp:ListItem>Nam</asp:ListItem>
                            <asp:ListItem>Nu</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        Email:
                    </td>
                    <td>
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="EmailTextBox" Display="Dynamic" 
                            ErrorMessage="Không được bỏ trống"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="EmailTextBox" Display="Dynamic" 
                            ErrorMessage="Sai định dạng" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        Số điên thoại</td>
                    <td>
                        <asp:TextBox ID="SoDTTextBox" runat="server" Text='<%# Bind("SoDT") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="SoDTTextBox" Display="Dynamic" 
                            ErrorMessage="Không được bỏ trống"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" 
                            ControlToValidate="SoDTTextBox" Display="Dynamic" 
                            ErrorMessage="Chỉ được nhập sô" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                        <asp:Label ID="lbSDT" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        Địa chỉ</td>
                    <td>
                        <asp:TextBox ID="DiaChiTextBox" runat="server" Height="72px" 
                            Text='<%# Bind("DiaChi") %>' TextMode="MultiLine" Width="221px" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="DiaChiTextBox" Display="Dynamic" 
                            ErrorMessage="Không được bỏ trống"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        Ngày sinh</td>
                    <td>
                        <asp:TextBox ID="NgaySinhTextBox" runat="server" Text='<%# Bind("NgaySinh") %>' 
                            Width="90px" />
                        <asp:ListBox ID="LbxNgay" runat="server" Height="23px" Rows="1" Width="110px">
                            <asp:ListItem Value="0">Chọn ngày</asp:ListItem>
                        </asp:ListBox>
                        &nbsp;/&nbsp;<asp:ListBox ID="LbxThang" runat="server" Rows="1" Width="106px" 
                            Height="24px">
                            <asp:ListItem Value="0">Chọn tháng</asp:ListItem>
                        </asp:ListBox>
                        &nbsp;/&nbsp;<asp:ListBox ID="LbxNam" runat="server" Rows="1" Width="90px">
                            <asp:ListItem Value="0">Chọn năm</asp:ListItem>
                        </asp:ListBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style=" text-align:right">
                        &nbsp;
                    </td>
                    <td>
                        <asp:LinkButton ID="lbSua" runat="server" ForeColor="#0000CC" 
                            onclick="lbSua_Click">Cập nhật</asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" ForeColor="#0000CC" 
                            Text="Cancel" />
                    </td>
                </tr>
            </table>
        </EditItemTemplate>
        <HeaderStyle BackColor="Red" ForeColor="White" Height="34px" 
            HorizontalAlign="Center" />
        <InsertItemTemplate>
            Ma_PQ:
            <asp:TextBox ID="Ma_PQTextBox" runat="server" Text='<%# Bind("Ma_PQ") %>' />
            <br />
            UserName:
            <asp:TextBox ID="UserNameTextBox0" runat="server" 
                Text='<%# Bind("UserName") %>' />
            <br />
            Pass:
            <asp:TextBox ID="PassTextBox0" runat="server" Text='<%# Bind("Pass") %>' />
            <br />
            HoTen:
            <asp:TextBox ID="HoTenTextBox0" runat="server" Text='<%# Bind("HoTen") %>' />
            <br />
            GioiTinh:
            <asp:TextBox ID="GioiTinhTextBox" runat="server" 
                Text='<%# Bind("GioiTinh") %>' />
            <br />
            Email:
            <asp:TextBox ID="EmailTextBox0" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            SoDT:
            <asp:TextBox ID="SoDTTextBox0" runat="server" Text='<%# Bind("SoDT") %>' />
            <br />
            DiaChi:
            <asp:TextBox ID="DiaChiTextBox0" runat="server" Text='<%# Bind("DiaChi") %>' />
            <br />
            NgaySinh:
            <asp:TextBox ID="NgaySinhTextBox0" runat="server" 
                Text='<%# Bind("NgaySinh") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Ma_TV:
            <asp:Label ID="Ma_TVLabel" runat="server" Text='<%# Eval("Ma_TV") %>' />
            <br />
            Ma_PQ:
            <asp:Label ID="Ma_PQLabel" runat="server" Text='<%# Bind("Ma_PQ") %>' />
            <br />
            UserName:
            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Bind("UserName") %>' />
            <br />
            Pass:
            <asp:Label ID="PassLabel" runat="server" Text='<%# Bind("Pass") %>' />
            <br />
            HoTen:
            <asp:Label ID="HoTenLabel" runat="server" Text='<%# Bind("HoTen") %>' />
            <br />
            GioiTinh:
            <asp:Label ID="GioiTinhLabel" runat="server" Text='<%# Bind("GioiTinh") %>' />
            <br />
            Email:
            <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            SoDT:
            <asp:Label ID="SoDTLabel" runat="server" Text='<%# Bind("SoDT") %>' />
            <br />
            DiaChi:
            <asp:Label ID="DiaChiLabel" runat="server" Text='<%# Bind("DiaChi") %>' />
            <br />
            NgaySinh:
            <asp:Label ID="NgaySinhLabel" runat="server" Text='<%# Bind("NgaySinh") %>' />
            <br />
        </ItemTemplate>
    </asp:FormView>
      
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DoAn3ConnectionString %>" 
            SelectCommand="SELECT * FROM [THANHVIEN] WHERE ([Ma_TV] = @Ma_TV)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Ma_TV" QueryStringField="Ma_TV" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
