<%@ Page Title="أضافة نوع الأماكن المفضلة للتبرع" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="FavortitTypes_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

  <div class="row">
    <div class="col-12">
      <h1 class="style5 text-center">
        نوع الأماكن المفضلة للتبرع
      </h1>
    </div>
  </div>
  <br>
  <div class="row">
    <div class=" col-md-6 col-12">
      <div class="form-group">
        <label for="">نوع المكان المفضل</label>
        <asp:TextBox ID="txt_type" runat="server" class="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_type"
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
    <div class="col-md-6 col-12">
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TypeID"
        DataSourceID="SqlDataSource1" GridLines="None" RowStyle-HorizontalAlign="Center"
        EmptyDataText="There are no data records to display." Width="100%" onrowdatabound="GridView1_RowDataBound">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7CDCD" Height="25px" Font-Bold="true" />
        <Columns>


          <%--  <asp:BoundField DataField="TypeID" HeaderText="TypeID" ReadOnly="True" 
                          SortExpression="TypeID" />--%>
          <asp:BoundField DataField="Type" HeaderText="نوع المكان" SortExpression="Type" />
          <asp:CommandField CancelText="الغاء" EditText="تعديل" CausesValidation="false" HeaderText="تعديل"
            ShowEditButton="True" UpdateText="حفظ">
            <ControlStyle Font-Underline="True" ForeColor="#B01C26" />
          </asp:CommandField>
          <asp:TemplateField HeaderText="حذف">
            <ItemTemplate>
              <asp:LinkButton ID="lnkbtn_del" CommandArgument='<%# Eval("TypeID") %>' CommandName="Delete"
                CausesValidation="false" ForeColor="#B01C26" runat="server">
                حذف</asp:LinkButton>
            </ItemTemplate>
          </asp:TemplateField>

        </Columns>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#B01C26" Font-Bold="True" HorizontalAlign="Center" ForeColor="White" Height="30px" />
        <AlternatingRowStyle BackColor="White" />
      </asp:GridView>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
        DeleteCommand="DELETE FROM [FavoriteTypes] WHERE [TypeID] = @TypeID"
        InsertCommand="INSERT INTO [FavoriteTypes] ([Type]) VALUES (@Type)"
        SelectCommand="SELECT [TypeID], [Type] FROM [FavoriteTypes]"
        UpdateCommand="UPDATE [FavoriteTypes] SET [Type] = @Type WHERE [TypeID] = @TypeID">
        <DeleteParameters>
          <asp:Parameter Name="TypeID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
          <asp:Parameter Name="Type" Type="String" />
        </InsertParameters>
        <UpdateParameters>
          <asp:Parameter Name="Type" Type="String" />
          <asp:Parameter Name="TypeID" Type="Int32" />
        </UpdateParameters>
      </asp:SqlDataSource>
    </div>
  </div>
  <br><br>

</asp:Content>