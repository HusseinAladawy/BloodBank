using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Volunteers_Calls : System.Web.UI.Page
{
    int ID;
    BloodBankDataContext b;
    protected void Page_Load(object sender, EventArgs e)
    {
        b = new BloodBankDataContext();
        ID = Request.QueryString["ID"].ToInt32();

        Volunteer v = b.Volunteers.Single(x => x.V_ID == ID);
        lbl_Name.Text = v.Name;
        lbl_VID.Text = ID.ToString();
        b.SubmitChanges();
       
            if (!IsPostBack)
            {

            }

    }
   
    protected void btn_Save_Click(object sender, EventArgs e)
    {
         
        VolunteerCall t = new VolunteerCall();
        Volunteer v = b.Volunteers.Single(x => x.V_ID == ID);
        t.VolunteerID = ID;
        
        t.CallDate = dt_CallDate.SelectedDate;
        t.Comments = txt_Comment.Text;
        v.LastCallDate = dt_CallDate.SelectedDate;
        if (v.CallPoints==null)
        {
            v.CallPoints =  1;
        }
        else
        {
            v.CallPoints = v.CallPoints + 1;
        }
       
        b.VolunteerCalls.InsertOnSubmit(t);

        MembershipUser user = Membership.GetUser();
        Guid userid = (Guid)user.ProviderUserKey;
        b.LogInsert("Add", userid, DateTime.Now, "Calls", ID);

        b.SubmitChanges();
        AddCalls(ID);
        ClientScript.RegisterStartupScript(this.GetType(), "warrning", "<script>alert('تم الحفظ بنجاح')</script>");
        GridView2.DataBind();



    }
    protected void btn_Edit_Click(object sender, EventArgs e)
    {
        Response.Redirect("Edit.aspx?ID=" + ID);
    }
    protected void btn_Donation_Click(object sender, EventArgs e)
    {
        Response.Redirect("History.aspx?ID=" + ID);
    }
    private  void AddCalls(int ID )
    {
         b = new BloodBankDataContext();
       


            var lv = from z in b.VolunteerLasts where z.VID == ID select z;
            if (lv.Any())
            {
                VolunteerLast vl = b.VolunteerLasts.Single(x => x.VID == ID);

                //  VolunteerLast vl = new VolunteerLast();
                vl.VID = ID;
                vl.CallDate = dt_CallDate.SelectedDate;
                vl.Comments = txt_Comment.Text;
                //  b.VolunteerLasts.InsertOnSubmit(vl);
                b.SubmitChanges();
            }
            else
            {
                VolunteerLast vl = new VolunteerLast();
                vl.VID = ID;
                vl.CallDate = dt_CallDate.SelectedDate;
                vl.Comments = txt_Comment.Text;
                b.VolunteerLasts.InsertOnSubmit(vl);
                b.SubmitChanges();
            }






        }
    protected void GV_Acontract_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            // get the categoryID of the clicked row
            int Call_ID = Convert.ToInt32(e.CommandArgument);
            // Delete the record 
            DeleteRecordByID(Call_ID);
            MembershipUser user = Membership.GetUser();
            Guid userid = (Guid)user.ProviderUserKey;
            b.LogInsert("Delete", userid, DateTime.Now, "Calls", ID);
            b.SubmitChanges();
            ClientScript.RegisterStartupScript(this.GetType(), "warrning", "<script>alert('تم الحفظ بنجاح')</script>");
            GridView2.DataBind();
            // Implement this on your own :) 
            //Search();
        }
    }

    private void DeleteRecordByID(int Call_ID)
    {
        VolunteerCall vh = b.VolunteerCalls.Single(x => x.CallID == Call_ID);

        b.VolunteerCalls.DeleteOnSubmit(vh);
        b.SubmitChanges();
        var MaxDate = from d in b.VolunteerCalls where d.VolunteerID == ID  select d.CallDate;

        Volunteer v = b.Volunteers.Single(x => x.V_ID == ID);
        v.CallPoints = v.CallPoints - 1;
        if (MaxDate.Any())
        {
           
            v.LastCallDate = MaxDate.Max();
           

        }
        else
        {
           
            v.LastCallDate = null;
        }


        var AnotherDonation = from d in b.VolunteerCalls where d.VolunteerID == ID select d;

        var AnotherLast = from d in b.VolunteerLasts where d.VID == ID select d;

        if (AnotherDonation.Any() && AnotherLast.Any())
        {
            VolunteerLast l = b.VolunteerLasts.Single(x => x.VID == ID);
            var MaxValue = AnotherDonation.Max(x => x.CallDate);
            var comment = AnotherDonation.First(x => x.CallDate == MaxValue && x.VolunteerID == ID);
            l.CallDate = MaxValue;
            l.Comments = comment.Comments;
        }
        else if (AnotherDonation.Any() == false && AnotherLast.Any())
        {
            VolunteerLast l = b.VolunteerLasts.Single(x => x.VID == ID);
            l.CallDate = null;
            l.Comments = null;
        }






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

    protected void btn_Fav_Click(object sender, EventArgs e)
    {
        Response.Redirect("DonationFavoritePlaces.aspx?ID=" + ID);
    }
}