using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Otomotiv_Yedek_Parça_E_Ticaret_Sitesi
{
    public partial class urunKargo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string mesaj = Request.QueryString["msg"];
            Response.Write(mesaj);
            if (Convert.ToBoolean(Session["login"]) != true)
                Response.Redirect("adminlogin.aspx?msg=Öncelikle giriş yapmalısınız!");

            if (!Page.IsPostBack)
            {
                Repeater1.DataSource = conn.adminSiparisK();
                Repeater1.DataBind();
            }
        }

        protected void ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater rp2 = e.Item.FindControl("Repeater2") as Repeater;

                if(string.IsNullOrEmpty(DataBinder.Eval(e.Item.DataItem, "kargo").ToString()) && string.IsNullOrEmpty(DataBinder.Eval(e.Item.DataItem, "kargoNo").ToString()))
                {
                    Label label1= e.Item.FindControl("Label1") as Label;
                    Label label4 = e.Item.FindControl("Label4") as Label;
                    label1.Attributes.Add("style", "display:none");
                    label4.Attributes.Add("style", "display:block");
                }
                else
                {
                    Label label1 = e.Item.FindControl("Label1") as Label;
                    Label label4 = e.Item.FindControl("Label4") as Label;
                    label1.Attributes.Add("style", "display:block");
                    label4.Attributes.Add("style", "display:none");
                }

                int siparisID = (int)DataBinder.Eval(e.Item.DataItem, "siparisID");

                rp2.DataSource = conn.adminSiparisOnlyK(siparisID);
                rp2.DataBind();
            }
        }

        protected void logout2_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();
            Response.Redirect("adminLogin.aspx?cikisYapildi.");
        }

        protected void siparisGun(object sender, EventArgs e)
        {
            Repeater1.DataSource = conn.adminSiparisGunK();
            Repeater1.DataBind();
            dropdownMenu2.InnerText = "Son 1 Gün";
        }
        protected void siparisUcGun(object sender, EventArgs e)
        {
            Repeater1.DataSource = conn.adminSiparis3GunK();
            Repeater1.DataBind();
            dropdownMenu2.InnerText = "Son 3 Gün";
        }

        protected void siparisHafta(object sender, EventArgs e)
        {
            Repeater1.DataSource = conn.adminSiparisHaftaK();
            Repeater1.DataBind();
            dropdownMenu2.InnerText = "Son 1 Hafta";
        }

        protected void siparisAy(object sender, EventArgs e)
        {
            Repeater1.DataSource = conn.adminSiparisAyK();
            Repeater1.DataBind();
            dropdownMenu2.InnerText = "Son 30 Gün";
        }

        protected void siparisYil(object sender, EventArgs e)
        {
            Repeater1.DataSource = conn.adminSiparisYilK();
            Repeater1.DataBind();
            dropdownMenu2.InnerText = "Son 1 Yıl";
        }

        protected void siparisTumu(object sender, EventArgs e)
        {
            Repeater1.DataSource = conn.adminSiparisK();
            Repeater1.DataBind();
            dropdownMenu2.InnerText = "Tümü";
        }

        protected void test(object sender, EventArgs e)
        {
            if (dropdownMenu2.InnerText == "Tümü")
            {
                Repeater1.DataSource = conn.adminSiparisK();
                Repeater1.DataBind();

            }
            else if (dropdownMenu2.InnerText == "Son 1 Yıl")
            {
                Repeater1.DataSource = conn.adminSiparisYilK();
                Repeater1.DataBind();
            }
            else if (dropdownMenu2.InnerText == "Son 30 Gün")
            {
                Repeater1.DataSource = conn.adminSiparisAyK();
                Repeater1.DataBind();
            }
            else if (dropdownMenu2.InnerText == "Son 1 Hafta")
            {
                Repeater1.DataSource = conn.adminSiparisHaftaK();
                Repeater1.DataBind();
            }
            else if (dropdownMenu2.InnerText == "Son 3 Gün")
            {
                Repeater1.DataSource = conn.adminSiparis3GunK();
                Repeater1.DataBind();
            }
            else if (dropdownMenu2.InnerText == "Son 1 Gün")
            {
                Repeater1.DataSource = conn.adminSiparisGunK();
                Repeater1.DataBind();
            }
            else
            {
                Repeater1.DataSource = conn.adminSiparisK();
                Repeater1.DataBind();
            }
        }

        [WebMethod]
        public static void kargoYolla(string siparisID, string kargo,string kargoNo)
        {
            conn.siparisOnayConnK(Convert.ToInt32(siparisID), kargo,kargoNo);
        }

        [WebMethod]
        public static string kargoNoVar(string siparisID)
        {
            return conn.siparisKargoNo(Convert.ToInt32(siparisID));
        }

        [WebMethod]
        public static string kargoFirmaVar(string siparisID)
        {
            return conn.siparisKargoFirma(Convert.ToInt32(siparisID));
        }
    }
}