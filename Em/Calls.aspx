<%@ Page Title="تاريخ وأضافة مكالمات للمتبرع" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Calls.aspx.cs" Inherits="Volunteers_Calls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
    .style2
    {
        height: 48px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table dir="rtl" align="right" width="100%">
        <tr>
            <td colspan="5" style="font-family: tahoma; font-size: x-large; color: #991821; font-weight: 100;
                text-align: center;">
                &nbsp;
                &nbsp;
                تاريخ وأضافة مكالمات للمتبرع&nbsp;
                            <asp:Label ID="lbl_Name" runat="server" Font-Size="X-Large" ForeColor="Black"></asp:Label>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td width="20%" rowspan="4" style="text-align: center">
                تاريخ المكالمة
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="ddl_DonationDay" runat="server" Width="100px" class="chzn-select">
                    <asp:ListItem Selected="True" Value="0">اختر اليوم</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>26</asp:ListItem>
                    <asp:ListItem>27</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                    <asp:ListItem>29</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>31</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddl_DonationDay" 
                    ErrorMessage="*" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="ddl_DonationMonth" runat="server" Width="100px" class="chzn-select">
                    <asp:ListItem Value="0">اختر الشهر</asp:ListItem>
                   <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="6">6</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                    <asp:ListItem Value="8">8</asp:ListItem>
                    <asp:ListItem Value="9">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                    <asp:ListItem Value="11">11</asp:ListItem>
                    <asp:ListItem Value="12">12</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                    ForeColor="Red" InitialValue="0" ControlToValidate="ddl_DonationMonth"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style2">
                <asp:DropDownList ID="ddl_DonationYear" runat="server" Width="100px" class="chzn-select">
                    <asp:ListItem Value="0" Selected="True">اختر السنة</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
                    ForeColor="Red" InitialValue="0" ControlToValidate="ddl_DonationYear"></asp:RequiredFieldValidator>
            </td>
            <td class="style2">
                &nbsp;
            </td>
            <td class="style2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style1">
                تعليق المكالمة
            </td>
            <td colspan="2">
                <asp:TextBox ID="txt_Comment" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td colspan="2">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td colspan="2">
                <asp:Button ID="btn_Save" runat="server" OnClick="btn_Save_Click" Text="حفظ" BorderStyle="Solid"
                    Font-Bold="True" Font-Names="Tahoma" Height="24px" Width="59px" />
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
                &nbsp;
                <asp:Button ID="btn_Donation" runat="server" Text="إضافة تبرع" 
                    OnClick="btn_Donation_Click" CssClass="myButton"
                    Width="100px" Visible="False" />
            </td>
            <td colspan="2">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
                    DeleteCommand="DELETE FROM [VolunteerCalls] WHERE [CallID] = @CallID" 
                    SelectCommand="SELECT     dbo.VolunteerCalls.CallID, dbo.VolunteerCalls.VolunteerID, dbo.VolunteerCalls.Comments,                                                                              dbo.VolunteerCalls.CallDate, dbo.Volunteer.Name   FROM dbo.VolunteerCalls INNER JOIN
                                                   dbo.Volunteer ON dbo.VolunteerCalls.VolunteerID = dbo.Volunteer.V_ID where dbo.VolunteerCalls.VolunteerID = @VolunteerID"
>
                    <DeleteParameters>
                        <asp:Parameter Name="CallID" Type="Int32" />
                    </DeleteParameters>
                 
                  
                         <SelectParameters>
                                    
                        <asp:QueryStringParameter QueryStringField="ID" Name="VolunteerID" Type="Int32" />
                                  
                        </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="CallID"
                    DataSourceID="SqlDataSource1" GridLines="None" EmptyDataText="There are no data records to display."
                     onrowcommand="GV_Acontract_RowCommand"   onrowdatabound="GridView1_RowDataBound"
                    ForeColor="#333333" Width="70%">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7CDCD" Height="25px" Wrap="False" HorizontalAlign="Center" />
                    <Columns>
                        <%--  <asp:BoundField DataField="FavID" HeaderText="FavID" ReadOnly="True" 
                            SortExpression="FavID" />--%>
                       
                        <asp:BoundField DataField="Name" HeaderText="اسم المتبرع" SortExpression="Name" />
                        <asp:TemplateField HeaderText="تاريخ المكالمة">
                            <ItemTemplate>
                                <%# Volunteers_Calls.CallDate(Convert.ToDateTime(Eval("CallDate")))%>
                            </ItemTemplate>
                        </asp:TemplateField>
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
            </td>
        </tr>
    </table>
    <script src="../Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="../Scripts/chosen.jquery.js" type="text/javascript"></script>
    <script type="text/javascript">        $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
</asp:Content>
