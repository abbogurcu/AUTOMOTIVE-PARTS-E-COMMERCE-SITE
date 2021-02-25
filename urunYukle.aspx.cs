using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Threading;
using System.Timers;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Otomotiv_Yedek_Parça_E_Ticaret_Sitesi
{
    public partial class urunYukle : System.Web.UI.Page
    {
        public static SqlConnection con = conn.getConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            string mesaj = Request.QueryString["msg"];
            Response.Write(mesaj);
            if (Convert.ToBoolean(Session["login"]) != true)
                Response.Redirect("adminlogin.aspx?msg=Öncelikle giriş yapmalısınız!");


            if (!Page.IsPostBack)
            {
                test.Visible = false;
                test3.Visible=false;
                if (DropDownList1.SelectedItem.Value.ToString() == "1")
                {
                    DataTable mekanik = mekanikCek();
                    mekanik.Rows.Add("Mekanik parça kategorisini düzenleyin.");

                    DropDownList2.DataSource = mekanik;
                    DropDownList2.DataTextField = "kategori";
                    DropDownList2.DataBind();
                }
                else
                {
                    DataTable aksesuar = aksesuarCek();
                    DataRow dr = aksesuar.NewRow();
                    aksesuar.Rows.Add("Aksesuar parça kategorisi düzenleyin.");

                    DropDownList2.DataSource = aksesuar;
                    DropDownList2.DataTextField = "kategori";
                    DropDownList2.DataBind();
                }
            }
        }

        public static DataTable mekanikCek()
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select kategori from kategoriler where kategoriTuru='Mekanik'", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            adaptor.Fill(dt);
            return dt;
        }

        public static DataTable aksesuarCek()
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select kategori from kategoriler where kategoriTuru='Aksesuar'", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            adaptor.Fill(dt);
            return dt;
        }

        protected void SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Value.ToString() == "1")
            {
                DataTable mekanik = mekanikCek();
                mekanik.Rows.Add("Mekanik parça kategorisini düzenleyin.");

                DropDownList2.DataSource = mekanik;
                DropDownList2.DataTextField = "kategori";
                DropDownList2.DataBind();
            }
            else
            {
                DataTable aksesuar = aksesuarCek();
                DataRow dr = aksesuar.NewRow();
                aksesuar.Rows.Add("Aksesuar parça kategorisini düzenleyin.");

                DropDownList2.DataSource = aksesuar;
                DropDownList2.DataTextField = "kategori";
                DropDownList2.DataBind();
            }
        }

        protected void SelectedIndexChanged2(object sender, EventArgs e)
        {
            if (DropDownList2.SelectedItem.ToString() == "Mekanik parça kategorisini düzenleyin.")
            {
                test.Visible = true;
                test2.Visible = false;

                DataTable mekanik = mekanikCek();
                mekanik.Rows.Add("Yeni mekanik parça kategorisi ekleyin.");

                DropDownList3.DataSource = mekanik;
                DropDownList3.DataTextField = "kategori";
                DropDownList3.DataBind();
                TextBox3.Text = DropDownList3.SelectedItem.ToString();
                Button4.Visible = false;
                if (DropDownList3.SelectedItem.ToString() == "Yeni mekanik parça kategorisi ekleyin.")
                {
                    Button4.Visible = true;
                    Button5.Visible = false;
                    TextBox3.Text = null;
                }
                else if (DropDownList3.SelectedItem.ToString() == "Yeni aksesuar parça kategorisi ekleyin.")
                {
                    Button4.Visible = true;
                    Button5.Visible = false;
                    TextBox3.Text = null;
                }
            }
            else if (DropDownList2.SelectedItem.ToString() == "Aksesuar parça kategorisini düzenleyin.")
            {
                test.Visible = true;
                test2.Visible = false;

                DataTable mekanik = aksesuarCek();
                mekanik.Rows.Add("Yeni aksesuar parça kategorisi ekleyin.");

                DropDownList3.DataSource = mekanik;
                DropDownList3.DataTextField = "kategori";
                DropDownList3.DataBind();
                TextBox3.Text = DropDownList3.SelectedItem.ToString();
                Button4.Visible = false;
                if (DropDownList3.SelectedItem.ToString() == "Yeni mekanik parça kategorisi ekleyin.")
                {
                    Button4.Visible = true;
                    Button5.Visible = false;
                    TextBox3.Text = null;
                }
                else if (DropDownList3.SelectedItem.ToString() == "Yeni aksesuar parça kategorisi ekleyin.")
                {
                    Button4.Visible = true;
                    Button5.Visible = false;
                    TextBox3.Text = null;
                }
            }
        }

        protected void SelectedIndexChanged3(object sender, EventArgs e)
        {
            if (DropDownList3.SelectedItem.ToString() == "Yeni mekanik parça kategorisi ekleyin.")
            {
                Button4.Visible = true;
                Button3.Visible = false;
                Button5.Visible = false;
                TextBox3.Text=null;
            }
            else if (DropDownList3.SelectedItem.ToString() == "Yeni aksesuar parça kategorisi ekleyin.")
            {
                Button4.Visible = true;
                Button3.Visible = false;
                Button5.Visible = false;
                TextBox3.Text = null;
            }
            else
            {
                TextBox3.Text = DropDownList3.SelectedItem.ToString();
                Button3.Visible = true;
                Button4.Visible = false;
                Button5.Visible = true;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            test2.Visible = true;
            test.Visible = false;
            DropDownList1.SelectedIndex = 0;
            DataTable mekanik = mekanikCek();
            mekanik.Rows.Add("Mekanik parça kategorisini düzenleyin.");

            DropDownList2.DataSource = mekanik;
            DropDownList2.DataTextField = "kategori";
            DropDownList2.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlCommand komutNesnesi = new SqlCommand("select * from kategoriler where kategori='" + TextBox3.Text + "' and kategoriTuru='" + DropDownList1.SelectedItem.ToString() + "'", con);
            con.Open();
            SqlDataReader reader = komutNesnesi.ExecuteReader();
            if (!reader.HasRows&&!string.IsNullOrEmpty(TextBox3.Text))
            {
                con.Close();
                SqlCommand komutNesnesi2 = new SqlCommand("update kategoriler set kategori='" + TextBox3.Text + "' where kategori='" + DropDownList3.SelectedItem.ToString() + "' and kategoriTuru='" + DropDownList1.SelectedItem.ToString() + "'", con);
                con.Open();
                komutNesnesi2.ExecuteNonQuery();
                con.Close();
                DropDownList2.SelectedIndex = 0;
                ClientScript.RegisterStartupScript(this.GetType(), "ShowLabel4", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label6.ClientID + "').style.display='block'\",100)</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "HideLabel4", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label6.ClientID + "').style.display='none'\",2000)</script>");
                con.Close();
                if (DropDownList1.SelectedItem.Value.ToString() == "1")
                {
                    DataTable mekanik = mekanikCek();
                    mekanik.Rows.Add("Yeni mekanik parça kategorisi ekleyin.");

                    DropDownList3.DataSource = mekanik;
                    DropDownList3.DataTextField = "kategori";
                    DropDownList3.DataBind();
                    TextBox3.Text = DropDownList3.SelectedItem.ToString();
                }
                else
                {
                    DataTable mekanik = aksesuarCek();
                    mekanik.Rows.Add("Yeni aksesuar parça kategorisi ekleyin.");

                    DropDownList3.DataSource = mekanik;
                    DropDownList3.DataTextField = "kategori";
                    DropDownList3.DataBind();
                    TextBox3.Text = DropDownList3.SelectedItem.ToString();
                }

                DropDownList2.SelectedIndex = 0;
                if (DropDownList3.SelectedItem.ToString() == "Yeni mekanik parça kategorisi ekleyin.")
                {
                    Button4.Visible = true;
                    Button3.Visible = false;
                    TextBox3.Text = null;
                }
                else if (DropDownList3.SelectedItem.ToString() == "Yeni aksesuar parça kategorisi ekleyin.")
                {
                    Button4.Visible = true;
                    Button3.Visible = false;
                    TextBox3.Text = null;
                }
                else
                {
                    TextBox3.Text = DropDownList3.SelectedItem.ToString();
                    Button3.Visible = true;
                    Button4.Visible = false;
                }
            }
            else if (string.IsNullOrEmpty(TextBox3.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "ShowLabel5", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label5.ClientID + "').style.display='block'\",100)</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "HideLabel5", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label5.ClientID + "').style.display='none'\",2000)</script>");
                con.Close();
            }
            else if (!string.IsNullOrEmpty(TextBox3.Text) && reader.HasRows)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "ShowLabel6", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label4.ClientID + "').style.display='block'\",100)</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "HideLabel6", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label4.ClientID + "').style.display='none'\",2000)</script>");
                con.Close();
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            SqlCommand komutNesnesi = new SqlCommand("select * from kategoriler where kategori='" + TextBox3.Text + "' and kategoriTuru='" + DropDownList1.SelectedItem.ToString() + "'", con);
            con.Open();
            SqlDataReader reader = komutNesnesi.ExecuteReader();
            if (!reader.HasRows && !string.IsNullOrEmpty(TextBox3.Text))
            {
                con.Close();
                SqlCommand komutNesnesi2 = new SqlCommand("insert into kategoriler(kategori,kategoriTuru) values('" + TextBox3.Text + "','" + DropDownList1.SelectedItem.ToString() + "')", con);
                con.Open();
                komutNesnesi2.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "ShowLabel1", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label7.ClientID + "').style.display='block'\",100)</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "HideLabel1", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label7.ClientID + "').style.display='none'\",2000)</script>");
                con.Close();
                if (DropDownList1.SelectedItem.Value.ToString() == "1")
                {
                    DataTable mekanik = mekanikCek();
                    mekanik.Rows.Add("Yeni mekanik parça kategorisi ekleyin.");

                    DropDownList3.DataSource = mekanik;
                    DropDownList3.DataTextField = "kategori";
                    DropDownList3.DataBind();
                    TextBox3.Text = DropDownList3.SelectedItem.ToString();
                }
                else
                {
                    DataTable mekanik = aksesuarCek();
                    mekanik.Rows.Add("Yeni aksesuar parça kategorisi ekleyin.");

                    DropDownList3.DataSource = mekanik;
                    DropDownList3.DataTextField = "kategori";
                    DropDownList3.DataBind();
                    TextBox3.Text = DropDownList3.SelectedItem.ToString();
                }

                DropDownList2.SelectedIndex = 0;
                if (DropDownList3.SelectedItem.ToString() == "Yeni mekanik parça kategorisi ekleyin.")
                {
                    Button4.Visible = true;
                    Button3.Visible = false;
                    TextBox3.Text = null;
                }
                else if (DropDownList3.SelectedItem.ToString() == "Yeni aksesuar parça kategorisi ekleyin.")
                {
                    Button4.Visible = true;
                    Button3.Visible = false;
                    TextBox3.Text = null;
                }
                else
                {
                    TextBox3.Text = DropDownList3.SelectedItem.ToString();
                    Button3.Visible = true;
                    Button4.Visible = false;
                }
            }
            else if (string.IsNullOrEmpty(TextBox3.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "ShowLabel2", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label5.ClientID + "').style.display='block'\",100)</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "HideLabel2", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label5.ClientID + "').style.display='none'\",2000)</script>");

                con.Close();
            }
            else if (!string.IsNullOrEmpty(TextBox3.Text) && reader.HasRows)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "ShowLabel3", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label4.ClientID + "').style.display='block'\",100)</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "HideLabel3", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label4.ClientID + "').style.display='none'\",2000)</script>");

                con.Close();
            }
            reader.Close();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            test2.Visible = false;
            test.Visible = false;
            test3.Visible = true;
            Label8.Text = "Silinecek olan " + "'"+DropDownList3.SelectedItem.ToString() +"'"+ " adlı kategori silinmesi durumunda bazı ürünlerin kategorileri silinebilir. Bunu onaylıyor musunuz?";

        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            SqlCommand komutNesnesi = new SqlCommand("delete from kategoriler where kategori='"+DropDownList3.SelectedItem.ToString()+"' and kategoriTuru='"+ DropDownList1.SelectedItem.ToString() + "'", con);
            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();

            if (DropDownList1.SelectedItem.Value.ToString() == "1")
            {
                DataTable mekanik = mekanikCek();
                mekanik.Rows.Add("Yeni mekanik parça kategorisi ekleyin.");

                DropDownList3.DataSource = mekanik;
                DropDownList3.DataTextField = "kategori";
                DropDownList3.DataBind();
                TextBox3.Text = DropDownList3.SelectedItem.ToString();
            }
            else
            {
                DataTable mekanik = aksesuarCek();
                mekanik.Rows.Add("Yeni aksesuar parça kategorisi ekleyin.");

                DropDownList3.DataSource = mekanik;
                DropDownList3.DataTextField = "kategori";
                DropDownList3.DataBind();
                TextBox3.Text = DropDownList3.SelectedItem.ToString();
            }

            test.Visible = true;
            test3.Visible = false;
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            test2.Visible = true;
            test3.Visible = false;
        }

        protected void Button_Click(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(TextBox2.Text)) {
                SqlCommand komutNesnesi = new SqlCommand("select * from urunler inner join kategoriler on kategoriler.kategoriID=urunler.kategoriID where urunler.urun='" + TextBox2.Text + "'", con);
                con.Open();
                SqlDataReader reader = komutNesnesi.ExecuteReader();
                if (!reader.HasRows)
                {
                    if (!string.IsNullOrEmpty(TextBox1.Text))
                    {
                        con.Close();
                        if (FileUpload1.HasFile)
                        {
                            if (!string.IsNullOrEmpty(TextArea1.InnerText.ToString()))
                            {
                                //Kategori ve Kategori türünü çek
                                int kategoriID = 0;
                                string kategoriTuru = "";
                                string kategori = DropDownList2.SelectedItem.ToString();

                                SqlCommand komutNesnesi3 = new SqlCommand("select * from kategoriler where kategori='" + kategori + "'", con);
                                con.Open();
                                SqlDataReader reader2 = komutNesnesi3.ExecuteReader();
                                while (reader2.Read())
                                {
                                    kategoriID = Convert.ToInt32(reader2[0]);
                                    kategoriTuru = reader2[2].ToString();
                                }
                                con.Close();

                                //Ürün kaydediliyor
                                SqlConnection con2 = con;
                                SqlCommand komutNesnesi2 = new SqlCommand("insert into urunler(urun,fiyat,aciklama,kategoriID) values(@urun,@fiyat,@aciklama,@kategoriID)", con2);
                                komutNesnesi2.Parameters.AddWithValue("@urun", TextBox2.Text);
                                komutNesnesi2.Parameters.AddWithValue("@fiyat", TextBox1.Text);
                                komutNesnesi2.Parameters.AddWithValue("@aciklama", TextArea1.InnerText.ToString());
                                komutNesnesi2.Parameters.AddWithValue("@kategoriID", kategoriID);
                                con2.Open();
                                komutNesnesi2.ExecuteNonQuery();
                                con2.Close();

                                int urunID = 0;
                                SqlCommand komutNesnesi4 = new SqlCommand("select urunID from urunler where urun='" + TextBox2.Text + "' and fiyat='" + TextBox1.Text + "' and kategoriID='" + kategoriID + "'", con2);
                                con2.Open();
                                SqlDataReader reader3 = komutNesnesi4.ExecuteReader();
                                while (reader3.Read())
                                {
                                    urunID = Convert.ToInt32(reader3[0]);
                                }
                                con2.Close();

                                //Ürün resmi sunucuya Yükleniyor


                                string resimYolu = Server.MapPath(@"~\Pictures\" + kategoriTuru + @"\" + kategori + @"\" + urunID + ".jpeg");

                                string resimKlasoru = Server.MapPath(@"~\Pictures\" + kategoriTuru + @"\" + kategori);

                                string siteResim = @"Pictures\" + kategoriTuru + @"\" + kategori + @"\" + urunID + ".jpeg";

                                bool exists = System.IO.Directory.Exists(resimKlasoru);

                                if (!exists)
                                    System.IO.Directory.CreateDirectory(resimKlasoru);
                                FileUpload1.PostedFile.SaveAs(resimYolu);


                                //Ürün resmi uzatısı veritabanına Yükleniyor


                                SqlCommand komutNesnesi5 = new SqlCommand("update urunler set resim=@resim where urunID=@urunID", con2);
                                komutNesnesi5.Parameters.AddWithValue("@resim", siteResim);
                                komutNesnesi5.Parameters.AddWithValue("@urunID", urunID);
                                con2.Open();
                                komutNesnesi5.ExecuteNonQuery();
                                con2.Close();

                                con.Close();

                                ClientScript.RegisterStartupScript(this.GetType(), "ShowLabel4", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label1.ClientID + "').style.display='block'\",100)</script>");
                                ClientScript.RegisterStartupScript(this.GetType(), "HideLabel4", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label1.ClientID + "').style.display='none'\",2000)</script>");
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "ShowLabel13", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label13.ClientID + "').style.display='block'\",100)</script>");
                                ClientScript.RegisterStartupScript(this.GetType(), "HideLabel13", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label13.ClientID + "').style.display='none'\",2000)</script>");
                            }
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "ShowLabel5", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label9.ClientID + "').style.display='block'\",100)</script>");
                            ClientScript.RegisterStartupScript(this.GetType(), "HideLabel5", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label9.ClientID + "').style.display='none'\",2000)</script>");
                            con.Close();
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "ShowLabel6", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label10.ClientID + "').style.display='block'\",100)</script>");
                        ClientScript.RegisterStartupScript(this.GetType(), "HideLabel6", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label10.ClientID + "').style.display='none'\",2000)</script>");
                        con.Close();
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "ShowLabel7", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label11.ClientID + "').style.display='block'\",100)</script>");
                    ClientScript.RegisterStartupScript(this.GetType(), "HideLabel7", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label11.ClientID + "').style.display='none'\",2000)</script>");
                    con.Close();
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "ShowLabel8", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label12.ClientID + "').style.display='block'\",100)</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "HideLabel8", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + Label12.ClientID + "').style.display='none'\",2000)</script>");
                con.Close();
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