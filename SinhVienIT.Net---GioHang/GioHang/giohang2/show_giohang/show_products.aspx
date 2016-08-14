<%@ Page Language="C#" AutoEventWireup="true" CodeFile="show_products.aspx.cs" Inherits="show_products" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style1
        {
            width: 59%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style2">
        <tr>
            <td>
    
        <asp:DataList ID="DataList1" runat="server" DataKeyField="productid" 
            onitemcommand="DataList1_ItemCommand" RepeatColumns="2">
            <ItemTemplate>
                <table class="style1">
                    <tr>
                        <td>
                            Productid</td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Productid") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Productname</td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("productname") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            unitprice</td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("unitprice") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btn_buy" runat="server" CommandName="BuyIt" Text="BuyIt" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
            </td>
            <td>
                <asp:GridView ID="GridView1" runat="server">
                </asp:GridView>
                <br />
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="Button1" runat="server"  
        Text="Showhang" onclick="Button1_Click1" />
    </form>
</body>
</html>
