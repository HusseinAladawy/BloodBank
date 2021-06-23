<%@ Page Title="الأماكن المفضلة للتبرع" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="FavoritePlaces_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div class="row">
    <div class="col-12">
      <h1 class="style5 text-center">
        أضافة الأماكن المفضلة للتبرع
      </h1>
    </div>
  </div>
  <br>
  <div class="row">
    <div class=" col-md-6 col-12">
      <div class="form-group">
        <label for="">نوع المكان</label>
        <asp:DropDownList ID="ddl_Type" runat="server" DataSourceID="sds_Type" class="chzn-select form-control"
          DataTextField="Type" DataValueField="TypeID" AutoPostBack="true" ondatabound="ddl_Type_DataBound">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddl_Type"
          ErrorMessage="*" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
        <asp:SqlDataSource ID="sds_Type" runat="server"
          ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
          SelectCommand="SELECT [TypeID], [Type] FROM [FavoriteTypes]">
        </asp:SqlDataSource>
      </div>
      <div class="form-group">
        <label for="">أسم المكان</label>
        <asp:TextBox ID="txt_Place" runat="server" class="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddl_Type"
          ErrorMessage="*" Display="Dynamic" ForeColor="Red">
        </asp:RequiredFieldValidator>
      </div>
      <div class="float-left">
        <asp:Button ID="btn_Save" runat="server" OnClick="btn_Save_Click" Text="حفظ" CssClass="btn btn-light" />
      </div>
    </div>
  </div>
  <br>
  <div class="row">
    <div class="col-md-8 col-12">
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PlaceID"
        DataSourceID="SqlDataSource1" GridLines="None" RowStyle-HorizontalAlign="Center"
        EmptyDataText="There are no data records to display." Width="100%" onrowdatabound="GridView1_RowDataBound1">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7CDCD" Height="25px" />
        <Columns>
          <asp:BoundField DataField="PlaceID" HeaderText="كود المكان " SortExpression="PlaceID" />
          <%--  <asp:BoundField DataField="FavID" HeaderText="FavID" ReadOnly="True" 
                          SortExpression="FavID" />--%>
          <asp:BoundField DataField="FavPlace" HeaderText="المكان المفضل" SortExpression="FavPlace" />

          <asp:TemplateField HeaderText="النوع">
            <EditItemTemplate>
              <asp:DropDownList ID="dll_Type" runat="server" SelectedValue='<%# Bind("FavoriteTypeID") %>'
                ForeColor="Black" DataSourceID="SqlDataSource1" DataTextField="Type" DataValueField="TypeID">
              </asp:DropDownList>


              <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
                SelectCommand="SELECT [TypeID], [Type] FROM [FavoriteTypes]">
              </asp:SqlDataSource>
            </EditItemTemplate>
            <ItemTemplate>
              <%# Eval("Type")%>
            </ItemTemplate>
          </asp:TemplateField>


          <asp:CommandField CancelText="الغاء" EditText="تعديل" CausesValidation="false" HeaderText="تعديل"
            ShowEditButton="True" UpdateText="حفظ">
            <ControlStyle Font-Underline="True" ForeColor="#B01C26" />
          </asp:CommandField>
          <asp:TemplateField HeaderText="حذف">
            <ItemTemplate>
              <asp:LinkButton ID="lnkbtn_del" CommandArgument='<%# Eval("PlaceID") %>' CommandName="Delete"
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
        DeleteCommand="DELETE FROM [FavoritePlaces] WHERE [PlaceID] = @PlaceID"
        InsertCommand="INSERT INTO [FavoritePlaces] ([FavPlace], [FavoriteTypeID]) VALUES (@FavPlace, @FavoriteTypeID)"
        SelectCommand="SELECT     dbo.FavoritePlaces.PlaceID, dbo.FavoritePlaces.FavPlace, dbo.FavoritePlaces.FavoriteTypeID, dbo.FavoriteTypes.Type
                                  FROM         dbo.FavoritePlaces INNER JOIN
                    dbo.FavoriteTypes ON dbo.FavoritePlaces.FavoriteTypeID = dbo.FavoriteTypes.TypeID where FavoriteTypeID =@TypeID"
        UpdateCommand="UPDATE [FavoritePlaces] SET [FavPlace] = @FavPlace, [FavoriteTypeID] = @FavoriteTypeID WHERE [PlaceID] = @PlaceID">
        <DeleteParameters>
          <asp:Parameter Name="PlaceID" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
          <asp:ControlParameter ControlID="ddl_Type" PropertyName="SelectedValue" Name="TypeID" />
        </SelectParameters>
        <UpdateParameters>
          <asp:Parameter Name="FavPlace" Type="String" />
          <asp:Parameter Name="FavoriteTypeID" Type="Int32" />
          <asp:Parameter Name="PlaceID" Type="Int32" />
        </UpdateParameters>
      </asp:SqlDataSource>
    </div>
  </div>
  <br><br>

  <script src="../Scripts/jquery.min.js" type="text/javascript"></script>
  <script src="../Scripts/chosen.jquery.js" type="text/javascript"></script>
  <script
    type="text/javascript">		    $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
</asp:Content>