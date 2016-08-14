<%@ Page Language="C#" AutoEventWireup="true" CodeFile="show_giohang.aspx.cs" Inherits="show_giohang" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 298px; width: 658px">
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            onrowcancelingedit="GridView1_RowCancelingEdit" 
            onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" onrowupdating="GridView1_RowUpdating" 
            >
            <Columns>
                <asp:TemplateField HeaderText="productid">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("productid") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="productname">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("productname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="unitprice">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("unitprice") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="quantity" HeaderText="quantity" />
                <asp:TemplateField HeaderText="subtotal">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("subtotal") %>'></asp:Label>
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
