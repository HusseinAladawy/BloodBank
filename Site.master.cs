using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    aspnet_User asp_user;
    protected void Page_Load(object sender, EventArgs e)
    {
        BloodBankDataContext blood = new BloodBankDataContext();
        MembershipUser user = Membership.GetUser();
        if (user != null)
        {
            asp_user = blood.aspnet_Users.Single(x => x.UserId == (Guid)user.ProviderUserKey);
        }
        if (user == null)
        {
            Response.Redirect("~/login.aspx");
        }

        // if (Roles.IsUserInRole("User"))
        // {
        //     // MenuItem mnuItem1 = NavigationMenu.FindItem("1"); // Find particular item
        //     // NavigationMenu.Items.Remove(mnuItem1);
        //     // //MenuItem mnuItem2 = NavigationMenu.FindItem("2"); // Find particular item
        //     // //NavigationMenu.Items.Remove(mnuItem2);
        //     // //MenuItem mnuItem3 = NavigationMenu.FindItem("3"); // Find particular item
        //     // //NavigationMenu.Items.Remove(mnuItem3);
        //     // MenuItem mnuItem4 = NavigationMenu.FindItem("4"); // Find particular item
        //     // NavigationMenu.Items.Remove(mnuItem4);
        //     // MenuItem mnuItem5 = NavigationMenu.FindItem("5"); // Find particular item
        //     // NavigationMenu.Items.Remove(mnuItem5);


        // }
         else if (Roles.IsUserInRole("Admin"))
        {
            MenuItem.Visible = true;
             deleted.Visible = true;
        //     // MenuItem mnuItem1 = NavigationMenu.FindItem("1"); // Find particular item
        //     // NavigationMenu.Items.Remove(mnuItem1);
        //     // MenuItem mnuItem5 = NavigationMenu.FindItem("5"); // Find particular item
        //     // NavigationMenu.Items.Remove(mnuItem5);
         }
        // else if (Roles.IsUserInRole("Mini"))
        // {

        //     MenuItem mnuItem1 = NavigationMenu.FindItem("1"); // Find particular item
        //     NavigationMenu.Items.Remove(mnuItem1);
        //     //MenuItem mnuItem2 = NavigationMenu.FindItem("2"); // Find particular item
        //     //NavigationMenu.Items.Remove(mnuItem2);
        //     //MenuItem mnuItem3 = NavigationMenu.FindItem("3"); // Find particular item
        //     //NavigationMenu.Items.Remove(mnuItem3);
        //     MenuItem mnuItem4 = NavigationMenu.FindItem("4"); // Find particular item
        //     NavigationMenu.Items.Remove(mnuItem4);
        //     MenuItem mnuItem5 = NavigationMenu.FindItem("5"); // Find particular item
        //     NavigationMenu.Items.Remove(mnuItem5);
        //     MenuItem mnuItem7 = NavigationMenu.FindItem("7"); // Find particular item
        //     NavigationMenu.Items.Remove(mnuItem7);
        //     MenuItem mnuItem8 = NavigationMenu.FindItem("8"); // Find particular item
        //     NavigationMenu.Items.Remove(mnuItem8);
        //     MenuItem mnuItem9 = NavigationMenu.FindItem("9"); // Find particular item
        //     NavigationMenu.Items.Remove(mnuItem9);
        //     MenuItem mnuItem10 = NavigationMenu.FindItem("10"); // Find particular item
        //     NavigationMenu.Items.Remove(mnuItem10);
        //     MenuItem mnuItem11 = NavigationMenu.FindItem("11"); // Find particular item
        //     NavigationMenu.Items.Remove(mnuItem11);
        // }
        else if (Roles.IsUserInRole("SuperAdmin"))
        {
            MenuItem.Visible = true;
            UserMng.Visible = true;
            deleted.Visible = true;
        }
        // else
        // {
        //     MenuItem mnuItem1 = NavigationMenu.FindItem("1"); // Find particular item
        //     NavigationMenu.Items.Remove(mnuItem1);
        //     //MenuItem mnuItem2 = NavigationMenu.FindItem("2"); // Find particular item
        //     //NavigationMenu.Items.Remove(mnuItem2);
        //     //MenuItem mnuItem3 = NavigationMenu.FindItem("3"); // Find particular item
        //     //NavigationMenu.Items.Remove(mnuItem3);
        //     MenuItem mnuItem4 = NavigationMenu.FindItem("4"); // Find particular item
        //     NavigationMenu.Items.Remove(mnuItem4);
        //     MenuItem mnuItem5 = NavigationMenu.FindItem("5"); // Find particular item
        //     NavigationMenu.Items.Remove(mnuItem5);
        //     MenuItem mnuItem6 = NavigationMenu.FindItem("6"); // Find particular item
        //     NavigationMenu.Items.Remove(mnuItem6);
        //     MenuItem mnuItem7 = NavigationMenu.FindItem("7"); // Find particular item
        //     NavigationMenu.Items.Remove(mnuItem7);
        //     MenuItem mnuItem8 = NavigationMenu.FindItem("8"); // Find particular item
        //     NavigationMenu.Items.Remove(mnuItem8);
        //     MenuItem mnuItem9 = NavigationMenu.FindItem("9"); // Find particular item
        //     NavigationMenu.Items.Remove(mnuItem9);
        //     MenuItem mnuItem10 = NavigationMenu.FindItem("10"); // Find particular item
        //     NavigationMenu.Items.Remove(mnuItem10);
        //     MenuItem mnuItem11 = NavigationMenu.FindItem("11"); // Find particular item
        //     NavigationMenu.Items.Remove(mnuItem11);
        //     MenuItem mnuItem13 = NavigationMenu.FindItem("13"); // Find particular item
        //     NavigationMenu.Items.Remove(mnuItem13);
        // }






    }
}
