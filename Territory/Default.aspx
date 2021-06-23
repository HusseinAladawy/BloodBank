<%@ Page Title=" المناطق" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Territory_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

  <div class="row">
    <div class="col-12">
      <h1 class="style5 text-center">
        المناطق
      </h1>
    </div>
  </div>
  <br>
  <div class="row">
    <div class=" col-md-6 col-12">
      <div class="form-group">
        <label for="">المحافظة</label>
        <asp:DropDownList ID="ddl_Gov" runat="server" DataSourceID="sds_Gov" class="form-control chosen-select"
          DataTextField="GovernerateName" DataValueField="GovID" ondatabound="ddl_Type_DataBound">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddl_Gov"
          ErrorMessage="*" Display="Dynamic" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
        <asp:SqlDataSource ID="sds_Gov" runat="server"
          ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
          SelectCommand="SELECT [GovID], [GovernerateName] FROM [Governerates]">
        </asp:SqlDataSource>
      </div>
      <div class="form-group">
        <label for="">المنطقة</label>
        <asp:TextBox ID="txt_Territory" runat="server" class="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_Territory"
          ErrorMessage="*" Display="Dynamic" ForeColor="Red">
        </asp:RequiredFieldValidator>
      </div>
      <div class="float-left">
        <asp:Button ID="btn_Save" runat="server" OnClick="btn_Save_Click" Text="حفظ" CssClass="btn btn-danger" />
      </div>
    </div>
  </div>
  <br>
  <div class="row">
    <div class="col-md-8 col-12">
      <asp:SqlDataSource ID="sds_territory" runat="server"
        ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
        DeleteCommand="DELETE FROM [Territory] WHERE [TerritoryID] = @TerritoryID" SelectCommand="SELECT     dbo.Territory.TerritoryID, dbo.Territory.GovernerateID, dbo.Territory.TerritoryName, dbo.Governerates.GovernerateName, dbo.Governerates.GovID
FROM         dbo.Territory INNER JOIN
                    dbo.Governerates ON dbo.Territory.GovernerateID = dbo.Governerates.GovID"
        UpdateCommand="UPDATE [Territory] SET [GovernerateID] = @GovernerateID, [TerritoryName] = @TerritoryName WHERE [TerritoryID] = @TerritoryID">
        <DeleteParameters>
          <asp:Parameter Name="TerritoryID" Type="Int32" />
        </DeleteParameters>

        <UpdateParameters>
          <asp:Parameter Name="GovernerateID" Type="Int32" />
          <asp:Parameter Name="TerritoryName" Type="String" />
          <asp:Parameter Name="TerritoryID" Type="Int32" />
        </UpdateParameters>
      </asp:SqlDataSource>

      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TerritoryID"
        DataSourceID="sds_territory" GridLines="None" EmptyDataText="There are no data records to display."
        ForeColor="#333333" Width="100%" onrowdatabound="GridView1_RowDataBound1">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7CDCD" Height="25px" Wrap="False" HorizontalAlign="Center" Font-Bold="true" />
        <Columns>

          <%--  <asp:BoundField DataField="FavID" HeaderText="FavID" ReadOnly="True" 
                          SortExpression="FavID" />--%>
          <asp:BoundField DataField="TerritoryName" HeaderText="المنطقة" SortExpression="TerritoryName" />

          <asp:TemplateField HeaderText="المحافظة">
            <EditItemTemplate>
              <asp:DropDownList ID="dll_Gov" runat="server" SelectedValue='<%# Bind("GovernerateID") %>'
                ForeColor="Black" DataSourceID="SqlDataSource1" DataTextField="GovernerateName" DataValueField="GovID">
              </asp:DropDownList>


              <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
                SelectCommand="SELECT [GovID], [GovernerateName] FROM [Governerates]">
              </asp:SqlDataSource>
            </EditItemTemplate>
            <ItemTemplate>
              <%# Eval("GovernerateName")%>
            </ItemTemplate>
          </asp:TemplateField>


          <asp:CommandField CancelText="الغاء" EditText="تعديل" CausesValidation="false" HeaderText="تعديل"
            ShowEditButton="True" UpdateText="حفظ">
            <ControlStyle Font-Underline="True" ForeColor="#B01C26" />
          </asp:CommandField>
          <asp:TemplateField HeaderText="حذف">
            <ItemTemplate>
              <asp:LinkButton ID="lnkbtn_del" CommandArgument='<%# Eval("TerritoryID") %>' CommandName="Delete"
                CausesValidation="false" ForeColor="#B01C26" runat="server">
                حذف</asp:LinkButton>
            </ItemTemplate>
          </asp:TemplateField>
        </Columns>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

        <AlternatingRowStyle BackColor="White" />
        <HeaderStyle BackColor="#B01C26" Font-Bold="True" HorizontalAlign="Center" ForeColor="White" Height="30px" />

      </asp:GridView>
    </div>
  </div>
  <br><br>

  
</asp:Content>