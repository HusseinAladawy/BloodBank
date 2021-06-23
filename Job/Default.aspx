<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Job_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

  <div class="row">
    <div class="col-12">
      <h1 class="style5 text-center">
        أضافة وظيفة
      </h1>
    </div>
  </div>
  <br>
  <div class="row">
    <div class=" col-md-6 col-12">
      <div class="form-group">
        <label for="">أسم الوظيفة</label>
        <asp:TextBox ID="txt_Job" runat="server" class="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_Job"
          ErrorMessage="*" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
      </div>
      <div class="float-left">
        <asp:Button ID="btn_Save" runat="server" OnClick="btn_Save_Click" Text="حفظ" CssClass="btn btn-danger" />
      </div>
    </div>
  </div>
  <br>
  <div class="row">
    <div class="col-md-6 col-12">
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="JobID"
        DataSourceID="sds_Job" GridLines="None" RowStyle-HorizontalAlign="Center"
        EmptyDataText="There are no data records to display." ForeColor="#333333" Width="100%"
        onrowdatabound="GridView1_RowDataBound">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#F7CDCD" Height="25px" Font-Bold="true"/>
        <Columns>


          <%--  <asp:BoundField DataField="TypeID" HeaderText="TypeID" ReadOnly="True" 
                          SortExpression="TypeID" />--%>
          <asp:BoundField DataField="JobName" HeaderText="الوظيفة" SortExpression="JobName" />
          <asp:CommandField CancelText="الغاء" EditText="تعديل" CausesValidation="false" HeaderText="تعديل"
            ShowEditButton="True" UpdateText="حفظ">
            <ControlStyle Font-Underline="True" ForeColor="#B01C26" />
          </asp:CommandField>
          <asp:TemplateField HeaderText="حذف">
            <ItemTemplate>
              <asp:LinkButton ID="lnkbtn_del" CommandArgument='<%# Eval("JobID") %>' CommandName="Delete"
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

      <asp:SqlDataSource ID="sds_Job" runat="server"
        ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
        DeleteCommand="DELETE FROM [Jobs] WHERE [JobID] = @JobID"
        InsertCommand="INSERT INTO [Jobs] ([JobName]) VALUES (@JobName)"
        SelectCommand="SELECT [JobID], [JobName] FROM [Jobs]"
        UpdateCommand="UPDATE [Jobs] SET [JobName] = @JobName WHERE [JobID] = @JobID">
        <DeleteParameters>
          <asp:Parameter Name="JobID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
          <asp:Parameter Name="JobName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
          <asp:Parameter Name="JobName" Type="String" />
          <asp:Parameter Name="JobID" Type="Int32" />
        </UpdateParameters>
      </asp:SqlDataSource>
    </div>
  </div>
  <br><br>
</asp:Content>