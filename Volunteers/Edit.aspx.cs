using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Volunteers_Edit : System.Web.UI.Page
{
    BloodBankDataContext b;
    Volunteer v;
    int ID;
    protected void Page_Load(object sender, EventArgs e)
    {
        ID = Request.QueryString["ID"].ToInt32();
        b = new BloodBankDataContext();
        v = b.Volunteers.Single(x => x.V_ID == ID);
        lbl_Name.Text = v.Name;
        lbl_VID.Text = ID.ToString().Trim();
        int curYear = DateTime.Now.Year - 15;
        for (int i = 1; i < 50; i++)
        {
            ListItem tmp = new ListItem();

            tmp.Value = curYear.ToString();
            tmp.Text = curYear.ToString();
            ddl_BirthYear.Items.Add(tmp);
            curYear = curYear - 1;
        }


        if (!IsPostBack)
        {
            #region PhenoType

            // ddl_BloodType.SelectedValue = v.BloodType;
            ddl_ABO.SelectedValue = v.ABO;
            ddl_RH.SelectedValue = v.RH;
            ddl_C_.SelectedValue = v.C;
            ddl_c.SelectedValue = v.c_;
            ddl_E_.SelectedValue = v.E;
            ddl_e.SelectedValue = v.e_;
            ddl_Kell.SelectedValue = v.Kell;

            #endregion

            #region Email

            Txt_Email1.Text = v.Email1;
            Txt_Email2.Text = v.Email2;

            #endregion

            #region Mobile & Phone

            Txt_Mobile1.Text = v.Mobile1;
            Txt_Mobile2.Text = v.Mobile2;
            chk_Mob1.Checked = (bool)v.Mobile1_W;
            chk_Mob2.Checked = (bool)v.Mobile2_W;
            Txt_Phone.Text = v.Phone;
            ddl_MobileNetwork1.SelectedValue = v.MobileNetwork1;
            ddl_MobileNetwork2.SelectedValue = v.MobileNetwork2;

            #endregion

            #region Adress

            if (v.TerritoryID.ToString() != "")
            {
                Territory ter = b.Territories.Single(x => x.TerritoryID == v.TerritoryID);
                string GovernerateID = ter.GovernerateID.ToString();

                ddl_Governerate.SelectedValue = GovernerateID;
                ddl_Governerate.DataBind();
                ddl_Territory.SelectedValue = v.TerritoryID.ToString();

            }
            #endregion

            #region Job
            ddl_Job.DataBind();
            string job_id = v.Job_ID.ToString();
            ddl_Job.SelectedValue = job_id;
            Txt_JobDetails.Text = v.JobDetails;
            #endregion

            #region Basic Info

            Txt_Name.Text = v.Name;
            rbl_Gender.SelectedValue = v.Gender;
            ddl_BirthYear.SelectedValue = v.BirthYear;
            Txt_IDNo.Text = v.IDNo;

            #endregion

            #region Kafala
            ddl_Kafala.SelectedValue = v.Kafala;

            #endregion
            try
            {
                if (v.InsertionDate.ToString().Contains("0001") || v.InsertionDate == null)
                {
                    Log l = b.Logs.First(x => x.VID == ID && x.ActionIN == "Volunteer" && x.Action == "Add");
                    lbl_InsertionDate.Text = Convert.ToDateTime(l.ActionDate).ToString("yyyy/MM/dd");
                }
                else
                {
                    lbl_InsertionDate.Text = Convert.ToDateTime(v.InsertionDate).ToString("yyyy/MM/dd");
                }
            }
            catch (Exception)
            {


            }

            //  
            chk_ready.Checked = Convert.ToBoolean(v.Ready);
            Txt_Notes.Text = v.Notes;
            ddl_HearedAbout.SelectedValue = v.HearedAboutUs.ToString();
            ddl_Evaluation.SelectedValue = v.Evaluation;
            ddl_Platelet.SelectedValue = v.Platelet;
            //string branch = v.BranchID.ToString();
            //ddl_branch.SelectedValue = branch;


            if (v.InActive == true)
            {
                chk_InActive.Checked = true;
            }



        }


    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        //try
        //{
        #region Insert
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
        v.Ready = chk_ready.Checked;
        #region Mobile & Phone


        string mobile1 = Txt_Mobile1.Text;
        string mobile2 = Txt_Mobile2.Text;

        v.Mobile1 = mobile1;
        v.MobileNetwork1 = ddl_MobileNetwork1.SelectedValue;
        if (mobile2 != "")
        {
            v.Mobile2 = mobile2;
            v.MobileNetwork2 = ddl_MobileNetwork2.SelectedValue;
        }
        else
        {
            v.Mobile2 = "";
            v.MobileNetwork2 = "3";
        }
        v.Mobile1_W = chk_Mob1.Checked;
        v.Mobile2_W = chk_Mob2.Checked;
        CheckMobile1();
        CheckMobile2();
        #endregion

        v.Name = Txt_Name.Text;
        v.Notes = Txt_Notes.Text;

        v.Kafala = ddl_Kafala.SelectedValue;

        v.IDNo = Txt_IDNo.Text;
        string gender = rbl_Gender.SelectedValue;
        v.Gender = gender;
        v.HearedAboutUs = ddl_HearedAbout.SelectedValue.ToInt32();
        v.Evaluation = ddl_Evaluation.SelectedValue;
        //v.CallPoint = Txt_Points.Text;
        v.Platelet = ddl_Platelet.SelectedValue;
        //v.NotAvailable = ddl_NotAvailable.SelectedValue;
        v.TerritoryID = ddl_Territory.SelectedValue.ToNullInt32();
      ///  v.BranchID = ddl_branch.SelectedValue.ToNullInt32();
        v.InActive = chk_InActive.Checked;

        v.JobDetails = Txt_JobDetails.Text;
        b.SubmitChanges();
        MembershipUser user = Membership.GetUser();
        Guid userid = (Guid)user.ProviderUserKey;
        b.LogInsert("Edit", userid, DateTime.Now, "Volunteer", ID);
        b.SubmitChanges();
        if (ddl_K_ID.Visible == true)
        {
            if (ddl_K_ID.SelectedValue != "0")
            {
                b.Volunteer_Kid_Insert(ID, ddl_K_ID.SelectedValue.ToInt32());
                b.SubmitChanges();
            }

        }

        b.SubmitChanges();
        ClientScript.RegisterStartupScript(this.GetType(), "warrning", "<script>alert('تم الحفظ بنجاح')</script>");

        #endregion


        //}
        //catch (Exception ex)
        //{

        //    if (ex.Message.Contains("UNIQUE "))
        //    {
        //        lbl_Mobile.Visible = true;
        //        lbl_Mobile.Text = "رقم الموبايل موجود بالفعل  ";
        //    }
        //}


    }
    protected void ddl_Governerate_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر", "0");

        ddl_Governerate.Items.Insert(0, item);
    }
    protected void ddl_Territory_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر", "");

        ddl_Territory.Items.Insert(0, item);
    }

    //protected void ddl_branch_DataBound(object sender, EventArgs e)
    //{
    //    ListItem item = new ListItem("اختر الفرع", "0");

    //    ddl_branch.Items.Insert(0, item);
    //}
    protected void Txt_Mobile1_TextChanged(object sender, EventArgs e)
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
                    lbl_Mobile.Visible = true;
                    lbl_Mobile.Text = "رقم الموبايل موجود بأسم : <br/>" + Person.Name;
                    btn_Save.Enabled = false;
                }
            }
            else if (mobile1 == Txt_Mobile2.Text)
            {
                lbl_Mobile.Visible = true;
                lbl_Mobile.Text = "لايمكن ادخال نفس الرقم مرتين ";
                btn_Save.Enabled = false;
            }
            else
            {
                lbl_Mobile.Visible = false;
                btn_Save.Enabled = true;
            }
        }
        catch (Exception)
        {


        }
    }
    protected void Txt_Mobile2_TextChanged(object sender, EventArgs e)
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
                    lbl_Mobile.Visible = true;
                    lbl_Mobile.Text = "رقم الموبايل موجود بأسم <br/>" + Person.Name;
                    btn_Save.Enabled = false;
                }
            }
            else if (mobile2 == Txt_Mobile1.Text)
            {
                lbl_Mobile.Visible = true;
                lbl_Mobile.Text = "لايمكن ادخال نفس الرقم مرتين ";
                btn_Save.Enabled = false;
            }
            else
            {
                lbl_Mobile.Visible = false;
                btn_Save.Enabled = true;
            }
        }
        catch (Exception)
        {


        }
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
                        lbl_Mobile.Visible = true;
                        lbl_Mobile.Text = " الموبايل موجود بأسم:" + Person.Name;
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
                    lbl_Mobile.Visible = false;
                    btn_Save.Enabled = true;
                }
            }
            catch (Exception)
            {


            }
        }
        else
        {
            lbl_Mobile.Visible = false;
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
                    lbl_Mobile.Visible = true;
                    lbl_Mobile.Text = " الموبايل موجود بأسم:" + Person.Name;
                    btn_Save.Enabled = false;
                }
            }
            //else if (mobile2 == txt_V_ID.Text)
            //{
            //    lbl_Mobile.Visible = true;
            //    lbl_Mobile.Text = "لايمكن ادخال نفس الرقم مرتين ";
            //    btn_Save.Enabled = false;
            //}
            else
            {
                lbl_Mobile.Visible = false;
                btn_Save.Enabled = true;
            }
        }
        catch (Exception)
        {

            lbl_Mobile.Visible = false;
            btn_Save.Enabled = true;
        }
    }
    protected void btn_Donation_Click(object sender, EventArgs e)
    {
        Response.Redirect("History.aspx?ID=" + ID);
    }
    protected void btn_Call_Click(object sender, EventArgs e)
    {
        Response.Redirect("Calls.aspx?ID=" + ID);
    }
    protected void ddl_Job_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر", "");

        ddl_Job.Items.Insert(0, item);
    }
    protected void btn_Fav_Click(object sender, EventArgs e)
    {
        Response.Redirect("DonationFavoritePlaces.aspx?ID=" + ID);
    }

    protected void ddl_Kafala_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_Kafala.SelectedValue == "1")
        {
            ddl_K_ID.Visible = true;
        }
        else
        {
            ddl_K_ID.Visible = false;
        }
    }

    protected void ddl_K_ID_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر", "0");

        ddl_K_ID.Items.Insert(0, item);
    }
    protected void ddl_HearedAbout_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر", "0");

        ddl_HearedAbout.Items.Insert(0, item);
    }
}