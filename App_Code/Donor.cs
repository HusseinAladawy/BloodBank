using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using System.Web;

/// <summary>
/// Summary description for Donor
/// </summary>
public class Donor
{
    public Donor()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static void Search(int? RowNmbers,string name, string phone, string birthYear, string mobile, bool WhatsApp, string idNo, string email, string mobileNetwork,
       int territory, string platelet, string evaluation, string gender, int FavPlaceID, string Holded, bool Inactive, int VolunteerID,
       DateTime? From, DateTime? To, int FavoriteTypeID, int? callpoints, int? DonationPoint, string ABO,
       string RH, string E, string e_, string C, string c_, string Kell, string kafala, string ready, bool Activedata, bool inactivedata, int hear, int Gov,GridView gv_Search, Label lbl_Count)
    {
        BloodBankDataContext b = new BloodBankDataContext();
        var data = b.SearchVolunteer(RowNmbers,idNo, name, phone, mobile, WhatsApp, email, territory, null, gender, mobileNetwork, birthYear, evaluation, platelet,
            null, FavPlaceID, Holded, Inactive, VolunteerID, From, To, FavoriteTypeID,
            callpoints, DonationPoint, ABO, RH, c_, C, e_, E, Kell, kafala, ready, Activedata, inactivedata, hear, Gov).ToList();

        gv_Search.DataSource = data;
        gv_Search.DataBind();
        int count = data.Count();
        //b.SearchVolunteer(idNo, name, phone, mobile, WhatsApp, email, territory, null, gender, mobileNetwork, birthYear, evaluation, platelet,
        //null, FavPlaceID, Holded, Inactive, VolunteerID, From, To, BranchID, FavoriteTypeID,
        //callpoints, DonationPoint, ABO, RH, c_, C, e_, E, Kell,kafala,ready).Count();
        lbl_Count.Visible = true;
        lbl_Count.Text = count.ToString();
    }
}