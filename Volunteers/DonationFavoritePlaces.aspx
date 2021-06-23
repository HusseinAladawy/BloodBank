<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DonationFavoritePlaces.aspx.cs" Inherits="Volunteers_DonationFavoritePlaces" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div class="row">
    <div class="col-12">
      <h1 class="style5 text-center">
        الأماكن المفضلة للمتبرع
        (<asp:Label ID="lbl_VID" runat="server" Font-Size="X-Large" ForeColor="Blue"></asp:Label>)&nbsp;<asp:Label
          ID="lbl_Name" runat="server" Font-Size="X-Large" ForeColor="Black"></asp:Label>
      </h1>
    </div>
  </div>
  <br>
  <div class="row">
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22'>نوع المكان :</label>
        <asp:DropDownList ID="ddl_Type" cssClass='form-control' runat="server" DataSourceID="sds_Type"
          DataTextField="Type" DataValueField="TypeID" ondatabound="ddl_Type_DataBound" AutoPostBack="True">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddl_Type"
          ErrorMessage="*" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
        <asp:SqlDataSource ID="sds_Type" runat="server"
          ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
          SelectCommand="SELECT [TypeID], [Type] FROM dbo.[FavoriteTypes]">
        </asp:SqlDataSource>
      </div>
    </div>
    <div class="col-md-6 col-12">
      <label for="" class='font-22'> أسم المكان :</label>
      <asp:CheckBoxList ID="chkl_Places" runat="server" DataSourceID="sds_Place" DataTextField="FavPlace"
        DataValueField="PlaceID" RepeatColumns="3" RepeatDirection="Horizontal" ForeColor="#3366FF">
      </asp:CheckBoxList>
      <asp:SqlDataSource ID="sds_Place" runat="server"
        ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
        SelectCommand="SELECT [PlaceID], [FavPlace], [FavoriteTypeID] FROM dbo.[FavoritePlaces] WHERE ([FavoriteTypeID] = @FavoriteTypeID)">
        <SelectParameters>
          <asp:ControlParameter ControlID="ddl_Type" Name="FavoriteTypeID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
      </asp:SqlDataSource>
    </div>
  </div>


  <div class="row">

    <div class="col-md-6 col-12 text-left">
      <div class="form-group text-left">
        <asp:Button ID="btn_Save" runat="server" OnClick="btn_Save_Click" Text="حفظ" BorderStyle="Solid"
          Font-Bold="True" Font-Names="Tahoma" CssClass="btn btn-danger myButton w-25 text-center" />
        <asp:Button ID="btn_Edit" runat="server" OnClick="btn_Edit_Click" Text="تعديل" BorderStyle="Solid"
          Font-Bold="True" Font-Names="Tahoma" CssClass="btn btn-warning myButton w-25 text-center"
          CausesValidation="False" />

      </div>
      <div class="form-group text-left">
        <asp:Button ID="btn_Donation" runat="server" Text="تبرع" OnClick="btn_Donation_Click"
          CssClass="btn btn-success myButton w-25 text-center" Width="100px" CausesValidation="False" />
        <asp:Button ID="btn_Call" runat="server" Text="مكالمة" OnClick="btn_Call_Click"
          CssClass="btn btn-primary myButton w-25 text-center" Width="100px" CausesValidation="False" />
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-12">
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" HeaderStyle-Height="30px"
        HeaderStyle-BackColor="#B01C26" HeaderStyle-ForeColor="White" DataKeyNames="ID" DataSourceID="SqlDataSource1"
        GridLines="None" RowStyle-HorizontalAlign="Center" EmptyDataText="There are no data records to display."
        ForeColor="#333333" Width="70%" onrowdatabound="GridView1_RowDataBound1">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7CDCD" Height="25px" />
        <Columns>

          <asp:BoundField DataField="Type" HeaderText="النوع" ReadOnly="True" SortExpression="Type" />

          <asp:BoundField DataField="FavPlace" HeaderText="المكان المفضل" SortExpression="FavPlace" />




          <asp:TemplateField HeaderText="حذف">
            <ItemTemplate>
              <asp:LinkButton ID="lnkbtn_del" CommandArgument='<%# Eval("ID") %>' CommandName="Delete"
                CausesValidation="false" ForeColor="#B01C26" runat="server">
                حذف</asp:LinkButton>
            </ItemTemplate>
          </asp:TemplateField>
        </Columns>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

        <AlternatingRowStyle BackColor="White" />
      </asp:GridView>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
        DeleteCommand="DELETE FROM [VolunteerPlaces] WHERE [ID] = @ID"
        SelectCommand="SELECT     dbo.VolunteerPlaces.ID,dbo.VolunteerPlaces.VolunteerID, dbo.VolunteerPlaces.PlaceID, dbo.Volunteer.Name, dbo.FavoritePlaces.FavPlace, dbo.FavoriteTypes.Type
                          FROM         dbo.VolunteerPlaces INNER JOIN
                    dbo.Volunteer ON dbo.VolunteerPlaces.VolunteerID = dbo.Volunteer.V_ID INNER JOIN
                    dbo.FavoritePlaces ON dbo.VolunteerPlaces.PlaceID = dbo.FavoritePlaces.PlaceID INNER JOIN
                    dbo.FavoriteTypes ON dbo.FavoritePlaces.FavoriteTypeID = dbo.FavoriteTypes.TypeID where [VolunteerID] = @VolunteerID "
        UpdateCommand="UPDATE [VolunteerPlaces] SET [VolunteerID] = @VolunteerID, [PlaceID] = @PlaceID WHERE [ID] = @ID">
        <DeleteParameters>
          <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
          <asp:QueryStringParameter Name="VolunteerID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>

      </asp:SqlDataSource>
    </div>
  </div>
</asp:Content>