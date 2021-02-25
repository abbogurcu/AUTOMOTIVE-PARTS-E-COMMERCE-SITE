using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Otomotiv_Yedek_Parça_E_Ticaret_Sitesi
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty((Session["userID"]) as string))
            {
                Response.Redirect("login.aspx?msg=girisYapmalisin");
            }
            DataTable dt = conn.user(Convert.ToInt32(Session["userID"]));

            userID.Text = Session["userID"].ToString();

            adisoyadi.Text= dt.Rows[0]["adi"].ToString() + ", ";

            labelUsername.Text = dt.Rows[0]["adi"].ToString() + " " + dt.Rows[0]["soyadi"].ToString();

            //Profil Bilgilerini Doldurma

            sifreLabel.Text = dt.Rows[0]["password"].ToString();
            adLabel.Text = dt.Rows[0]["adi"].ToString();
            soyadLabel.Text = dt.Rows[0]["soyadi"].ToString();
            telefonLabel.Text = dt.Rows[0]["telefon"].ToString();


            if (!Page.IsPostBack)
            {
                Repeater1.DataSource = conn.userSiparis(Convert.ToInt32(Session["userID"]));
                Repeater1.DataBind();

                DataTable adresDT = conn.userAdres(Convert.ToInt32(Session["userID"]));
                adresDT.Rows.Add(-1, "Farklı bir adres girin.");

                DropDownList1.DataSource = adresDT;
                DropDownList1.DataTextField = "adres";
                DropDownList1.DataValueField = "adresID";
                DropDownList1.DataBind();

                DropDownList2.DataSource = adresDT;
                DropDownList2.DataTextField = "adres";
                DropDownList2.DataValueField = "adresID";
                DropDownList2.DataBind();

                if (DropDownList2.SelectedItem.Value.ToString() == "-1")
                {
                    div5.Attributes.Add("style", "display:none");
                    div6.Attributes.Add("style", "display:inline-grid");
                    TextBox1.Attributes.Add("style", "display:block");
                }
                else
                {
                    DataTable adresDT2 = conn.userAdres(Convert.ToInt32(Session["userID"]));
                    TextArea3.Value = adresDT2.Rows[0]["adresFull"].ToString();
                    div5.Attributes.Add("style", "display:inline-grid");
                    div6.Attributes.Add("style", "display:none");
                    TextBox1.Attributes.Add("style", "display:none");
                }

                if (DropDownList1.SelectedItem.Value.ToString() == "-1")
                {
                    adres.Attributes.Add("style", "display:none");
                    adres2.Attributes.Add("style", "display:inline-grid");
                    adresTxt.Attributes.Add("style", "display:block");
                }
                else
                {
                    DataTable adresDT2 = conn.userAdres(Convert.ToInt32(Session["userID"]));
                    TextArea1.Value = adresDT2.Rows[0]["adresFull"].ToString();
                    adres.Attributes.Add("style", "display:inline-grid");
                    adres2.Attributes.Add("style", "display:none");
                    adresTxt.Attributes.Add("style", "display:none");
                }
            }
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            if (url.Contains("siparisler"))
            {
                div1.Attributes.Add("style", "display:none");
                div2.Attributes.Add("style", "display:contents");
            }else if (url.Contains("adresler"))
            {
                div1.Attributes.Add("style", "display:none");
                div3.Attributes.Add("style", "display:contents");
            }

            if (!string.IsNullOrEmpty(Session["userID"] as string))
            {
                userID.Text = Session["userID"].ToString();
                if (string.IsNullOrEmpty(conn.userItems(Session["userID"].ToString())))
                {
                    sepetLabelSergile.Attributes.Add("style", "display:none");
                }
                else
                {
                    sepetLabelSergile.Attributes.Add("style", "display:block");
                    sepetLabel.Text = conn.userItems(Session["userID"].ToString());
                }
            }
            else
            {
                userID.Text = null;
                if (string.IsNullOrEmpty(conn.userItems(Request.AnonymousID)))
                {
                    sepetLabelSergile.Attributes.Add("style", "display:none");
                }
                else
                {
                    sepetLabelSergile.Attributes.Add("style", "display:block");
                    sepetLabel.Text = conn.userItems(Request.AnonymousID);
                }
            }
        }

        protected void ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater rp2 = e.Item.FindControl("Repeater2") as Repeater;

                int siparisID = (int)DataBinder.Eval(e.Item.DataItem, "siparisID");

                rp2.DataSource = conn.userSiparisOnly(Convert.ToInt32(Session["userID"]), siparisID);
                rp2.DataBind();
            }
        }


        [WebMethod]
        public static string adresFullCek(string userID,string adresID)
        {
            DataTable adresDT = conn.userAdres2(Convert.ToInt32(userID), Convert.ToInt32(adresID));
            return adresDT.Rows[0]["adresFull"].ToString();
        }

        protected void logout2_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();
            Response.Redirect("default.aspx?cikisYapildi.");
        }

        protected void siparisAy(object sender, EventArgs e)
        {
            Repeater1.DataSource = conn.userSiparisAy(Convert.ToInt32(Session["userID"]));
            Repeater1.DataBind();
            div1.Attributes.Add("style", "display:none");
            div5.Attributes.Add("style", "display:none");
            div2.Attributes.Add("style", "display:contents");
            dropdownMenu2.InnerText = "Son 30 Gün";
        }

        protected void siparisYil(object sender, EventArgs e)
        {
            Repeater1.DataSource = conn.userSiparisYil(Convert.ToInt32(Session["userID"]));
            Repeater1.DataBind();
            div1.Attributes.Add("style", "display:none");
            div2.Attributes.Add("style", "display:contents");
            div5.Attributes.Add("style", "display:none");
            dropdownMenu2.InnerText = "Son 1 Yıl";
        }

        protected void siparisTumu(object sender, EventArgs e)
        {
            Repeater1.DataSource = conn.userSiparis(Convert.ToInt32(Session["userID"]));
            Repeater1.DataBind();
            div1.Attributes.Add("style", "display:none");
            div2.Attributes.Add("style", "display:contents");
            div5.Attributes.Add("style", "display:none");
            dropdownMenu2.InnerText = "Tümü";
        }


        [WebMethod]
        public static void sifreDegistir(string userID,string password)
        {
            conn.userSifre(Convert.ToInt32(userID), password);
        }

        [WebMethod]
        public static void adDegistir(string userID, string ad)
        {
            conn.userAd(Convert.ToInt32(userID), ad);
        }

        [WebMethod]
        public static void soyadDegistir(string userID, string soyad)
        {
            conn.userSoyad(Convert.ToInt32(userID), soyad);
        }

        [WebMethod]
        public static void telefonDegistir(string userID, string telefon)
        {
            conn.userTelefon(Convert.ToInt32(userID), telefon);
        }

        [WebMethod]
        public static void adresDegistir(string adres,string adresID,string adresAdi)
        {
            conn.userAdres(adres, Convert.ToInt32(adresID),adresAdi);
        }

        [WebMethod]
        public static void adresEkle(string userID, string adres, string adresAdi)
        {
            conn.userAdresEkle(Convert.ToInt32(userID), adres, adresAdi);
        }

        [WebMethod]
        public static void adresSil(string adresID)
        {
            conn.userAdresSil(Convert.ToInt32(adresID));
        }
    }
}