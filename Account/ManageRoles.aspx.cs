using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class ManageUsers : System.Web.UI.Page
{
   
    protected void dl_Roles_EditCommand(object source, DataListCommandEventArgs e)
    {
        chkl_Users.DataSource = Membership.GetAllUsers();
        chkl_Users.DataBind();
        
        Label roleName = (Label)e.Item.FindControl("lbl_RoleName");
        string RoleName = lbl_RoleName.Text = roleName.Text;

        foreach (ListItem item in chkl_Users.Items)
        {
            if (Roles.IsUserInRole(item.Value,RoleName))
            {
                item.Selected=true;
            }
        }

    }
    protected void dl_Roles_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        Label username = (Label)e.Item.FindControl("lbl_RoleName");
       
        Roles.DeleteRole(e.CommandArgument.ToString(),false);
        dl_Roles.DataBind();
    }
    protected void chkl_Users_TextChanged(object sender, EventArgs e)
    {
        string RoleName = lbl_RoleName.Text;
        foreach (ListItem item in chkl_Users.Items)
        {
            if (item.Selected == true && Roles.IsUserInRole(item.Value,RoleName) == false)
            {

                Roles.AddUserToRole(item.Value, RoleName);
                ///Response.Write("the user in role " + item.Value + "<br>");
            }
            else if (item.Selected == false && Roles.IsUserInRole(item.Value, RoleName) == true)
            {
                Roles.RemoveUserFromRole(item.Value, RoleName);
                //  Response.Write(" <br>the user not in role " + item.Value + "<br>");
            }

        }

    }
}