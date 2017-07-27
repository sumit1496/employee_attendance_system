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
    public partial class Role : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void RoleCreated(object sender, EventArgs e)
        {
            int RoleId = 0;
            //Guid newguid = Guid.NewGuid();
            string constr = ConfigurationManager.ConnectionStrings["REGDataConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Create_Role"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        //cmd.Parameters.AddWithValue("@CompanyId", newguid.ToString());
                        cmd.Parameters.AddWithValue("@RoleName", txtrolename.Text.Trim());
                        cmd.Parameters.AddWithValue("@CreatedBy", txtcreatedby.Text.Trim());
                        //cmd.Parameters.AddWithValue("@Contact", txtContact.Text.Trim());


                        //var returnParam = new SqlParameter("@return", SqlDbType.Int);
                        //returnParam.Direction = ParameterDirection.ReturnValue;

                        cmd.Connection = con;
                        con.Open();
                        //cmd.ExecuteNonQuery();
                        RoleId = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();
                    }
                }
                //Response.Write("Registration Successful");
                string message = string.Empty;
                switch (RoleId)
                {
                    case -1:
                        message = "Role already exists.\\nPlease choose a different Role name.";
                        break;

                    default:
                        message = "Registration successful.\\nRole Id: " + RoleId.ToString();
                        break;
                }
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');window.location.href = 'Role.aspx'", true);
            }
        }
    }
}