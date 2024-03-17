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

    public partial class SignUp : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constring"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("insert into SignUpUsers (firstname, lastname, email, contact, city, password, createDt) values (@firstname, @lastname, @email, @contact, @city, @password, @createDt)", con);
            cmd.Parameters.AddWithValue("@firstname", txtFname.Text);
            cmd.Parameters.AddWithValue("@lastname", txtLname.Text);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@contact", txtContact.Text);
            cmd.Parameters.AddWithValue("@city", txtCity.Text);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@createDt", DateTime.Now);
            con.Open();
            cmd.ExecuteNonQuery();

            txtFname.Text = string.Empty;
            txtLname.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtContact.Text = string.Empty;
            txtCity.Text = string.Empty;
            txtPassword.Text = string.Empty;
            Response.Write("<script>alert('You have registered successfully..!')</script>");

            Response.Redirect("SignIn.aspx");
        }
    }
}