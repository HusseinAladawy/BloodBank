using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Volunteers_Add : System.Web.UI.Page
{
    BloodBankDataContext b;
    protected void Page_Load(object sender, EventArgs e)
    {
        b = new BloodBankDataContext();
        if (!IsPostBack)
        {
            int curYear = DateTime.Now.Year - 15;
            for (int i = 1; i < 50; i++)
            {
                ListItem tmp = new ListItem();

                tmp.Value = curYear.ToString();
                tmp.Text = curYear.ToString();
                ddl_BirthYear.Items.Add(tmp);
                curYear = curYear - 1;
            }
        }

        //int ThisYear = DateTime.Now.Year ;
        //ListItem callyear = new ListItem(ThisYear.ToString());
        //ddl_CallYear.Items.Add(callyear);
        //for (int l = 1; l <4; l++)
        //{
        //    ListItem temp = new ListItem();

        //    temp.Value = ThisYear.ToString();
        //    temp.Text = ThisYear.ToString();
        //   // ddl_AvailableYear.Items.Add(temp);

        //    //ddl_DonationYear.Items.Add(temp);

        //    ThisYear = ThisYear + 1;
        //}

    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {

        #region Insert
        Volunteer v = new Volunteer();
        v.BirthYear = ddl_BirthYear.SelectedValue;
        //   v.BloodType = ddl_BloodType.SelectedValue;


        #region PhenoType
        v.ABO = ddl_ABO.SelectedValue;
        v.E = ddl_E_.SelectedValue;
        v.e_ = ddl_e.SelectedValue;
        v.C = ddl_C_.SelectedValue;
        v.c_ = ddl_c.SelectedValue;
        v.Kell = ddl_Kell.SelectedValue;
        v.RH = ddl_RH.SelectedValue;
        #endregion

        v.Email1 = Txt_Email1.Text;
        v.Email2 = Txt_Email2.Text;
        v.Job_ID = ddl_Job.SelectedValue.ToNullInt32();
        string mobile1 = Txt_Mobile1.Text;
        string mobile2 = Txt_Mobile2.Text;

        v.Mobile1 = mobile1;
        v.Mobile1_W = chk_KidMob1.Checked;
        v.MobileNetwork1 = ddl_MobileNetwork1.SelectedValue;
        if (mobile2 != "")
        {
            v.Mobile2 = mobile2;
            v.MobileNetwork2 = ddl_MobileNetwork2.SelectedValue;
            v.Mobile2_W = chk_KidMob2.Checked;
        }
        else
        {
            v.Mobile2_W = false;
        }
       
        v.Name = Txt_Name.Text;
        v.Notes = Txt_Notes.Text;
        v.Phone = Txt_Phone.Text;
        if ((ddl_Governerate.SelectedValue == "0" && ddl_Territory.SelectedValue == "") || (ddl_Governerate.SelectedValue != "0" && ddl_Territory.SelectedValue != ""))
        {
            lbl_Territory.Visible = false;
            btn_Save.Enabled = true;
        }
        else
        {
            lbl_Territory.Visible = true;
            btn_Save.Enabled = false;
        }

        v.IDNo = Txt_IDNo.Text;
        string gender = rbl_Gender.SelectedValue;
        v.Gender = gender;
        v.HearedAboutUs = ddl_HearedAbout.SelectedValue.ToInt32();
        // v.Evaluation = ddl_Evaluation.SelectedValue;
        if (gender == "0")
        {
            v.Platelet = "4";
        }
        else
        {
            v.Platelet = ddl_Platelet.SelectedValue;
        }


        v.TerritoryID = ddl_Territory.SelectedValue.ToNullInt32();
        //v.BranchID = ddl_branch.SelectedValue.ToNullInt32();
        v.InActive = chk_InActive.Checked;
        v.Kafala = "3";//chk_Kafala.Checked;
        v.Ready = chk_ready.Checked;
        v.JobDetails = Txt_JobDetails.Text;
        v.Evaluation = "5";



        CheckMobile1();
        CheckMobile2();
        ClientScript.RegisterStartupScript(this.GetType(), "warrning", "<script>alert('تم الحفظ بنجاح')</script>");
        b.Volunteers.InsertOnSubmit(v);
        b.SubmitChanges();
        MembershipUser user = Membership.GetUser();
        Guid userid = (Guid)user.ProviderUserKey;
        b.LogInsert("Add", userid, DateTime.Now, "Volunteer", v.V_ID);
        Response.Redirect("History.aspx?ID=" + v.V_ID);



        #endregion


    }
    protected void ddl_Governerate_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر المحافظة", "0");

        ddl_Governerate.Items.Insert(0, item);
    }
    protected void ddl_Territory_DataBound(object sender, EventArgs e)
    {

        ListItem item = new ListItem("اختر المنطقة", "0");

        ddl_Territory.Items.Insert(0, item);


    }
    //protected void ddl_Type_DataBound(object sender, EventArgs e)
    //{
    //    ListItem item = new ListItem("اختر النوع", "0");

    //    ddl_Type.Items.Insert(0, item);
    //}

    //protected void dll_Place_DataBound(object sender, EventArgs e)
    //{
    //    ListItem item = new ListItem("اختر المكان", "0");

    //    dll_Place.Items.Insert(0, item);
    //}
    //protected void ddl_branch_DataBound(object sender, EventArgs e)
    //{
    //    ListItem item = new ListItem("بدون فرع", "71");

    // //   ddl_branch.Items.Insert(0, item);
    //}
    protected void Txt_Mobile1_TextChanged(object sender, EventArgs e)
    {
        CheckMobile1();
    }
    protected void Txt_Mobile2_TextChanged(object sender, EventArgs e)
    {
        CheckMobile2();
    }
    private void CheckMobile1()
    {
        if (Txt_Mobile1.Text != "")
        {
            try
            {
                string mobile1 = Txt_Mobile1.Text;
                ddl_MobileNetwork1.SelectedValue = mobile1[2].ToString();

                var Volunteer = from v in b.Volunteers where v.Mobile1 == mobile1 | v.Mobile2 == mobile1 select v;
                bool exist = Volunteer.Any();

                if (exist)
                {

                    foreach (var Person in Volunteer)
                    {
                        // lbl_Mobile.Visible = true;
                        //lbl_Mobile.Text =
                        lnk_Mobile.Visible = true;
                        lnk_Mobile.Text = " الموبايل موجود بأسم:" + Person.Name;
                        string URL = "Edit.aspx?ID=" + Person.V_ID;
                        lnk_Mobile.NavigateUrl = URL;
                        btn_Save.Enabled = false;
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
                    btn_Save.Enabled = true;
                    lnk_Mobile.Visible = false;
                }
            }
            catch (Exception)
            {


            }
        }
        else
        {
            //lbl_Mobile.Visible = false;
            lnk_Mobile.Visible = false;
            btn_Save.Enabled = false;
        }

    }


    private void CheckMobile2()
    {

        try
        {
            string mobile2 = Txt_Mobile2.Text;
            ddl_MobileNetwork2.SelectedValue = mobile2[2].ToString();

            var Volunteer = from v in b.Volunteers where v.Mobile1 == mobile2 | v.Mobile2 == mobile2 select v;
            bool exist = Volunteer.Any();

            if (exist)
            {

                foreach (var Person in Volunteer)
                {
                    //lbl_Mobile.Visible = true;
                    //lbl_Mobile.Text = " الموبايل موجود بأسم:" + Person.Name;
                    lnk_Mobile.Visible = true;
                    lnk_Mobile.Text = " الموبايل موجود بأسم:" + Person.Name;
                    string URL = "Edit.aspx?ID=" + Person.V_ID;
                    lnk_Mobile.NavigateUrl = URL;
                    btn_Save.Enabled = false;
                }
            }
            //else if (mobile2 == Txt_Mobile1.Text)
            //{
            //    lbl_Mobile.Visible = true;
            //    lbl_Mobile.Text = "لايمكن ادخال نفس الرقم مرتين ";
            //    btn_Save.Enabled = false;
            //}
            else
            {
                // lbl_Mobile.Visible = false;
                lnk_Mobile.Visible = false;
                btn_Save.Enabled = true;
            }
        }
        catch (Exception)
        {

            //  lbl_Mobile.Visible = false;
            lnk_Mobile.Visible = false;
            btn_Save.Enabled = true;
        }
    }




    protected void ddl_Job_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر", "");

        ddl_Job.Items.Insert(0, item);
    }
    protected void btn_Donation_Click(object sender, EventArgs e)
    {

    }

    protected void ddl_HearedAbout_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر", "0");

        ddl_HearedAbout.Items.Insert(0, item);
    }
}