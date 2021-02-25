using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Otomotiv_Yedek_Parça_E_Ticaret_Sitesi
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(username.Value) && !string.IsNullOrEmpty(password.Value) && !string.IsNullOrEmpty(adi.Value) && !string.IsNullOrEmpty(soyadi.Value) && !string.IsNullOrEmpty(telefon.Value) && !string.IsNullOrEmpty(adres.Value))
            {
                if (conn.insertUser(username.Value, password.Value, adi.Value, soyadi.Value, telefon.Value, adres.Value) == true)
                {
                    Response.Redirect("login.aspx?kayitBasarili");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "ShowLabel2", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label9.ClientID + "').style.display='block'\",100)</script>");
                    ClientScript.RegisterStartupScript(this.GetType(), "HideLabel2", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label9.ClientID + "').style.display='none'\",2000)</script>");
                }

            }else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "ShowLabel1", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label1.ClientID + "').style.display='block'\",100)</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "HideLabel1", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label1.ClientID + "').style.display='none'\",2000)</script>");
            }
        }
    }
}