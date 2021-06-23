using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Kafala_Kid_Edit : System.Web.UI.Page
{
    BloodBankDataContext b;
    Kid k;
    int ID;
    protected void Page_Load(object sender, EventArgs e)
    {
        b = new BloodBankDataContext();
        ID = Request.QueryString["ID"].ToInt32();
        k = b.Kids.Single(x => x.Kid_ID == ID);
        if (!IsPostBack)
        {

           
            dt_BirthDate.SelectedDate = Convert.ToDateTime(k.BirthDate);
            rbl_Status.SelectedValue = k.Status.ToString();
            Txt_DeactivationReason.Text = k.DeactivationReason;
            ddl_Hospital.SelectedValue = k.Hospital_ID_FK.ToString();
            Txt_IDNo.Text = k.IDNo;
             rbl_Insurance.SelectedValue= k.Insurance.ToString() ;
            rbl_Gender.SelectedValue = k.KidGender.ToString();
            Txt_Name.Text = k.KidName;
            Txt_Notes.Text = k.Notes;
            Txt_AdressDetails.Text = k.AdressDetails;
            #region Jobs
            ddl_MotherJob.DataBind();
            ddl_FatherJob.DataBind();
          
            ddl_FatherJob.SelectedValue = k.Father_Job_ID_FK.ToString();
            ddl_MotherJob.SelectedValue = k.Mother_Job_ID_FK.ToString();
            #endregion

            #region Territory
            if (k.Territory_ID_FK.ToString() != "")
            {
                Territory ter = b.Territories.Single(x => x.TerritoryID == k.Territory_ID_FK);
                string GovernerateID = ter.GovernerateID.ToString();

                ddl_Governerate.SelectedValue = GovernerateID;
                ddl_Governerate.DataBind();
                ddl_Territory.SelectedValue = k.Territory_ID_FK.ToString();

            }
            #endregion 

            #region PhenoType
            ddl_ABO.SelectedValue = k.ABO;
            ddl_RH.SelectedValue = k.RH;
            ddl_C_.SelectedValue = k.C;
            ddl_c.SelectedValue = k.c_;
            ddl_E_.SelectedValue = k.E;
            ddl_e.SelectedValue = k.e_;
            ddl_Kell.SelectedValue = k.Kell;
            #endregion

            #region Mobile
            Txt_Father1_Mobile.Text = k.FatherMobile1;
            chk_FatherMob1.Checked = (bool)k.FatherMobile1_W;
            Txt_Father2_Mobile.Text = k.FatherMobile2;
            chk_FatherMob2.Checked = (bool)k.FatherMobile2_W;
            Txt_Kid_Mobile1.Text = k.KidMobile1;
            chk_KidMob1.Checked = (bool)k.KidMobile1_W;
            Txt_Kid_Mobile2.Text = k.KidMobile2;
            chk_KidMob2.Checked = (bool)k.KidMobile2_W;
            Txt_Mother1_Mobile.Text = k.MotherMobile1;
            chk_MotherMob1.Checked = (bool)k.MotherMobile1_W;
            Txt_Mother2_Mobile.Text = k.MotherMobile2;
            chk_MotherMob2.Checked = (bool)k.MotherMobile2_W;
            Txt_Phone.Text = k.Phone;
            #endregion

            #region disease

            ddl_Disease.SelectedValue = k.Disease_ID_FK.ToString();
            Txt_DiseaseDetails.Text = k.DiseaseDetails;
            #endregion


        
          
        }
    }

    protected void btn_Save_Click(object sender, EventArgs e)
    {
        #region PhenoType
        k.ABO = ddl_ABO.SelectedValue;
        k.E = ddl_E_.SelectedValue;
        k.e_ = ddl_e.SelectedValue;
        k.C = ddl_C_.SelectedValue;
        k.c_ = ddl_c.SelectedValue;
        k.Kell = ddl_Kell.SelectedValue;
        k.RH = ddl_RH.SelectedValue;
        #endregion

        #region Mobile
        k.FatherMobile1 = Txt_Father1_Mobile.Text;
        k.FatherMobile1_W = chk_FatherMob1.Checked;
        k.FatherMobile2 = Txt_Father2_Mobile.Text;
        k.FatherMobile2_W = chk_FatherMob2.Checked;
        k.KidMobile1 = Txt_Kid_Mobile1.Text;
        k.KidMobile1_W = chk_KidMob1.Checked;
        k.KidMobile2 = Txt_Kid_Mobile2.Text;
        k.KidMobile2_W = chk_KidMob2.Checked;
        k.MotherMobile1 = Txt_Mother1_Mobile.Text;
        k.MotherMobile1_W = chk_MotherMob1.Checked;
        k.MotherMobile2 = Txt_Mother2_Mobile.Text;
        k.MotherMobile2_W = chk_MotherMob2.Checked;
        #endregion

        #region disease
        k.Disease_ID_FK = ddl_Disease.SelectedValue.ToInt32();
        k.DiseaseDetails = Txt_DiseaseDetails.Text;
      
        #endregion

        #region Jobs

        k.Father_Job_ID_FK = ddl_FatherJob.SelectedValue.ToInt32();
        k.Mother_Job_ID_FK = ddl_MotherJob.SelectedValue.ToInt32();
        #endregion

        k.BirthDate = dt_BirthDate.SelectedDate;
        k.CreationDate = DateTime.Now;
        k.Status = rbl_Status.SelectedValue;
        k.DeactivationReason = Txt_DeactivationReason.Text;
      
    
        k.Hospital_ID_FK = ddl_Hospital.SelectedValue.ToInt32();
        k.IDNo = Txt_IDNo.Text;
        k.AdressDetails = Txt_AdressDetails.Text;
        if (rbl_Insurance.SelectedValue != "")
        {
            k.Insurance = rbl_Insurance.SelectedValue.ToBool();
        }
       
        k.KidGender = rbl_Gender.SelectedValue;
     
        k.KidName = Txt_Name.Text;
 
        k.Notes = Txt_Notes.Text;
       
        //  k.Status


        b.SubmitChanges();







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

    protected void ddl_FatherJob_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر الوظيفة ", "");

        ddl_FatherJob.Items.Insert(0, item);
    }
    protected void ddl_MotherJob_DataBound(object sender, EventArgs e)
    {

        ListItem item = new ListItem("اختر الوظيفة ", "");

        ddl_MotherJob.Items.Insert(0, item);
    }
    protected void ddl_Disease_DataBound(object sender, EventArgs e)
    {

        ListItem item = new ListItem("اختر ", "0");

        ddl_Disease.Items.Insert(0, item);

    }
    protected void ddl_Hospital_DataBound(object sender, EventArgs e)
    {

        ListItem item = new ListItem("اختر ", "0");

        ddl_Hospital.Items.Insert(0, item);

    }
    protected void btn_Call_Click(object sender, EventArgs e)
    {
        Response.Redirect("Calls.aspx?ID=" + ID);
    }
    protected void btn_Help_Click(object sender, EventArgs e)
    {
        Response.Redirect("Help.aspx?ID=" + ID);
    }
    protected void btn_Transfer_Click(object sender, EventArgs e)
    {
        Response.Redirect("Transfers.aspx?ID=" + ID);
    }
}