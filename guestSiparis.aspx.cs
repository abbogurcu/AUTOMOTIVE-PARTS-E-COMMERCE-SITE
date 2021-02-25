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
    public partial class guestSiparis : System.Web.UI.Page
    {
        static SqlConnection con = conn.getConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            Repeater1.DataSource = null;
            Repeater1.DataBind();
            if (string.IsNullOrEmpty(Session["userID"] as string))
            {
                linkAyarla.Visible = true;
                session.Visible = false;
                adisoyadi.Visible = false;
            }
            else
            {
                DataTable dt2 = conn.user(Convert.ToInt32(Session["userID"]));

                adisoyadi.Text = dt2.Rows[0]["adi"].ToString() + ", ";
                linkAyarla.Visible = false;
                session.Visible = true;
                adisoyadi.Visible = true;
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

        protected void logout2_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();
            Response.Redirect("default.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TextBox1.Text))
            {
                int siparisNo = Convert.ToInt32(TextBox1.Text);
                DataTable dt = new DataTable();
                SqlCommand komutNesnesi = new SqlCommand("select *,(urunler.fiyat*siparisler.adet) as totalFiyat from siparisler inner join urunler on urunler.urunID=siparisler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where siparisID='" + siparisNo + "'", con);
                SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
                con.Open();
                adaptor.Fill(dt);
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["userID"].ToString().Contains('-'))
                    {
                        Repeater1.DataSource = dt;
                        Repeater1.DataBind();
                        Label13.Text = "Sipariş No : " + dt.Rows[0]["siparisID"].ToString();
                        Label12.Text = "Sipariş Tarihi : " + dt.Rows[0]["tarih"].ToString();

                        DataTable dt2 = new DataTable();
                        SqlCommand komutNesnesi2 = new SqlCommand("select DISTINCT siparisler.siparisID,siparisler.tarih,SUM(siparisler.adet*urunler.fiyat) as genelToplam,convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18 as KDV,(SUM(siparisler.adet*urunler.fiyat)-convert(float,SUM(siparisler.adet*urunler.fiyat))/100*18) as KDVsiz from siparisler inner join urunler on urunler.urunID=siparisler.urunID inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where siparisID='" + siparisNo + "' group by siparisler.siparisID,siparisler.tarih", con);
                        SqlDataAdapter adaptor2 = new SqlDataAdapter(komutNesnesi2);
                        con.Open();
                        adaptor2.Fill(dt2);
                        con.Close();
                        Label19.Text = "Toplam Fiyat : " + dt2.Rows[0]["genelToplam"].ToString() + " TL";
                        Label21.Text = "Toplam Fiyat(KDV Hariç) : " + dt2.Rows[0]["KDVsiz"].ToString() + " TL";
                        Label20.Text = "Toplam KDV : " + dt2.Rows[0]["KDV"].ToString() + " TL";
                        siparisGeldi.Attributes.Add("style", "display:block");
                        TextBox1.Text = "";
                    }
                    else
                    {
                        TextBox1.Text = "";
                        siparisGeldi.Attributes.Add("style", "display:none");
                        ClientScript.RegisterStartupScript(this.GetType(), "ShowLabel5", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label3.ClientID + "').style.display='block'\",100)</script>");
                        ClientScript.RegisterStartupScript(this.GetType(), "HideLabel5", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label3.ClientID + "').style.display='none'\",3000)</script>");
                    }
                }
                else
                {
                    TextBox1.Text = "";
                    siparisGeldi.Attributes.Add("style", "display:none");
                    ClientScript.RegisterStartupScript(this.GetType(), "ShowLabel5", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label2.ClientID + "').style.display='block'\",100)</script>");
                    ClientScript.RegisterStartupScript(this.GetType(), "HideLabel5", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label2.ClientID + "').style.display='none'\",3000)</script>");
                } 
            }
            else
            {
                TextBox1.Text = "";
                siparisGeldi.Attributes.Add("style", "display:none");
                ClientScript.RegisterStartupScript(this.GetType(), "ShowLabel5", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label1.ClientID + "').style.display='block'\",100)</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "HideLabel5", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label1.ClientID + "').style.display='none'\",3000)</script>");
            }
        }
    }
}