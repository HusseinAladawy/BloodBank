using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Security;

public partial class Volunteers_Search : System.Web.UI.Page
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
            int ThisYear = 2000;
            for (int l = 1; l < 22; l++)
            {
                ListItem temp = new ListItem();

                temp.Value = ThisYear.ToString();
                temp.Text = ThisYear.ToString();
                ddl_FromYear.Items.Add(temp);
                ddl_ToYear.Items.Add(temp);
                //ddl_DonationYear.Items.Add(temp);

                ThisYear = ThisYear + 1;
            }
        }
    

       
    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        Search();
        //MembershipUser user = Membership.GetUser();
        //Guid userid = (Guid)user.ProviderUserKey;
        //b.LogInsert("Serach", userid, DateTime.Now, "SerachVolunteer", null);
        //b.SubmitChanges();
    }

    private void Search()
    {
        string name = Txt_Name.Text;
        string phone = Txt_Phone.Text;
        string birthYear = ddl_BirthYear.SelectedValue;
        string mobile = Txt_Mobile1.Text;
        string idNo = Txt_IDNo.Text;
        string email = Txt_Email1.Text;
        string bloodType = ddl_BloodType.SelectedValue;
        string mobileNetwork = ddl_MobileNetwork1.SelectedValue;
        int territory = ddl_Territory.SelectedValue.ToInt32();
        string platelet = ddl_Platelet.SelectedValue;
        int branch = ddl_branch.SelectedValue.ToInt32();
        string evaluation = ddl_Evaluation.SelectedValue;
        string status = ddl_Status.SelectedValue;
        string gender = rbl_Gender.SelectedValue;
        int FavPlaceID = dll_Place.SelectedValue.ToInt32();
        int FavoriteTypeID = ddl_Type.SelectedValue.ToInt32();
        string Holded = null;
        bool Inactive = chk_InActive.Checked;
        int VolunteerID = Txt_V_ID.Text.ToInt32();
        DateTime? from = null;
        DateTime? To = null;
        if (ddl_FromYear.SelectedValue != "0" || ddl_FromMonth.SelectedValue != "0" || ddl_FromDay.SelectedValue != "0")
        {
            from = new DateTime(ddl_FromYear.SelectedValue.ToInt32(), ddl_FromMonth.SelectedValue.ToInt32(), ddl_FromDay.SelectedValue.ToInt32());
        } if (ddl_ToYear.SelectedValue != "0" || ddl_ToMonth.SelectedValue != "0" || ddl_ToDay.SelectedValue != "0")
        {
            To = new DateTime(ddl_ToYear.SelectedValue.ToInt32(), ddl_ToMonth.SelectedValue.ToInt32(), ddl_ToDay.SelectedValue.ToInt32());
        }
        if (rbl_Reserved.SelectedValue != "")
        {
            Holded = rbl_Reserved.SelectedValue;
        }

        switch (rbl_Active.SelectedValue)
        {
            case "2": SearchAll(name, phone, birthYear, mobile, idNo, email, bloodType, mobileNetwork, territory, platelet, evaluation,
                gender, FavPlaceID, Holded, Inactive, VolunteerID, from, To, branch, FavoriteTypeID,status); break;
            case "1": SearchActive(name, phone, birthYear, mobile, idNo, email, bloodType, mobileNetwork, territory, platelet, evaluation,
                gender, FavPlaceID, Holded, Inactive, VolunteerID, from, To, branch, FavoriteTypeID,status); break;
            case "0": SearchInActive(name, phone, birthYear, mobile, idNo, email, bloodType, mobileNetwork, territory, platelet, evaluation,
                gender, FavPlaceID, Holded, Inactive, VolunteerID, from, To, branch, FavoriteTypeID,status); break;
            default:
                break;
        }
    }

    private void SearchAll(string name, string phone, string birthYear, string mobile, string idNo, string email, string bloodType, string mobileNetwork,
        int territory, string platelet, string evaluation, string gender, int FavPlaceID, string Holded, bool Inactive, int VolunteerID,
        DateTime? From, DateTime? To, int BranchID, int FavoriteTypeID,string status)
    {


        GridView1.DataSource = b.ReportAll(idNo, name, phone, mobile, email, bloodType, territory, null, gender, mobileNetwork, birthYear, evaluation,
            platelet, null, FavPlaceID, Holded, Inactive, VolunteerID, From, To, BranchID, FavoriteTypeID,status);
        GridView1.DataBind();
        int Count = b.ReportAll(idNo, name, phone, mobile, email, bloodType, territory, null, gender, mobileNetwork, birthYear, evaluation,
            platelet, null, FavPlaceID, Holded, Inactive, VolunteerID, From, To, BranchID, FavoriteTypeID, status).Count();
        lbl_Report.Visible = true;
        lbl_Report.Text =Count.ToString();
    }
    private void SearchActive(string name, string phone, string birthYear, string mobile, string idNo, string email, string bloodType, string mobileNetwork, 
        int territory, string platelet, string evaluation, string gender, int FavPlaceID, string Holded, bool Inactive, int VolunteerID, 
        DateTime? From, DateTime? To, int BranchID, int FavoriteTypeID,string status)
    {


        GridView1.DataSource = b.ReportActive(idNo, name, phone, mobile, email, bloodType, territory, null, gender, mobileNetwork,
            birthYear, evaluation, platelet, null, FavPlaceID, Holded, Inactive, VolunteerID, From, To, BranchID, FavoriteTypeID,status);
        GridView1.DataBind();
        int Count = b.ReportActive(idNo, name, phone, mobile, email, bloodType, territory, null, gender, mobileNetwork,
            birthYear, evaluation, platelet, null, FavPlaceID, Holded, Inactive, VolunteerID, From, To, BranchID, FavoriteTypeID, status).Count();
        lbl_Report.Visible = true;
        lbl_Report.Text = Count.ToString();
    }
    private void SearchInActive(string name, string phone, string birthYear, string mobile, string idNo, string email, 
        string bloodType, string mobileNetwork, int territory, string platelet, string evaluation, string gender, int FavPlaceID,
        string Holded, bool Inactive, int VolunteerID, DateTime? From, DateTime? To, int BranchID, int FavoriteTypeID,string status)
    {


        GridView1.DataSource = b.ReportInActive(idNo, name, phone, mobile, email, bloodType, territory, null, gender, mobileNetwork, birthYear,
            evaluation, platelet, null, FavPlaceID, Holded, Inactive, VolunteerID, From, To, BranchID, FavoriteTypeID,status);
        GridView1.DataBind();
        int Count = b.ReportInActive(idNo, name, phone, mobile, email, bloodType, territory, null, gender, mobileNetwork,
           birthYear, evaluation, platelet, null, FavPlaceID, Holded, Inactive, VolunteerID, From, To, BranchID, FavoriteTypeID, status).Count();
        lbl_Report.Visible = true;
        lbl_Report.Text = Count.ToString();
    }




    public static string Gender(object gender)
    {
        string BloodType = "";
        if (gender != null)
        {
            BloodType = gender.ToString();
            switch (BloodType)
            {

                case "1": BloodType = "ذكر"; break;
                case "0": BloodType = "أنثى"; break;
              
               
                default: BloodType = ""; break;


            }
        }

        return BloodType;




    }


    public static string LastDonationDate(DateTime DonatDate)
    {
        string yearMonth = "";
        if (DonatDate.ToString().Contains("0001") == false)
        {
           //  DateTime ym =  new 
            DonatDate.Month.ToString();
            DonatDate.Year.ToString();
            yearMonth = DonatDate.Day + " / " + DonatDate.Month.ToString() + " / " + DonatDate.Year.ToString();
        }
        return yearMonth;

    }

    public static string BloodType(object BT)
    {
        string BloodType = "";
        if (BT != null)
        {
            BloodType = BT.ToString();
            switch (BloodType)
            {

                case "1": BloodType = "O+"; break;
                case "2": BloodType = "A+"; break;
                case "3": BloodType = "B+"; break;
                case "4": BloodType = "AB+"; break;
                case "5": BloodType = "O-"; break;
                case "6": BloodType = "A-"; break;
                case "7": BloodType = "B-"; break;
                case "8": BloodType = "AB-"; break;
                case "9": BloodType = "غير معروف"; break;
                case "": BloodType = ""; break;
                default: BloodType = ""; break;

            }
        }

        return BloodType;




    }
    public static string MobileNetwork(object mobenetwork)
    {
        string mobilenetwork = "";
        if (mobenetwork != null)
        {
            mobilenetwork = mobenetwork.ToString();
            switch (mobilenetwork)
            {
                case "0": mobilenetwork = "فودافون"; break;
                case "1": mobilenetwork = "إتصالات"; break;
                case "2": mobilenetwork = "موبينيل"; break;
                default: mobilenetwork = ""; break;

            }
        }

        return mobilenetwork;


    }
    protected void ddl_Governerate_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem(" اختر المحافظة", "0");

        ddl_Governerate.Items.Insert(0, item);
    }
    protected void dll_Place_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر اسم المكان", "0");

        dll_Place.Items.Insert(0, item);
    }
    protected void ddl_Territory_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر المنطقة", "0");

        ddl_Territory.Items.Insert(0, item);
    }
    protected void ddl_Type_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر نوع المكان", "0");

        ddl_Type.Items.Insert(0, item);
    }
    protected void ddl_branch_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر", "0");

        ddl_branch.Items.Insert(0, item);
    }
    protected void btn_Export_Click(object sender, EventArgs e)
    {
        string attachment = "attachment; filename=vol.xls";
        Response.ClearContent();
        Response.AddHeader("content-disposition", attachment);
        Response.ContentType = "application/ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        GridView1.RenderControl(htw);
        
        Response.Write(sw.ToString());
        Response.End();
   
      
    }
   
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.Search();
    }
}