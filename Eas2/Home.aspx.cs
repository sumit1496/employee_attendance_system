using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.DataVisualization.Charting;
namespace Eas2
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            string username = Session["user"].ToString();

        }
        private static DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            string constr = ConfigurationManager.ConnectionStrings["REGDataConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);
                    }
                }
                return dt;
            }
        }

        private static DataTable chartData()
        {
            /*string query = "Select E.EmployeeId,E.monthDate,ISNULL(Present, 0 ) as Present ,ISNULL(Halfday, 0 ) as Halfday,ISNULL(Exception, 0 ) as Exception from (SELECT distinct EmployeeId , month(Logintime) as monthdate FROM tblAttendanceDetails) as E left join "
                + "(select EmployeeId as id,count(Logintime) as Present, month(Logintime) as monthDate from tblAttendanceDetails where cast(Logintime as time)< cast('09:20' as time)  group by EmployeeId,month(Logintime)) as tb1 on E.EmployeeId=tb1.id and E.monthdate=tb1.monthdate left join "
                + "(select EmployeeId,count(Logintime) as Halfday, month(Logintime) as monthDate2 from tblAttendanceDetails where cast(Logintime as time)> cast('09:30' as time)  group by EmployeeId, month(Logintime)) as tb2 "
                + "on E.EmployeeId=tb2.EmployeeId and tb1.monthDate=tb2.monthDate2 "
                + "left join "
                + "(select EmployeeId,count(Logintime) as Exception,month(Logintime) as monthDate3 from tblAttendanceDetails where cast(Logintime as time) between cast('09:20' as time) and cast('09:30' as time)  group by EmployeeId,month(Logintime)) as tb3 "
                + "on E.EmployeeId=tb3.EmployeeId and tb1.monthDate=tb3.monthDate3"; */
            string query = "SELECT distinct EmployeeId as ID , month(Logintime) as MonthDate, sum(case when cast(Logintime as time) <= cast('09:20' as time)then 1 else 0 end) over(partition by month(Logintime), EmployeeId) as Present, sum(case when cast(Logintime as time) between cast('09:20' as time) and cast('09:30' as time)then 1 else 0 end) over(partition by month(Logintime), EmployeeId) as Exception , sum(case when cast(Logintime as time) > cast('09:30' as time)then 1 else 0 end) over(partition by month(Logintime), EmployeeId) as HalfDay FROM tblAttendanceDetails E ";
            DataTable dt = GetData(query);
            return dt;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = chartData();
                string expression = string.Format("ID={0} and monthDate={1}", Session["User"].ToString().Split('^')[0], DropDownList2.SelectedValue); //DropDownList1.SelectedValue, DropDownList2.SelectedValue);
                DataRow[] foundRows = dt.Select(expression);
                string[] x = new string[] { "Present", "Exception", "Halfday" };
                decimal[] y = new decimal[5];
                y[0] = Convert.ToInt32(foundRows[0][2]);
                y[1] = Convert.ToInt32(foundRows[0][3]);
                y[2] = Convert.ToInt32(foundRows[0][4]);
                BarChart1.Series.Add(new AjaxControlToolkit.BarChartSeries { Data = y, Name = "Month " + DropDownList2.SelectedValue });
                BarChart1.CategoriesAxis = string.Join(",", x);
                BarChart1.ChartTitle = string.Format("Logintime for Employee: {0}", Session["User"].ToString().Split('^')[1]);
            }
            catch (Exception)
            {
                string msg = "No match found for that month!";
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + msg + "');window.location.href = 'Home.aspx'", true);
            }
            
        }

    }
}
