using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Volunteers_Deleted : System.Web.UI.Page
{
    BloodBankDataContext b;
    protected void Page_Load(object sender, EventArgs e)
    {
        b = new BloodBankDataContext();
        if (!IsPostBack)
        {
           GridView1.DataSource= b.Deleted_Volunteer(null, null, null, null, null);
            GridView1.DataBind();
            int Count = b.Deleted_Volunteer(null, null, null, null, null).Count();
            lbl_Report.Visible = true;
            lbl_Report.Text = Count.ToString();
        }
    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        Search();


    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton l = (LinkButton)e.Row.FindControl("lnkbtn_del");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('  هل انت متأكد من حذف المتبرع " +
            DataBinder.Eval(e.Row.DataItem, "Name") + "')");
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = (int)GridView1.DataKeys[e.RowIndex].Value;
        DeleteRecordByID(id);
      
        b.SubmitChanges();
        Search();
    }
    private void DeleteRecordByID(int ID)
    {
        Volunteer t = b.Volunteers.Single(x => x.V_ID == ID);
        b.Volunteers.DeleteOnSubmit(t);
        b.SubmitChanges();
        MembershipUser user = Membership.GetUser();
        Guid userid = (Guid)user.ProviderUserKey;
        b.LogInsert("Remove", userid, DateTime.Now, "Deleted", ID);
        b.SubmitChanges();
        Search();
        // attach parameters 
        // delete the record 
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.Search();
    }
    private void Search()
    {
        string userid = ddl_User.SelectedValue;
        DateTime? from = null;
        DateTime? To = null;
        Guid user = Guid.Empty;
        string Moblile = Txt_mobile.Text;
        if (!dt_From.SelectedDate.ToString().Contains("1980"))
        {
            from = dt_From.SelectedDate;
        }
        if (!dt_To.SelectedDate.ToString().Contains("1980"))
        {
            To = dt_To.SelectedDate;
        }
        if (ddl_User.SelectedValue != "0")
        {

            user = new Guid(userid);

        }
        GridView1.DataSource = b.Deleted_Volunteer(user, from, To,Moblile, Txt_V_ID.Text.ToInt32());
        GridView1.DataBind();
        int Count = b.Deleted_Volunteer(user, from, To, Moblile, Txt_V_ID.Text.ToInt32()).Count();
        lbl_Report.Visible = true;
        lbl_Report.Text = Count.ToString();
    }
    protected void ddl_User_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر", "0");

        ddl_User.Items.Insert(0, item);
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = (int)GridView1.DataKeys[e.RowIndex].Value;
        ReAcivateUser(id);

        b.SubmitChanges();
        Search();
    }

    private void ReAcivateUser(int id)
    {
        Volunteer t = b.Volunteers.Single(x => x.V_ID==id);
        t.Deleted = false;
        
        b.SubmitChanges();
        MembershipUser user = Membership.GetUser();
        Guid userid = (Guid)user.ProviderUserKey;
        b.LogInsert("Reactivate", userid, DateTime.Now, "Deleted", id);
        b.SubmitChanges();
        Search();
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int id = (int)GridView1.DataKeys[e.NewEditIndex].Value;
        ReAcivateUser(id);

        b.SubmitChanges();
        Search();
    }
}