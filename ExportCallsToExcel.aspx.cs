using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Security;


public partial class ExportCallsToExcel : System.Web.UI.Page
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

       
    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        Search();
  
   
        btn_Export.Visible = GridView1.Visible; ;
        btn_CHold.Visible = GridView1.Visible;
        MembershipUser user = Membership.GetUser();
        Guid userid = (Guid)user.ProviderUserKey;
        b.LogInsert("Search", userid, DateTime.Now, "ToExcel", null);
    }

    private void Search()
    {
        string name = Txt_Name.Text;
        string phone = Txt_Phone.Text;
        string birthYear = ddl_BirthYear.SelectedValue;
        string mobile = txt_Mobile.Text;
        string idNo = Txt_IDNo.Text;
        string email = Txt_Email1.Text;
        //string bloodType = ddl_BloodType.SelectedValue;
        string ABO = ddl_ABO.SelectedValue;
        string RH = ddl_RH.SelectedValue;
        string E = ddl_E_.SelectedValue;
        string e_ = ddl_e.SelectedValue;
        string C = ddl_C_.SelectedValue;
        string c_ = ddl_c.SelectedValue;
        string Kell = ddl_Kell.SelectedValue;
        string mobileNetwork = ddl_MobileNetwork1.SelectedValue;
        int territory = ddl_Territory.SelectedValue.ToInt32();
        string platelet = ddl_Platelet.SelectedValue;
        // int branch = ddl_branch.SelectedValue.ToInt32();

        string evaluation = ddl_Evaluation.SelectedValue;
        string kafala = ddl_Kafala.SelectedValue;
        bool whats = chk_WhatsApp.Checked;
        string gender = rbl_Gender.SelectedValue;
        int FavPlaceID = dll_Place.SelectedValue.ToInt32();
        int FavoriteTypeID = ddl_Type.SelectedValue.ToInt32();
        string Holded = null;
        bool Inactive = chk_InActive.Checked;
        string ready = rbl_Ready.SelectedValue;
        int VolunteerID = Txt_V_ID.Text.ToInt32();
        DateTime? from = null;
        DateTime? To = null;
        int? Callpoint = txt_callpoints.Text.ToNullInt32();

        bool ActiveData = true;
        bool InActiveData = false;
        int rowNo = ddl_RowsNo.SelectedValue.ToInt32();

        int? DonationPoint = txt_Donationpoints.Text.ToNullInt32();
        int hear = ddl_HearedAbout.SelectedValue.ToInt32();
        int Gov = ddl_Governerate.SelectedValue.ToInt32();

        if (!dt_From.SelectedDate.ToString().Contains("1980"))
        {
            from = dt_From.SelectedDate;
        }
        if (!dt_To.SelectedDate.ToString().Contains("1980"))
        {
            To = dt_To.SelectedDate;
        }
        if (rbl_Reserved.SelectedValue != "")
        {
            Holded = rbl_Reserved.SelectedValue;
        }

        switch (rbl_Active.SelectedValue)
        {
            case "2":
                InActiveData = false;
                ActiveData = false;
                break;

            case "0":
                InActiveData = true;
                ActiveData = false;
                break;
            default:
                break;
        }


        Donor.Search(rowNo, name, phone, birthYear, mobile, whats, idNo, email, mobileNetwork, territory, platelet, evaluation, gender, FavPlaceID, Holded,
                Inactive, VolunteerID, from, To, FavoriteTypeID, Callpoint, DonationPoint, ABO, RH, E, e_, C, c_, Kell, kafala, ready, ActiveData, InActiveData, hear, Gov, GridView1, lbl_Report);

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
                case "2": mobilenetwork = "اورانج"; break;
                case "5": mobilenetwork = "WE"; break;
                default: mobilenetwork = ""; break;

            }
        }

        return mobilenetwork;


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
    //protected void ddl_branch_DataBound(object sender, EventArgs e)
    //{
    //    ListItem item = new ListItem("اختر", "0");

    //    ddl_branch.Items.Insert(0, item);
    //}
    protected void btn_Export_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            string cellText = row.Cells[0].Text;
            if (cellText != "")
            {
                Volunteer v = b.Volunteers.Single(x => x.V_ID==cellText.ToInt32());
                v.HoldDate = DateTime.Now.AddDays(6);
              
               
                b.SubmitChanges();
            }
         
        }
        string attachment = "attachment; filename=vol.xls";
        Response.ClearContent();
        Response.AddHeader("content-disposition", attachment);
        Response.ContentType = "application/ms-excel";
        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        GridView1.RenderControl(htw);

        Response.Write(sw.ToString());
        Response.End();
        MembershipUser user = Membership.GetUser();
        Guid userid = (Guid)user.ProviderUserKey;
        b.LogInsert("Export", userid, DateTime.Now, "ToExcel", null);
        b.SubmitChanges();


    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
    protected void btn_CHold_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            string cellText = row.Cells[0].Text;
            if (cellText != "")
            {
                Volunteer v = b.Volunteers.Single(x => x.V_ID == cellText.ToInt32());
                v.HoldDate = null;


                b.SubmitChanges();
            }

        }
        MembershipUser user = Membership.GetUser();
        Guid userid = (Guid)user.ProviderUserKey;
        b.LogInsert("UnHold", userid, DateTime.Now, "ToExcel", null);
        b.SubmitChanges();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.Search();
    }
    protected void ddl_HearedAbout_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر", "0");

        ddl_HearedAbout.Items.Insert(0, item);
    }
}