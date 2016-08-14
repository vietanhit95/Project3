<%@ Page Language="C#" AutoEventWireup="true" CodeFile="show_products.aspx.cs" Inherits="show_products" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 249px; width: 641px">
    
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            style="height: 26px" Text="Showhang" />
&nbsp;somonhang :
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            onrowcommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="productid" HeaderText="productid" />
                <asp:BoundField DataField="productname" HeaderText="productname" />
                <asp:BoundField DataField="unitprice" HeaderText="unitprice" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" 
                            CommandArgument='<%# Eval("productid") %>' CommandName="buyit">buyit</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
