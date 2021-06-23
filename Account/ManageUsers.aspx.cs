using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class ManageUsers : System.Web.UI.Page
{

    protected void dl_Users_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        Label username = (Label)e.Item.FindControl("lbl_UserName");
        Membership.DeleteUser(e.CommandArgument.ToString());
        dl_Users.DataBind();
    }
    protected void dl_Users_EditCommand(object source, DataListCommandEventArgs e)
    {
        chkl_Roles.DataSource = Roles.GetAllRoles();
        chkl_Roles.DataBind();

        Label username = (Label)e.Item.FindControl("lbl_UserName");
        lbl_UserName.Text = username.Text;

        foreach (ListItem item in chkl_Roles.Items)
        {
            if (Roles.IsUserInRole(username.Text, item.Value))
            {
                item.Selected = true;

            }
        }
    }
    protected void chkl_Roles_TextChanged(object sender, EventArgs e)
    {
        string UserName = lbl_UserName.Text;
        foreach (ListItem item in chkl_Roles.Items)
        {
            if (item.Selected == true && Roles.IsUserInRole(UserName, item.Value) == false)
            {

                Roles.AddUserToRole(UserName, item.Value);
                ///Response.Write("the user in role " + item.Value + "<br>");
            }
            else if (item.Selected == false && Roles.IsUserInRole(UserName, item.Value) == true)
            {
                Roles.RemoveUserFromRole(UserName, item.Value);
                //  Response.Write(" <br>the user not in role " + item.Value + "<br>");
            }

        }

    }
}