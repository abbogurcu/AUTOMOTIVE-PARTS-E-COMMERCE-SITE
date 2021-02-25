using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Otomotiv_Yedek_Parça_E_Ticaret_Sitesi
{
    public partial class basket : System.Web.UI.Page
    {
        static SqlConnection baglanti = conn.getConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Session["userID"] as string))
            {
                linkAyarla.Visible = true;
                session.Visible = false;
                adisoyadi.Visible = false;
                guestSiparis.Attributes.Add("style", "display:block");
                userSiparis.Attributes.Add("style", "display:none");
            }
            else
            {
                guestSiparis.Attributes.Add("style", "display:none");
                userSiparis.Attributes.Add("style", "display:block");
                DataTable dt2 = conn.user(Convert.ToInt32(Session["userID"]));

                adisoyadi.Text = dt2.Rows[0]["adi"].ToString() + ", ";
                linkAyarla.Visible = false;
                session.Visible = true;
                adisoyadi.Visible = true;
            }

            anonymousLabel.Text = Request.AnonymousID;
            

            if (!string.IsNullOrEmpty(Session["userID"] as string))
            {
                userID.Text = Session["userID"].ToString();
                if (conn.basketFill(Session["userID"].ToString()).Rows.Count == 0)
                {
                    sepetBos.Attributes.Add("style", "display:block");
                    sepetDolu.Attributes.Add("style", "display:none");
                }
                else
                {
                    sepetBos.Attributes.Add("style", "display:none");
                    sepetDolu.Attributes.Add("style", "display:block");
                    Repeater1.DataSource = conn.basketFill(Session["userID"].ToString());
                    Repeater1.DataBind();
                    div5.Attributes.Add("style", "display:none");
                    div6.Attributes.Add("style", "display:contents");

                    DataTable adresDT = conn.userAdres(Convert.ToInt32(Session["userID"]));
                    DropDownList2.DataSource = adresDT;
                    DropDownList2.DataTextField = "adres";
                    DropDownList2.DataValueField = "adresID";
                    DropDownList2.DataBind();
                    TextArea3.Value = adresDT.Rows[0]["adresFull"].ToString();
                }

                userID.Text = Session["userID"].ToString();
                if (string.IsNullOrEmpty(conn.userItems(Session["userID"].ToString())))
                {
                    sepetLabelSergile.Attributes.Add("style", "display:none");
                }
                else
                {
                    sepetLabelSergile.Attributes.Add("style", "display:block");
                    sepetLabel.Text = conn.userItems(Session["userID"].ToString());
                    urunAdet.Text= conn.userItems(Session["userID"].ToString());
                    urunFiyatKDVsiz.Text = conn.userSepetFiyatKDVsiz(Session["userID"].ToString());
                    urunKDV.Text= conn.userSepetFiyatKDV(Session["userID"].ToString());
                    urunFiyatToplam.Text = conn.userSepetToplamFiyat(Session["userID"].ToString());
                }
            }
            else
            {
                if (conn.basketFill(Request.AnonymousID).Rows.Count == 0)
                {
                    sepetBos.Attributes.Add("style", "display:block");
                    sepetDolu.Attributes.Add("style", "display:none");
                }
                else
                {
                    sepetBos.Attributes.Add("style", "display:none");
                    sepetDolu.Attributes.Add("style", "display:block");
                    Repeater1.DataSource = conn.basketFill(Request.AnonymousID);
                    Repeater1.DataBind();
                    div5.Attributes.Add("style", "display:contents");
                    div6.Attributes.Add("style", "display:none");
                }

                userID.Text = null;
                if (string.IsNullOrEmpty(conn.userItems(Request.AnonymousID)))
                {
                    sepetLabelSergile.Attributes.Add("style", "display:none");
                }
                else
                {
                    sepetLabelSergile.Attributes.Add("style", "display:block");
                    sepetLabel.Text = conn.userItems(Request.AnonymousID);
                    urunAdet.Text = conn.userItems(Request.AnonymousID);
                    urunFiyatKDVsiz.Text = conn.userSepetFiyatKDVsiz(Request.AnonymousID);
                    urunKDV.Text = conn.userSepetFiyatKDV(Request.AnonymousID);
                    urunFiyatToplam.Text = conn.userSepetToplamFiyat(Request.AnonymousID);
                }
            }
        }

        protected void logout2_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();
            Response.Redirect("default.aspx?cikisYapildi.");
        }

        [WebMethod]
        public static string deleteItemRequest(string sepetID,string userID,string anonymousID)
        {
            conn.deleteItem(sepetID);
            if (!string.IsNullOrEmpty(userID))
            {
                return conn.userItems(userID);
            }
            else
            {
                return conn.userItems(anonymousID);
            }
        }

        [WebMethod]
        public static string deleteItemsRequest(string userID,string anonymousID)
        {
            if (!string.IsNullOrEmpty(userID))
            {
                conn.deleteItems(userID);
                return conn.userItems(userID);
            }
            else
            {
                conn.deleteItems(anonymousID);
                return conn.userItems(anonymousID);
            }
        }

        [WebMethod]
        public static string itemCount(string userID,string anonymousID)
        {
            if (!string.IsNullOrEmpty(userID))
            {
                return conn.userItems(userID);
            }
            else
            {
                return conn.userItems(anonymousID);
            }
        }
        
        [WebMethod]
        public static string itemIncDec(string userID, string value, string anonymousID, string urunID)
        {
            if (!string.IsNullOrEmpty(userID))
            {
                conn.userItemUpdateBasket2(userID, Convert.ToInt32(urunID), Convert.ToInt32(value));
                return conn.userItems(userID);
            }
            else
            {
                conn.guestItemUpdateBasket2(anonymousID, Convert.ToInt32(urunID), Convert.ToInt32(value));
                return conn.userItems(anonymousID);
            }
        }

        [WebMethod]
        public static string sepetFiyatKDVsiz(string userID, string anonymousID)
        {
            if (!string.IsNullOrEmpty(userID))
            {
                return conn.userSepetFiyatKDVsiz(userID);
            }
            else
            {
                return conn.userSepetFiyatKDVsiz(anonymousID);
            }
        }

        [WebMethod]
        public static string sepetFiyatKDV(string userID, string anonymousID)
        {
            if (!string.IsNullOrEmpty(userID))
            {
                return conn.userSepetFiyatKDV(userID);
            }
            else
            {
                return conn.userSepetFiyatKDV(anonymousID);
            }
        }

        [WebMethod]
        public static string sepetFiyatToplam(string userID, string anonymousID)
        {
            if (!string.IsNullOrEmpty(userID))
            {
                return conn.userSepetToplamFiyat(userID);
            }
            else
            {
                return conn.userSepetToplamFiyat(anonymousID);
            }
        }

        [WebMethod]
        public static string SatinAl(string userID, string anonymousID)
        {
            if (!string.IsNullOrEmpty(userID))
            {
                return conn.userSepetToplamFiyat(userID);
            }
            else
            {
                return conn.userSepetToplamFiyat(anonymousID);
            }
        }

        [WebMethod]
        public static string adresFullCek(string userID, string adresID)
        {
            DataTable adresDT = conn.userAdres2(Convert.ToInt32(userID), Convert.ToInt32(adresID));
            return adresDT.Rows[0]["adresFull"].ToString();
        }

        [WebMethod]
        public static string siparisVer(string ID,string adres)
        {
            int siparisNo = 1;
            while (true)
            {
                baglanti.Close();
                SqlCommand siparisNoCheck = new SqlCommand("select * from siparisler where siparisID='" + siparisNo.ToString() + "'", baglanti);
                baglanti.Open();
                SqlDataReader readerCheck = siparisNoCheck.ExecuteReader();
                if (readerCheck.HasRows)
                {
                    siparisNo++;
                }
                else
                {

                    break;
                }
            }
            baglanti.Close();


            SqlCommand komutNesnesi = new SqlCommand("select * from sepetler where userID='"+ID+"'",baglanti);
            baglanti.Open();
            SqlDataReader reader = komutNesnesi.ExecuteReader();
            while (reader.Read())
            {
                conn.siparisEkle(siparisNo, ID, Convert.ToInt32(reader["urunID"]), Convert.ToInt32(reader["adet"]), adres);
            }
            conn.deleteItems(ID);
            baglanti.Close();
            return siparisNo.ToString();
        }
    }
}