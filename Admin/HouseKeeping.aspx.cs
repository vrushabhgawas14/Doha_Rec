using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doha_Rec.Admin
{
    public partial class HouseKeeping : System.Web.UI.Page
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
            }finally {
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


        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gridRow = GridView2.SelectedRow;
            string userName = gridRow.Cells[0].Text;
            string role = gridRow.Cells[1].Text;
            string email = gridRow.Cells[2].Text;

            Response.Write("Selected UserName: " + userName + " | " + role + " | " + email);
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (e.NewPageIndex >= 0 && e.NewPageIndex < GridView2.PageCount)
            {
                GridView2.PageIndex = e.NewPageIndex;
                BindGrid();
            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView2, "Select$" + e.Row.RowIndex);
            }

            e.Row.Style["cursor"] = "pointer";
        }
    }
}