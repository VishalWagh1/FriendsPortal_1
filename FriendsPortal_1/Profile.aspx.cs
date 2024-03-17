using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FriendsPortal_1
{
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constring"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] != null)
            {
                if (!IsPostBack)
                {
                    ShowUserInfo();
                    ShowUsersPosts();
                    ShowBio();
                    ShowProfPic();

                   
                }
                

            }
            else 
            {
                Response.Redirect("SignIn.aspx");
            }

        }

        protected void ShowUserInfo()
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("select * from SignUpUsers where userId=@Id", con);
            cmd.Parameters.AddWithValue("@Id", Session["userId"]);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.HasRows)
            {
                sdr.Read();
                lblUserFName.Text = sdr.GetValue(1).ToString();
                lblUserLName.Text = sdr.GetValue(2).ToString();
                lblFName.Text= sdr.GetValue(1).ToString();
                lblLName.Text = sdr.GetValue(2).ToString();
                lblEmail.Text = sdr.GetValue(3).ToString();
                lblContact.Text = sdr.GetValue(4).ToString();
                lblCity.Text = sdr.GetValue(5).ToString();
            }

        }

        protected void ShowProfPic()
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("select * from OtherData where userId=@userId", con);
            cmd.Parameters.AddWithValue("@userId", Session["userId"].ToString());
            
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.HasRows)
            {
                sdr.Read();
                ProfPic.ImageUrl = sdr.GetValue(2).ToString();
                ProfPicIcon.Visible = false;
            }
        }

        protected void ShowUsersPosts()
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("select * from Posts where userId=@userId order by postId DESC", con);
            cmd.Parameters.AddWithValue("@userId", Session["userId"].ToString());
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if(sdr.HasRows)
            {
                while(sdr.Read())
                {
                    LitPosts.Text += "<div class='col-md-4 my-3 deletetab'><a href='" +sdr.GetValue(3)+"'><img src='"+sdr.GetValue(2)+"' /></a></div>";
                }
            }
        }

        

        protected void btnBio_Click1(object sender, EventArgs e)
        {
            {
                con.Close();
                SqlCommand cmd = new SqlCommand("insert into AllBios (userId, bio, BiouploadedDt) values (@userId, @bio, @BiouploadedDt)", con);
                cmd.Parameters.AddWithValue("@userId", Session["userId"].ToString());
                cmd.Parameters.AddWithValue("@bio", txtBio.Text);
                cmd.Parameters.AddWithValue("BiouploadedDt", DateTime.Now);
                
                con.Open();
                cmd.ExecuteNonQuery();
                ShowBio();

            }
        }


        protected void ShowBio()
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("select * from AllBios where userId=@userId order by srno DESC", con);
            cmd.Parameters.AddWithValue("@userId", Session["userId"].ToString());
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.HasRows)
            {
                sdr.Read();
                lblBio.Text = sdr.GetValue(2).ToString();
                
            }
        }
        
    }

    
}