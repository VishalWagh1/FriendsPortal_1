using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace FriendsPortal_1
{
    public partial class SearchFriends : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constring"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"]!=null)
            {

            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }
        }

        protected void btnSearchUsers_Click(object sender, EventArgs e)
        {
            PopulateGridView(txtSearch.Text);
        }

        void PopulateGridView(string searchTerm)
        {
            DataTable dt = new DataTable();
            using (con)
            {

                string query = "SELECT * FROM SignUpUsers";
                SqlCommand cmd = new SqlCommand(query, con);

                if (!String.IsNullOrWhiteSpace(searchTerm))
                {
                    query += " WHERE firstname like '" + searchTerm + "%' or lastname like '" + searchTerm + "%'";
                    cmd.CommandText = query;
                    //cmd.Parameters.AddWithValue("@firstname", searchTerm);
                    //cmd.Parameters.AddWithValue("@lastname", searchTerm);
                }

                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);

                sda.Fill(dt);
            }

            if (dt.Rows.Count > 0)
            {
                gvUsers.DataSource = dt;
                gvUsers.DataBind();
                gvUsers.Visible = true;
            }
            else
            {
                dt.Rows.Add(dt.NewRow());
                gvUsers.DataSource = dt;
                gvUsers.DataBind();
                //gvUsers.Rows[0].Cells.Clear();
                //gvUsers.Rows[0].Cells.Add(new TableCell());
                //gvUsers.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                //gvUsers.Rows[0].Cells[0].Text = "No Data Found";
                //gvUsers.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }
    }
}