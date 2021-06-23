<%@ Page Title="مكالمات الطفل" Language="C#" MasterPageFile="~/Kafala/MasterPage.master" AutoEventWireup="true" CodeFile="Calls.aspx.cs" Inherits="Kafala_Kid_Calls" %>


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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table dir="rtl" align="right" width="100%">
        <tr>
            <td colspan="5" style="font-family: tahoma; font-size: x-large; color: #991821; font-weight: 100;
                text-align: center;">
                &nbsp;
                &nbsp;
                المكالمات (<asp:Label ID="lbl_KID" runat="server" Font-Size="X-Large" ForeColor="Blue"></asp:Label>)
                            <asp:Label ID="lbl_Name" runat="server" Font-Size="X-Large" ForeColor="Black"></asp:Label>
                &nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td width="20%" style="text-align: center">
                &nbsp;</td>
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
            <td width="20%" style="text-align: center">
                تاريخ المكالمة
            </td>
            <td>
                
                <radCln:RadDatePicker ID="dt_Calldate" runat="server" Culture="ar-EG" Font-Size="Medium">
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
                &nbsp;<asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="dt_Calldate" ErrorMessage="*" ForeColor="Red" MaximumValue="01/01/2070" MinimumValue="01/01/1981" SetFocusOnError="True" Type="Date"></asp:RangeValidator>


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
            <td class="style1">
                تعليق المكالمة
            </td>
            <td colspan="2">
                <asp:TextBox ID="txt_Comment" runat="server" TextMode="MultiLine"></asp:TextBox>


                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                    ForeColor="Red" ControlToValidate="txt_Comment"></asp:RequiredFieldValidator>


<asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txt_Comment" ID="RegularExpressionValidator3" ValidationExpression = "^[\s\S]{1,100}$"
     runat="server" ErrorMessage="الحد الأقصى للكتابة 100 حرف" ForeColor="Red"></asp:RegularExpressionValidator>

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
            <td style="text-align: left">
                <asp:Button ID="btn_Help" runat="server" OnClick="btn_Help_Click" Text="مساعدات" BorderStyle="Solid"
                    Font-Bold="True" Font-Names="Tahoma" Height="24px" Width="59px" CausesValidation="False" />
                </td>
            <td colspan="2">
                <asp:Button ID="btn_Edit" runat="server" OnClick="btn_Edit_Click" Text="تعديل" BorderStyle="Solid"
                    Font-Bold="True" Font-Names="Tahoma" Height="24px" Width="59px" CausesValidation="False" />
                <asp:Button ID="btn_Transfer" runat="server" OnClick="btn_Transfer_Click" Text="نقل" BorderStyle="Solid"
                    Font-Bold="True" Font-Names="Tahoma" Height="24px" Width="59px" CausesValidation="False" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
                    DeleteCommand="DELETE FROM [Kid_Calls] WHERE [Kid_Call_ID] = @Kid_Call_ID" 
                    SelectCommand="SELECT [Kid_Call_ID], [Kid_ID_FK], [Comment], [Caller_ID_FK], [CallDate] ,   dbo.aspnet_Users.UserName
                            FROM  dbo.Kid_Calls INNER JOIN
                         dbo.aspnet_Users ON dbo.Kid_Calls.Caller_ID_FK = dbo.aspnet_Users.UserId
                   where
                     Kid_ID_FK=@Kid_ID
                    "
                    UpdateCommand="UPDATE [Kid_Calls] SET [Kid_ID_FK] = @Kid_ID_FK, [Comment] = @Comment, [Caller_ID_FK] = @Caller_ID_FK, [CallDate] = @CallDate WHERE [Kid_Call_ID] = @Kid_Call_ID"
>
                    <DeleteParameters>
                        <asp:Parameter Name="Kid_Call_ID" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>

                        <asp:QueryStringParameter QueryStringField="ID" Name="Kid_ID" Type="Int32" />

                    </SelectParameters>
                  
                         <InsertParameters>
                             <asp:Parameter Name="Kid_ID_FK" Type="Int32" />
                             <asp:Parameter Name="Comment" Type="String" />
                             <asp:Parameter Name="Caller_ID_FK" Type="Object" />
                             <asp:Parameter DbType="Date" Name="CallDate" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Kid_ID_FK" Type="Int32" />
                        <asp:Parameter Name="Comment" Type="String" />
                        <asp:Parameter Name="Caller_ID_FK" Type="Object" />
                        <asp:Parameter DbType="Date" Name="CallDate" />
                        <asp:Parameter Name="Kid_Call_ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Kid_Call_ID"
                    DataSourceID="SqlDataSource1" GridLines="None" EmptyDataText="There are no data records to display."
                     onrowcommand="GV_Acontract_RowCommand"   onrowdatabound="GridView1_RowDataBound"
                    ForeColor="#333333" Width="70%">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7CDCD" Height="25px" Wrap="False" HorizontalAlign="Center" />
                    <Columns>
                        <%--  <asp:BoundField DataField="FavID" HeaderText="FavID" ReadOnly="True" 
                            SortExpression="FavID" />--%>
                       
                        <asp:BoundField DataField="UserName" HeaderText="المتصل" SortExpression="UserName" />
                               <asp:BoundField HeaderText="تاريخ المكالمة" DataField="CallDate" DataFormatString="{0:dd/MM/yyyy}" />
                     
                        <asp:BoundField DataField="Comment" HeaderText="التعليق" SortExpression="Comment" />
                       
                                   
                        <asp:TemplateField HeaderText="حذف المكالمة">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtn_del" CommandArgument='<%# Eval("Kid_Call_ID") %>' CommandName="Delete"
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

