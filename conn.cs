using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Otomotiv_Yedek_Parça_E_Ticaret_Sitesi
{
    public class conn
    {
        static SqlConnection con = getConnection();
        public static SqlConnection getConnection()
        {
            return new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=yedekparcaeticaret;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        }

        public static DataTable user(int userID)
        {
            
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select * from users where userID='" + userID + "' and Yetki=0", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static Boolean insertUser(string username,string password,string adi,string soyadi,string telefon,string adres)
        {
            SqlCommand komutNesnesi = new SqlCommand("insert into users(username,password,adi,soyadi,telefon,yetki) values(@username,@password,@adi,@soyadi,@telefon,@yetki)", con);
            komutNesnesi.Parameters.AddWithValue("@username",username);
            komutNesnesi.Parameters.AddWithValue("@password",password);
            komutNesnesi.Parameters.AddWithValue("@adi",adi);
            komutNesnesi.Parameters.AddWithValue("@soyadi",soyadi);
            komutNesnesi.Parameters.AddWithValue("@telefon",telefon);
            komutNesnesi.Parameters.AddWithValue("@adres",adres);
            komutNesnesi.Parameters.AddWithValue("@yetki",0);
            
            if (checkUser(username) == true)
            {
                return false;
            }
            else
            {
                con.Open();
                komutNesnesi.ExecuteNonQuery();
                con.Close();
                return true;
            }
        }

        public static Boolean checkUser(string username)
        {
            SqlCommand komutNesnesi = new SqlCommand("select * from users where username='" + username + "' and Yetki=0", con);
            con.Open();
            if (komutNesnesi.ExecuteScalar() != null)
            {
                con.Close();
                return true;
            }
            con.Close();
            return false;
        }

        public static void userSifre(int userID, string password)
        {
            SqlCommand komutNesnesi = new SqlCommand("update users set password='" + password + "' where userID='" + userID + "'", con);
            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();
        }

        public static void userAd(int userID, string ad)
        {
            SqlCommand komutNesnesi = new SqlCommand("update users set adi='" + ad + "' where userID='" + userID + "'", con);
            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();
        }

        public static void userSoyad(int userID, string soyad)
        {
            SqlCommand komutNesnesi = new SqlCommand("update users set soyadi='" + soyad + "' where userID='" + userID + "'", con);
            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();
        }

        public static void userTelefon(int userID, string telefon)
        {
            SqlCommand komutNesnesi = new SqlCommand("update users set telefon='" + telefon + "' where userID='" + userID + "'", con);
            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();
        }

        public static void userAdres(string adres,int adresID,string adresAdi)
        {
            SqlCommand komutNesnesi = new SqlCommand("update adresler set adresFull='" + adres + "',adres='"+adresAdi+"' where adresID='"+adresID+"'", con);
            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();
        }

        public static DataTable userSiparis(int userID)
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select DISTINCT siparisler.siparisID,siparisler.tarih,SUM(siparisler.adet*urunler.fiyat) as genelToplam,convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18 as KDV,(SUM(siparisler.adet*urunler.fiyat)-convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18) as KDVsiz from siparisler inner join urunler on urunler.urunID=siparisler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where userID='"+userID+ "' group by siparisler.siparisID,siparisler.tarih order by siparisler.tarih DESC", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static DataTable userSiparisOnly(int userID,int siparisID)
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select siparisler.siparisID,urunler.urun,kategoriler.kategori,siparisler.adet,siparisler.adres,siparisler.kargo,siparisler.kargoNo,siparisler.tarih,urunler.fiyat,urunler.fiyat*siparisler.adet as totalFiyat,siparisler.urunID from siparisler inner join urunler on urunler.urunID=siparisler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where userID='" + userID + "' and siparisler.siparisID='"+siparisID+"'", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static DataTable userSiparisAy(int userID)
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select DISTINCT siparisler.siparisID,siparisler.tarih,SUM(siparisler.adet*urunler.fiyat) as genelToplam,convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18 as KDV,(SUM(siparisler.adet*urunler.fiyat)-convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18) as KDVsiz from siparisler inner join urunler on urunler.urunID=siparisler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where userID='" + userID + "' and convert(datetime,siparisler.tarih,104)>getdate()-30  group by siparisler.siparisID,siparisler.tarih order by siparisler.tarih DESC", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static DataTable userSiparisYil(int userID)
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select DISTINCT siparisler.siparisID,siparisler.tarih,SUM(siparisler.adet*urunler.fiyat) as genelToplam,convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18 as KDV,(SUM(siparisler.adet*urunler.fiyat)-convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18) as KDVsiz from siparisler inner join urunler on urunler.urunID=siparisler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where userID='"+userID+ "' and year(convert(datetime,siparisler.tarih,104))=year(getdate()) or (year(convert(datetime,siparisler.tarih,104))=year(getdate())-1 and month(convert(datetime,siparisler.tarih,104))-month(getdate())>=0) and (year(convert(datetime,siparisler.tarih,104))=year(getdate())-1 and month(convert(datetime,siparisler.tarih,104))=month(getdate()) and day(convert(datetime,siparisler.tarih,104))-day(getdate())>=0) group by siparisler.siparisID,siparisler.tarih order by siparisler.tarih DESC", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static DataTable userAdres(int userID)
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select * from adresler where userID='" + userID + "'", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static DataTable userAdres2(int userID,int adresID)
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select * from adresler where userID='" + userID + "' and adresID='"+adresID+"'", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static void userAdresEkle(int userID,string adresFull,string adres)
        {
            SqlCommand komutNesnesi = new SqlCommand("insert into adresler(adres,userID,adresFull) values('"+adres+"','"+userID+"','"+adresFull+"')", con);

            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();
        }

        public static void userAdresSil(int adresID)
        {
            SqlCommand komutNesnesi = new SqlCommand("delete from adresler where adresID='"+adresID+"'", con);

            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();
        }

        public static Boolean userHasItemBasket(string userID, int urunID)
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select * from sepetler where userID='" + userID + "' and urunID='" + urunID + "'", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                return true;
            }
            return false;
        }

        public static void userItemInsertBasket(string userID, int urunID,int adet)
        {
            SqlCommand komutNesnesi = new SqlCommand("insert into sepetler(userID,urunID,adet) values('"+userID+"','"+urunID+"','" + adet + "')", con);
            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();
        }

        public static void userItemUpdateBasket(string userID, int urunID, int adet)
        {
            SqlCommand komutNesnesi = new SqlCommand("update sepetler set adet=(select adet from sepetler where userID='"+userID+"' and urunID='"+urunID+"')+'"+adet+"' where userID='"+userID+"' and urunID='"+urunID+"'", con);
            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();
        }

        public static string userItems(string userID)
        {
            SqlCommand komutNesnesi = new SqlCommand("select SUM(adet) from sepetler where userID='"+userID+"'", con);
            con.Open();
            string a = komutNesnesi.ExecuteScalar().ToString();
            con.Close();
            return a;
        }

        public static Boolean guestHasItemBasket(string userID, int urunID)
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select * from sepetler where userID='" + userID + "' and urunID='" + urunID + "'", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                return true;
            }
            return false;
        }

        public static void guestItemInsertBasket(string userID, int urunID, int adet)
        {
            SqlCommand komutNesnesi = new SqlCommand("insert into sepetler(userID,urunID,adet,tarih) values('" + userID + "','" + urunID + "','" + adet + "','"+ DateTime.Now.ToString("dd.MM.yyyy", CultureInfo.InvariantCulture) + "')", con);
            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();
        }

        public static void guestItemUpdateBasket(string userID, int urunID, int adet)
        {
            SqlCommand komutNesnesi = new SqlCommand("update sepetler set adet=(select adet from sepetler where userID='" + userID + "' and urunID='" + urunID + "')+'" + adet + "',tarih='"+ DateTime.Now.ToString("dd.MM.yyyy", CultureInfo.InvariantCulture) + "' where userID='" + userID + "' and urunID='" + urunID + "'", con);
            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();
        }

        public static DataTable basketFill(string userID)
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select sepetler.urunID,sepetler.sepetID,urunler.urun,kategoriler.kategori,urunler.resim,sepetler.adet,(urunler.fiyat*adet) as urunFiyat from sepetler inner join urunler on urunler.urunID=sepetler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where sepetler.userID='"+userID+"'", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static void deleteItem(string sepetID)
        {
            SqlCommand komutNesnesi = new SqlCommand("delete from sepetler where sepetID='"+Convert.ToInt32(sepetID)+"'", con);
            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();
        }

        public static void deleteItems(string userID)
        {
            SqlCommand komutNesnesi = new SqlCommand("delete from sepetler where userID='" + userID + "'", con);
            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();
        }

        public static void userItemUpdateBasket2(string userID, int urunID, int adet)
        {
            SqlCommand komutNesnesi = new SqlCommand("update sepetler set adet='" + adet + "' where userID='" + userID + "' and urunID='" + urunID + "'", con);
            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();
        }

        public static void guestItemUpdateBasket2(string userID, int urunID, int adet)
        {
            SqlCommand komutNesnesi = new SqlCommand("update sepetler set adet='"+ adet + "',tarih='" + DateTime.Now.ToString("dd.MM.yyyy", CultureInfo.InvariantCulture) + "' where userID='" + userID + "' and urunID='" + urunID + "'", con);
            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();
        }

        public static string userSepetFiyatKDVsiz(string userID)
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select DISTINCT (SUM(sepetler.adet*urunler.fiyat)-convert(float,SUM(sepetler.adet*urunler.fiyat))/100*18) as KDVsiz from sepetler inner join urunler on urunler.urunID=sepetler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where userID='"+userID+"'", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt.Rows[0][0].ToString();
        }

        public static string userSepetFiyatKDV(string userID)
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select DISTINCT convert(float,SUM(sepetler.adet*urunler.fiyat))/100*18 as KDV from sepetler inner join urunler on urunler.urunID=sepetler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where userID='"+userID+"'", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt.Rows[0][0].ToString();
        }

        public static string userSepetToplamFiyat(string userID)
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select DISTINCT SUM(sepetler.adet*urunler.fiyat) as toplamFiyat from sepetler inner join urunler on urunler.urunID=sepetler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where userID='" + userID + "'", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt.Rows[0][0].ToString();
        }

        public static void siparisEkle(int siparisNo,string userID, int urunID, int adet,string adres)
        {
            SqlCommand komutNesnesi = new SqlCommand("insert into siparisler(siparisID,userID,urunID,adet,adres,tarih,onay) values('"+siparisNo+"','" + userID + "','" + urunID + "','" + adet + "','"+adres+"','" + DateTime.Now + "',0)", con);
            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();
        }

        public static DataTable itemFill(string kategoriTuru)
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select * from urunler inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where kategoriler.kategoriTuru like '%"+kategoriTuru+"%'", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static DataTable itemFill2(string kategoriID)
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select * from urunler inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where kategoriler.kategoriID='"+Convert.ToInt32(kategoriID)+"'", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static DataTable adminSiparis()
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select DISTINCT siparisler.siparisID,siparisler.tarih,SUM(siparisler.adet*urunler.fiyat) as genelToplam,convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18 as KDV,(SUM(siparisler.adet*urunler.fiyat)-convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18) as KDVsiz from siparisler inner join urunler on urunler.urunID=siparisler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID group by siparisler.siparisID,siparisler.tarih order by siparisler.tarih DESC", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static DataTable adminSiparisOnly(int siparisID)
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select siparisler.siparisID,urunler.urun,kategoriler.kategori,siparisler.adet,siparisler.adres,siparisler.kargo,siparisler.kargoNo,siparisler.tarih,urunler.fiyat,siparisler.onay,urunler.fiyat*siparisler.adet as totalFiyat,siparisler.urunID from siparisler inner join urunler on urunler.urunID=siparisler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where siparisler.siparisID='" + siparisID + "'", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static DataTable adminSiparisGun()
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select DISTINCT siparisler.siparisID,siparisler.tarih,SUM(siparisler.adet*urunler.fiyat) as genelToplam,convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18 as KDV,(SUM(siparisler.adet*urunler.fiyat)-convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18) as KDVsiz from siparisler inner join urunler on urunler.urunID=siparisler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where (year(convert(datetime,siparisler.tarih,104))=year(getdate()) and month(convert(datetime,siparisler.tarih,104))=month(getdate()) and (day(convert(datetime,siparisler.tarih,104))>=day(getdate())-1)) group by siparisler.siparisID,siparisler.tarih order by siparisler.tarih DESC", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static DataTable adminSiparis3Gun()
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select DISTINCT siparisler.siparisID,siparisler.tarih,SUM(siparisler.adet*urunler.fiyat) as genelToplam,convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18 as KDV,(SUM(siparisler.adet*urunler.fiyat)-convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18) as KDVsiz from siparisler inner join urunler on urunler.urunID=siparisler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where (year(convert(datetime,siparisler.tarih,104))=year(getdate()) and month(convert(datetime,siparisler.tarih,104))=month(getdate()) and (day(convert(datetime,siparisler.tarih,104))>=day(getdate())-3)) group by siparisler.siparisID,siparisler.tarih order by siparisler.tarih DESC", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static DataTable adminSiparisHafta()
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select DISTINCT siparisler.siparisID,siparisler.tarih,SUM(siparisler.adet*urunler.fiyat) as genelToplam,convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18 as KDV,(SUM(siparisler.adet*urunler.fiyat)-convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18) as KDVsiz from siparisler inner join urunler on urunler.urunID=siparisler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where (year(convert(datetime,siparisler.tarih,104))=year(getdate()) and month(convert(datetime,siparisler.tarih,104))=month(getdate()) and (day(convert(datetime,siparisler.tarih,104))>=day(getdate())-7)) group by siparisler.siparisID,siparisler.tarih order by siparisler.tarih DESC", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static DataTable adminSiparisAy()
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select DISTINCT siparisler.siparisID,siparisler.tarih,SUM(siparisler.adet*urunler.fiyat) as genelToplam,convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18 as KDV,(SUM(siparisler.adet*urunler.fiyat)-convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18) as KDVsiz from siparisler inner join urunler on urunler.urunID=siparisler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where (year(convert(datetime,siparisler.tarih,104))=year(getdate()) and month(convert(datetime,siparisler.tarih,104))=month(getdate())) or (year(convert(datetime,siparisler.tarih,104))=year(getdate()) and month(convert(datetime,siparisler.tarih,104))=month(getdate())-1 and (day(convert(datetime,siparisler.tarih,104))-day(getdate()))>=0) group by siparisler.siparisID,siparisler.tarih order by siparisler.tarih DESC", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static DataTable adminSiparisYil()
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select DISTINCT siparisler.siparisID,siparisler.tarih,SUM(siparisler.adet*urunler.fiyat) as genelToplam,convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18 as KDV,(SUM(siparisler.adet*urunler.fiyat)-convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18) as KDVsiz from siparisler inner join urunler on urunler.urunID=siparisler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where year(convert(datetime,siparisler.tarih,104))=year(getdate()) or (year(convert(datetime,siparisler.tarih,104))=year(getdate())-1 and month(convert(datetime,siparisler.tarih,104))-month(getdate())>=0) and (year(convert(datetime,siparisler.tarih,104))=year(getdate())-1 and month(convert(datetime,siparisler.tarih,104))=month(getdate()) and day(convert(datetime,siparisler.tarih,104))-day(getdate())>=0) group by siparisler.siparisID,siparisler.tarih order by siparisler.tarih DESC", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static void siparisOnayConn(int siparisID, int urunID)
        {
            SqlCommand komutNesnesi = new SqlCommand("update siparisler set onay=1 where siparisID='" + siparisID + "' and urunID='" + urunID + "'", con);
            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();
        }

        public static DataTable adminSiparisK()
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select DISTINCT siparisler.siparisID,siparisler.kargo,siparisler.kargoNo,siparisler.tarih,SUM(siparisler.adet*urunler.fiyat) as genelToplam,convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18 as KDV,(SUM(siparisler.adet*urunler.fiyat)-convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18) as KDVsiz from siparisler inner join urunler on urunler.urunID=siparisler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where siparisler.onay=1 group by siparisler.siparisID,siparisler.tarih,siparisler.kargo,siparisler.kargoNo order by siparisler.tarih DESC", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static DataTable adminSiparisOnlyK(int siparisID)
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select siparisler.siparisID,urunler.urun,kategoriler.kategori,siparisler.adet,siparisler.adres,siparisler.kargo,siparisler.kargoNo,siparisler.tarih,urunler.fiyat,siparisler.onay,urunler.fiyat*siparisler.adet as totalFiyat,siparisler.urunID from siparisler inner join urunler on urunler.urunID=siparisler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where siparisler.onay=1 and siparisler.siparisID='" + siparisID + "'", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static DataTable adminSiparisGunK()
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select DISTINCT siparisler.kargo,siparisler.kargoNo,siparisler.siparisID,siparisler.tarih,SUM(siparisler.adet*urunler.fiyat) as genelToplam,convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18 as KDV,(SUM(siparisler.adet*urunler.fiyat)-convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18) as KDVsiz from siparisler inner join urunler on urunler.urunID=siparisler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where siparisler.onay=1 and (year(convert(datetime,siparisler.tarih,104))=year(getdate()) and month(convert(datetime,siparisler.tarih,104))=month(getdate()) and (day(convert(datetime,siparisler.tarih,104))>=day(getdate())-1)) group by siparisler.siparisID,siparisler.tarih,siparisler.kargo,siparisler.kargoNo order by siparisler.tarih DESC", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static DataTable adminSiparis3GunK()
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select DISTINCT siparisler.kargo,siparisler.kargoNo,siparisler.siparisID,siparisler.tarih,SUM(siparisler.adet*urunler.fiyat) as genelToplam,convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18 as KDV,(SUM(siparisler.adet*urunler.fiyat)-convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18) as KDVsiz from siparisler inner join urunler on urunler.urunID=siparisler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where siparisler.onay=1 and (year(convert(datetime,siparisler.tarih,104))=year(getdate()) and month(convert(datetime,siparisler.tarih,104))=month(getdate()) and (day(convert(datetime,siparisler.tarih,104))>=day(getdate())-3)) group by siparisler.siparisID,siparisler.tarih,siparisler.kargo,siparisler.kargoNo order by siparisler.tarih DESC", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static DataTable adminSiparisHaftaK()
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select DISTINCT siparisler.kargo,siparisler.kargoNo,siparisler.siparisID,siparisler.tarih,SUM(siparisler.adet*urunler.fiyat) as genelToplam,convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18 as KDV,(SUM(siparisler.adet*urunler.fiyat)-convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18) as KDVsiz from siparisler inner join urunler on urunler.urunID=siparisler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where siparisler.onay=1 and (year(convert(datetime,siparisler.tarih,104))=year(getdate()) and month(convert(datetime,siparisler.tarih,104))=month(getdate()) and (day(convert(datetime,siparisler.tarih,104))>=day(getdate())-7)) group by siparisler.siparisID,siparisler.tarih,siparisler.kargo,siparisler.kargoNo order by siparisler.tarih DESC", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static DataTable adminSiparisAyK()
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select DISTINCT siparisler.kargo,siparisler.kargoNo,siparisler.siparisID,siparisler.tarih,SUM(siparisler.adet*urunler.fiyat) as genelToplam,convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18 as KDV,(SUM(siparisler.adet*urunler.fiyat)-convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18) as KDVsiz from siparisler inner join urunler on urunler.urunID=siparisler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where siparisler.onay=1 and (year(convert(datetime,siparisler.tarih,104))=year(getdate()) and month(convert(datetime,siparisler.tarih,104))=month(getdate())) or (year(convert(datetime,siparisler.tarih,104))=year(getdate()) and month(convert(datetime,siparisler.tarih,104))=month(getdate())-1 and (day(convert(datetime,siparisler.tarih,104))-day(getdate()))>=0) group by siparisler.siparisID,siparisler.tarih,siparisler.kargo,siparisler.kargoNo order by siparisler.tarih DESC", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static DataTable adminSiparisYilK()
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select DISTINCT siparisler.kargo,siparisler.kargoNo,siparisler.siparisID,siparisler.tarih,SUM(siparisler.adet*urunler.fiyat) as genelToplam,convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18 as KDV,(SUM(siparisler.adet*urunler.fiyat)-convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18) as KDVsiz from siparisler inner join urunler on urunler.urunID=siparisler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where siparisler.onay=1 and year(convert(datetime,siparisler.tarih,104))=year(getdate()) or (year(convert(datetime,siparisler.tarih,104))=year(getdate())-1 and month(convert(datetime,siparisler.tarih,104))-month(getdate())>=0) and (year(convert(datetime,siparisler.tarih,104))=year(getdate())-1 and month(convert(datetime,siparisler.tarih,104))=month(getdate()) and day(convert(datetime,siparisler.tarih,104))-day(getdate())>=0) group by siparisler.siparisID,siparisler.tarih,siparisler.kargo,siparisler.kargoNo order by siparisler.tarih DESC", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();
            return dt;
        }

        public static void siparisOnayConnK(int siparisID, string kargo,string kargoNo)
        {
            SqlCommand komutNesnesi = new SqlCommand("update siparisler set kargo='"+kargo+"',kargoNo='"+kargoNo+"' where siparisID='" + siparisID + "'", con);
            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();
        }

        public static string siparisKargoFirma(int siparisID)
        {
            string firma = "";
            SqlCommand komutNesnesi = new SqlCommand("select kargo from siparisler where siparisID='" + siparisID + "'", con);
            con.Open();
            SqlDataReader reader = komutNesnesi.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    firma = reader["kargo"].ToString();
                }
            }
            else
            {
                firma = "empty";
            }
            con.Close();
            return firma;
        }

        public static string siparisKargoNo(int siparisID)
        {
            string kargoNo = "";
            SqlCommand komutNesnesi = new SqlCommand("select kargoNo from siparisler where siparisID='" + siparisID + "'", con);
            con.Open();
            SqlDataReader reader = komutNesnesi.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    kargoNo = reader["kargoNo"].ToString();
                }
            }
            else
            {
                kargoNo = "empty";
            }
            con.Close();
            return kargoNo;
        }
    }
}