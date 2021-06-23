using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.OleDb;
using System.Data;
using System.Configuration;
using System.Web.Security;

public partial class ImportExcel : System.Web.UI.Page
{
    BloodBankDataContext b;
    protected void Page_Load(object sender, EventArgs e)
    {
        b = new BloodBankDataContext();
    }


    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string FileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string Extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
            string FolderPath = ConfigurationManager.AppSettings["FolderPath"];

            string FilePath = Server.MapPath("~/Sheets/" + FileName);
            FileUpload1.SaveAs(FilePath);
            Import_To_Grid(FilePath, Extension, "Yes");
            MembershipUser user = Membership.GetUser();
            Guid userid = (Guid)user.ProviderUserKey;
            b.LogInsert("Import", userid, DateTime.Now, "FromExcel", null);
            b.SubmitChanges();

            if ((System.IO.File.Exists(FilePath)))
            {
                System.IO.File.Delete(Server.MapPath("~/Sheets/" + FileName));
            }

        }
    }
    private void Import_To_Grid(string FilePath, string Extension, string isHDR)
    {
        //try
        //{
        string conStr = "";
        switch (Extension)
        {
            case ".xls": //Excel 97-03
                conStr = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                break;
            case ".xlsx": //Excel 07

                conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString;
                break;
        }
        conStr = String.Format(conStr, FilePath, isHDR);
        OleDbConnection connExcel = new OleDbConnection(conStr);
        OleDbCommand cmdExcel = new OleDbCommand();
        OleDbDataAdapter oda = new OleDbDataAdapter();
        DataTable dt = new DataTable();
        cmdExcel.Connection = connExcel;

        //Get the name of First Sheet
        connExcel.Open();


        DataTable dtExcelSchema;
        dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
        string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();
        connExcel.Close();

        //Read Data from First Sheet
        connExcel.Open();
        cmdExcel.CommandText = "SELECT * From [" + SheetName + "]";
        oda.SelectCommand = cmdExcel;
        oda.Fill(dt);
        connExcel.Close();

        BloodBankDataContext b = new BloodBankDataContext();

        foreach (DataRow row in dt.Rows)
        {



            if (row["V_ID"].ToString() != "")
            {

                int VolunteerID = Convert.ToInt32(row["V_ID"]);
                string Comments = row["Comments"].ToString();
                VolunteerCall c = new VolunteerCall();
                c.VolunteerID = VolunteerID;
                Volunteer v = b.Volunteers.Single(x => x.V_ID == c.VolunteerID);
                v.HoldDate = null;
                v.CallPoints = v.CallPoints + 1;
                DateTime CallDate = DateTime.Now;
                if (row["CallDate"].ToString() != "")
                {
                    CallDate = Convert.ToDateTime(row["CallDate"].ToString());
                }
                c.CallDate = CallDate;
                c.Comments = row["Comments"].ToString();
                b.VolunteerCalls.InsertOnSubmit(c);
                AddCalls(VolunteerID, Comments, CallDate);
                b.SubmitChanges();
            }




        }
        //Bind Data to GridView
        GridView1.Caption = Path.GetFileName(FilePath);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        lbl_Exception.Visible = false;
        //}
        //catch (Exception ex)
        //{

        //    if (ex.Message.Contains("format"))
        //    {
        //        lbl_Exception.Visible = true;
        //        lbl_Exception.Text = "يجب حفظ الملف Save AS";
        //    }
        //    else if (ex.Message.Contains("Column"))
        //    {
        //        lbl_Exception.Visible = true;
        //        lbl_Exception.Text = "تم تغيير أسم عمود من الجدول";
        //    }
        //}

    }
    protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        string FolderPath = ConfigurationManager.AppSettings["FolderPath"];
        string FileName = GridView1.Caption;
        string Extension = Path.GetExtension(FileName);
        string FilePath = Server.MapPath(FolderPath + FileName);

        Import_To_Grid(FilePath, Extension, "Yes");
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
    private static void AddCalls(int VolunteerID, string Comment, DateTime CallDate)
    {
        BloodBankDataContext b = new BloodBankDataContext();
        //var c = from x in b.VolunteerCalls orderby x.VolunteerID, x.CallDate ascending select x;



        var lv = from z in b.VolunteerLasts where z.VID == VolunteerID select z;
        if (lv.Any())
        {
            VolunteerLast vl = b.VolunteerLasts.Single(x => x.VID == VolunteerID);

            //  VolunteerLast vl = new VolunteerLast();
            vl.VID = VolunteerID;
            vl.CallDate = CallDate;
            vl.Comments = Comment;
            //  b.VolunteerLasts.InsertOnSubmit(vl);
            b.SubmitChanges();
        }
        else
        {
            VolunteerLast vl = new VolunteerLast();
            vl.VID = VolunteerID;
            vl.CallDate = CallDate;
            vl.Comments = Comment;
            b.VolunteerLasts.InsertOnSubmit(vl);
            b.SubmitChanges();
        }







    }

}