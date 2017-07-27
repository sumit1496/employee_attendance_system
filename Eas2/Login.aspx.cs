using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Eas2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["REGDataConnectionString"].ToString());
                con.Open();
                string query = "select ISNULL(EmployeeId,0)  from tblEmployee where UserName='" + txtuser.Text + "' and Password='" + txtpass.Text + "' ";
                SqlCommand cmd = new SqlCommand(query, con);
                var output = cmd.ExecuteScalar().ToString();

                if (output != "0")
                {

                    Session["user"] = output + "^" + txtuser.Text;
                    Response.Redirect("~/Home.aspx");
                }

            }
            catch (Exception)
            {

                lblerror.Text = "Username or Password is incorrect!";

            }

        }

    }
}
