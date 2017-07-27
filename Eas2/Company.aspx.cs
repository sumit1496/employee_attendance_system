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
    public partial class Company : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        

        protected void RegisterCompany(object sender, EventArgs e)
        {
             int CompanyId = 0;
            //Guid newguid = Guid.NewGuid();
            string constr = ConfigurationManager.ConnectionStrings["REGDataConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Register_Company"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        //cmd.Parameters.AddWithValue("@CompanyId", newguid.ToString());
                        cmd.Parameters.AddWithValue("@Name", txtname.Text.Trim());
                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                        cmd.Parameters.AddWithValue("@Contact", txtContact.Text.Trim());


                        //var returnParam = new SqlParameter("@return", SqlDbType.Int);
                        //returnParam.Direction = ParameterDirection.ReturnValue;

                        cmd.Connection = con;
                        con.Open();
                        //cmd.ExecuteNonQuery();
                        CompanyId = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();
                    }
                }
                //Response.Write("Registration Successful");
                string message = string.Empty;
                switch (CompanyId)
                {
                    case -1:
                        message = "Company already exists.\\nPlease choose a different Company name.";
                        break;

                    default:
                        message = "Registration successful.\\nUser Id: " + CompanyId.ToString();
                        break;
                }
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');window.location.href = 'Company.aspx'", true);
            }
        }
    }
}