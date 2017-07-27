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
    public partial class Employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string pwd = TextBoxpassword.Text;
            TextBoxpassword.Attributes.Add("value", pwd);
            string rpwd = TextBoxRPass.Text;
            TextBoxRPass.Attributes.Add("value", rpwd);

            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                string CS = ConfigurationManager.ConnectionStrings["REGDataConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("Select CompanyId, Name, Address, Contact from tblCompany", con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    //DropDownListCN.DataTextField = "Name";
                    //DropDownListCN.DataValueField = "CompanyId";
                    DropDownListCN.DataSource = rdr;
                    DropDownListCN.DataBind();
                }
            }


        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {



                int EmployeeId = 0;
                string constr = ConfigurationManager.ConnectionStrings["REGDataConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {

                    using (SqlCommand com = new SqlCommand("Register_Employee"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            com.CommandType = CommandType.StoredProcedure;
                            com.Parameters.AddWithValue("@EmployeeCode", TextBoxEC.Text);
                            com.Parameters.AddWithValue("@Fname", TextBoxEF.Text);
                            com.Parameters.AddWithValue("@Mname", TextBoxEM.Text);
                            com.Parameters.AddWithValue("@LaName", TextBoxEL.Text);
                            com.Parameters.AddWithValue("@UserName", TextBoxUN.Text);
                            com.Parameters.AddWithValue("@Password", TextBoxpassword.Text);
                            com.Parameters.AddWithValue("@RPassword", TextBoxRPass.Text);
                            com.Parameters.AddWithValue("@CompanyName", DropDownListCN.SelectedItem.ToString());
                            com.Parameters.AddWithValue("@Gender", DropDownListG.SelectedItem.ToString());
                            com.Parameters.AddWithValue("@DateOfBirth", TextBoxCal.Text);
                            com.Parameters.AddWithValue("@DateOfJoining", TextBoxJoin.Text);
                            com.Parameters.AddWithValue("@Address", TextBoxAdd.Text);
                            com.Parameters.AddWithValue("@PAddress", TextBoxPAdd.Text);
                            com.Parameters.AddWithValue("@Email", TextBoxEMAIL.Text);
                            com.Parameters.AddWithValue("@PhoneNumber", TextBoxPHN.Text);
                            com.Parameters.AddWithValue("@ExpectedPeriod", TextBoxPERIOD.Text);
                            com.Parameters.AddWithValue("@SkillSet", DropDownListSKILL.SelectedItem.ToString());
                            int value;
                            if (Chkbox.Checked)
                                              {
                                //com.Parameters.Add("@Chkbox", SqlDbType.Bit).Value = 1;
                                value = 1;
                            }
                            else
                            {
                                //com.Parameters.Add("@Chkbox", SqlDbType.Bit).Value = 0;
                                value = 0;
                            }
                            com.Parameters.AddWithValue("@ActiveInactive",value);
                            com.Connection = con;
                            con.Open();
                            EmployeeId = Convert.ToInt32(com.ExecuteScalar());
                            con.Close();

                        }
                    }
                }

                string message = string.Empty;
                switch (EmployeeId)
                {
                    case -1:
                        message = "Employee already exists.\\nPlease choose a different Employee name.";
                        break;

                    default:
                        message = "Registration successful.\\nEmployee Id: " + EmployeeId.ToString();
                        break;
                }
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');window.location.href = 'Employee.aspx'", true);

            }

            catch (Exception ex)
            {
                Response.Write("Error!" + ex.ToString());

            }
        }

        protected void TextBoxUN_TextChanged(object sender, EventArgs e)
        {

        }

        protected void chkSameasLocal_CheckedChanged(object sender, EventArgs e)
        {
            TextBoxPAdd.Text = TextBoxAdd.Text;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Employee.aspx");
        }
    }
}