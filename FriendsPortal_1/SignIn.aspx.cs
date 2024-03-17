using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FriendsPortal_1
{
    public partial class SignIn : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constring"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("select * from SignUpUsers where Email=@email and Password=@password", con);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.HasRows)
            {
                sdr.Read();
                Session["userId"] = sdr.GetValue(0);
                Response.Redirect("Feed.aspx");
            }
            else
            {
                Response.Write("<script>alert('Incorrect Email Id and Password..!')</script>");
            }
        }

        protected void ForgotPsw_Click(object sender, EventArgs e)
        {
            Response.Redirect("ResetPwd.aspx");
        }
    }
}