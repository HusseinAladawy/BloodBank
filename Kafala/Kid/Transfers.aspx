<%@ Page Title="نقل الدم" Language="C#" MasterPageFile="~/Kafala/MasterPage.master" AutoEventWireup="true" CodeFile="Transfers.aspx.cs" Inherits="Kafala_Kid_Transfers" %>

<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .style1 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <table dir="rtl" align="right" width="100%">
        <tr>
            <td colspan="8"
                style="font-family: tahoma; font-size: x-large; color: #991821; font-weight: 100; text-align: center;">&nbsp;
                            &nbsp;
                            النقل &nbsp;
                            <asp:Label ID="lbl_Name" runat="server" Font-Size="X-Large" ForeColor="Black"></asp:Label>
                &nbsp;(<asp:Label ID="lbl_KID" runat="server" Font-Size="X-Large" ForeColor="Blue"></asp:Label>)
            </td>
        </tr>

        <tr>
            <td width="20%" style="text-align: center">&nbsp;</td>
            <td colspan="4">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td width="20%" style="text-align: center">تاريخ النقل</td>
            <td colspan="5">


                <radCln:RadDatePicker ID="dt_TransferDate" runat="server" Culture="ar-EG" Font-Size="Medium">
                    <calendar font-size="Medium" enableviewselector="True">
                    <DayStyle Font-Size="Medium" Font-Strikeout="False" />
                    <WeekendDayStyle Font-Size="Large" />
                    <calendartablestyle font-size="Medium" />
                    <OtherMonthDayStyle Font-Size="Medium" />
                    <outofrangedaystyle font-size="Medium" />
                    <disableddaystyle font-size="Medium" />
                    <SelectedDayStyle Font-Size="Medium" />
                    <dayoverstyle font-size="Medium" />
                    <TitleStyle Font-Size="Medium" />
                    <HeaderStyle Font-Size="Medium" />
                    <fastnavigationstyle font-size="Large" height="200px" width="200px" />
                    
                </calendar>
                    <dateinput font-size="Large" />
                    <datepopupbutton font-size="Large" />
                </radCln:RadDatePicker>


                <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="dt_TransferDate" ErrorMessage="*" ForeColor="Red" MaximumValue="01/01/2070" MinimumValue="01/01/1981" SetFocusOnError="True" Type="Date"></asp:RangeValidator>


            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="style1">المستشفى</td>
            <td colspan="5">



                <asp:DropDownList ID="ddl_Hospital" runat="server" class="chzn-select" DataSourceID="sds_Hospital" DataTextField="HospitalName"
                    DataValueField="Hospital_ID" OnDataBound="ddl_Hospital_DataBound">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sds_Hospital" runat="server" ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>" SelectCommand="SELECT [Hospital_ID], [HospitalName] FROM [Hospital]"></asp:SqlDataSource>
            </td>
            <td rowspan="2">&nbsp;</td>
            <td rowspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td class="style1">V_ID</td>
            <td colspan="5">


                <asp:TextBox ID="txt_V_ID" runat="server" AutoPostBack="True" OnTextChanged="txt_V_ID_TextChanged"></asp:TextBox>


                <asp:HyperLink ID="lnk_Mobile" runat="server" Font-Names="Tahoma" ForeColor="Red" Visible="False"></asp:HyperLink>


            </td>
        </tr>
        <%-- <tr>
                        <td class="style1" >
                            حالة التبرع</td>
                        <td colspan="5" >
                <asp:DropDownList ID="ddl_DonationStatus" runat="server" class="chzn-select">
                    <asp:ListItem Value="0">اختر</asp:ListItem>
                    <asp:ListItem Value="1">مقبول</asp:ListItem>
                    <asp:ListItem Value="2">مؤجل</asp:ListItem>
                    <asp:ListItem Value="3">مرفوض</asp:ListItem>
                     <asp:ListItem Value="4">هروب</asp:ListItem>
                    <asp:ListItem Value="5">مشتقات</asp:ListItem>
                </asp:DropDownList>
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ErrorMessage="*" ForeColor="Red" InitialValue="0" 
                    ControlToValidate="ddl_DonationStatus"></asp:RequiredFieldValidator>
               
                  
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>--%>
        <tr>
            <td class="style1">ظروف الطفل</td>
            <td colspan="5">
                <asp:TextBox ID="txt_Notes" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>&nbsp;
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="style1">النقل القادم</td>
            <td>
                <radCln:RadDatePicker ID="dt_Upcoming_Transfer" runat="server" Culture="ar-EG" />

            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="style1">&nbsp;</td>
            <td colspan="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
            <td colspan="5">
                <asp:Button ID="btn_Save" runat="server" OnClick="btn_Save_Click" Text="حفظ" BorderStyle="Solid"
                    Font-Bold="True" Font-Names="Tahoma" Height="24px" Width="59px" />
            </td>
            <td>&nbsp;
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="5">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: left">
                <asp:Button ID="btn_Call" runat="server" OnClick="btn_Call_Click" Text="مكالمات" BorderStyle="Solid"
                    Font-Bold="True" Font-Names="Tahoma" Height="24px" Width="59px" CausesValidation="False" />
            </td>
            <td colspan="5" style="direction: ltr">
                <asp:Button ID="btn_Help" runat="server" OnClick="btn_Help_Click" Text="مساعدات" BorderStyle="Solid"
                    Font-Bold="True" Font-Names="Tahoma" Height="24px" Width="59px" CausesValidation="False" />
                <asp:Button ID="btn_Edit" runat="server" OnClick="btn_Edit_Click" Text="تعديل" BorderStyle="Solid"
                    Font-Bold="True" Font-Names="Tahoma" Height="24px" Width="59px" CausesValidation="False" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: left">
                &nbsp;</td>
            <td colspan="5">
                &nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="8">

                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
                    DeleteCommand="DELETE FROM [Kid_Transfers] WHERE [T_ID] = @T_ID"
                    InsertCommand="INSERT INTO [Kid_Transfers] ([Hospital_ID_FK], [Kid_ID_FK], [TransferDate], [Notes], [V_ID_FK]) VALUES (@Hospital_ID_FK, @Kid_ID_FK, @TransferDate, @Notes, @V_ID_FK)"
                    SelectCommand="SELECT        dbo.Kid_Transfers.T_ID, dbo.Kid_Transfers.Hospital_ID_FK, dbo.Kid_Transfers.Kid_ID_FK, dbo.Kid_Transfers.TransferDate, dbo.Kid_Transfers.Notes, dbo.Kid_Transfers.V_ID_FK, dbo.Kid.KidName, dbo.Volunteer.Name, 
                         dbo.Volunteer.V_ID, dbo.Hospital.HospitalName
FROM            dbo.Kid_Transfers left outer JOIN
                         dbo.Kid ON dbo.Kid_Transfers.Kid_ID_FK = dbo.Kid.Kid_ID left outer JOIN
                         dbo.Volunteer ON dbo.Kid_Transfers.V_ID_FK = dbo.Volunteer.V_ID left outer JOIN
                         dbo.Hospital ON dbo.Kid.Hospital_ID_FK = dbo.Hospital.Hospital_ID where Kid_ID_FK=@Kid_ID"
                    UpdateCommand="UPDATE [Kid_Transfers] SET [Hospital_ID_FK] = @Hospital_ID_FK, [Kid_ID_FK] = @Kid_ID_FK, [TransferDate] = @TransferDate, [Notes] = @Notes, [V_ID_FK] = @V_ID_FK WHERE [T_ID] = @T_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="T_ID" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>

                        <asp:QueryStringParameter QueryStringField="ID" Name="Kid_ID" Type="Int32" />

                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Hospital_ID_FK" Type="Int32" />
                        <asp:Parameter Name="Kid_ID_FK" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="TransferDate" />
                        <asp:Parameter Name="Notes" Type="String" />
                        <asp:Parameter Name="V_ID_FK" Type="Int32" />
                        <asp:Parameter Name="T_ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="T_ID" DataSourceID="SqlDataSource1" GridLines="None"
                    EmptyDataText="There are no data records to display." ForeColor="#333333"
                    Width="70%" OnRowCommand="GV_Acontract_RowCommand"
                    OnRowDataBound="GridView1_RowDataBound">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7CDCD" Height="25px" Wrap="False"
                        HorizontalAlign="Center" />
                    <Columns>

                        <asp:BoundField DataField="V_ID_FK" HeaderText="V_ID_FK" ReadOnly="True" 
                            SortExpression="V_ID_FK" />

                        <asp:BoundField DataField="Name" HeaderText="اسم المتبرع"
                            SortExpression="Name" />
                        <asp:BoundField DataField="HospitalName" HeaderText="المستشفى " SortExpression="HospitalName" />
                        <asp:BoundField HeaderText="تاريخ النقل" DataField="TransferDate" DataFormatString="{0:dd/MM/yyyy}" />



                        <asp:BoundField DataField="Notes" HeaderText="ملاحظات" SortExpression="Notes" />



                        <%--<asp:CommandField CancelText="الغاء" EditText="تعديل" CausesValidation="false" HeaderText="تعديل" 
                                        ShowEditButton="True" UpdateText="حفظ">
                                        <ControlStyle Font-Underline="True" ForeColor="#B01C26" />
                                    </asp:CommandField>--%>
                        <asp:TemplateField HeaderText="حذف النقل">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtn_del" CommandArgument='<%# Eval("T_ID") %>' CommandName="Delete" CausesValidation="false" ForeColor="#B01C26"
                                    runat="server">
                             حذف النقل</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

                    <AlternatingRowStyle BackColor="White" />
                    <HeaderStyle BackColor="#B01C26" Font-Bold="True" ForeColor="White"
                        Height="30px" />

                </asp:GridView>
            </td>
        </tr>
    </table>
    <script src="../../Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="../../Scripts/chosen.jquery.js" type="text/javascript"></script>
    <script type="text/javascript">		    $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
</asp:Content>
