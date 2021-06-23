using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Kafala_Kid_Transfers : System.Web.UI.Page
{
    int ID;
    BloodBankDataContext b;
    Kid k;
    DateTime DonationDate;
    protected void Page_Load(object sender, EventArgs e)
    {
        b = new BloodBankDataContext();
        ID = Request.QueryString["ID"].ToInt32();
        k = b.Kids.Single(x => x.Kid_ID == ID);
        lbl_Name.Text = k.KidName;
        lbl_KID.Text = ID.ToString();


        if (!IsPostBack)
        {
            ddl_Hospital.SelectedValue = k.Hospital_ID_FK.ToString();
        }
    }
    protected void ddl_Hospital_DataBound(object sender, EventArgs e)
    {

        ListItem item = new ListItem("اختر ", "0");

        ddl_Hospital.Items.Insert(0, item);

    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        Kid_Transfer kt = new Kid_Transfer();
        k.LastDate_Received_Blood=dt_TransferDate.SelectedDate;
        kt.Hospital_ID_FK = ddl_Hospital.SelectedValue.ToInt32();
        
         if (txt_V_ID.Text!="")
	    {
		   kt.V_ID_FK = txt_V_ID.Text.ToInt32();
	    }

         kt.Kid_ID_FK = ID;
        kt.TransferDate = dt_TransferDate.SelectedDate;
        kt.Notes = txt_Notes.Text;
        k.No_Bloodbags = k.No_Bloodbags + 1;

        if (dt_Upcoming_Transfer.SelectedDate.ToString().Contains("1980") && k.TransferDays!=null)
        {
            k.NextExpectedBloodNeed = dt_TransferDate.SelectedDate.AddDays((double)k.TransferDays);
        }
        else if (dt_Upcoming_Transfer.SelectedDate.ToString().Contains("1980") && k.TransferDays == null)
        {
            
        }
        else
        {
            k.NextExpectedBloodNeed = dt_Upcoming_Transfer.SelectedDate;
        }

        b.Kid_Transfers.InsertOnSubmit(kt);
        b.SubmitChanges();
        
      





        //MembershipUser user = Membership.GetUser();
        //Guid userid = (Guid)user.ProviderUserKey;
        //b.LogInsert("Add", userid, DateTime.Now, "Donations", ID);
        //b.SubmitChanges();
        ClientScript.RegisterStartupScript(this.GetType(), "warrning", "<script>alert('تم الحفظ بنجاح')</script>");
        GridView2.DataBind();



    }



   



    private void DeleteRecordByID(int T_ID)
    {
        Kid_Transfer vh = b.Kid_Transfers.Single(x => x.T_ID == T_ID);

        b.Kid_Transfers.DeleteOnSubmit(vh);
        b.SubmitChanges();
        var MaxDate = from d in b.Kid_Transfers where d.Kid_ID_FK == ID   select d.TransferDate;

        DateTime max_date;
        if (MaxDate.Any())
        {
            max_date = (DateTime)MaxDate.Max();
            
            k.LastDate_Received_Blood = max_date;
            k.No_Bloodbags = k.No_Bloodbags - 1;
           

        }
        else
        {

            k.No_Bloodbags = null;
            k.LastDate_Received_Blood = null;
        }




        b.SubmitChanges();
    }


    
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton l = (LinkButton)e.Row.FindControl("lnkbtn_del");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('  هل انت متأكد من حذف النقل  ')");
        }
    }
    protected void GV_Acontract_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
        //    // get the categoryID of the clicked row
            int kidid = Convert.ToInt32(e.CommandArgument);
        //    // Delete the record 
            DeleteRecordByID(kidid);
        //    MembershipUser user = Membership.GetUser();
        //    Guid userid = (Guid)user.ProviderUserKey;
        //    b.LogInsert("Delete", userid, DateTime.Now, "Donations", ID);
        //    b.SubmitChanges();
        //    ClientScript.RegisterStartupScript(this.GetType(), "warrning", "<script>alert('تم الحفظ بنجاح')</script>");
           GridView2.DataBind();
            // Implement this on your own :) 
            //Search();
        }
    }




    protected void txt_V_ID_TextChanged(object sender, EventArgs e)
    {
        if (txt_V_ID.Text != "")
        {
            try
            {
                string vid = txt_V_ID.Text;

                var Volunteer = from v in b.Volunteers where v.V_ID == vid.ToInt32() select v;
                bool exist = Volunteer.Any();

                if (exist)
                {

                    foreach (var Person in Volunteer)
                    {
                        // lbl_Mobile.Visible = true;
                        //lbl_Mobile.Text =
                        lnk_Mobile.Visible = true;
                        lnk_Mobile.Text = " المتبرع موجود بأسم:" + Person.Name;
                        string URL = "~/volunteers/History.aspx?ID=" + Person.V_ID;
                        lnk_Mobile.NavigateUrl = URL;
                        btn_Save.Enabled = true;
                    }
                }
                //else if (mobile1 == Txt_Mobile2.Text)
                //{
                //    lbl_Mobile.Visible = true;
                //    lbl_Mobile.Text = "لايمكن ادخال نفس الرقم مرتين ";
                //    btn_Save.Enabled = false;
                //}
                else
                {
                    //  lbl_Mobile.Visible = false;
                    btn_Save.Enabled = false;
                    lnk_Mobile.Visible = false;
                }
            }
            catch (Exception)
            {


            }
        }
    }
    protected void btn_Edit_Click(object sender, EventArgs e)
    {
        Response.Redirect("Edit.aspx?ID=" + ID);
    }
    protected void btn_Call_Click(object sender, EventArgs e)
    {
        Response.Redirect("Calls.aspx?ID=" + ID);
    }
    protected void btn_Help_Click(object sender, EventArgs e)
    {
        Response.Redirect("Help.aspx?ID=" + ID);
    }

}