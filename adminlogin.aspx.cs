using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Otomotiv_Yedek_Parça_E_Ticaret_Sitesi
{
    public partial class login2 : System.Web.UI.Page
    {
        static SqlConnection con = conn.getConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            div111.Visible = false;
        }


        protected void Button_Click(object sender, EventArgs e)
        {
            SqlCommand komutNesnesi = new SqlCommand("select * from users where username=@username and password=@password and Yetki='1'", con);
            komutNesnesi.Parameters.AddWithValue("@username", TextBox1.Text);
            komutNesnesi.Parameters.AddWithValue("@password", TextBox2.Text);

            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            con.Open();
            DataTable dt = new DataTable();
            adaptor.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                Session["login"] = true;
                Session["username"] = TextBox1.Text;
                Response.Redirect("admin.aspx");
            }
            else
            {
                div111.Visible = true;
                ClientScript.RegisterStartupScript(this.GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + div111.ClientID + "').style.display='none'\",3000)</script>");
            }
        }
    }
}