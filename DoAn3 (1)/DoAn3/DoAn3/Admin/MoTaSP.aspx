<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MoTaSP.aspx.cs" Inherits="DoAn3.Admin.MoTaSP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="Ma_SP" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                Ma_SP:
                <asp:Label ID="Ma_SPLabel1" runat="server" Text='<%# Eval("Ma_SP") %>' />
                <br />
                MoTa:
                <asp:TextBox ID="MoTaTextBox" runat="server" Text='<%# Bind("MoTa") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                MoTa:
                <asp:TextBox ID="MoTaTextBox" runat="server" Text='<%# Bind("MoTa") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <br />
                <asp:Label ID="MoTaLabel" runat="server" Text='<%# Bind("MoTa") %>' />
                <br />

            </ItemTemplate>

        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DoAn3ConnectionString %>" SelectCommand="Select [Ma_SP],[MoTa] from [SANPHAM] where ([Ma_SP]=@Ma_SP)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Ma_SP" QueryStringField="Ma_SP" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
