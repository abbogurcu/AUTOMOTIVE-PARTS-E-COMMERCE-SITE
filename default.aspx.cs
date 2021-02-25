using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Profile;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Otomotiv_Yedek_Parça_E_Ticaret_Sitesi
{
    public partial class _default : System.Web.UI.Page
    {
        static SqlConnection con = conn.getConnection();
        protected void Page_Load(object sender, EventArgs e) {
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
            

            SqlCommand komut = new SqlCommand("select * from urunler inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID", con);
            con.Open();
            SqlDataAdapter adaptor = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            adaptor.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            con.Close();

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

        protected void logout2_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();
            Response.Redirect("default.aspx");
        }
    }
}