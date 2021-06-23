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
           
        }
    

       
    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        Search();
        MembershipUser user = Membership.GetUser();
        Guid userid = (Guid)user.ProviderUserKey;
        b.LogInsert("Serach", userid, DateTime.Now, "طوارئ", null);
        b.SubmitChanges();
    }

    private void Search()
    {
       
        string bloodType = ddl_BloodType.SelectedValue;
        string mobileNetwork = ddl_MobileNetwork1.SelectedValue;
        int territory = ddl_Territory.SelectedValue.ToInt32();
        string platelet = ddl_Platelet.SelectedValue;
        string evaluation = ddl_Evaluation.SelectedValue;
       
        string gender = rbl_Gender.SelectedValue;
        int FavPlaceID = dll_Place.SelectedValue.ToInt32();
        int FavoriteTypeID = ddl_Type.SelectedValue.ToInt32();
        int? Callpoint = txt_callpoints.Text.ToNullInt32();
        int? DonationPoint = txt_Donationpoints.Text.ToNullInt32();
        EmergencySearch(bloodType, mobileNetwork, territory, platelet, evaluation, gender, FavPlaceID, FavoriteTypeID, Callpoint,DonationPoint);
    }


    private void EmergencySearch(string bloodType, string mobileNetwork, int territory, string platelet, string evaluation, string gender, int FavPlaceID, int FavoriteTypeID, int? callpoints, int? DonationPoint)
    {


        GridView1.DataSource = b.EmergencySearch(bloodType, territory, FavPlaceID, gender, mobileNetwork, evaluation, platelet, FavoriteTypeID, callpoints, DonationPoint);
        GridView1.DataBind();
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
    public static string DonationStatus(object DS)
    {
        string DonationStatus = "";
        if (DS != null)
        {
            DonationStatus = DS.ToString();
            switch (DonationStatus)
            {
                /*
                    <asp:ListItem Value="0">اختر</asp:ListItem>
                <asp:ListItem Value="1">مقبول</asp:ListItem>
                <asp:ListItem Value="2">مؤجل</asp:ListItem>
                <asp:ListItem Value="3">مرفوض</asp:ListItem>
                 <asp:ListItem Value="4">هروب</asp:ListItem>
                <asp:ListItem Value="5">مشتقات</asp:ListItem>*/
                case "1": DonationStatus = "مقبول"; break;
                case "2": DonationStatus = "مؤجل"; break;
                case "3": DonationStatus = "مرفوض"; break;
                case "4": DonationStatus = "هروب"; break;
                case "5": DonationStatus = "مشتقات"; break;
                //case "6": DonationStatus = "A-"; break;
                //case "7": BloodType = "B-"; break;
                //case "8": BloodType = "AB-"; break;
                //case "9": BloodType = "غير معروف"; break;
                case "": DonationStatus = ""; break;
                default: DonationStatus = ""; break;


            }
        }

        return DonationStatus;




    }
}