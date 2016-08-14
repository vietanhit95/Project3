<%@ Page Language="C#" AutoEventWireup="true" CodeFile="product_show_images.aspx.cs" Inherits="product_show_images" %>

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
    
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="3">
            <ItemTemplate>
                <table cellspacing="1" class="style1">
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" Height="77px" 
                                ImageUrl='<%# Eval("photos") %>' Width="121px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ProductName:
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("productname") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            UnitPrice:
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("unitprice") %>'></asp:Label>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    
    </div>
    </form>
</body>
</html>
