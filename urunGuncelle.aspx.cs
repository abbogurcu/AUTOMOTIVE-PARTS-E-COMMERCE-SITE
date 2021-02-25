using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Threading;
using System.Timers;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Otomotiv_Yedek_Parça_E_Ticaret_Sitesi
{
    public partial class urunGuncelle : System.Web.UI.Page
    {
        public static SqlConnection con = conn.getConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            string mesaj = Request.QueryString["msg"];
            Response.Write(mesaj);
            if (Convert.ToBoolean(Session["login"]) != true)
            {
                Response.Redirect("adminlogin.aspx?msg=Öncelikle giriş yapmalısınız!");
            }

            if (!Page.IsPostBack)
            {

                if (DropDownList1.SelectedItem.Value.ToString() == "1")
                {
                    DataTable mekanik = mekanikCek();
                    DropDownList2.DataSource = mekanik;
                    DropDownList2.DataTextField = "kategori";
                    DropDownList2.DataValueField = "kategoriID";
                    DropDownList2.DataBind();
                }
                else
                {
                    DataTable aksesuar = aksesuarCek();
                    DropDownList2.DataSource = aksesuar;
                    DropDownList2.DataTextField = "kategori";
                    DropDownList2.DataValueField = "kategoriID";
                    DropDownList2.DataBind();
                }
                Repeater1.DataSource = conn.itemFill(null);
                Repeater1.DataBind();

                DataTable tumu = new DataTable();
                tumu.Columns.Add("kategoriID", typeof(int));
                tumu.Columns.Add("kategori", typeof(string));
                tumu.Rows.Add(0, "Tümü");
                tumu.Merge(mekanikAksesuarCek());

                DropDownList4.DataSource = tumu;
                DropDownList4.DataTextField = "kategori";
                DropDownList4.DataValueField = "kategoriID";
                DropDownList4.DataBind();
            }
        }

        public static DataTable mekanikAksesuarCek()
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select kategoriID,kategori from kategoriler", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            adaptor.Fill(dt);
            return dt;
        }

        public static DataTable mekanikCek()
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select kategoriID,kategori from kategoriler where kategoriTuru='Mekanik'", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            adaptor.Fill(dt);
            return dt;
        }

        public static DataTable aksesuarCek()
        {
            DataTable dt = new DataTable();
            SqlCommand komutNesnesi = new SqlCommand("select kategoriID,kategori from kategoriler where kategoriTuru='Aksesuar'", con);
            SqlDataAdapter adaptor = new SqlDataAdapter(komutNesnesi);
            adaptor.Fill(dt);
            return dt;
        }

        protected void SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Value.ToString() == "1")
            {
                DataTable mekanik = mekanikCek();
                DropDownList2.DataSource = mekanik;
                DropDownList2.DataTextField = "kategori";
                DropDownList2.DataValueField = "kategoriID";
                DropDownList2.DataBind();
            }
            else
            {
                DataTable aksesuar = aksesuarCek();
                DropDownList2.DataSource = aksesuar;
                DropDownList2.DataTextField = "kategori";
                DropDownList2.DataValueField = "kategoriID";
                DropDownList2.DataBind();
            }
        }


        protected void OnSelectedIndexChanged3(object sender, EventArgs e)
        {
            if (DropDownList4.SelectedItem.Value.ToString() == "0")
            {
                Repeater1.DataSource = conn.itemFill("");
                Repeater1.DataBind();
            }
            else
            {
                Repeater1.DataSource = conn.itemFill2(DropDownList4.SelectedItem.Value.ToString());
                Repeater1.DataBind();
            }
        }

        protected void logout2_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();
            Response.Redirect("adminlogin.aspx");
        }

        [WebMethod]
        public static Boolean urunAdKontrol(string urun,string urunID)
        {
            SqlCommand komutNesnesi = new SqlCommand("select * from urunler where urun='" + urun + "' and urunID!='"+Convert.ToInt32(urunID)+"'", con);
            con.Open();
            SqlDataReader reader = komutNesnesi.ExecuteReader();
            if(reader.HasRows){
                con.Close();
                return true;
            }
            else
            {
                con.Close();
                return false;
            }
        }

        [WebMethod]
        public static void urunGuncelleniyor(string urun,string fiyat,string kategoriID,string aciklama,string urunID)
        {
            SqlCommand komutNesnesi = new SqlCommand("update urunler set urun=@urun,fiyat=@fiyat,kategoriID=@kategoriID,aciklama=@aciklama where urunID=@urunID", con);
            komutNesnesi.Parameters.AddWithValue("@urun", urun);
            komutNesnesi.Parameters.AddWithValue("@fiyat", fiyat);
            komutNesnesi.Parameters.AddWithValue("@kategoriID", Convert.ToInt32(kategoriID));
            komutNesnesi.Parameters.AddWithValue("@aciklama", aciklama);
            komutNesnesi.Parameters.AddWithValue("@urunID", Convert.ToInt32(urunID));
            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();
        }

        [WebMethod]
        public static void urunuSil(string urunID)
        {
            SqlCommand komutNesnesi = new SqlCommand("delete from urunler where urunID='"+Convert.ToInt32(urunID)+"'", con);
            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();
        }

        protected void test(object sender, EventArgs e)
        {
            if (DropDownList4.SelectedItem.Value.ToString() == "0")
            {
                Repeater1.DataSource = conn.itemFill("");
                Repeater1.DataBind();
            }
            else
            {
                Repeater1.DataSource = conn.itemFill2(DropDownList4.SelectedItem.Value.ToString());
                Repeater1.DataBind();
            }
        }
    }
}