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
    public partial class ResetPwd : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constring"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] != null)
            {
                
            }
            else
            {
                Response.Redirect("SignIn.aspc");
            }
        }

        
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("Update SignUpUsers set password=@pwd where userId=@userId", con);
            cmd.Parameters.AddWithValue("@pwd", txtPassword.Text);
            cmd.Parameters.AddWithValue("@userId", Session["userId"].ToString());
            con.Open();
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Password Changed Successfully')</script>");
            Response.Redirect("Profile.aspx");
        }
    }
}