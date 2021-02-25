using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Otomotiv_Yedek_Parça_E_Ticaret_Sitesi
{
    public partial class urun : System.Web.UI.Page
    {
        public static SqlConnection con = conn.getConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
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
                    DataTable dt = conn.user(Convert.ToInt32(Session["userID"]));

                    adisoyadi.Text = dt.Rows[0]["adi"].ToString() + ", ";
                    linkAyarla.Visible = false;
                    session.Visible = true;
                    adisoyadi.Visible = true;
                }
                
                anonymousLabel.Text = Request.AnonymousID;
                string url = HttpContext.Current.Request.Url.AbsoluteUri;
                string urunID = url.Split('?').Last();
                linkAyarla.HRef = "login.aspx";
                if (url.Contains('?'))
                {
                    linkAyarla.HRef = "login.aspx?=urun.aspx?" + urunID;
                    int val;
                    if (int.TryParse(urunID, out val))
                    {
                        if (urunKontrol(Convert.ToInt32(urunID)).Rows.Count == 1)
                        {
                            SqlCommand komut = new SqlCommand("select * from urunler inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where urunID='" + urunID + "'", con);
                            con.Open();
                            SqlDataAdapter adaptor = new SqlDataAdapter(komut);
                            DataTable dt = new DataTable();
                            adaptor.Fill(dt);
                            Repeater1.DataSource = dt;
                            Repeater1.DataBind();
                            con.Close();
                            div1.Visible = true;

                        }
                        else
                        {
                            div4.Visible = true;
                        }
                    }
                    else
                    {
                        div3.Visible = true;
                    }
                }
                else
                {
                    div2.Visible = true;
                }
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
                    sepetLabelSergile.Attributes.Add("style","display:block");
                    sepetLabel.Text = conn.userItems(Request.AnonymousID);
                }
            }
        }

        protected void logout_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();
            Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);
        }

        public static DataTable urunKontrol(int urunID)
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select * from urunler where urunID='" + urunID + "'", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            adaptor.Fill(dt);
            con.Close();

            return dt;
        }

        [WebMethod]
        public static string Test(string userID,string value,string anonymousID,string urunID)
        {
           if (!string.IsNullOrEmpty(userID)) {
                if (conn.userHasItemBasket(userID, Convert.ToInt32(urunID)) == false)
                {
                    conn.userItemInsertBasket(userID, Convert.ToInt32(urunID), Convert.ToInt32(value));
                }
                else
                {
                    conn.userItemUpdateBasket(userID, Convert.ToInt32(urunID), Convert.ToInt32(value));
                }
                return conn.userItems(userID);
            }
            else
            {
                if (conn.guestHasItemBasket(anonymousID, Convert.ToInt32(urunID)) == false)
                {
                    conn.guestItemInsertBasket(anonymousID, Convert.ToInt32(urunID), Convert.ToInt32(value));
                }
                else
                {
                    conn.guestItemUpdateBasket(anonymousID, Convert.ToInt32(urunID), Convert.ToInt32(value));
                }
                return conn.userItems(anonymousID);
            }
            
        }
    }
}