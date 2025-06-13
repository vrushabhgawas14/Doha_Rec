using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Doha_Rec.Admin
{
    public partial class AddEditUser : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Run the below function only Once, isPostBack happpens on second reload.
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            SqlConnection sqlConnection = new SqlConnection(connString);
            string sqlQuery = "SELECT * FROM RegisteredUsers";
            try
            {
                SqlCommand sqlCommand = new SqlCommand(sqlQuery, sqlConnection);
                sqlConnection.Open();

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);

                GridView2.DataSource = dataTable;
                GridView2.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("Error : " + ex.Message);
            }
            finally
            {
                sqlConnection.Close();
            }
        }

        protected void GridView2_DataBound(object sender, EventArgs e)
        {
            GridViewRow pagerRow = GridView2.BottomPagerRow;
            if (pagerRow != null)
            {
                Label lblPageIndex = (Label)pagerRow.FindControl("lblPageIndex");
                Label lblTotalPages = (Label)pagerRow.FindControl("lblTotalPages");

                if (lblPageIndex != null && lblTotalPages != null)
                {
                    lblPageIndex.Text = (GridView2.PageIndex + 1).ToString();
                    lblTotalPages.Text = GridView2.PageCount.ToString();
                }
            }
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (e.NewPageIndex >= 0 && e.NewPageIndex < GridView2.PageCount)
            {
                GridView2.PageIndex = e.NewPageIndex;
                BindGrid();
            }
        }

        protected void addNextBtn_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "NextTab", "showTab('access');", true);
            pnlAccessControl.Enabled = true;
        }

        protected void accessNextBtn_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "NextTab", "showTab('confirm');", true);
            pnlConfirmation.Enabled = true;
        }

        protected void cancelSubmitBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Admin/HouseKeeping");
        }
    }
}