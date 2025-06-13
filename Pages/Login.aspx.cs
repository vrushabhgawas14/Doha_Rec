using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doha_Rec
{
    public partial class Login : System.Web.UI.Page
    {

        string connString = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                Response.Redirect("/");
            }
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            string userName = usernameTextBox.Text.Trim();
            string password = passTextBox.Text.Trim();

            if(isValidUserAsync(userName, password)){
                
                Response.Redirect("/");
            }
            else
            {
                string alertScript = "alert('Invalid Username or Password!')";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", alertScript, true);
            }
        }

        protected bool isValidUserAsync(string userName, string password)
        {
            string sqlQuery = "SELECT Username FROM RegisteredUsers WHERE Username=@username and Password=@password";
            SqlConnection sqlConnection = new SqlConnection(connString);
            try
            {
                sqlConnection.Open();
                SqlCommand sqlCommand = new SqlCommand(sqlQuery, sqlConnection);
                sqlCommand.Parameters.AddWithValue("@username", userName.ToLower());
                sqlCommand.Parameters.AddWithValue("@password", password);

                SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();

                if (sqlDataReader.HasRows)
                {
                    while (sqlDataReader.Read())
                    {
                        Session["user"] = sqlDataReader.GetString(0);
                    }

                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {

                sqlConnection.Close();
            }


            return false;
        }
    }
}