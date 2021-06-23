<%@ Page Title="المحافظات" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Governerate_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div class="row">
    <div class="col-12">
      <h1 class="style5 text-center">
        المحافظات
      </h1>
    </div>
  </div>
  <br>
  <div class="row">
    <div class=" col-md-6 col-12">
      <div class="form-group">
        <label for="">أسم المحافظة</label>
        <asp:TextBox ID="txt_Gov" runat="server" class="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_Gov"
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
    <div class="col-md-6 col-12">
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="GovID"
        DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display." ForeColor="#333333"
        Width="100%" onrowdatabound="GridView1_RowDataBound" GridLines="None">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7CDCD" Height="25px" HorizontalAlign="Center" Font-Bold="true" />
        <Columns>




          <asp:BoundField DataField="GovernerateName" HeaderText="المحافظة" SortExpression="GovernerateName" />

          <asp:CommandField CancelText="الغاء" EditText="تعديل" CausesValidation="false" HeaderText="تعديل"
            ControlStyle-ForeColor="#F7CDCD" ShowEditButton="True" UpdateText="حفظ">
            <ControlStyle Font-Underline="True" ForeColor="#B01C26" />
          </asp:CommandField>
          <asp:TemplateField HeaderText="حذف">
            <ItemTemplate>
              <asp:LinkButton ID="lnkbtn_del" CommandArgument='<%# Eval("GovID") %>' CommandName="Delete"
                CausesValidation="false" ForeColor="#B01C26" runat="server">
                حذف</asp:LinkButton>
            </ItemTemplate>
          </asp:TemplateField>

        </Columns>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#B01C26" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#B01C26" Font-Bold="True" HorizontalAlign="Center" ForeColor="White" Height="30px" />
        <AlternatingRowStyle BackColor="White" />
      </asp:GridView>
      <asp:SqlDataSource ID="SqlDataSource2" runat="server"
        ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
        DeleteCommand="DELETE FROM [Governerates] WHERE [GovID] = @GovID"
        InsertCommand="INSERT INTO [Governerates] ([Governerate]) VALUES (@Governerate)"
        SelectCommand="SELECT [GovID], [GovernerateName] FROM [Governerates]"
        UpdateCommand="UPDATE [Governerates] SET [GovernerateName] = @GovernerateName WHERE [GovID] = @GovID">
        <DeleteParameters>
          <asp:Parameter Name="GovID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
          <asp:Parameter Name="GovernerateName" Type="String" />
          <asp:Parameter Name="GovID" Type="Int32" />
        </UpdateParameters>
      </asp:SqlDataSource>
    </div>
  </div>
  <br><br>
</asp:Content>