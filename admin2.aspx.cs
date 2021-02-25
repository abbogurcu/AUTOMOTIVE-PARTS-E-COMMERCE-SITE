using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Otomotiv_Yedek_Parça_E_Ticaret_Sitesi
{
    public partial class admin2 : System.Web.UI.Page
    {
        static SqlConnection con = conn.getConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            string mesaj = Request.QueryString["msg"];
            Response.Write(mesaj);
            if (Convert.ToBoolean(Session["login"]) != true)
                Response.Redirect("adminlogin.aspx?msg=Öncelikle giriş yapmalısınız!");

            if (!Page.IsPostBack)
            {
                div111.Visible = false;
                div1.Visible = false;
            }
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == TextBox2.Text)
            {
                SqlCommand komutNesnesi = new SqlCommand("UPDATE users SET password = @password WHERE username=@username", con);
                komutNesnesi.Parameters.AddWithValue("@password", TextBox1.Text);
                komutNesnesi.Parameters.AddWithValue("@username", Session["username"].ToString());
                con.Open();
                komutNesnesi.ExecuteNonQuery();
                con.Close();
                div1.Visible = true;
                Response.AddHeader("REFRESH", "2;URL=login2.aspx");
                ClientScript.RegisterStartupScript(this.GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + div1.ClientID + "').style.display='none'\",1800)</script>");
                Session.Clear();
            }
            else
            {
                div111.Visible = true;
                ClientScript.RegisterStartupScript(this.GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + div111.ClientID + "').style.display='none'\",3000)</script>");

            }
        }

        protected void logout2_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();
            Response.Redirect("adminlogin.aspx");
        }
    }
}