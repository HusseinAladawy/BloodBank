using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Volunteers_History : System.Web.UI.Page
{
    int ID;
    BloodBankDataContext b;
    Volunteer v;
    DateTime DonationDate;
    protected void Page_Load(object sender, EventArgs e)
    {
        b = new BloodBankDataContext();
        ID = Request.QueryString["ID"].ToInt32();
        v = b.Volunteers.Single(x => x.V_ID == ID);
        lbl_Name.Text = v.Name;
        lbl_VID.Text = ID.ToString().Trim();


        if (!Page.IsPostBack)
        {
            string currentDate = DateTime.Today.ToShortDateString();
            //Assign the value to compare here
            Comparevalidator1.ValueToCompare = currentDate;
        }
    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {

        VolunteerHistory t = new VolunteerHistory();
        t.Volunteer_ID = ID;
        DonationDate = dt_DonationDate.SelectedDate;
        t.DonationDate = DonationDate;
        t.Place_ID = dll_Place.SelectedValue.ToInt32();
        t.Notes = txt_Notes.Text;
        t.Status = ddl_DonationStatus.SelectedValue;

        if (v.DonationPoints == null)
        {
            v.DonationPoints = 1;
        }
        else
        {
            v.DonationPoints = v.DonationPoints + 1;
        }

       
        b.VolunteerHistories.InsertOnSubmit(t);
        b.SubmitChanges();
        AddDonations(ID);
        var MaxDate = from d in b.VolunteerHistories where d.Volunteer_ID == ID && d.Status == "1" select d.DonationDate;
        DateTime max_date;

        if (MaxDate.Any() && ddl_DonationStatus.SelectedValue == "1")
        {
            max_date = (DateTime)MaxDate.Max();
            v.LastDonationDate = max_date;
            if (v.Gender == "0")
            {
                v.ActivationDate = max_date.AddMonths(4);
            }
            else
            {
                v.ActivationDate = max_date.AddMonths(3);
            }


        }
        else if (ddl_DonationStatus.SelectedValue == "1")
        {

            v.LastDonationDate = DonationDate;
            //  v.LastDonationDate = null;
            if (v.Gender == "0")
            {
                v.ActivationDate = DonationDate.AddMonths(4);
            }
            else
            {
                v.ActivationDate = DonationDate.AddMonths(3);
            }

        }



        if (!dt_AvailabilityDate.SelectedDate.ToString().Contains("1980") && ddl_NotAvailable.SelectedValue != "0")
        {
            lbl_temp.Visible = false;
            btn_Save.Enabled = true;
            v.AvailabilityDate = dt_AvailabilityDate.SelectedDate;
            b.SubmitChanges();

            ClientScript.RegisterStartupScript(this.GetType(), "warrning", "<script>alert('تم الحفظ بنجاح')</script>");
        }
        else if (dt_AvailabilityDate.SelectedDate.ToString().Contains("1980") && ddl_NotAvailable.SelectedValue == "0")
        {
            lbl_temp.Visible = false;
            btn_Save.Enabled = true;
            b.SubmitChanges();
            ClientScript.RegisterStartupScript(this.GetType(), "warrning", "<script>alert('تم الحفظ بنجاح')</script>");



        }
        else
        {
            lbl_temp.Visible = true;
            lbl_temp.Text = "ادخل التاريخ والمانع المؤفت ";

        }





        MembershipUser user = Membership.GetUser();
        Guid userid = (Guid)user.ProviderUserKey;
        b.LogInsert("Add", userid, DateTime.Now, "Donations", ID);
        b.SubmitChanges();
        ClientScript.RegisterStartupScript(this.GetType(), "warrning", "<script>alert('تم الحفظ بنجاح')</script>");
        GridView2.DataBind();



    }







    private void DeleteRecordByID(int History_ID)
    {
        VolunteerHistory vh = b.VolunteerHistories.Single(x => x.ID == History_ID);

        b.VolunteerHistories.DeleteOnSubmit(vh);
        b.SubmitChanges();
        var MaxDate = from d in b.VolunteerHistories where d.Volunteer_ID == ID && d.Status == "1" select d.DonationDate;

        DateTime max_date;
        if (MaxDate.Any())
        {
            max_date = (DateTime)MaxDate.Max();
            Volunteer v = b.Volunteers.Single(x => x.V_ID == ID);
            v.LastDonationDate = max_date;
            v.DonationPoints = v.DonationPoints - 1;
            if (v.Gender == "0")
            {
                v.ActivationDate = max_date.AddMonths(4);
            }
            else
            {
                v.ActivationDate = max_date.AddMonths(3);
            }


        }
        else
        {

            v.LastDonationDate = null;
            v.ActivationDate = null;
        }

        var AnotherDonation = from d in b.VolunteerHistories where d.Volunteer_ID == ID select d;

        var AnotherLast = from d in b.VolunteerLasts where d.VID == ID select d;

        if (AnotherDonation.Any() && AnotherLast.Any())
        {
            VolunteerLast l = b.VolunteerLasts.Single(x => x.VID == ID);
            var MaxValue = AnotherDonation.Max(x => x.DonationDate);
            var status = AnotherDonation.First(x => x.DonationDate == MaxValue && x.Volunteer_ID == ID);
            l.DonationDate = MaxValue;
            l.Status = status.Status;
        }
        else if (AnotherDonation.Any() == false && AnotherLast.Any())
        {
            VolunteerLast l = b.VolunteerLasts.Single(x => x.VID == ID);
            l.DonationDate = null;
            l.Status = null;
        }




        b.SubmitChanges();
    }

    private void AddDonations(int ID)
    {
        DonationDate = dt_DonationDate.SelectedDate;
        BloodBankDataContext b = new BloodBankDataContext();

        var lv = from z in b.VolunteerLasts where z.VID == ID select z;
        if (lv.Any())
        {
            VolunteerLast vl = b.VolunteerLasts.Single(x => x.VID == ID);

            //  VolunteerLast vl = new VolunteerLast();
            vl.VID = ID;
            vl.DonationDate = DonationDate;
            vl.Status = ddl_DonationStatus.SelectedValue;
            //  b.VolunteerLasts.InsertOnSubmit(vl);
            b.SubmitChanges();
        }
        else
        {
            VolunteerLast vl = new VolunteerLast();

            vl.VID = ID;
            vl.DonationDate = DonationDate;
            vl.Status = ddl_DonationStatus.SelectedValue;
            b.VolunteerLasts.InsertOnSubmit(vl);
            b.SubmitChanges();
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton l = (LinkButton)e.Row.FindControl("lnkbtn_del");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('  هل انت متأكد من حذف التبرع  ')");
        }
    }
    protected void GV_Acontract_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            // get the categoryID of the clicked row
            int History_ID = Convert.ToInt32(e.CommandArgument);
            // Delete the record 
            DeleteRecordByID(History_ID);
            MembershipUser user = Membership.GetUser();
            Guid userid = (Guid)user.ProviderUserKey;
            b.LogInsert("Delete", userid, DateTime.Now, "Donations", ID);
            b.SubmitChanges();
            ClientScript.RegisterStartupScript(this.GetType(), "warrning", "<script>alert('تم الحفظ بنجاح')</script>");
            GridView2.DataBind();
            // Implement this on your own :) 
            //Search();
        }
    }
    //protected void GV_Acontract_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    if (e.CommandName == "Delete")
    //    {
    //        // get the categoryID of the clicked row
    //        int History_ID = Convert.ToInt32(e.CommandArgument);
    //        // Delete the record 
    //        DeleteRecordByID(History_ID);
    //        //MembershipUser user = Membership.GetUser();
    //        //Guid userid = (Guid)user.ProviderUserKey;
    //        //b.LogInsert("Delete", userid, DateTime.Now, "Donations", ID);
    //        b.SubmitChanges();
    //        ClientScript.RegisterStartupScript(this.GetType(), "warrning", "<script>alert('تم الحفظ بنجاح')</script>");
    //        GridView2.DataBind();
    //        // Implement this on your own :) 
    //        //Search();
    //    }
    //}
    protected void btn_Edit_Click(object sender, EventArgs e)
    {
        Response.Redirect("Edit.aspx?ID=" + ID);
    }
    protected void btn_Call_Click(object sender, EventArgs e)
    {
        Response.Redirect("Calls.aspx?ID=" + ID);
    }
    protected void ddl_Type_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر نوع المكان", "0");

        ddl_Type.Items.Insert(0, item);
    }
    protected void dll_Place_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر اسم المكان", "0");

        dll_Place.Items.Insert(0, item);
    }
    public static string State(object State)
    {
        string status = "";
        if (State != null)
        {
            status = State.ToString();
            switch (status)
            {

                case "1": status = "مقبول"; break;
                case "2": status = "مؤجل"; break;
                case "3": status = "مرفوض"; break;
                case "4": status = "هروب"; break;
                case "5": status = "مشتقات"; break;

                default: status = ""; break;


            }
        }

        return status;




    }

    protected void btn_Fav_Click(object sender, EventArgs e)
    {

        Response.Redirect("DonationFavoritePlaces.aspx?ID=" + ID);

    }
}