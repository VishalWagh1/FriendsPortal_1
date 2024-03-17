using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FriendsPortal_1
{
    public partial class Feed : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constring"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] != null)
            {
                if(!IsPostBack)
                {
                    ShowFname();
                    ShowAllUsersPosts();
                }
            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }
            }



        protected void ShowFname()
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("select * from SignUpUsers where userId=@userId", con);
            cmd.Parameters.AddWithValue("@userId", Session["userId"].ToString());
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.HasRows)
            {
                sdr.Read();
                lblShowFname.Text = sdr.GetValue(1).ToString();
                

            }
        }

        protected void btnAddPost_Click(object sender, EventArgs e)
        {
            foreach(var files in UserPosts.PostedFiles)
            {
                string ext = System.IO.Path.GetExtension(files.FileName);
                Guid g = Guid.NewGuid();
                string PostName = g + ext;
                string PathPost = "AllPosts/" + PostName;
                files.SaveAs(Server.MapPath(PathPost));
                string paththumbnails = "Thumbnails/" + PostName;

                int widthC = 600;
                int heightC = 400;
                System.IO.Stream streamC = files.InputStream;
                System.Drawing.Bitmap imageC = new Bitmap(streamC);
                Bitmap targetC = new Bitmap(widthC, heightC);
                Graphics graphicC = Graphics.FromImage(targetC);
                graphicC.DrawImage(imageC, 0, 0, widthC, heightC);
                targetC.Save(Server.MapPath(paththumbnails));

                con.Close();
                SqlCommand cmd = new SqlCommand("insert into Posts (userId, Thumbnails, AllPosts, uploadedDt) values (@userId, @Thumbnails, @AllPosts, @dt)", con);
                cmd.Parameters.AddWithValue("@userId", Session["userId"].ToString());
                cmd.Parameters.AddWithValue("thumbnails", paththumbnails);
                cmd.Parameters.AddWithValue("@AllPosts", PathPost);
                cmd.Parameters.AddWithValue("@dt", DateTime.Now);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }


        protected void ShowAllUsersPosts()
        {
            try
            {
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand("select SignUpUsers.*, Posts.* from SignUpUsers inner join Posts on SignUpUsers.userId=Posts.userId order by postId DESC", con))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            RepeatAllPosts.DataSource = dt;
                            RepeatAllPosts.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnFollowSendRequest_Click(object sender, EventArgs e)
        {
            RepeaterItem a = (sender as Button).Parent as RepeaterItem;
            int FollowToUserId = int.Parse((a.FindControl("userId") as Label).Text.ToString());
            using (con)
            {
                try
                {
                    con.Close();
                    SqlCommand cmd = new SqlCommand("insert into FriendRequests (userId, ToUserId, followDt) values (@userId, @touserid, @dt)", con);
                    cmd.Parameters.AddWithValue("@userId", Session["userId"].ToString());
                    cmd.Parameters.AddWithValue("@touserid", FollowToUserId);
                    cmd.Parameters.AddWithValue("@dt", DateTime.Now);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    
                    Response.Write("<script>alert('Follow request sent Successfully')</script>");
                    
                    

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error sending follow request')</script>");
                }

                



            }
        }



        


    }
}