using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Kafala_Kid_Add : System.Web.UI.Page
{
    BloodBankDataContext b;
    protected void Page_Load(object sender, EventArgs e)
    {
        b = new BloodBankDataContext();
        if (!IsPostBack)
        {
        }
    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
       


        if (Txt_Father1_Mobile.Text=="" && Txt_Father2_Mobile.Text=="" && Txt_Mother1_Mobile.Text=="" && Txt_Mother2_Mobile.Text=="" &&Txt_Kid_Mobile1.Text=="" && Txt_Kid_Mobile2.Text=="")
        {
            lbl_Mobile.Visible = true;
            lbl_Mobile.Text = "يجب كتابة رقم موبايل واحد على الأقل";
            return;
        }
        else
        {
            lbl_Mobile.Visible = true;
        }
        
        Kid k = new Kid();


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

       #region kid Basic Info
        k.KidName = Txt_Name.Text;
        k.BirthDate = dt_BirthDate.SelectedDate;
        k.KidGender = rbl_Gender.SelectedValue;

       #endregion
     
        k.CreationDate = DateTime.Now;
        k.Status = rbl_Status.SelectedValue;
        k.DeactivationReason = Txt_DeactivationReason.Text;


        k.Hospital_ID_FK = ddl_Hospital.SelectedValue.ToInt32();
        k.IDNo = Txt_IDNo.Text;
        if (rbl_Insurance.SelectedValue != "")
        {
            k.Insurance = rbl_Insurance.SelectedValue.ToBool();
        }

      
   
        k.AdressDetails = Txt_AdressDetails.Text;
        k.Notes = Txt_Notes.Text;
        k.TransferDays = Txt_TransferDays.Text.ToInt32();

        b.Kids.InsertOnSubmit(k);
        b.SubmitChanges();
        ClientScript.RegisterStartupScript(this.GetType(), "warrning", "<script>alert('تم الحفظ بنجاح')</script>");
        Response.Redirect("Transfers.aspx?ID=" + k.Kid_ID);
       
        



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
        ListItem item = new ListItem("اختر الوظيفة ", "0");

        ddl_FatherJob.Items.Insert(0, item);
    }
    protected void ddl_MotherJob_DataBound(object sender, EventArgs e)
    {

        ListItem item = new ListItem("اختر الوظيفة ", "0");

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
}