<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/QuanTri.Master" AutoEventWireup="true" CodeBehind="QLLoaiSP.aspx.cs" Inherits="DoAn3.Admin.QLLoaiSP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .Hdtext {
            background-color: #222222;
            width: 168px;
            height: 26px;
            text-align: center;
            padding-top: 8px;
            color: white;
        }

        #content-left {
            float: left;
            width: 170px;
            border-left: 1px solid #CCC;
            border-right: 1px solid #CCC;
            border-bottom: 1px solid #CCC;
        }

        .timkiem-textbox {
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

        .button {
            width: 81px;
            background-image: url(button-2-o.gif);
            background-repeat: no-repeat;
            border: 0;
            font: Tahoma;
            color: #FFFFFF;
            height: 26px;
            margin-left: -3px;
        }

        .style3 {
            margin-left: 180px;
            text-align: center;
            width: 81%;
            font-size:13px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main">
        <div id="content-left">
            <div class="Hdtext">LOẠI SP</div>
            <br />
            <div>
                <img src="imange/towred1-r.gif" style="float: left" /><a href="ThemLoaiSP.aspx" class="Link">Thêm loại sản phẩm</a>
            </div>
            <br />
            <div>
                <img src="imange/towred1-r.gif" style="float: left" /><a href="QLLoaiSP.aspx" class="Link">Danh 
            sách loại sp</a>
            </div>
            <br />
            <div class="Hdtext">NHÓM SP</div>
            <br />
            <div>
                <img src="imange/towred1-r.gif" style="float: left" /><a href="ThemNhomSP.aspx" class="Link">Thêm 
            nhóm sản phẩm</a>
            </div>
            <br />
            <div>
                <img src="imange/towred1-r.gif" style="float: left" /><a href="QLNhomSP.aspx" class="Link">Danh 
            sách nhóm sp</a>
            </div>
            <br />
            <div class="Hdtext">Loại sản phẩm theo nhóm </div>
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1"
                OnItemCommand="DataList1_ItemCommand">
                <ItemTemplate>
                    <br />
                    <div style="width: 148px; margin-left: 30px">
                        <img src="imange/file_uf.gif"
                            style="height: 15px; width: 18px; float: left" />
                        <asp:Label ID="lbMa_NhomSP" runat="server" Text='<%# Eval("Ma_NhomSP") %>'
                            Visible="False"></asp:Label>
                        <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("TenNhom") %>'
                            CommandName="btNhomSP"></asp:LinkButton>
                        <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:DoAn3ConnectionString %>"
                SelectCommand="SELECT [TenNhom], [Ma_NhomSP] FROM [NHOMSP]"></asp:SqlDataSource>
        </div>
        <div id="content-right">
            <div style="float: left; height: 18px; padding: 14px; margin-top: 35px; width: 692px; font-size: 20px;" class="style1">
                <strong>QUẢN LÝ LOẠI SẢN PHẨM</strong>&nbsp;     
    <asp:TextBox ID="txtTimKiem" runat="server" CssClass="timkiem-textbox"></asp:TextBox>
                <asp:Button ID="btTimKiem" runat="server" Text="Tìm kiếm" CssClass="button"
                    OnClick="btTimKiem_Click" />
            </div>
            <div style="padding-left: 681px;">
                <asp:Button runat="server" Text="" OnClick="Unnamed_Click1"
                    Style="background: url(imange/sg.jpg); width: 55px; height: 65px; margin-top: 30px;" />
            </div>
            <div style="text-align: center; color: white; margin-left: 172px; background-color: #555; height: 25px; padding-top: 7px; width: 81%;">
                DANH SÁCH LOẠI SẢN PHẨM
            </div>
            <asp:GridView ID="GrvLoaiSP" runat="server"  onrowcancelingedit="GrvLoaiSP_RowCancelingEdit" onrowdeleting="GrvLoaiSP_RowDeleting"
                 AutoGenerateColumns="False" Width="778px"  onrowediting="GrvLoaiSP_RowEditing"  onrowupdating="GrvLoaiSP_RowUpdating" CssClass="style3">
                   <Columns>
                    <asp:TemplateField HeaderText="Mã loại sản phẩm">
                        <EditItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Ma_LoaiSP") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Ma_LoaiSP") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nhóm sản phẩm">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server"
                                DataSourceID="SqlDataSource1" DataTextField="TenNhom"
                                DataValueField="Ma_NhomSP">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:DoAn3ConnectionString %>"
                                SelectCommand="SELECT * FROM [NHOMSP]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("TenNhom") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tên loại sản phẩm">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TenLoaiSP") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("TenLoaiSP") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sủa" ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="Update" runat="server" CausesValidation="True"
                                CommandName="Update" Text="Update" OnClientClick='return confirm ("Bạn muốn sửa sản phẩm này ?");'></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="Cancel" runat="server" CausesValidation="False"
                                CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="Edit" runat="server" CausesValidation="False"
                                CommandName="Edit" Text="Edit"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Xóa" ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="Delete" runat="server" CausesValidation="False"
                                CommandName="Delete" Text="Delete" OnClientClick='return confirm ("Bạn muốn xóa sản phẩm này ?");'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            
        </div>
    </div>
</asp:Content>
