<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Deleted.aspx.cs" Inherits="Volunteers_Deleted" %>

<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <table width="100%" dir="rtl">
        <tr>
            <td class="chzn-rtl">اسم الحاذف</td>
            <td class="style1">
                <asp:DropDownList ID="ddl_User" runat="server" DataSourceID="SDS_Users" class="chosen-select"
                    DataTextField="UserName" DataValueField="UserId"
                    OnDataBound="ddl_User_DataBound">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SDS_Users" runat="server"
                    ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
                    SelectCommand="SELECT [UserId], [UserName] FROM [vw_aspnet_Users]"></asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="chzn-rtl">VID</td>
            <td class="style1">
                <asp:TextBox ID="Txt_V_ID" runat="server" placeholder="V_ID"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td class="chzn-rtl">الموبايل</td>
            <td class="style1">



                <asp:TextBox ID="Txt_mobile" runat="server" placeholder="الموبايل"></asp:TextBox>


            </td>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td class="chzn-rtl">من</td>
            <td class="style1">



                <radCln:RadDatePicker ID="dt_From" runat="server" Culture="ar-EG" Font-Size="Medium">
                    <Calendar Font-Size="Medium" EnableViewSelector="True">
                        <DayStyle Font-Size="Medium" Font-Strikeout="False" />
                        <WeekendDayStyle Font-Size="Medium" />
                        <CalendarTableStyle Font-Size="Medium" />
                        <OtherMonthDayStyle Font-Size="Medium" />
                        <OutOfRangeDayStyle Font-Size="Medium" />
                        <DisabledDayStyle Font-Size="Medium" />
                        <SelectedDayStyle Font-Size="Medium" />
                        <DayOverStyle Font-Size="Medium" />
                        <TitleStyle Font-Size="Medium" />
                        <HeaderStyle Font-Size="Medium" />
                        <FastNavigationStyle Font-Size="Medium" Height="200px" Width="200px" />

                    </Calendar>
                    <DateInput Font-Size="Medium" />
                    <DatePopupButton Font-Size="Medium" />
                </radCln:RadDatePicker>


            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="chzn-rtl">الى</td>
            <td class="style1">



                <radCln:RadDatePicker ID="dt_To" runat="server" Culture="ar-EG" Font-Size="Medium">
                    <Calendar Font-Size="Medium" EnableViewSelector="True">
                        <DayStyle Font-Size="Medium" Font-Strikeout="False" />
                        <WeekendDayStyle Font-Size="Medium" />
                        <CalendarTableStyle Font-Size="Medium" />
                        <OtherMonthDayStyle Font-Size="Medium" />
                        <OutOfRangeDayStyle Font-Size="Medium" />
                        <DisabledDayStyle Font-Size="Medium" />
                        <SelectedDayStyle Font-Size="Medium" />
                        <DayOverStyle Font-Size="Medium" />
                        <TitleStyle Font-Size="Medium" />
                        <HeaderStyle Font-Size="Medium" />
                        <FastNavigationStyle Font-Size="Medium" Height="200px" Width="200px" />

                    </Calendar>
                    <DateInput Font-Size="Medium" />
                    <DatePopupButton Font-Size="Medium" />
                </radCln:RadDatePicker>


            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="chzn-rtl">&nbsp;</td>
            <td class="style1">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="style1">&nbsp;</td>
            <td>
                <asp:Button ID="btn_Save" runat="server" Text="بحث" OnClick="btn_Save_Click"
                    CssClass="myButton" Width="66px"
                    meta:resourcekey="btn_SaveResource1" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: right">
                <asp:Label ID="lbl_Report" runat="server" Font-Size="Medium"
                    ForeColor="Black" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="V_ID"
                    AllowPaging="True" PageSize="100" HeaderStyle-Height="30px" BackColor="#B01C26"
                    HeaderStyle-ForeColor="White"
                    Width="100%"
                    EmptyDataText="There are no data records to display."
                    OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" OnRowEditing="GridView1_RowEditing" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7CDCD" Height="25px" HorizontalAlign="Center" />
                    <Columns>

                        <asp:CommandField ShowEditButton="True" EditText="إعادة" CancelText="الغاء" ControlStyle-ForeColor="#B01C26" UpdateText="تأكيد" />

                        <asp:TemplateField HeaderText="V_ID">
                            <ItemTemplate>
                                <%# Eval("V_ID")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--  <asp:BoundField DataField="IDNo" HeaderText="الرقم القومي" SortExpression="IDNo" 
                             />--%>
                        <asp:TemplateField HeaderText="الاسم">
                            <ItemTemplate>
                                <%# Eval("Name") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="الفصيلة">
                            <ItemTemplate>
                                <%# Eval("RH")%><%# Eval("ABO")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="الموبيل" SortExpression="Mobile" ItemStyle-Font-Size="Medium">
                            <ItemTemplate>

                                <asp:Image ID="Image11" runat="server" Height="15px" ImageUrl="~/Kafala/Kid/w.png" Width="15px"
                                    Visible='<%# Convert.ToBoolean( Eval("Mobile1_W")) %>' ImageAlign="Top" />&nbsp;<%# Eval("Mobile1") %><br />
                                <asp:Image ID="Image1" runat="server" Height="15px" ImageUrl="~/Kafala/Kid/w.png" Width="15px"
                                    Visible='<%# Convert.ToBoolean( Eval("Mobile2_W")) %>' ImageAlign="Top" /><%# Eval("Mobile2") %>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <%--      <asp:TemplateField HeaderText="الموبيل" SortExpression="Mobile" ItemStyle-Font-Size="Medium">
                            <ItemTemplate>
                                <%# Eval("Mobile1") %><br />
                                <%# Eval("Mobile2") %>
                            </ItemTemplate>
                            <ItemStyle Font-Size="Medium"></ItemStyle>
                        </asp:TemplateField>--%>

                        <%--   <asp:TemplateField HeaderText="آخر مكالمة">
                            <ItemTemplate>
                                <%# Volunteers_Deleted.lastCall(Convert.ToDateTime(Eval("LastCallDate")))%>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>--%>
                        <%--  <asp:TemplateField HeaderText="النوع">
                            <ItemTemplate>
                                <%# Volunteers_Deleted.Gender(Eval("Gender"))%>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <%-- <asp:TemplateField HeaderText=" آخر تبرع">
                            <ItemTemplate>
                                <%# Volunteers_Deleted.lastCall(Convert.ToDateTime(Eval("LastDonationDate")))%>
                                
                            </ItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>--%>
                        <%-- <asp:BoundField DataField="Gender" HeaderText="النوع" 
                            SortExpression="Gender"  />--%>



                        <%--   <asp:TemplateField HeaderText="تعديل">
                            <ItemTemplate>
                                <a href='Edit.aspx?ID=<%#Eval("V_ID")%>' style="color: #B01C26">تعديل</a>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:BoundField DataField="UserName" HeaderText="اسم الحاذف" SortExpression="UserName" />
                        <asp:TemplateField HeaderText="تاريخ الحذف">
                            <ItemTemplate>
                                <%# Convert.ToDateTime(Eval("ActionDate")).AddHours(10).ToString("tt hh:mm    yyyy/MM/dd ")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="حذف">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtn_del" CommandArgument='<%# Eval("V_ID") %>' CommandName="Delete"
                                    CausesValidation="false" ForeColor="#B01C26" runat="server">
                             حذف</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <%--  <asp:TemplateField HeaderText="إضافة  تبرع">
                            <ItemTemplate>
                                <a href='History.aspx?ID=<%#Eval("V_ID")%>' style="color: #B01C26">تبرع جديد</a>
                            </ItemTemplate>
                        </asp:TemplateField>--%>

                        <asp:TemplateField HeaderText="إضافة مكالمة">
                            <ItemTemplate>
                                <a href='Calls.aspx?ID=<%#Eval("V_ID")%>' style="color: #B01C26">مكالمة</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle ForeColor="White" Height="30px" Wrap="true"></HeaderStyle>
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>


    </table>

    <br />
</asp:Content>

