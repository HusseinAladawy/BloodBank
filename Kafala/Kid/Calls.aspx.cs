using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Kafala_Kid_Calls : System.Web.UI.Page
{
    int KidID;
    BloodBankDataContext b;
    Kid k;
    protected void Page_Load(object sender, EventArgs e)
    {
        b = new BloodBankDataContext();
        KidID = Request.QueryString["ID"].ToInt32();

         k = b.Kids.Single(x => x.Kid_ID == KidID);
        lbl_Name.Text = k.KidName;
        lbl_KID.Text = KidID.ToString();
        b.SubmitChanges();

        if (!IsPostBack)
        {
           
        }
    }
  
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        DateTime CallDate = dt_Calldate.SelectedDate;
        Kid_Call c = new Kid_Call();
        k.LastCall_Date = CallDate;


        c.CallDate = CallDate;
        c.Comment = txt_Comment.Text;
        MembershipUser user = Membership.GetUser();
        Guid userid = (Guid)user.ProviderUserKey;
        c.Caller_ID_FK = userid;
        c.Kid_ID_FK = KidID;
     //   v.LastCallDate = new DateTime(ddl_DonationYear.SelectedValue.ToInt32(), ddl_DonationMonth.SelectedValue.ToInt32(), ddl_DonationDay.SelectedValue.ToInt32());
      //  v.CallPoints = v.CallPoints + 1;
        b.Kid_Calls.InsertOnSubmit(c);

       

        b.SubmitChanges();
       
        ClientScript.RegisterStartupScript(this.GetType(), "warrning", "<script>alert('تم الحفظ بنجاح')</script>");
        GridView2.DataBind();



    }
    protected void btn_Edit_Click(object sender, EventArgs e)
    {
        Response.Redirect("Edit.aspx?ID=" + KidID);
    }
  
    protected void btn_Transfer_Click(object sender, EventArgs e)
    {
        Response.Redirect("Transfers.aspx?ID=" + KidID);
    }

    protected void GV_Acontract_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            // get the categoryID of the clicked row
            int Call_Kid_ID = Convert.ToInt32(e.CommandArgument);
            // Delete the record 
            DeleteRecordByID(Call_Kid_ID);
         //   MembershipUser user = Membership.GetUser();
        //    Guid userid = (Guid)user.ProviderUserKey;
           // b.LogInsert("Delete", userid, DateTime.Now, "Calls", ID);
            b.SubmitChanges();
            ClientScript.RegisterStartupScript(this.GetType(), "warrning", "<script>alert('تم الحفظ بنجاح')</script>");
            GridView2.DataBind();
            // Implement this on your own :) 
            //Search();
        }
    }

    private void DeleteRecordByID(int Call_ID)
    {
       Kid_Call vh = b.Kid_Calls.Single(x => x.Kid_Call_ID == Call_ID);

        b.Kid_Calls.DeleteOnSubmit(vh);
       
        b.SubmitChanges();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton l = (LinkButton)e.Row.FindControl("lnkbtn_del");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('  هل انت متأكد من حذف المكالمة  ')");
        }
    }



    protected void btn_Help_Click(object sender, EventArgs e)
    {
        Response.Redirect("Help.aspx?ID="+ KidID);
    }
}