using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace Eas2
{
    public partial class UserToRoleMapping : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                string CS = ConfigurationManager.ConnectionStrings["REGDataConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("Select RoleId, RoleName, CreatedBy, CreatedDate from tblRole", con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    //DropDownListCN.DataTextField = "Name";
                    //DropDownListCN.DataValueField = "CompanyId";
                    RoleList.DataSource = rdr;
                    RoleList.DataBind();
                }
            }

        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {

            var roleId = RoleList.SelectedValue;
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox ck = (CheckBox)row.FindControl("ck1");
                if (ck.Checked)
                {
                    var employeeId = row.Cells[1].Text;
                    var act = row.Cells[11].Text;
                    /* string constr = ConfigurationManager.ConnectionStrings["REGDataConnectionString"].ConnectionString;

                     SqlConnection con = new SqlConnection(constr);
                     SqlCommand command = new SqlCommand("insert into tblRoleToUsermapping (RoleId,EmployeeId,ActiveInactive) values (@RoleId,@EmployeeId,@ActiveInactive)", con);
                     command.Parameters.AddWithValue("@Roleid", roleId);
                     command.Parameters.AddWithValue("@EmployeeId", employeeId);
                     command.Parameters.AddWithValue("@ActiveInactive", act);


                     con.Open();
                     command.ExecuteNonQuery();

                     con.Close();*/
                    string constr = ConfigurationManager.ConnectionStrings["REGDataConnectionString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        using (SqlCommand cmd = new SqlCommand("rolemap"))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Connection = con;
                            cmd.Parameters.AddWithValue("@RoleId", roleId);
                            cmd.Parameters.AddWithValue("@EmployeeId", employeeId);
                            cmd.Parameters.AddWithValue("@ActiveInactive", act);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                    string msg = "Role assigned!";

                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + msg + "');window.location.href = 'UserToRoleMapping.aspx'", true);




                }
            }
        }
    }


}
