using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace Otomotiv_Yedek_Parça_E_Ticaret_Sitesi
{
    public partial class login : System.Web.UI.Page
    {
        static SqlConnection con = conn.getConnection();
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {         
            SqlCommand komutNesnesi = new SqlCommand("select * from users where username='" + username.Value + "' and password='" + password.Value + "' and Yetki=0",con);
            con.Open();
            SqlDataReader reader = komutNesnesi.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read()) { 
                Session["userID"] = reader[0].ToString();

                    string url = HttpContext.Current.Request.Url.AbsoluteUri;

                    if (url.Contains('=') && !url.Contains("msg"))
                    {
                        string page = url.Split('=').Last();
                        page = page.Replace("%3f", "?");
                        con.Close();
                        Response.Redirect(page);             
                    }
                    else if(!url.Contains('=')&& url.Contains('?')&&!url.Contains("msg")&& !url.Contains("kayitBasarili"))
                    {
                        string page = url.Split('?').Last();
                        con.Close();
                        Response.Redirect(page);
                    }
                    else if(url.Contains("msg"))
                    {
                        con.Close();
                        Response.Redirect("profile.aspx");
                    }
                    else if (url.Contains("mechanic")){
                        con.Close();
                        Response.Redirect("mechanic.aspx");
                    }
                    else if (url.Contains("acces"))
                    {
                        con.Close();
                        Response.Redirect("acces.aspx");
                    }
                    else
                    {
                        con.Close();
                        Response.Redirect("default.aspx");
                    }
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "ShowLabel5", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label9.ClientID + "').style.display='block'\",100)</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "HideLabel5", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label9.ClientID + "').style.display='none'\",3000)</script>");
            }
            con.Close();
        }
    }
}