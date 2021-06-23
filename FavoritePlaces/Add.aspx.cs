using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class FavoritePlaces_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        BloodBankDataContext b = new BloodBankDataContext();
        FavoritePlace t = new FavoritePlace();
        t.FavoriteTypeID = ddl_Type.SelectedValue.ToInt32();
        t.FavPlace = txt_Place.Text;
        MembershipUser user = Membership.GetUser();
        Guid userid = (Guid)user.ProviderUserKey;
        b.LogInsert("Add", userid, DateTime.Now, "FavoritePlaces", null);
        b.SubmitChanges();
        b.FavoritePlaces.InsertOnSubmit(t);
        b.SubmitChanges();

        ClientScript.RegisterStartupScript(this.GetType(), "warrning", "<script>alert('تم الحفظ بنجاح')</script>");
        GridView1.DataBind();
        
    }
   
    protected void ddl_Type_DataBound(object sender, EventArgs e)
    {
        ListItem item = new ListItem("اختر", "0");

        ddl_Type.Items.Insert(0, item);
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
}