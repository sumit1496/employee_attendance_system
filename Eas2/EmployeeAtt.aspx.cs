using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
namespace Eas2
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (!this.Page.User.Identity.IsAuthenticated)
            //{
            //    FormsAuthentication.RedirectToLoginPage();
           // }

            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        //protected void ValidateUser(object sender, AuthenticateEventArgs e)
        //{
        //    int userId = 0;
        //    string constr = ConfigurationManager.ConnectionStrings["REGDataConnectionString"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(constr))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("Validate-User"))
        //        {
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
        //            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
        //            cmd.Connection = con;
        //            con.Open();
        //            userId = Convert.ToInt32(cmd.ExecuteScalar());
        //            con.Close();
        //        }
        //        switch (userId)
        //        {
        //            case -1:
        //                Response.Write( "Username and/or password is incorrect.");
        //                break;

        //            default:
        //                Response.Redirect("Attendance.aspx");
        //                break;
        //        }
        //    }
        //}

        protected void ValidateUser(object sender, EventArgs e)
        {
            //string logintime = DateTime.Now.ToString("hh:mm");
            //if(logintime>'09:30')
            //{

            //}
            int userId = 0;
            string constr = ConfigurationManager.ConnectionStrings["REGDataConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("ValidateUser"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                    cmd.Connection = con;
                    var returnParam = new SqlParameter("@return", SqlDbType.Int);
                    returnParam.Direction = ParameterDirection.ReturnValue;
                    con.Open();
                    userId = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                }
                switch (userId)
                {
                    case -1:
                       Label1.Text=("Username and/or password is incorrect.");
                        break;

                    default:
                        Response.Redirect("Attendance.aspx");
                        break;
                }
            }
        }
    }
}