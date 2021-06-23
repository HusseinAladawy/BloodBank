using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Volunteers_DonationFavoritePlaces : System.Web.UI.Page
{
    BloodBankDataContext b;
    int ID;
    protected void Page_Load(object sender, EventArgs e)
    {
        b = new BloodBankDataContext();
        ID = Request.QueryString["ID"].ToInt32();
        Volunteer v = b.Volunteers.Single(x => x.V_ID == ID);
        lbl_Name.Text = v.Name;
        lbl_VID.Text = ID.ToString();
        b.SubmitChanges();
        


    }  
    protected void btn_Save_Click(object sender, EventArgs e)
    {
      
       
        foreach (ListItem item in chkl_Places.Items)
        { 
            if (item.Selected==true)
            {
                VolunteerPlace t = new VolunteerPlace();
                t.VolunteerID = ID;
              t.PlaceID = item.Value.ToInt32();
              b.VolunteerPlaces.InsertOnSubmit(t);
              MembershipUser user = Membership.GetUser();
              Guid userid = (Guid)user.ProviderUserKey;
              b.LogInsert("AddPlace", userid, DateTime.Now, "DonationFavoritePlaces", ID);
              b.SubmitChanges();

            }
        }
        ClientScript.RegisterStartupScript(this.GetType(), "warrning", "<script>alert('تم الحفظ بنجاح')</script>");
        GridView1.DataBind();
    }
    protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton l = (LinkButton)e.Row.FindControl("lnkbtn_del");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('  هل انت متأكد من حذف الملف " +
            DataBinder.Eval(e.Row.DataItem, "FavPlace") + "')");
        }
    }
    protected void ddl_Type_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر", "0");

        ddl_Type.Items.Insert(0, item);
    }
    protected void btn_Edit_Click(object sender, EventArgs e)
    {
        Response.Redirect("Edit.aspx?ID=" + ID);
    }
    protected void btn_Donation_Click(object sender, EventArgs e)
    {
        Response.Redirect("History.aspx?ID=" + ID);
    }
    protected void btn_Call_Click(object sender, EventArgs e)
    {
        Response.Redirect("Calls.aspx?ID=" + ID);
    }
}