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
    public partial class Attendance : System.Web.UI.Page
    {
        TimeSpan logintime = System.DateTime.Now.TimeOfDay;
        TimeSpan time = TimeSpan.Parse("09:20:00.000");
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            { 
                lblAttendance.Text = Session["user"].ToString().Split('^')[1];
                lblDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                if (Session["logintime"] != null && Session["user"] !=null)
                {
                    lblLogin.Text = Session["logintime"].ToString();
                    btnLogin.Text = "Logout(Daily Attendance)";
                    TextBoxRemarks.Text = TextBoxRemarks.Text.ToString();
                }

            }

        }
        
        protected void btnLogin_Click(object sender, EventArgs e)
        {

              if (btnLogin.Text == "Login(Daily Attendance)")
              {
                  SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["REGDataConnectionString"].ConnectionString);
                  con.Open();
                  SqlCommand cmd = new SqlCommand("Track_UserLog", con);
                  cmd.CommandType = CommandType.StoredProcedure;
                  cmd.Parameters.AddWithValue("@EmployeeId", Session["user"].ToString().Split('^')[0]);
                  cmd.ExecuteNonQuery();
                  con.Close();
                  lblLogin.Text = System.DateTime.Now.ToString("hh:mm");
                  Session["logintime"] = System.DateTime.Now.ToString("hh:mm");
                  btnLogin.Text = "Logout(Daily Attendance)";
                  if (logintime > time)
                  {
                      DateTime today = DateTime.Today;
                      SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["REGDataConnectionString"].ConnectionString);
                      cn.Open();
                      SqlCommand cd = new SqlCommand("update tblAttendanceDetails set Remarks=@rem where LoginDate=convert(date,GETDATE()) AND EmployeeId=' " + Session["User"].ToString().Split('^')[0] + " ' AND Remarks IS NULL", cn);
                      cd.Parameters.AddWithValue("@rem", TextBoxRemarks.Text);
                      cd.ExecuteNonQuery();
                      cn.Close();

                  }

              }
              else if (btnLogin.Text == "Logout(Daily Attendance)")
              {
                  SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["REGDataConnectionString"].ConnectionString);
                  con.Open();
                  SqlCommand cmd = new SqlCommand("Track_logout", con);
                  cmd.CommandType = CommandType.StoredProcedure;
                  cmd.Parameters.AddWithValue("@EmployeeId", Session["user"].ToString().Split('^')[0]);

                  cmd.ExecuteNonQuery();

                  lblLogout.Text = System.DateTime.Now.ToString("hh:mm");
                  btnLogin.Text = "Login(Daily Attendance)";

              }
           /* if (btnLogin.Text == "Login(Daily Attendance)")
            {
                lblLogin.Text = System.DateTime.Now.ToString("hh:mm");
                //1.store value in session variable
                Session["logintime"] = System.DateTime.Now.ToString("hh:mm");
                btnLogin.Text = "Logout(Daily Attendance)";
            }
            else if (btnLogin.Text == "Logout(Daily Attendance)")
            {
                lblLogout.Text = System.DateTime.Now.ToString("hh:mm");
                btnLogin.Text = "Login(Daily Attendance)";
            }*/

        }

        

    }
}