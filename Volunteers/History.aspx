<%@ Page Title=" تاريخ وإضافة تبرعات للمتبرع" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="History.aspx.cs" Inherits="Volunteers_History" %>


<%@ Register assembly="RadCalendar.Net2" namespace="Telerik.WebControls" tagprefix="radCln" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div class="row">
    <div class="col-12">
      <h1 class="style5 text-center">
        تبرعات المتبرع
        (<asp:Label ID="lbl_VID" runat="server" Font-Size="X-Large" ForeColor="Blue"></asp:Label>)&nbsp;
        <asp:Label ID="lbl_Name" runat="server" Font-Size="X-Large" ForeColor="Black"></asp:Label>
      </h1>
    </div>
  </div>
  <br>
  <div class="row">
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22 d-block'> تاريخ التبرع
          :</label>
        <radCln:RadDatePicker ID="dt_DonationDate" runat="server" Culture="ar-EG" class="w-100" Font-Size="Medium">
          <calendar font-size="Medium" enableviewselector="True">
            <DayStyle Font-Size="Medium" Font-Strikeout="False" />
            <WeekendDayStyle Font-Size="Medium" />
            <calendartablestyle font-size="Medium" />
            <OtherMonthDayStyle Font-Size="Medium" />
            <outofrangedaystyle font-size="Medium" />
            <disableddaystyle font-size="Medium" />
            <SelectedDayStyle Font-Size="Medium" />
            <dayoverstyle font-size="Medium" />
            <TitleStyle Font-Size="Medium" />
            <HeaderStyle Font-Size="Medium" />
            <fastnavigationstyle font-size="Medium" height="200px" width="200px" />

          </calendar>
          <dateinput font-size="Medium" />
          <datepopupbutton font-size="Medium" />
        </radCln:RadDatePicker>
            <asp:CompareValidator ID="Comparevalidator1" runat="server" ErrorMessage="التاريخ لا يجب ان يكون اكبر من اليوم" ForeColor="Red"
            Operator="LessThanEqual" ControlToValidate="dt_DonationDate" Type="date" Display="Dynamic" />

        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="dt_DonationDate" ErrorMessage="*"
          ForeColor="Red" MaximumValue="01/01/2070" MinimumValue="01/01/1981" SetFocusOnError="True" Type="Date">
        </asp:RangeValidator>

      </div>
    </div>
    <div class="col-md-6 col-12">

    </div>
  </div>
  <div class="row">
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22'> مكان التبرع
          :</label>
        <asp:DropDownList ID="ddl_Type" runat="server" DataSourceID="sds_Type"  class="form-control chosen-select"
          DataTextField="DonationPlaceTypeName" DataValueField="DonationPlaceTypeID" AutoPostBack="true"
          ondatabound="ddl_Type_DataBound">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddl_Type"
          ErrorMessage="*" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
        <asp:SqlDataSource ID="sds_Type" runat="server"
          ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
          SelectCommand="SELECT [DonationPlaceTypeID], [DonationPlaceTypeName] FROM [DonationPlaceType]">
        </asp:SqlDataSource>

      </div>
    </div>
    <div class="col-md-6 col-12">
      <label for="">&nbsp;</label>
      <asp:DropDownList ID="dll_Place" runat="server"  class="form-control chosen-select" ForeColor="Black"
        DataSourceID="sds_Place" DataTextField="DonationPlaceName" DataValueField="DonationPlaceID"
        ondatabound="dll_Place_DataBound">
      </asp:DropDownList>


      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red"
        InitialValue="0" ControlToValidate="dll_Place"></asp:RequiredFieldValidator>


      <asp:SqlDataSource ID="sds_Place" runat="server"
        ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
        SelectCommand="SELECT [DonationPlaceID], [DonationPlaceName], [DonationPlaceTypeID_FK], [OLDName] from DonationPlaces WHERE   ([DonationPlaceTypeID_FK] = @DonationPlaceTypeID_FK)">
        <SelectParameters>
          <asp:ControlParameter ControlID="ddl_Type" Name="DonationPlaceTypeID_FK" PropertyName="SelectedValue"
            Type="Int32" />
        </SelectParameters>
      </asp:SqlDataSource>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22'> حالة التبرع
          :</label>
        <asp:DropDownList ID="ddl_DonationStatus" runat="server" class="form-control chosen-select">
          <asp:ListItem Value="0">اختر</asp:ListItem>
          <asp:ListItem Value="1">مقبول</asp:ListItem>
          <asp:ListItem Value="2">مؤجل</asp:ListItem>
          <asp:ListItem Value="3">مرفوض</asp:ListItem>
          <asp:ListItem Value="4">هروب</asp:ListItem>
          <asp:ListItem Value="5">مشتقات</asp:ListItem>
        </asp:DropDownList>
        &nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ForeColor="Red"
          InitialValue="0" ControlToValidate="ddl_DonationStatus"></asp:RequiredFieldValidator>

      </div>
    </div>
    <div class="col-md-6 col-12">
      <label for="" class="font-22">ملاحظات التبرع</label>
      <asp:TextBox ID="txt_Notes" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
      <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txt_Notes" ID="RegularExpressionValidator3"
        ValidationExpression="^[\s\S]{1,100}$" runat="server" ErrorMessage="الحد الأقصى للكتابة 100 حرف"
        ForeColor="Red"></asp:RegularExpressionValidator>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22'> مانع مؤقت
          :</label>
        <asp:DropDownList ID="ddl_NotAvailable" runat="server" class="form-control chosen-select">
          <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>
          <asp:ListItem Value="2">الحمل</asp:ListItem>
          <asp:ListItem Value="3">الرضاعة</asp:ListItem>
          <asp:ListItem Value="1">السفر</asp:ListItem>
          <asp:ListItem Value="4">أسنان</asp:ListItem>
          <asp:ListItem Value="5">جراحة</asp:ListItem>
          <asp:ListItem Value="7">أنيميا</asp:ListItem>
          <asp:ListItem Value="6">آخرى</asp:ListItem>
        </asp:DropDownList>

        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="lbl_temp" runat="server" Font-Names="Tahoma" ForeColor="Red" Visible="False" Font-Size="Small">
        </asp:Label>
      </div>
    </div>
    <div class="col-md-6 col-12">
      <label for="" class="font-22 d-block">المانع حتى</label>
      <radCln:RadDatePicker ID="dt_AvailabilityDate" runat="server" Culture="ar-EG" Font-Size="Medium">
        <calendar font-size="Medium" enableviewselector="True">
          <DayStyle Font-Size="Medium" Font-Strikeout="False" />
          <WeekendDayStyle Font-Size="Medium" />
          <calendartablestyle font-size="Medium" />
          <OtherMonthDayStyle Font-Size="Medium" />
          <outofrangedaystyle font-size="Medium" />
          <disableddaystyle font-size="Medium" />
          <SelectedDayStyle Font-Size="Medium" />
          <dayoverstyle font-size="Medium" />
          <TitleStyle Font-Size="Medium" />
          <HeaderStyle Font-Size="Medium" />
          <fastnavigationstyle font-size="Medium" height="200px" width="200px" />

        </calendar>
        <dateinput font-size="Medium" />
        <datepopupbutton font-size="Medium" />
      </radCln:RadDatePicker>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6 col-12">
    </div>
    <div class="col-md-6 col-12">
      <div class="form-group text-left">
             <asp:Button ID="btn_Save" runat="server" OnClick="btn_Save_Click" Text="حفظ"
          CssClass="btn btn-danger myButton  text-center" />
          &nbsp;
        <asp:Button ID="btn_Edit" runat="server" OnClick="btn_Edit_Click" Text="تعديل"
          CssClass="btn btn-warning myButton  text-center" CausesValidation="False" />
        &nbsp;
        <asp:Button ID="btn_Call" runat="server" Text="مكالمة" OnClick="btn_Call_Click"
          CssClass="btn btn-primary myButton  text-center" CausesValidation="False" />
        &nbsp;
        <asp:Button ID="btn_Fav" runat="server" Text=" مكان مفضل " OnClick="btn_Fav_Click"
          CssClass="btn btn-success myButton  text-center" CausesValidation="False" />
        &nbsp;
     
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-12">
      <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
        DeleteCommand="DELETE FROM [VolunteerHistory] WHERE [ID] = @ID"
        InsertCommand="INSERT INTO [VolunteerHistory] ([ID], [Volunteer_ID], [FavPlace_ID], [DonationDate], [Notes], [Status]) VALUES (@ID, @Volunteer_ID, @FavPlace_ID, @DonationDate, @Notes, @Status)"
        SelectCommand="SELECT        dbo.Volunteer.Name, dbo.VolunteerHistory.ID, dbo.VolunteerHistory.Volunteer_ID, dbo.VolunteerHistory.Place_ID, dbo.VolunteerHistory.DonationDate, dbo.VolunteerHistory.Notes, dbo.VolunteerHistory.Status, 
                     dbo.DonationPlaces.DonationPlaceID, dbo.DonationPlaces.DonationPlaceName, dbo.DonationPlaceType.DonationPlaceTypeName
FROM            dbo.VolunteerHistory INNER JOIN
                     dbo.Volunteer ON dbo.VolunteerHistory.Volunteer_ID = dbo.Volunteer.V_ID INNER JOIN
                     dbo.DonationPlaces ON dbo.VolunteerHistory.Place_ID = dbo.DonationPlaces.DonationPlaceID INNER JOIN
                     dbo.DonationPlaceType ON dbo.DonationPlaces.DonationPlaceTypeID_FK = dbo.DonationPlaceType.DonationPlaceTypeID
WHERE        (dbo.VolunteerHistory.Volunteer_ID = @Volunteer_ID)
                                          "
        UpdateCommand="UPDATE [VolunteerHistory] SET [Volunteer_ID] = @Volunteer_ID, [FavPlace_ID] = @FavPlace_ID, [DonationDate] = @DonationDate, [Notes] = @Notes, [Status] = @Status WHERE [ID] = @ID">
        <DeleteParameters>
          <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>

          <asp:QueryStringParameter QueryStringField="ID" Name="Volunteer_ID" Type="Int32" />

        </SelectParameters>
        <UpdateParameters>
          <asp:Parameter Name="Volunteer_ID" Type="Int32" />
          <asp:Parameter Name="FavPlace_ID" Type="Int32" />
          <asp:Parameter DbType="Date" Name="DonationDate" />
          <asp:Parameter Name="Notes" Type="String" />
          <asp:Parameter Name="Status" Type="String" />
          <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
      </asp:SqlDataSource>
      <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
        DataSourceID="SqlDataSource1" GridLines="None" EmptyDataText="There are no data records to display."
        ForeColor="#333333" Width="70%" onrowcommand="GV_Acontract_RowCommand" onrowdatabound="GridView1_RowDataBound">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7CDCD" Height="25px" Wrap="False" HorizontalAlign="Center" />
        <Columns>

          <%--  <asp:BoundField DataField="FavID" HeaderText="FavID" ReadOnly="True" 
                        SortExpression="FavID" />--%>

          <asp:BoundField DataField="Name" HeaderText="اسم المتبرع" SortExpression="Name" />
          <asp:BoundField DataField="DonationPlaceTypeName" HeaderText="نوع المكان"
            SortExpression="DonationPlaceTypeName" />
          <asp:BoundField DataField="DonationPlaceName" HeaderText="مكان التبرع" SortExpression="DonationPlaceName" />
          <%--<asp:TemplateField HeaderText="تاريخ التبرع"  
                        >
                        <ItemTemplate>
                        <%# Volunteers_History.CallDate(Convert.ToDateTime(Eval("DonationDate")))%>


          </ItemTemplate>

          </asp:TemplateField>--%>
          <asp:BoundField HeaderText="تاريخ التبرع" DataField="DonationDate" DataFormatString="{0:dd/MM/yyyy}" />
          <asp:TemplateField HeaderText="حالة التبرع">
            <ItemTemplate>
              <%# Volunteers_History.State(Eval("Status"))%>


            </ItemTemplate>

          </asp:TemplateField>
          <asp:BoundField DataField="Notes" HeaderText="ملاحظات" SortExpression="Notes" />



          <%--<asp:CommandField CancelText="الغاء" EditText="تعديل" CausesValidation="false" HeaderText="تعديل" 
                                    ShowEditButton="True" UpdateText="حفظ">
                                    <ControlStyle Font-Underline="True" ForeColor="#B01C26" />
                                </asp:CommandField>--%>
          <asp:TemplateField HeaderText="حذف التبرع">
            <ItemTemplate>
              <asp:LinkButton ID="lnkbtn_del" CommandArgument='<%# Eval("ID") %>' CommandName="Delete"
                CausesValidation="false" ForeColor="#B01C26" runat="server">
                حذف التبرع</asp:LinkButton>
            </ItemTemplate>
          </asp:TemplateField>
        </Columns>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

        <AlternatingRowStyle BackColor="White" />
        <HeaderStyle BackColor="#B01C26" Font-Bold="True" ForeColor="White" Height="30px" />

      </asp:GridView>
    </div>
  </div>
  <script src="../Scripts/jquery.min.js" type="text/javascript"></script>
  <script src="../Scripts/chosen.jquery.js" type="text/javascript"></script>
  <script
    type="text/javascript">		    $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
</asp:Content>