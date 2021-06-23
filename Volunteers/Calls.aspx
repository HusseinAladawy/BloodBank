<%@ Page Title="تاريخ وأضافة مكالمات للمتبرع" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Calls.aspx.cs" Inherits="Volunteers_Calls" %>

<%@ Register assembly="RadCalendar.Net2" namespace="Telerik.WebControls" tagprefix="radCln" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  <div class="row">
    <div class="col-12">
      <h1 class="style5 text-center">
        مكالمات لمتبرع&nbsp;(<asp:Label ID="lbl_VID" runat="server" Font-Size="X-Large" ForeColor="Blue">
        </asp:Label>)&nbsp;
        <asp:Label ID="lbl_Name" runat="server" Font-Size="X-Large" ForeColor="Black"></asp:Label>
      </h1>
    </div>
  </div>
  <br>
  <div class="row">
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22 d-block'> تاريخ المكالمة
          :</label>
        <radCln:RadDatePicker ID="dt_CallDate" runat="server" Culture="ar-EG" Font-Size="Medium">
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


        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="dt_CallDate" ErrorMessage="*"
          ForeColor="Red" MaximumValue="01/01/2070" MinimumValue="01/01/1981" SetFocusOnError="True" Type="Date">
        </asp:RangeValidator>


      </div>
    </div>
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="">تعليق المكالمة</label>
        <asp:TextBox ID="txt_Comment" class="form-control" runat="server" TextMode="MultiLine" MaxLength="10">
        </asp:TextBox>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red"
          ControlToValidate="txt_Comment"></asp:RequiredFieldValidator>

        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txt_Comment"
          ID="RegularExpressionValidator3" ValidationExpression="^[\s\S]{1,100}$" runat="server"
          ErrorMessage="الحد الأقصى للكتابة 100 حرف" ForeColor="Red"></asp:RegularExpressionValidator>

      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6 col-12">

    </div>
    <div class="col-md-6 col-12">
      <div class="form-group text-left">
          <asp:Button ID="btn_Save" runat="server" OnClick="btn_Save_Click" Text="حفظ"
          CssClass="btn btn-danger myButton  text-center" />
        <asp:Button ID="btn_Fav" runat="server" Text=" مكان مفضل " OnClick="btn_Fav_Click"
          CssClass="btn btn-success myButton  text-center" CausesValidation="False" />
        
        <asp:Button ID="btn_Edit" runat="server" OnClick="btn_Edit_Click" Text="تعديل"
          CssClass="btn btn-warning myButton  text-center" />
        &nbsp;
        <asp:Button ID="btn_Donation" runat="server" Text=" تبرع" OnClick="btn_Donation_Click"
          CssClass="btn btn-primary myButton  text-center" CausesValidation="False" />
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-12">
      <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
        DeleteCommand="DELETE FROM [VolunteerCalls] WHERE [CallID] = @CallID"
        SelectCommand="SELECT     dbo.VolunteerCalls.CallID, dbo.VolunteerCalls.VolunteerID, dbo.VolunteerCalls.Comments,                                                                              dbo.VolunteerCalls.CallDate, dbo.Volunteer.Name   FROM dbo.VolunteerCalls INNER JOIN
                                                     dbo.Volunteer ON dbo.VolunteerCalls.VolunteerID = dbo.Volunteer.V_ID where dbo.VolunteerCalls.VolunteerID = @VolunteerID">
        <DeleteParameters>
          <asp:Parameter Name="CallID" Type="Int32" />
        </DeleteParameters>


        <SelectParameters>

          <asp:QueryStringParameter QueryStringField="ID" Name="VolunteerID" Type="Int32" />

        </SelectParameters>
      </asp:SqlDataSource>
      <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="CallID"
        DataSourceID="SqlDataSource1" GridLines="None" EmptyDataText="There are no data records to display."
        onrowcommand="GV_Acontract_RowCommand" onrowdatabound="GridView1_RowDataBound" ForeColor="#333333" Width="70%">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7CDCD" Height="25px" Wrap="False" HorizontalAlign="Center" />
        <Columns>
          <%--  <asp:BoundField DataField="FavID" HeaderText="FavID" ReadOnly="True" 
                              SortExpression="FavID" />--%>

          <asp:BoundField DataField="Name" HeaderText="اسم المتبرع" SortExpression="Name" />
          <asp:BoundField HeaderText="تاريخ المكالمة" DataField="CallDate" DataFormatString="{0:dd/MM/yyyy}" />
          <asp:BoundField DataField="Comments" HeaderText="التعليق" SortExpression="Comments" />
          <%--<asp:CommandField CancelText="الغاء" EditText="تعديل" CausesValidation="false" HeaderText="تعديل" 
                                          ShowEditButton="True" UpdateText="حفظ">
                                          <ControlStyle Font-Underline="True" ForeColor="#B01C26" />
                                      </asp:CommandField>--%>
          <asp:TemplateField HeaderText="حذف المكالمة">
            <ItemTemplate>
              <asp:LinkButton ID="lnkbtn_del" CommandArgument='<%# Eval("CallID") %>' CommandName="Delete"
                CausesValidation="false" ForeColor="#B01C26" runat="server">
                حذف</asp:LinkButton>
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
    type="text/javascript">        $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
</asp:Content>