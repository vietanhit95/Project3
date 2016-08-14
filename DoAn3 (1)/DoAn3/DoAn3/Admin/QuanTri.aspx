<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/QuanTri.Master" AutoEventWireup="true" CodeBehind="QuanTri.aspx.cs" Inherits="DoAn3.Admin.QuanTri" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .danhmuc {
            width: 100px;
            height: 100px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <p>
        <center> 
     <!-- Hiệu ứng chữ chạy -->
       <div style=" font: normal bold 20px Times">
<script language="JavaScript1.2">
var message="CHÀO MỪNG BẠN ĐẾN VỚI TRANG QUẢN TRỊ ! "//Chữ cần tạo hiệu ứng
var neonbasecolor= "Red"//#FFA500Mầu chữ ban đầu
var neontextsize="40"
var neontextcolor="green"//Hiệu ứng màu 1
var neontextcolor2="blue"//Hiệu ứng màu 2
var flashspeed=100 //Tốc độ của hiệu ứng
var flashingletters=2 // Số chữ thay đổi màu của lần 1
var flashingletters2=1 // Số chữ thay đổi màu của lần 2
var flashpause=0 // the pause between flash-cycles in milliseconds

///No need to edit below this line/////

var n=0
if (document.all||document.getElementById){
document.write('<font color="'+neonbasecolor+'">')
for (m=0;m<message.length;m++)
document.write('<span id="neonlight'+m+'">'+message.charAt(m)+'</span>')
document.write('</font>')
}
else
document.write(message)

function crossref(number){
var crossobj=document.all? eval("document.all.neonlight"+number) : document.getElementById("neonlight"+number)
return crossobj
}

function neon(){

//Change all letters to base color
if (n==0){
for (m=0;m<message.length;m++)
crossref(m).style.color=neonbasecolor
}

//cycle through and change individual letters to neon color
crossref(n).style.color=neontextcolor

if (n>flashingletters-1) crossref(n-flashingletters).style.color=neontextcolor2 
if (n>(flashingletters+flashingletters2)-1) crossref(n-flashingletters-flashingletters2).style.color=neonbasecolor


if (n<message.length-1)
n++
else{
n=0
clearInterval(flashing)
setTimeout("beginneon()",flashpause)
return
}
}
function beginneon(){
if (document.all||document.getElementById)
flashing=setInterval("neon()",flashspeed)
}
beginneon()
</script>
<img src="imange/imgMenu/matcuoi.gif" id="sd" />
</div>

<!-- End Hiệu ứng chữ chạy -->
    </p>
    <%--<p>
           <br />
           </p>--%>
    <br />
    <p>
        <br />
    </p>
    <table>
        <tr>
            <td>
                <div style="width: 200px; height: 120px; text-align: center;">
                    <a href="QLSanPham.aspx">
                        <asp:Image ID="Image1" runat="server" CssClass="danhmuc" ImageUrl="imange/imgMenu/sanpham.jpg" /><br />
                        Sản Phẩm</a>
                </div>
            </td>
            <td>
                <div style="width: 200px; height: 120px; text-align: center;">
                    <a href="QuanLyHSX.aspx">
                        <asp:Image ID="Image2" runat="server" CssClass="danhmuc" ImageUrl="imange/imgMenu/hang.png" /><br />
                        Hãng sản xuất & NCC</a>
                </div>
            </td>
            <td>
                <div style="width: 200px; height: 120px; text-align: center;">
                    <a href="QLHoaDon.aspx">
                        <asp:Image ID="Image3" runat="server" CssClass="danhmuc" ImageUrl="imange/imgMenu/hoadon.jpg" /><br />
                        Hóa Đơn</a>
                </div>
            </td>
            <td>
                <div style="width: 200px; height: 120px; text-align: center;">
                    <a href="QLThanhVien.aspx">
                        <asp:Image ID="Image4" runat="server" CssClass="danhmuc" ImageUrl="imange/imgMenu/taikhoan.png" /><br />
                        Thành Viên</a>
                </div>
            </td>
        </tr>
    </table>
    <div style="margin-top: 220px">
        Copyright 2015 by Nguyễn Hoàng Anh - Nguyễn Việt Anh
    </div>
    </center>
    

</asp:Content>
