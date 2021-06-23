<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="DonationplaceType_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .style1 {
            color: #B01C26;
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="row">
        <div class="col-12">
            <h1 class="style5 text-center">نوع أماكن التبرع
            </h1>
        </div>
    </div>
    <br>
    <div class="row">
        <div class=" col-md-6 col-12">
            <div class="form-group">
                <label for="">أسم مكان التبرع</label>
                <asp:TextBox ID="txt_type" class="form-control" runat="server" Font-Names="Tahoma"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_type"
                    ErrorMessage="*" Display="Dynamic" ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>

            <div class="float-left">
                <asp:Button ID="btn_Save" runat="server" OnClick="btn_Save_Click" Text="حفظ" BorderStyle="Solid"
                    Font-Bold="True" Font-Names="Tahoma" CssClass="btn btn-danger" />
            </div>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-md-6 col-12">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DonationPlaceTypeID"
                DataSourceID="SqlDataSource1" GridLines="None" CssClass="text-center"
                EmptyDataText="There are no data records to display." Width="100%" OnRowDataBound="GridView1_RowDataBound">
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7CDCD" Height="25px" Font-Bold="true" />
                <Columns>
                    <%--  <asp:BoundField DataField="TypeID" HeaderText="TypeID" ReadOnly="True" 
                            SortExpression="TypeID" />--%>
                    <asp:BoundField DataField="DonationPlaceTypeName" HeaderText="نوع المكان" SortExpression="Type" />
                    <asp:CommandField CancelText="الغاء" EditText="تعديل" CausesValidation="false" HeaderText="تعديل"
                        ShowEditButton="True" UpdateText="حفظ">
                        <ControlStyle Font-Underline="True" ForeColor="#B01C26" />
                    </asp:CommandField>
                    <asp:TemplateField HeaderText="حذف">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkbtn_del" CommandArgument='<%# Eval("DonationPlaceTypeID") %>' CommandName="Delete"
                                CausesValidation="false" ForeColor="#B01C26" runat="server">
                حذف</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#B01C26" Font-Bold="True" ForeColor="White" Height="30px" HorizontalAlign="Center" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
                DeleteCommand="DELETE FROM [DonationPlaceType] WHERE [DonationPlaceTypeID] = @DonationPlaceTypeID"
                InsertCommand="INSERT INTO [DonationPlaceType] ([DonationPlaceTypeName]) VALUES (@DonationPlaceTypeName)"
                SelectCommand="SELECT [DonationPlaceTypeID], [DonationPlaceTypeName] FROM [DonationPlaceType]"
                UpdateCommand="UPDATE [DonationPlaceType] SET [DonationPlaceTypeName] = @DonationPlaceTypeName WHERE [DonationPlaceTypeID] = @DonationPlaceTypeID">
                <DeleteParameters>
                    <asp:Parameter Name="DonationPlaceTypeID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="DonationPlaceTypeName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="DonationPlaceTypeName" Type="String" />
                    <asp:Parameter Name="DonationPlaceTypeID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <br>
    <br>
</asp:Content>
