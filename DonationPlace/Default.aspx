<%@ Page Title="أماكن التبرع" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="DonationPlace_Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div class="row">
    <div class="col-12">
      <h1 class="style5 text-center">
        أضافة أماكن التبرع
      </h1>
    </div>
  </div>
  <br>
  <div class="row">
    <div class=" col-md-6 col-12">
      <div class="form-group">
        <label for="">نوع مكان التبرع</label>
        <asp:DropDownList ID="ddl_Type" runat="server" DataSourceID="sds_Type" cssClass="form-control chosen-select"
          DataTextField="DonationPlaceTypeName" DataValueField="DonationPlaceTypeID" AutoPostBack="true"
          ondatabound="ddl_Type_DataBound">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddl_Type"
          ErrorMessage="*" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
        <asp:SqlDataSource ID="sds_Type" runat="server"
          ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
          SelectCommand="SELECT [DonationPlaceTypeID], [DonationPlaceTypeName] FROM [DonationPlaceType]">
        </asp:SqlDataSource>
      </div>
      <div class="form-group">
        <label for="">أسم امكان التبرع</label>
        <asp:TextBox ID="txt_Place" runat="server" class="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddl_Type"
          ErrorMessage="*" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
      </div>

      <div class="float-left">
        <asp:Button ID="btn_Save" runat="server" OnClick="btn_Save_Click" Text="حفظ" CssClass="btn btn-danger" />

      </div>
    </div>
  </div>
  <br>
  <div class="row">
    <div class="col-md-10 col-12">
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DonationPlaceID"
        DataSourceID="SqlDataSource1" GridLines="None" RowStyle-HorizontalAlign="Center"
        EmptyDataText="There are no data records to display." Width="100%" onrowdatabound="GridView1_RowDataBound1">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7CDCD" Height="25px" />
        <Columns>
          <asp:BoundField DataField="DonationPlaceID" HeaderText="كود مكان التبرع " SortExpression="DonationPlaceID" />
          <%--  <asp:BoundField DataField="FavID" HeaderText="FavID" ReadOnly="True" 
                          SortExpression="FavID" />--%>
          <asp:BoundField DataField="DonationPlaceName" HeaderText="مكان التبرع " SortExpression="DonationPlaceName" />

          <asp:TemplateField HeaderText="نوع مكان التبرع">
            <EditItemTemplate>
              <asp:DropDownList ID="dll_Type" runat="server" SelectedValue='<%# Bind("DonationPlaceTypeID_FK") %>'
                ForeColor="Black" DataSourceID="SqlDataSource1" DataTextField="DonationPlaceTypeName"
                DataValueField="DonationPlaceTypeID">
              </asp:DropDownList>


              <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
                SelectCommand="SELECT [DonationPlaceTypeID], [DonationPlaceTypeName] FROM [DonationPlaceType]">
              </asp:SqlDataSource>
            </EditItemTemplate>
            <ItemTemplate>
              <%# Eval("DonationPlaceTypeName")%>
            </ItemTemplate>
          </asp:TemplateField>


          <asp:CommandField CancelText="الغاء" EditText="تعديل" CausesValidation="false" HeaderText="تعديل"
            ShowEditButton="True" UpdateText="حفظ">
            <ControlStyle Font-Underline="True" ForeColor="#B01C26" />
          </asp:CommandField>
          <asp:TemplateField HeaderText="حذف">
            <ItemTemplate>
              <asp:LinkButton ID="lnkbtn_del" CommandArgument='<%# Eval("DonationPlaceID") %>' CommandName="Delete"
                CausesValidation="false" ForeColor="#B01C26" runat="server">
                حذف</asp:LinkButton>
            </ItemTemplate>
          </asp:TemplateField>
        </Columns>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#B01C26" Font-Bold="True" ForeColor="White" Height="30px" />
        <AlternatingRowStyle BackColor="White" />
      </asp:GridView>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
        DeleteCommand="DELETE FROM [DonationPlaces] WHERE [DonationPlaceID] = @DonationPlaceID"
        InsertCommand="INSERT INTO [DonationPlaces] ([DonationPlaceName], [DonationPlaceTypeID_FK], [OLDName]) VALUES (@DonationPlaceName, @DonationPlaceTypeID_FK, @OLDName)"
        SelectCommand="SELECT [DonationPlaceID], [DonationPlaceName], [DonationPlaceTypeID_FK], [OLDName],DonationPlaceTypeName FROM [DonationPlaces]
                  inner join DonationPlaceType on DonationPlaceTypeID_FK =DonationPlaceTypeID
                  
                  "
        UpdateCommand="UPDATE [DonationPlaces] SET [DonationPlaceName] = @DonationPlaceName, [DonationPlaceTypeID_FK] = @DonationPlaceTypeID_FK  WHERE [DonationPlaceID] = @DonationPlaceID">
        <DeleteParameters>
          <asp:Parameter Name="DonationPlaceID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
          <asp:Parameter Name="DonationPlaceName" Type="String" />
          <asp:Parameter Name="DonationPlaceTypeID_FK" Type="Int32" />
          <asp:Parameter Name="OLDName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
          <asp:Parameter Name="DonationPlaceName" Type="String" />
          <asp:Parameter Name="DonationPlaceTypeID_FK" Type="Int32" />

          <asp:Parameter Name="DonationPlaceID" Type="Int32" />
        </UpdateParameters>
      </asp:SqlDataSource>
    </div>
  </div>
  <br><br>

  <script src="../Scripts/jquery.min.js" type="text/javascript"></script>
  <script src="../Scripts/chosen.jquery.js" type="text/javascript"></script>
  <script type="text/javascript">
    $(".chzn-select").chosen();
    $(".chzn-select-deselect").chosen({
      allow_single_deselect: true
    });
  </script>
</asp:Content>