using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FriendsPortal_1
{
    public partial class Notification : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constring"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] != null)
            {
                if(!IsPostBack)
                {
                    //GetNotifications();
                }
            }
            else
            {
                Response.Redirect("SignIn.aspc");
            }
        }


        //protected void GetNotifications1()
        //{
        //    using (con)
        //    {
        //        SqlCommand cmd = new SqlCommand("SELECT * FROM FriendRequests WHERE userId = @userId AND IsRead = 0", con);
        //        cmd.Parameters.AddWithValue("@userId", Session["userId"].ToString());
        //        con.Open();
        //        SqlDataReader sdr = cmd.ExecuteReader();

        //        NotificationsRepeater.DataSource = sdr;
        //        NotificationsRepeater.DataBind();
        //    }
        //}

        //protected void GetNotifications()
        //{
        //    try
        //    {
                
        //        int FollowToUserId = int.Parse((a.FindControl("userId") as Label).Text.ToString());

        //        using (con)
        //        {
                    
        //            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM FollowRequests WHERE userId = @userId AND ToUserId = @ToUserId", con);
        //            cmd.Parameters.AddWithValue("@userId", Session["userId"].ToString());
        //            cmd.Parameters.AddWithValue("@ToUserId", FollowToUserId);
        //            con.Open();
        //            int count = (int)cmd.ExecuteScalar();

        //            if (count == 0) // Request doesn't exist yet
        //            {
                        
        //            }
        //            else
        //            {
        //                // Handle duplicate request scenario (optional)
        //                // ...
        //            }
        //        }
        //    }
        //    catch (SqlException ex)
        //    {
        //        // Handle database errors
        //        // ...
        //    }
        //}

        //protected void btnAccept_Click(object sender, EventArgs e)
        //{

        //}

        //protected void btnDecline_Click(object sender, EventArgs e)
        //{

        //}
    }

}