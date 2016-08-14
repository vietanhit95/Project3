<%@ Page Language="C#" AutoEventWireup="true" CodeFile="show_giohang.aspx.cs" Inherits="show_giohang" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="productid" onrowdeleting="GridView1_RowDeleting" 
            onrowediting="GridView1_RowEditing" onrowupdating="GridView1_RowUpdating" 
            Width="292px">
            <Columns>
                <asp:TemplateField HeaderText="ProductID">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("productid") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ProductName">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("productname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="UnitPrice">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("unitprice") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="quantity" HeaderText="Quantity" />
                <asp:TemplateField HeaderText="SubTotal">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("subtotal") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    
    </div>
    </form>
</body>
</html>
