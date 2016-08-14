using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using DoAn3.Utility;

namespace DoAn3.Utility
{
    public class CongCu
    {
        public static int Kiemtra(string ID, string tenTable, string column)
        {
            string sql = string.Format("select COUNT (*) from {0} where {1} ='" + ID + "'", tenTable, column);
            return (int)Connect.get(sql);
        }
        public static int LaySLSP(string masp)
        {
            string sql = string.Format("select SoLuong from SANPHAM where Ma_SP ={0}", masp);
            return (int)Connect.get(sql);
        }
        public static string Laymatheoten(string ID, string ma, string ten, string table)
        {
            string sql = string.Format("select {0} from {1} where {2} = '" + ID + "'", ma, table, ten);
            return Connect.get(sql).ToString();
        }
        public static string Laygiasptheoma(string ma)
        {
            string sql = "select GiaBan from SanPham where Ma_SP = + '" + ma + "'";
            return Connect.get(sql).ToString();
        }
        public static bool KiemtraSDT(string phoneNumber)
        {
            long lphoneNumber;
            return ((phoneNumber.Length >= 9) && (phoneNumber.Length <= 11) && (phoneNumber[0] == '0') && (long.TryParse(phoneNumber, out lphoneNumber))) ? true : false;
        }
        public static int Kiemtrataikhoan(string user, string pass)
        {
            string sql = "select COUNT (*) from THANHVIEN where USERNAME ='" + user + "' and  Pass = '" + pass + "'";
            return (int)Connect.get(sql);
        }
        public static int Layquyen(string user)
        {
            string sql = string.Format("select Ma_PQ from THANHVIEN where UserName = '" + user + "'");
            return (int)Connect.get(sql);
        }
    }
}