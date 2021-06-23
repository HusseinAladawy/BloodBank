using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DonationPlace_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_Save_Click(object sender, EventArgs e)
    {
        BloodBankDataContext b = new BloodBankDataContext();
        DonationPlace d = new DonationPlace();
        d.DonationPlaceTypeID_FK = ddl_Type.SelectedValue.ToInt32();
        d.DonationPlaceName = txt_Place.Text;
        b.DonationPlaces.InsertOnSubmit(d);
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
            DataBinder.Eval(e.Row.DataItem, "DonationPlaceName") + "')");
        }
    }
}