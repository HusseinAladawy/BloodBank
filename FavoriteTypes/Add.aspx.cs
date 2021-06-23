using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class FavortitTypes_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        BloodBankDataContext b = new BloodBankDataContext();
        FavoriteType t = new FavoriteType();
        t.Type = txt_type.Text;
        b.FavoriteTypes.InsertOnSubmit(t);
        MembershipUser user = Membership.GetUser();
        Guid userid = (Guid)user.ProviderUserKey;
        b.LogInsert("Add", userid, DateTime.Now, "FavoriteTypes", null);
        b.SubmitChanges();
        
        ClientScript.RegisterStartupScript(this.GetType(), "warrning", "<script>alert('تم الحفظ بنجاح')</script>");
        GridView1.DataBind();
        

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton l = (LinkButton)e.Row.FindControl("lnkbtn_del");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('  هل انت متأكد من حذف الملف " +
            DataBinder.Eval(e.Row.DataItem, "Type") + "')");
        }
    }
}