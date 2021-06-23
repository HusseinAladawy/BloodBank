using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Kafala_Kid_Search : System.Web.UI.Page
{
    BloodBankDataContext b;

    protected void Page_Load(object sender, EventArgs e)
    {
        b = new BloodBankDataContext();
    }

    protected void btn_Save_Click(object sender, EventArgs e)
    {
        string name = Txt_Name.Text;     
        int territoryID = ddl_Territory.SelectedValue.ToInt32();
        string gender = rbl_Gender.SelectedValue;
        string Status = rbl_Status.SelectedValue;
        string ABO = ddl_ABO.SelectedValue;
        string RH = ddl_RH.SelectedValue;
        string E = ddl_E_.SelectedValue;
        string e_ = ddl_e.SelectedValue;
        string C = ddl_C_.SelectedValue;
        string c_ = ddl_c.SelectedValue;
        string Kell = ddl_Kell.SelectedValue;
        DateTime? BirthDateFrom = null;
        DateTime? BirthDateTo = null;
        if (!dt_BirthDateFrom.SelectedDate.ToString().Contains("1980"))
        {
            BirthDateFrom = dt_BirthDateFrom.SelectedDate;
        }
         if (!dt_BirthDateTo.SelectedDate.ToString().Contains("1980"))
        {
            BirthDateTo = dt_BirthDateFrom.SelectedDate;
        }
     
        int HosptialID = ddl_Hospital.SelectedValue.ToInt32();
        int DiseaseID = ddl_Disease.SelectedValue.ToInt32();
        string IDNo=Txt_IDNo.Text;
        int  K_ID=Txt_K_ID.Text.ToInt32();

        var result = b.Kid_Search(IDNo, name, territoryID, gender, K_ID, Status, HosptialID, DiseaseID, ABO, RH, c_, C, e_, E, Kell, BirthDateFrom, BirthDateTo).ToList();
        GridView1.DataSource = result;
        GridView1.DataBind();

        lbl_Report.Visible = true;
        lbl_Report.Text = result.Count().ToString();
    }

    public static string Gender(object gender)
    {
        string g = "";
        if (gender != null)
        {
            g = gender.ToString();
            switch (g)
            {

                case "1": g = "ذكر"; break;
                case "0": g = "أنثى"; break;


                default: g = ""; break;


            }
        }

        return g;




    }
#region Gridview Function

    protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton l = (LinkButton)e.Row.FindControl("lnkbtn_del");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm(' <br> هل انت متأكد ؟ " +
            DataBinder.Eval(e.Row.DataItem, "KidName") + "')");
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = (int)GridView1.DataKeys[e.RowIndex].Value;
        DeleteRecordByID(id);
        //MembershipUser user = Membership.GetUser();
        //Guid userid = (Guid)user.ProviderUserKey;
        //b.LogInsert("Delete", userid, DateTime.Now, "ManageVolunteer", id);
        //b.SubmitChanges();
       // Search();
    }
    private void DeleteRecordByID(int ID)
    {
        Kid t = b.Kids.Single(x => x.Kid_ID == ID);
        t.Deleted = true;
        b.SubmitChanges();

        // attach parameters 
        // delete the record 
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
       // this.Search();
    }
#endregion
    #region dropDowns
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
    #endregion
}