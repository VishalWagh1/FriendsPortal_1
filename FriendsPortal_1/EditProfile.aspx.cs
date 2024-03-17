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
    public partial class EditProfile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constring"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] != null)
            {
                if (!IsPostBack)
                {
                    ShowInfoToEdit();
                }
            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }

        }

        protected void ShowInfoToEdit()
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("select * from SignUpUsers where userId=@userid", con);
            cmd.Parameters.AddWithValue("@userId", Session["userId"].ToString());
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.HasRows)
            {
                sdr.Read();
                txtFname.Text = sdr.GetValue(1).ToString();
                txtLname.Text = sdr.GetValue(2).ToString();
                txtEmail.Text = sdr.GetValue(3).ToString();
                txtContact.Text = sdr.GetValue(4).ToString();
                txtCity.Text = sdr.GetValue(5).ToString();
                
                

            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("Update SignUpUsers set firstname=@fname, lastname=@lname, email=@email, contact=@contact, city=@city, updateDt=@dt, bio=@bio where userId=@userId", con);
            cmd.Parameters.AddWithValue("@fname", txtFname.Text);
            cmd.Parameters.AddWithValue("@lname", txtLname.Text);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@contact", txtContact.Text);
            cmd.Parameters.AddWithValue("@city", txtCity.Text);
            cmd.Parameters.AddWithValue("@userId", Session["userId"].ToString());
            cmd.Parameters.AddWithValue("@dt", DateTime.Now);
            
            con.Open();
            cmd.ExecuteNonQuery();
            ShowInfoToEdit();
            Response.Redirect("Profile.aspx");
        }



        protected void btnUploadProfile_Click1(object sender, EventArgs e)
        {
            foreach (var files1 in UserProfile.PostedFiles)
            {

                string ext1 = System.IO.Path.GetExtension(files1.FileName);
                Guid g = Guid.NewGuid();
                string picName = g + ext1;
                string pathPic = "ProfileImg/" + picName;
                files1.SaveAs(Server.MapPath(pathPic));

                con.Close();
                SqlCommand cmd = new SqlCommand("insert into OtherData (userId, profilePic, PicuploadedDt) values (@userId, @profilePic, @dt)", con);
                cmd.Parameters.AddWithValue("@userId", Session["userId"].ToString());
                cmd.Parameters.AddWithValue("@profilePic", pathPic);
                cmd.Parameters.AddWithValue("@dt", DateTime.Now);
                con.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect("Profile.aspx");
                
            }
        }

    }    
}