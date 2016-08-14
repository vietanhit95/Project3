<%@ Page Language="C#" AutoEventWireup="true" CodeFile="show_product.aspx.cs" Inherits="show_product" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DataList ID="DataList1" runat="server" DataKeyField="productid" 
            onitemcommand="DataList1_ItemCommand" RepeatColumns="3">
            <ItemTemplate>
                <table cellspacing="1" class="style1">
                    <tr>
                        <td>
                            ProductID</td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("productid") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ProductName</td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("productname") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            UnitPrice</td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("unitprice") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="Button2" runat="server" CommandName="buyit" 
                                onclick="Button2_Click" Text="buyit" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    
    </div>
    <br />
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
        Text="Show Gio Hang" />
    </form>
</body>
</html>
