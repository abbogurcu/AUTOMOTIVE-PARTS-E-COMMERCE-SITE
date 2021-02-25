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
    public partial class urunSiparis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string mesaj = Request.QueryString["msg"];
            Response.Write(mesaj);
            if (Convert.ToBoolean(Session["login"]) != true)
                Response.Redirect("adminlogin.aspx?msg=Öncelikle giriş yapmalısınız!");

            if (!Page.IsPostBack)
            {
                Repeater1.DataSource = conn.adminSiparis();
                Repeater1.DataBind();
            }
        }

        protected void ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater rp2 = e.Item.FindControl("Repeater2") as Repeater;

                int siparisID = (int)DataBinder.Eval(e.Item.DataItem, "siparisID");

                rp2.DataSource = conn.adminSiparisOnly(siparisID);
                rp2.DataBind();
            }
        }

        protected void ItemDataBound2(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int onay = (int)DataBinder.Eval(e.Item.DataItem, "onay");

                HtmlGenericControl onayGoster = e.Item.FindControl("onayGoster") as HtmlGenericControl;
                HtmlGenericControl onaySakla = e.Item.FindControl("onaySakla") as HtmlGenericControl;

                if (onay == 0)
                {
                    onayGoster.Attributes.Add("style", "display:block");
                    onaySakla.Attributes.Add("style", "display:none");
                }
                else
                {
                    onaySakla.Attributes.Add("style", "display:block");
                    onayGoster.Attributes.Add("style", "display:none");
                }
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
            Repeater1.DataSource = conn.adminSiparisGun();
            Repeater1.DataBind();
            dropdownMenu2.InnerText = "Son 1 Gün";
        }
        protected void siparisUcGun(object sender, EventArgs e)
        {
            Repeater1.DataSource = conn.adminSiparis3Gun();
            Repeater1.DataBind();
            dropdownMenu2.InnerText = "Son 3 Gün";
        }

        protected void siparisHafta(object sender, EventArgs e)
        {
            Repeater1.DataSource = conn.adminSiparisHafta();
            Repeater1.DataBind();
            dropdownMenu2.InnerText = "Son 1 Hafta";
        }

        protected void siparisAy(object sender, EventArgs e)
        {
            Repeater1.DataSource = conn.adminSiparisAy();
            Repeater1.DataBind();
            dropdownMenu2.InnerText = "Son 30 Gün";
        }

        protected void siparisYil(object sender, EventArgs e)
        {
            Repeater1.DataSource = conn.adminSiparisYil();
            Repeater1.DataBind();
            dropdownMenu2.InnerText = "Son 1 Yıl";
        }

        protected void siparisTumu(object sender, EventArgs e)
        {
            Repeater1.DataSource = conn.adminSiparis();
            Repeater1.DataBind();
            dropdownMenu2.InnerText = "Tümü";
        }

        protected void test(object sender, EventArgs e)
        {
            if(dropdownMenu2.InnerText == "Tümü")
            {
                Repeater1.DataSource = conn.adminSiparis();
                Repeater1.DataBind();

            }
            else if (dropdownMenu2.InnerText == "Son 1 Yıl")
            {
                Repeater1.DataSource = conn.adminSiparisYil();
                Repeater1.DataBind();
            }
            else if (dropdownMenu2.InnerText == "Son 30 Gün")
            {
                Repeater1.DataSource = conn.adminSiparisAy();
                Repeater1.DataBind();
            }
            else if (dropdownMenu2.InnerText == "Son 1 Hafta")
            {
                Repeater1.DataSource = conn.adminSiparisHafta();
                Repeater1.DataBind();
            }
            else if (dropdownMenu2.InnerText == "Son 3 Gün")
            {
                Repeater1.DataSource = conn.adminSiparis3Gun();
                Repeater1.DataBind();
            }
            else if (dropdownMenu2.InnerText == "Son 1 Gün")
            {
                Repeater1.DataSource = conn.adminSiparisGun();
                Repeater1.DataBind();
            }
            else
            {
                Repeater1.DataSource = conn.adminSiparis();
                Repeater1.DataBind();
            }
        }

        [WebMethod]
        public static void siparisOnayServer(string siparisID,string urunID)
        {
            conn.siparisOnayConn(Convert.ToInt32(siparisID), Convert.ToInt32(urunID));
        }
    }
}