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
    public partial class admin : System.Web.UI.Page
    {
        static SqlConnection con = conn.getConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            string mesaj = Request.QueryString["msg"];
            Response.Write(mesaj);
            if (Convert.ToBoolean(Session["login"]) != true)
                Response.Redirect("adminlogin.aspx?msg=Öncelikle giriş yapmalısınız!");

            DataSet iletisim = iletisimFormu();
            GridView1.DataSource = iletisim.Tables[0];
            GridView1.DataBind();
        }

        public static DataSet iletisimFormu()
        {
            SqlCommand komut = new SqlCommand("select * from iletisimFormu", con);
            DataSet randevularDS = new DataSet();
            SqlDataAdapter adaptor = new SqlDataAdapter(komut);
            con.Open();
            adaptor.Fill(randevularDS);
            con.Close();
            return randevularDS;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label mesajNo = (Label)GridView1.Rows[e.RowIndex].FindControl("urunmontajid");
            SqlCommand komutNesnesi = new SqlCommand("delete from iletisimFormu where iletisimFormID='" + Convert.ToInt32(mesajNo.Text) + "'", con);
            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();

            GridView1.DataSource = iletisimFormu();
            GridView1.DataBind();
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