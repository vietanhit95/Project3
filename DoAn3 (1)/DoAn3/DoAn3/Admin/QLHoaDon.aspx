<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/QuanTri.Master" AutoEventWireup="true" CodeBehind="QLHoaDon.aspx.cs" Inherits="DoAn3.Admin.QLHoaDon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" language="javascript">
        function qldh() {
            document.getElementById("demo").innerHTML = "<iframe src='HoaDon/QLDonHang.aspx' frameborder='0' style='width: 775px; height: 490px;'></iframe>";
        }
        function qlhdb() {
            document.getElementById("demo").innerHTML = "<iframe src='HoaDon/QLHoaDonBan.aspx' frameborder='0' style='width: 775px; height: 490px;'></iframe>";
        }
        function themdh() {
            document.getElementById("demo").innerHTML = "<iframe src='HoaDon/ThemDonHang.aspx' frameborder='0' style='width: 775px; height: 490px;'></iframe>"
        }
    </script>

    <style type="text/css">
        .div:hover {
            cursor: pointer;
            color: red;
        }

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
            width: 178px;
            border-left: 1px solid #CCC;
            border-right: 1px solid #CCC;
            border-bottom: 1px solid #CCC;
        }

        #demo {
            height: 494px;
            width: 782px;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main">
        <div id="content-left">
            <div class="Hdtext">QUẢN LÝ HÓA ĐƠN</div>
            <br />
            <div class="div" onclick="qldh()">
                <img src="imange/towred1-r.gif" style="float: left" />Đơn Hàng
            </div>
            <br />
            <div class="div" onclick="qlhdb()">
                <img src="imange/towred1-r.gif" style="float: left" />Đơn hàng đã giải quyết
            </div>
            <br />
            <div class="div" onclick="themdh()">
                <img src="imange/towred1-r.gif" style="float: left" />Thêm đơn hàng
            </div>
            <br />
            <br />
            <%--   <div style="margin-left:30px">
        </div>--%>
        </div>
        <div id="content-right">
            <div style="float: left; height: 18px; padding: 14px; width: 692px; font-size: 20px; color: #555">
                <strong>QUẢN LÝ HÓA ĐƠN</strong>
            </div>
            <div style="padding-left: 681px;">
                <asp:Button ID="btthem" runat="server"
                    Style="background: url(imange/sg.jpg); width: 55px; height: 65px;" PostBackUrl="~/Admin/HoaDon/ThemDonHang.aspx" />
            </div>
            <div id="demo" style="margin-left: 180px;">
                <iframe src='HoaDon/QLDonHang.aspx' frameborder='0' style='width: 775px; height: 490px;'></iframe>
            </div>
        </div>
    </div>
</asp:Content>
