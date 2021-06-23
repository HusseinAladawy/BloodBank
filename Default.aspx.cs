using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

       // AddDonations();

      //  AddCalls();
    }

    private static void AddDonations()
    {
        BloodBankDataContext b = new BloodBankDataContext();
        var c = from x in b.VolunteerHistories orderby x.Volunteer_ID, x.DonationDate ascending select x;
        foreach (var volc in c)
        {
            var lv = from z in b.VolunteerLasts where z.VID == volc.Volunteer_ID select z;
            if (lv.Any())
            {
                VolunteerLast vl = b.VolunteerLasts.Single(x => x.VID == volc.Volunteer_ID);
                Volunteer vln = b.Volunteers.Single(x => x.V_ID == volc.Volunteer_ID);
                //  VolunteerLast vl = new VolunteerLast();
                vl.VID = volc.Volunteer_ID;
                vl.DonationDate = volc.DonationDate;
                vln.LastDonationDate = volc.DonationDate;
                vl.Status = volc.Status;
                //  b.VolunteerLasts.InsertOnSubmit(vl);
                b.SubmitChanges();
            }
            else
            {
                VolunteerLast vl = new VolunteerLast();

                vl.VID = volc.Volunteer_ID;
                vl.DonationDate = volc.DonationDate;
                vl.Status = volc.Status;
                b.VolunteerLasts.InsertOnSubmit(vl);
                b.SubmitChanges();
            }
        }
    }

    private static void AddCalls()
    {
        BloodBankDataContext b = new BloodBankDataContext();
        var c = from x in b.VolunteerCalls orderby x.VolunteerID, x.CallDate ascending select x;
        foreach (var volc in c)
        {


            var lv = from z in b.VolunteerLasts where z.VID == volc.VolunteerID select z;
            if (lv.Any())
            {
                VolunteerLast vl = b.VolunteerLasts.Single(x => x.VID == volc.VolunteerID);

                //  VolunteerLast vl = new VolunteerLast();
                vl.VID = volc.VolunteerID;
                vl.CallDate = volc.CallDate;
                vl.Comments = volc.Comments;
                //  b.VolunteerLasts.InsertOnSubmit(vl);
                b.SubmitChanges();
            }
            else
            {
                VolunteerLast vl = new VolunteerLast();
                vl.VID = volc.VolunteerID;
                vl.CallDate = volc.CallDate;
                vl.Comments = volc.Comments;
                b.VolunteerLasts.InsertOnSubmit(vl);
                b.SubmitChanges();
            }






        }
    }
}
