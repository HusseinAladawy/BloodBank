using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


public partial class ExportCallsToExcel : System.Web.UI.Page
{
    BloodBankDataContext b;
    protected void Page_Load(object sender, EventArgs e)
    {
        b = new BloodBankDataContext();
    



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
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        Search(0);

        btn_Export.Visible = GridView1.Visible; ;
        btn_CHold.Visible = GridView1.Visible;

    }

    private void Search(int pageIndex)
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
        int BranchID = ddl_branch.SelectedValue.ToInt32();
        string evaluation = ddl_Evaluation.SelectedValue;

        string gender = rbl_Gender.SelectedValue;
        int FavPlaceID = dll_Place.SelectedValue.ToInt32();
        int FavoriteTypeID = ddl_Type.SelectedValue.ToInt32();
        string Holded = null;
        bool Inactive = chk_InActive.Checked;
        int VolunteerID = Txt_V_ID.Text.ToInt32();
        DateTime? From = null;
        DateTime? To = null;
        if (ddl_FromYear.SelectedValue != "0" || ddl_FromMonth.SelectedValue != "0" || ddl_FromDay.SelectedValue != "0")
        {
            From = new DateTime(ddl_FromYear.SelectedValue.ToInt32(), ddl_FromMonth.SelectedValue.ToInt32(), ddl_FromDay.SelectedValue.ToInt32());
        } if (ddl_ToYear.SelectedValue != "0" || ddl_ToMonth.SelectedValue != "0" || ddl_ToDay.SelectedValue != "0")
        {
            To = new DateTime(ddl_ToYear.SelectedValue.ToInt32(), ddl_ToMonth.SelectedValue.ToInt32(), ddl_ToDay.SelectedValue.ToInt32());
        }
        if (rbl_Reserved.SelectedValue != "")
        {
            Holded = rbl_Reserved.SelectedValue;
        }
        int totalRecords;
        int pageSize = 100;
        int startRow;
        switch (rbl_Active.SelectedValue)
        {
            case "2":
                totalRecords = b.SearchVolunteer(idNo, name, phone, mobile, email, bloodType, territory, null, gender, mobileNetwork, birthYear,
               evaluation, platelet, null, FavPlaceID, Holded, Inactive, VolunteerID, From, To, BranchID, FavoriteTypeID).Count();
               
                startRow = pageIndex * pageSize;
               BindPager(totalRecords, pageIndex, pageSize);
               GridView1.DataSource = b.SearchVolunteer(idNo, name, phone, mobile, email, bloodType, territory, null, gender, mobileNetwork, birthYear, evaluation, platelet, null, 
               FavPlaceID, Holded, Inactive, VolunteerID, From, To, BranchID, FavoriteTypeID).Skip(startRow).Take(pageSize);;
               GridView1.DataBind(); break;

            case "1":


               totalRecords = b.ActiveSearchVolunteer(idNo, name, phone, mobile, email, bloodType, territory, null, gender, mobileNetwork, birthYear,
               evaluation, platelet, null, FavPlaceID, Holded, Inactive, VolunteerID, From, To, BranchID, FavoriteTypeID).Count();
               
                startRow = pageIndex * pageSize;
               BindPager(totalRecords, pageIndex, pageSize);
               GridView1.DataSource = b.ActiveSearchVolunteer(idNo, name, phone, mobile, email, bloodType, territory, null, gender, mobileNetwork, birthYear, evaluation, platelet, null, 
               FavPlaceID, Holded, Inactive, VolunteerID, From, To, BranchID, FavoriteTypeID).Skip(startRow).Take(pageSize);;
               GridView1.DataBind();

                
                ; break;

            case "0":


                totalRecords = b.ActiveSearchVolunteer(idNo, name, phone, mobile, email, bloodType, territory, null, gender, mobileNetwork, birthYear,
               evaluation, platelet, null, FavPlaceID, Holded, Inactive, VolunteerID, From, To, BranchID, FavoriteTypeID).Count();
               
                startRow = pageIndex * pageSize;
               BindPager(totalRecords, pageIndex, pageSize);
               GridView1.DataSource = b.ActiveSearchVolunteer(idNo, name, phone, mobile, email, bloodType, territory, null, gender, mobileNetwork, birthYear, evaluation, platelet, null, 
               FavPlaceID, Holded, Inactive, VolunteerID, From, To, BranchID, FavoriteTypeID).Skip(startRow).Take(pageSize);;
               GridView1.DataBind();


              
                    ;
                    break;
            default:
                break;
        }
    }

    //private void SearchAll(string name, string phone, string birthYear, string mobile, string idNo, string email, string bloodType, string mobileNetwork,
    //    int territory, string platelet, string evaluation, string gender, int FavPlaceID, string Holded, bool Inactive, int VolunteerID,
    //    DateTime? From, DateTime? To, int BranchID, int FavoriteTypeID)
    //{

    //    int totalRecords = GetCustomerEntity().Count;
    //    int pageSize = 100;
    //    int startRow = pageIndex * pageSize;

    //    grdCustomer.DataSource = GetCustomerEntity().Skip(startRow).Take(pageSize);
    //    grdCustomer.DataBind();

    //    BindPager(totalRecords, pageIndex, pageSize);
    //    GridView1.DataSource = b.SearchVolunteer(idNo, name, phone, mobile, email, bloodType, territory, null, gender, mobileNetwork, birthYear, evaluation, platelet, null, FavPlaceID, Holded, Inactive, VolunteerID, From, To, BranchID, FavoriteTypeID);
    //    GridView1.DataBind();
       
    //}
    //private void SearchActive(string name, string phone, string birthYear, string mobile, string idNo, string email, string bloodType, string mobileNetwork, int territory, string platelet, string evaluation, string gender, int FavPlaceID, string Holded, bool Inactive, int VolunteerID, DateTime? From, DateTime? To, int BranchID, int FavoriteTypeID)
    //{


      
    //}
    //private void SearchInActive(string name, string phone, string birthYear, string mobile, string idNo, string email, string bloodType, string mobileNetwork, int territory, string platelet, string evaluation, string gender, int FavPlaceID, string Holded, bool Inactive, int VolunteerID, DateTime? From, DateTime? To, int BranchID, int FavoriteTypeID)
    //{


    //    GridView1.DataSource = b.InActiveSearchVolunteer(idNo, name, phone, mobile, email, bloodType, territory, null, gender, mobileNetwork, birthYear, evaluation, platelet, null, FavPlaceID, Holded, Inactive, VolunteerID, From, To, BranchID, FavoriteTypeID);
    //    GridView1.DataBind();
    //}


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
    protected void ddl_branch_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر", "0");

        ddl_branch.Items.Insert(0, item);
    }
    protected void btn_Export_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            string cellText = row.Cells[0].Text;
            if (cellText != "")
            {
                Volunteer v = b.Volunteers.Single(x => x.V_ID==cellText.ToInt32());
                v.HoldDate = DateTime.Now.AddDays(3);
              
               
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
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //GridView1.PageIndex = e.NewPageIndex;
        //this.Search();
    }
    private void BindPager(int totalRecordCount, int currentPageIndex, int pageSize)
    {
        double getPageCount = (double)((decimal)totalRecordCount / (decimal)pageSize);
        int pageCount = (int)Math.Ceiling(getPageCount);
        List<ListItem> pages = new List<ListItem>();
        if (pageCount > 1)
        {
            pages.Add(new ListItem("FIRST", "1", currentPageIndex > 1));
            for (int i = 1; i <= pageCount; i++)
            {
                pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPageIndex + 1));
            }
            pages.Add(new ListItem("LAST", pageCount.ToString(), currentPageIndex < pageCount - 1));
        }

        rptPager.DataSource = pages;
        rptPager.DataBind();
    }
    protected void Page_Changed(object sender, EventArgs e)
    {
        int pageIndex = Convert.ToInt32(((sender as LinkButton).CommandArgument));
        Search(pageIndex - 1);
    }


  
}