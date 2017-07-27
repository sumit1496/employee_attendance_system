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
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                lblid.Text = Session["User"].ToString().Split('^')[1];
                GridView1.Visible = false;
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["REGDataConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT EmployeeId,LoginDate,Logintime,Logoutime,Remarks FROM tblAttendanceDetails where EmployeeId=' " + Session["User"].ToString().Split('^')[0] + " ' and LoginDate BETWEEN Convert(DateTime,'" + TextBoxstart.Text + "',101) AND Convert(DateTime,'" + TextBoxend.Text + "',101)"))
                {

                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {


                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                            GridView1.Visible = true;
                        }
                    }
                }
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                TableHeaderCell NewCell = new TableHeaderCell();
                NewCell.Text = "Delay";
                e.Row.Cells.Add(NewCell);
                NewCell = new TableHeaderCell();
                NewCell.Text = "Duration";
                e.Row.Cells.Add(NewCell);
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                string Logintime = e.Row.Cells[2].Text;
                string Logoutime = e.Row.Cells[3].Text;
                DateTime Logintimedt = Convert.ToDateTime(Logintime);
                DateTime Logoutimedt = Convert.ToDateTime(Logoutime);
                DateTime today = DateTime.Today.AddHours(09).AddMinutes(20).AddSeconds(00);
                TimeSpan diff = Logoutimedt.TimeOfDay - Logintimedt.TimeOfDay;
                TimeSpan delay;
                TableCell NewCell = new TableCell();
                if (Logintimedt > today)
                {
                    delay = Logintimedt.TimeOfDay - today.TimeOfDay;
                    NewCell.Text = delay.ToString();
                }
                NewCell.ID = "NewCell1";
                e.Row.Cells.AddAt(5, NewCell);
                NewCell = new TableCell();
                NewCell.ID = "NewCell2";
                NewCell.Text = diff.ToString();
                e.Row.Cells.AddAt(6, NewCell);

            }

        }
    }
}