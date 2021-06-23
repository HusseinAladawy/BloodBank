using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Account_log : System.Web.UI.Page
{
    BloodBankDataContext b;
    protected void Page_Load(object sender, EventArgs e)
    {

        b = new BloodBankDataContext();
        if (!IsPostBack)
        {
           
       var log = b.LogSearch(null, null,null, null, null, null);
        GridView1.DataSource = log;
        GridView1.DataBind();
        int Count = b.LogSearch(null, null,null, null, null, null).Count();
        lbl_Report.Visible = true;
        lbl_Report.Text = Count.ToString();
        }

    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        Search();


    }

    private void Search()
    {
        BloodBankDataContext b = new BloodBankDataContext();

        string userid = ddl_User.SelectedValue;

        string action = null;
        string actionin = null;

        Guid user = Guid.Empty;
        if (ddl_User.SelectedValue != "0")
        {

            user = new Guid(userid);

        }
        if (action != "0")
        {
            action = ddl_Action.SelectedValue;
        }
        if (actionin != "0")
        {
            actionin = ddl_IN.SelectedValue;
        }
        DateTime? from = null;
        DateTime? To = null;
        if (!dt_From.SelectedDate.ToString().Contains("1980"))
        {
            from = dt_From.SelectedDate;
        }
        if (!dt_To.SelectedDate.ToString().Contains("1980"))
        {
            To = dt_To.SelectedDate; 
        }

        var log = b.LogSearch(action, user, from, To, actionin, Txt_V_ID.Text.ToInt32());
        GridView1.DataSource = log;
        GridView1.DataBind();
        int Count = b.LogSearch(action, user, from, To, actionin, Txt_V_ID.Text.ToInt32()).Count();
        lbl_Report.Visible = true;
        lbl_Report.Text = Count.ToString();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    LinkButton l = (LinkButton)e.Row.FindControl("lnkbtn_del");
        //    l.Attributes.Add("onclick", "javascript:return " +
        //    "confirm('  هل انت متأكد من الحذف  ')");
        //}
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = (int)GridView1.DataKeys[e.RowIndex].Value;
        DeleteRecordByID(id);
        GridView1.DataBind();
    }
    private void DeleteRecordByID(int ID)
    {
        Log t = b.Logs.Single(x=>x.LogID==ID);
        b.Logs.DeleteOnSubmit(t);
        b.SubmitChanges();

        // attach parameters 
        // delete the record 
    }
    protected void ddl_User_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر", "0");

        ddl_User.Items.Insert(0, item);
    }
    protected void ddl_Action_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر", "0");

        ddl_Action.Items.Insert(0, item);
    }
    protected void ddl_IN_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر", "0");

        ddl_IN.Items.Insert(0, item);
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.Search();
    }
    protected void btn_Delete_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            
            
            int id = row.Cells[1].Text.ToInt32();
            Log t = b.Logs.Single(x => x.LogID == id);
            b.Logs.DeleteOnSubmit(t);
            b.SubmitChanges();
            GridView1.DataBind();
           ClientScript.RegisterStartupScript(this.GetType(), "warrning", "<script>alert('تم الحذف ')</script>");
        }
    }
}