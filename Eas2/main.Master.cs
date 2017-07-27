using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;

namespace Eas2
{
    public partial class main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (IsPostBack)
            {
                foreach (MenuItem item in pnMenu.Items)
                {
                    Check(item);
                }
            }
            

        }
        private void Check(MenuItem item)
        {
            if (item.NavigateUrl.Equals(Request.AppRelativeCurrentExecutionFilePath, StringComparison.InvariantCultureIgnoreCase))
            {
                item.Selected = true;
            }
            else if (item.ChildItems.Count > 0)
            {
                foreach (MenuItem menuItem in item.ChildItems)
                {
                    Check(menuItem);
                }
            }
        }

        protected void lblLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            //Session["User"]
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
        
    }
}