using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FriendsPortal_1
{
    public partial class FriendsList : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constring"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] != null)
            {
                if (!IsPostBack)
                {
                    GetAllFriendsNames();
                }
            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }
        }

        protected void GetAllFriendsNames()
        {
            try
            {
                using(con)
                {
                    using (SqlCommand cmd = new SqlCommand("select * from SignUpUsers order by userId DESC", con))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            RAllFriendsList.DataSource = dt;
                            RAllFriendsList.DataBind();
                        }
                    }
                }
            }
            catch(Exception ex)
            {

            }
        }

        
    }
}