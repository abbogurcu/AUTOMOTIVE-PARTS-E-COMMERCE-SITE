using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Otomotiv_Yedek_Parça_E_Ticaret_Sitesi
{
    public class Global : System.Web.HttpApplication
    {
        public static SqlConnection con = conn.getConnection();

        protected void Application_Start(object sender, EventArgs e)
        {
            System.Timers.Timer timScheduledTask = new System.Timers.Timer();
            // Timer interval is set in miliseconds,
            // In this case, we'll run a task every minute
            timScheduledTask.Interval = 60 * 1000 * 60 * 24;
            timScheduledTask.Enabled = true;
            // Add handler for Elapsed event
            timScheduledTask.Elapsed +=
            new System.Timers.ElapsedEventHandler(timScheduledTask_Elapsed);
            timScheduledTask.Stop();
            timScheduledTask.Start();
        }
        void timScheduledTask_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
        {
            // Execute some task
            SqlCommand komutNesnesi = new SqlCommand("delete from sepetler where tarih<DATEADD(day, -2, GETDATE())", con);
            con.Open();
            komutNesnesi.ExecuteNonQuery();
            con.Close();
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}