using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Kafala_Kid_Help : System.Web.UI.Page
{
    int ID;
    BloodBankDataContext b;
    Kid k;
    protected void Page_Load(object sender, EventArgs e)
    {
        b = new BloodBankDataContext();
        ID = Request.QueryString["ID"].ToInt32();

        k = b.Kids.Single(x => x.Kid_ID == ID);
        lbl_Name.Text = k.KidName;
        lbl_KID.Text = k.Kid_ID.ToString();
        if (!IsPostBack)
        {
            
         

        
        }
       
    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        
       
        Kid_Help kh = new Kid_Help();
        kh.Date = dt_HelpDate.SelectedDate; 
        kh.Amount = txt_Amount.Text.ToInt32();
        kh.HelpType_ID_FK = ddl_HelpType.SelectedValue.ToInt32();
        kh.Notes = txt_Notes.Text;
        kh.Kid_ID_FK = ID;
   
        b.Kid_Helps.InsertOnSubmit(kh);
        b.SubmitChanges();
        GridView2.DataBind();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton l = (LinkButton)e.Row.FindControl("lnkbtn_del");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('  هل انت متأكد من حذف المساعدة  ')");
        }
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            // get the categoryID of the clicked row
            int Help_ID = Convert.ToInt32(e.CommandArgument);
            // Delete the record 
            DeleteRecordByID(Help_ID);
            //MembershipUser user = Membership.GetUser();
            //Guid userid = (Guid)user.ProviderUserKey;
            // b.LogInsert("Delete", userid, DateTime.Now, "Calls", ID);
            b.SubmitChanges();
            ClientScript.RegisterStartupScript(this.GetType(), "warrning", "<script>alert('تم الحفظ بنجاح')</script>");
            GridView2.DataBind();
            // Implement this on your own :) 
            //Search();
        }
    }
    private void DeleteRecordByID(int Help_ID)
    {
        Kid_Help kh = b.Kid_Helps.Single(x => x.HelpID == Help_ID);

        b.Kid_Helps.DeleteOnSubmit(kh);

        b.SubmitChanges();
    }

    protected void ddl_HelpType_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر", "0");

        ddl_HelpType.Items.Insert(0, item);
    }

    protected void btn_Edit_Click(object sender, EventArgs e)
    {
        Response.Redirect("Edit.aspx?ID=" + ID);
    }
    protected void btn_Call_Click(object sender, EventArgs e)
    {
        Response.Redirect("Calls.aspx?ID=" + ID);
    }
    protected void btn_Transfer_Click(object sender, EventArgs e)
    {
        Response.Redirect("Transfers.aspx?ID=" + ID);
    }
}