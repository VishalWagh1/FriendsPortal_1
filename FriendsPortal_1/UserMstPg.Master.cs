using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FriendsPortal_1
{
    public partial class UserMstPg : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constring"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] != null)
            {
                
            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }
        }


        protected void btnAddPost_Click(object sender, EventArgs e)
        {
            foreach (var files in UserPosts.PostedFiles) 
            {
                //to get exention
                string ext = System.IO.Path.GetExtension(files.FileName);
                //this is a data type used to rename the file name. it adds unique id 
                Guid guid = Guid.NewGuid();
                string PostName = guid + ext;
                string PathPost = "AllPosts/" + PostName;
                //server.mappath is to store image in allposts folder
                files.SaveAs(Server.MapPath(PathPost));

                string paththumbnails = "Thumbnails/" + PostName;

                //to resize the image
                int widthC = 600;
                int heightC = 400;
                System.IO.Stream streamC = files.InputStream;
                System.Drawing.Bitmap imageC = new Bitmap(streamC);
                Bitmap targetC = new Bitmap(widthC, heightC);
                Graphics graphicC = Graphics.FromImage(targetC);
                graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
                targetC.Save(Server.MapPath(paththumbnails));

                //to store images in database
                con.Close();
                SqlCommand cmd = new SqlCommand("insert into Posts (userId, Thumbnails, AllPosts, uploadedDt) values (@userId, @thumbnails, @posts, @dt)", con);
                cmd.Parameters.AddWithValue("@userId", Session["userId"].ToString());
                cmd.Parameters.AddWithValue("@thumbnails", paththumbnails);
                cmd.Parameters.AddWithValue("@posts", PathPost);
                cmd.Parameters.AddWithValue("@dt", DateTime.Now);
                con.Open();
                cmd.ExecuteNonQuery();
                
            }
             
        }

        protected void btnSetting_Click(object sender, EventArgs e)
        {
            Response.Redirect("Setting.aspx");
        }

        protected void btnEditProf_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProfile.aspx");
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("SignIn.aspx");
        }

        protected void btnDeleteAcc_Click(object sender, EventArgs e)
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("Delete * from SignUpUsers where userId=@userId", con);
            cmd.Parameters.AddWithValue("@userId", Session["userId"].ToString());
            con.Open();
            cmd.ExecuteNonQuery();
        }

        protected void btnShareAcc_Click(object sender, EventArgs e)
        {
            string accountLink = "http://FriendsPortal/Profile.aspx?userId=" + Session["userId"];
            string script = "alert('Check out my profile on my new social platform:\n" + accountLink + "');";
            
            // Display the link in a label
            ShareAccLbl.Text = "Your shareable link: " + accountLink;
            ShareAccLbl.Visible = true;
        }

        protected void btnFriendsList_Click(object sender, EventArgs e)
        {
            Response.Redirect("FriendsList.aspx");
        }

        protected void btnProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
                      
        }

        protected void btnFeed_Click(object sender, EventArgs e)
        {
            Response.Redirect("Feed.aspx");
                        
        }

        

        
    }
}