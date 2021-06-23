<%@ Page Title="" Language="C#" MasterPageFile="~/Kafala/MasterPage.master" AutoEventWireup="true" CodeFile="Help.aspx.cs" Inherits="Kafala_Kid_Help" %>



<%@ Register assembly="RadCalendar.Net2" namespace="Telerik.WebControls" tagprefix="radCln" %>



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
        .auto-style1 {
            text-align: center;
            height: 32px;
        }
        .auto-style2 {
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table dir="rtl" align="right" width="100%">
        <tr>
            <td colspan="4" style="font-family: tahoma; font-size: x-large; color: #991821; font-weight: 100;
                text-align: center;">
                &nbsp;مساعدات &nbsp;
                            <asp:Label ID="lbl_Name" runat="server" Font-Size="X-Large" ForeColor="Black"></asp:Label>
                &nbsp;
                (<asp:Label ID="lbl_KID" runat="server" Font-Size="X-Large" ForeColor="Blue"></asp:Label>)</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                تاريخ المساعدة</td>
            <td>
                


                <radCln:RadDatePicker ID="dt_HelpDate" runat="server" Culture="ar-EG" Font-Size="Medium" >
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


                <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="dt_HelpDate" ErrorMessage="*" ForeColor="Red" MaximumValue="01/01/2070" MinimumValue="01/01/1981" SetFocusOnError="True" Type="Date"></asp:RangeValidator>


            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                نوع المساعدة</td>
            <td>
                <asp:DropDownList ID="ddl_HelpType" runat="server" Width="100px" class="chzn-select" DataSourceID="SqlDataSource2" DataTextField="HelpName" DataValueField="HelpTypeID" OnDataBound="ddl_HelpType_DataBound">
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
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*"
                    ForeColor="Red" InitialValue="0" ControlToValidate="ddl_HelpType" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>" SelectCommand="SELECT [HelpTypeID], [HelpName] FROM [Help_Type]"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                المبلغ</td>
            <td>
                <asp:TextBox ID="txt_Amount" runat="server"></asp:TextBox>
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
                ملاحظات</td>
            <td>
                <asp:TextBox ID="txt_Notes" runat="server" TextMode="MultiLine"></asp:TextBox>

<asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txt_Notes" ID="RegularExpressionValidator3" ValidationExpression = "^[\s\S]{1,100}$"
     runat="server" ErrorMessage="الحد الأقصى للكتابة 100 حرف" ForeColor="Red"></asp:RegularExpressionValidator>

            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">
                &nbsp;
            </td>
            <td class="auto-style2">
                &nbsp;
            </td>
            <td class="auto-style2">
                &nbsp;
            </td>
            <td class="auto-style2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
                </td>
            <td>
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
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: left">
                <asp:Button ID="btn_Edit" runat="server" OnClick="btn_Edit_Click" Text="تعديل" BorderStyle="Solid"
                    Font-Bold="True" Font-Names="Tahoma" Height="24px" Width="59px" CausesValidation="False" />
            &nbsp;</td>
            <td>
                &nbsp;<asp:Button ID="btn_Call" runat="server" OnClick="btn_Call_Click" Text="مكالمات" BorderStyle="Solid"
                    Font-Bold="True" Font-Names="Tahoma" Height="24px" Width="59px" CausesValidation="False" />
            &nbsp;<asp:Button ID="btn_Transfer" runat="server" OnClick="btn_Transfer_Click" Text="نقل" BorderStyle="Solid"
                    Font-Bold="True" Font-Names="Tahoma" Height="24px" Width="59px" CausesValidation="False" />
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
                    DeleteCommand="DELETE FROM [Kid_Help] WHERE [HelpID] = @HelpID" 
                    SelectCommand="SELECT        dbo.Kid_Help.HelpID, dbo.Kid_Help.Kid_ID_FK, dbo.Kid_Help.Amount, dbo.Kid_Help.HelpType_ID_FK, dbo.Kid_Help.Date, dbo.Kid_Help.Notes, dbo.Help_Type.HelpName
                                        FROM            dbo.Kid_Help INNER JOIN
                         dbo.Help_Type ON dbo.Kid_Help.HelpType_ID_FK = dbo.Help_Type.HelpTypeID"
                    UpdateCommand="UPDATE [Kid_Help] SET [Kid_ID_FK] = @Kid_ID_FK, [Amount] = @Amount, [HelpType_ID_FK] = @HelpType_ID_FK, [Date] = @Date WHERE [HelpID] = @HelpID" InsertCommand="INSERT INTO [Kid_Help] ([HelpID], [Kid_ID_FK], [Amount], [HelpType_ID_FK], [Date]) VALUES (@HelpID, @Kid_ID_FK, @Amount, @HelpType_ID_FK, @Date)"
>
                    <DeleteParameters>
                        <asp:Parameter Name="HelpID" Type="Int32" />
                    </DeleteParameters>
                 
                  
                         <InsertParameters>
                             <asp:Parameter Name="HelpID" Type="Int32" />
                             <asp:Parameter Name="Kid_ID_FK" Type="Int32" />
                             <asp:Parameter Name="Amount" Type="Int32" />
                             <asp:Parameter Name="HelpType_ID_FK" Type="Int32" />
                             <asp:Parameter DbType="Date" Name="Date" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Kid_ID_FK" Type="Int32" />
                        <asp:Parameter Name="Amount" Type="Int32" />
                        <asp:Parameter Name="HelpType_ID_FK" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="Date" />
                        <asp:Parameter Name="HelpID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="HelpID"
                    DataSourceID="SqlDataSource1" GridLines="None" EmptyDataText="There are no data records to display."
                    onrowdatabound="GridView1_RowDataBound"
                    ForeColor="#333333" Width="70%" OnRowCommand="GridView2_RowCommand">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7CDCD" Height="25px" Wrap="False" HorizontalAlign="Center" />
                    <Columns>
                          <asp:BoundField DataField="HelpName" HeaderText="نوع المساعدة" ReadOnly="True" 
                            SortExpression="HelpName" />
                       
                        <asp:BoundField DataField="Amount" HeaderText="المبلغ" SortExpression="Amount" />

                             <asp:BoundField HeaderText="تاريخ المساعدة" DataField="Date" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="Notes" HeaderText="ملاحظات" SortExpression="Notes" />
                        <%--<asp:CommandField CancelText="الغاء" EditText="تعديل" CausesValidation="false" HeaderText="تعديل" 
                                        ShowEditButton="True" UpdateText="حفظ">
                                        <ControlStyle Font-Underline="True" ForeColor="#B01C26" />
                                    </asp:CommandField>--%>
                        <asp:TemplateField HeaderText="حذف المساعدة">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtn_del" CommandArgument='<%# Eval("HelpID") %>' CommandName="Delete"
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
    <script src="../../Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="../../Scripts/chosen.jquery.js" type="text/javascript"></script>
    <script type="text/javascript">   $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
</asp:Content>


