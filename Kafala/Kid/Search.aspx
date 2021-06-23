<%@ Page Title="" Language="C#" MasterPageFile="~/Kafala/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Kafala_Kid_Search" %>
<%@ Register assembly="RadCalendar.Net2" namespace="Telerik.WebControls" tagprefix="radCln" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style5 {
            text-align: center;
        }
        .auto-style2 {
            width: 144px;
        }
        .auto-style3 {
            text-align: center;
            width: 144px;
        }
        .auto-style4 {
            text-align: right;
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table dir="rtl" align="right" width="100%">
        <tr>
            <td>&nbsp;
            </td>
            <td colspan="5" style="font-family: tahoma; font-size: x-large; color: #991821; font-weight: 100; text-align: center;">بحث الأطفال
            </td>
            <td>&nbsp;
            </td>
            <td>&nbsp;
            </td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
            <td class="auto-style2">&nbsp;
            </td>
            <td>&nbsp;
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td class="style4">&nbsp;
            </td>
            <td>&nbsp;
            </td>
            <td>&nbsp;
            </td>
            <td>&nbsp;
            </td>
            <td>&nbsp;
            </td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
            <td class="auto-style3">الاسم
            </td>
            <td>
                <asp:TextBox ID="Txt_Name" runat="server"></asp:TextBox>
                <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="*" ForeColor="Red" InitialValue="0" 
                    ControlToValidate="Txt_Name"></asp:RequiredFieldValidator>--%>
            </td>
            <td class="style4">&nbsp;
            </td>
            <td class="style5">الرقم القومي
            </td>
            <td colspan="2">
                <asp:TextBox ID="Txt_IDNo" runat="server" MaxLength="14"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server"
                    ControlToValidate="Txt_IDNo" Display="Dynamic" ErrorMessage="الرقم القومي يجب أن يكون 14 أرقام"
                    Font-Names="Tahoma" Font-Size="11px" ValidationExpression="\d{14}" ForeColor="Red"></asp:RegularExpressionValidator>
                &nbsp;
            </td>
            <td>&nbsp;
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style3">من تاريخ النقل القادم</td>
            <td>
                <radCln:RadDatePicker ID="dt_BirthDateFrom" Runat="server" Culture="en-US" />
            </td>
            <td class="style4">&nbsp;</td>
            <td class="style5">الى تاريخ النقل القادم</td>
            <td>
             
                <radCln:RadDatePicker ID="dt_BirthDateTo" Runat="server" Culture="en-US" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
            <td class="auto-style3">K_ID</td>
            <td>
                <asp:TextBox ID="Txt_K_ID" runat="server" MaxLength="14"></asp:TextBox>
            </td>
            <td class="style4">&nbsp;
            </td>
            <td class="style5">النوع
            </td>
            <td>
             
                <asp:RadioButtonList ID="rbl_Gender" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">ذكر</asp:ListItem>
                    <asp:ListItem Value="0">أنثى</asp:ListItem>
                    <asp:ListItem value="">الكل</asp:ListItem>
                </asp:RadioButtonList>   
            </td>
            <td>&nbsp;
            </td>
            <td>&nbsp;
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style3">المرض</td>
            <td>
                <asp:DropDownList ID="ddl_Disease" runat="server" class="chzn-select" DataSourceID="sds_Disease" DataTextField="DiseaseName" DataValueField="DiseaseID" OnDataBound="ddl_Disease_DataBound">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sds_Disease" runat="server" ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>" SelectCommand="SELECT [DiseaseID], [DiseaseName] FROM [Disease]"></asp:SqlDataSource>
            </td>
            <td class="style4">&nbsp;</td>
            <td class="style5">المستشفى</td>
            <td>
             
                <asp:DropDownList ID="ddl_Hospital" runat="server" class="chzn-select" DataSourceID="sds_Hospital" DataTextField="HospitalName" DataValueField="Hospital_ID" OnDataBound="ddl_Hospital_DataBound">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sds_Hospital" runat="server" ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>" SelectCommand="SELECT [Hospital_ID], [HospitalName] FROM [Hospital]"></asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style3">التأمين</td>
            <td>
             
                <asp:RadioButtonList ID="rbl_Insurance" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="True">نعم</asp:ListItem>
                    <asp:ListItem Value="False">لا</asp:ListItem>
                </asp:RadioButtonList>   
            </td>
            <td class="style4">&nbsp;</td>
            <td class="style5">الحالة</td>
            <td>
             
                <asp:RadioButtonList ID="rbl_Status" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">مستفيد</asp:ListItem>
                    <asp:ListItem Value="0">منتظر</asp:ListItem>
                    <asp:ListItem Value="3">معطل</asp:ListItem>
                    <asp:ListItem Value="" >الكل</asp:ListItem>
                </asp:RadioButtonList>      
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style4">&nbsp;</td>
            <td rowspan="2" style="text-align: center">محل السكن
            </td>
            <td>
             
                <asp:DropDownList ID="ddl_Governerate" runat="server" class="chzn-select" OnDataBound="ddl_Governerate_DataBound"
                    AutoPostBack="True" DataSourceID="sds_Gov" DataTextField="GovernerateName" DataValueField="GovID">
                    <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource
                        ID="sds_Gov" runat="server" ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
                        SelectCommand="SELECT [GovID], [GovernerateName] FROM [Governerates]"></asp:SqlDataSource>
                     
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style4">&nbsp;</td>
            <td>
             
                <asp:DropDownList ID="ddl_Territory" runat="server" class="chzn-select" DataSourceID="sds_Territory"
                    DataTextField="TerritoryName" DataValueField="TerritoryID" OnDataBound="ddl_Territory_DataBound">
                    <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="sds_Territory" runat="server" ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
                    SelectCommand="SELECT [TerritoryID], [TerritoryName] FROM [Territory] WHERE ([GovernerateID] = @GovernerateID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl_Governerate" Name="GovernerateID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style4" colspan="6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Phenotype &nbsp;&nbsp; </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="style5" colspan="7">
                <table width="50%" align="right">
                    <tr>
                        <td>Kell</td>                        
                        <td>e</td>
                        <td>E</td>
                        <td>c</td>
                        <td>C</td>
                        <td>RH</td>
                        <td>ABO</td>
                    </tr>
                     <tr>
                        <td>
                <asp:DropDownList ID="ddl_Kell" runat="server"  Width="75px">
                      <asp:ListItem Selected="True" Value="0">اختر</asp:ListItem>
                    <asp:ListItem Value="+">+</asp:ListItem>
                    <asp:ListItem Value="-">-</asp:ListItem>                 
                    <asp:ListItem Value="M">M</asp:ListItem>
                    <asp:ListItem Value="U" >غير معروف</asp:ListItem>
                </asp:DropDownList>
                            </td>
                         <td>
                <asp:DropDownList ID="ddl_e" runat="server" Width="75px">
                      <asp:ListItem Selected="True" Value="0">اختر</asp:ListItem>
                    <asp:ListItem Value="+">+</asp:ListItem>
                    <asp:ListItem Value="-">-</asp:ListItem>                 
                    <asp:ListItem Value="M">M</asp:ListItem>
                    <asp:ListItem Value="U" >غير معروف</asp:ListItem>
                </asp:DropDownList>
                
                             </td>
                         <td>
                <asp:DropDownList ID="ddl_E_" runat="server" Width="75px">
                      <asp:ListItem Selected="True" Value="0">اختر</asp:ListItem>
                    <asp:ListItem Value="+">+</asp:ListItem>
                    <asp:ListItem Value="-">-</asp:ListItem>                 
                    <asp:ListItem Value="M">M</asp:ListItem>
                    <asp:ListItem Value="U" >غير معروف</asp:ListItem>
                </asp:DropDownList>
                             </td>
                         <td>
                <asp:DropDownList ID="ddl_c" runat="server"  Width="75px">
                      <asp:ListItem Selected="True" Value="0">اختر</asp:ListItem>
                    <asp:ListItem Value="+">+</asp:ListItem>
                    <asp:ListItem Value="-">-</asp:ListItem>                 
                    <asp:ListItem Value="M">M</asp:ListItem>
                    <asp:ListItem Value="U" >غير معروف</asp:ListItem>
                </asp:DropDownList>
                             </td>
                         <td>
                <asp:DropDownList ID="ddl_C_" runat="server"  Width="80px">
                      <asp:ListItem Selected="True" Value="0">اختر</asp:ListItem>
                    <asp:ListItem Value="+">+</asp:ListItem>
                    <asp:ListItem Value="-">-</asp:ListItem>                 
                    <asp:ListItem Value="M">M</asp:ListItem>
                    <asp:ListItem Value="U" >غير معروف</asp:ListItem>
                </asp:DropDownList>
                         </td>
                         <td>
                <asp:DropDownList ID="ddl_RH" runat="server"  Width="75px">
                      <asp:ListItem Selected="True" Value="0">اختر</asp:ListItem>
                    <asp:ListItem Value="+">+</asp:ListItem>
                    <asp:ListItem Value="-">-</asp:ListItem>
                    <asp:ListItem Value="U">غير معروف</asp:ListItem>
                </asp:DropDownList>
                         </td>
                         <td>
                <asp:DropDownList ID="ddl_ABO" runat="server"  Width="75px">
                    
                    
                      <asp:ListItem Selected="True" Value="0">اختر</asp:ListItem>
                    <asp:ListItem Value="O">O</asp:ListItem>
                    <asp:ListItem Value="A">A</asp:ListItem>
                    <asp:ListItem Value="B">B</asp:ListItem>
                    <asp:ListItem Value="AB">AB</asp:ListItem>                            
                    <asp:ListItem Value="U">غير معروف</asp:ListItem>
                </asp:DropDownList>
                         </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style4">&nbsp;</td>
            <td class="style5">&nbsp;</td>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
            <td class="auto-style3">&nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style5">
                <asp:Button ID="btn_Search" runat="server" Text="بحث" OnClick="btn_Save_Click" CssClass="myButton"
                    Width="66px" />
            </td>
            <td>
             
                &nbsp;</td>
            <td colspan="2">&nbsp;
            </td>
        </tr>
        <%-- <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>--%><%-- <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>--%>
        <%-- <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>--%><%-- <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>--%><%-- <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>--%><%-- <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>--%>
        <tr>
            <td colspan="8">&nbsp;
            &nbsp;
            &nbsp;
            &nbsp;
            &nbsp;
            &nbsp;
            &nbsp;
            &nbsp;
              
                <asp:Label ID="lbl_Report" runat="server" Font-Size="Medium"
                    ForeColor="Black" Visible="False"></asp:Label>
                &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Kid_ID"
                    AllowPaging="true" PageSize="100" HeaderStyle-Height="30px" BackColor="#B01C26"
                    HeaderStyle-ForeColor="White" EmptyDataText="There are no data records to display."
                    Width="100%" OnRowDeleting="GridView1_RowDeleting" OnRowDataBound="GridView1_RowDataBound1"
                    OnPageIndexChanging="GridView1_PageIndexChanging">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7CDCD" Height="25px" HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField DataField="Kid_ID" HeaderText="K_ID" SortExpression="Kid_ID" />
                          <%--<asp:BoundField DataField="IDNo" HeaderText="الرقم القومي" SortExpression="IDNo" 
                             />--%>
                        <asp:BoundField DataField="KidName" HeaderText="الاسم" SortExpression="KidName" meta:resourcekey="BoundFieldResource2">
                            <ItemStyle Width="150px" />
                        </asp:BoundField>
                    <asp:TemplateField HeaderText="PhenoType">
                            <ItemTemplate>
                           <%--  <%#Eval("PhenoType")%>--%>
                                   <table dir="ltr"><tr>
                                       <td><%#Eval("ABO")%></td>
                                       <td><%#Eval("RH")%></td>
                                       <td><%#Eval("C")%></td>
                                       <td><%#Eval("c_")%></td>
                                       <td><%#Eval("E")%></td>
                                       <td><%#Eval("e_")%></td>
                                         <td><%#Eval("Kell")%></td>
                                          </tr></table>
                                     
                               
                            </ItemTemplate>
                        </asp:TemplateField>
                     
                    
                            <asp:BoundField HeaderText="اخر مكالمة" DataField="CD" DataFormatString="{0:dd/MM/yyyy}" />
                         <asp:BoundField HeaderText="تاريخ اخر نقل " DataField="LastDate_Received_Blood" DataFormatString="{0:dd/MM/yyyy}" />
                          <asp:BoundField HeaderText="تاريخ النقل القادم" DataField="NextExpectedBloodNeed" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:TemplateField HeaderText="النوع">
                            <ItemTemplate>
                               <%# Kafala_Kid_Search.Gender(Eval("KidGender"))%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CallPoints" HeaderText="نقاط المكالمات" SortExpression="CallPoints" />
                      <%--  <asp:BoundField DataField="DonationPoints" HeaderText="نقاط التبرع" SortExpression="DonationPoints" />--%>
                        <asp:BoundField HeaderText="تاريخ الميلاد" DataField="BirthDate" DataFormatString="{0:dd/MM/yyyy}" />
                        <%-- <asp:BoundField DataField="Gender" HeaderText="النوع" 
                            SortExpression="Gender"  />--%>
                        <asp:TemplateField HeaderText="تعديل">
                            <ItemTemplate>
                                <a href='Edit.aspx?ID=<%#Eval("Kid_ID")%>' style="color: #B01C26">تعديل</a>
                            </ItemTemplate>
                        </asp:TemplateField>

                 <%--       <asp:TemplateField HeaderText="تبرعات">
                            <ItemTemplate>
                                <a href='../../Volunteers/History.aspx?ID=<%#Eval("Kid_ID")%>' style="color: #B01C26">تبرع جديد</a>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                           <asp:TemplateField HeaderText=" نقل دم">
                            <ItemTemplate>
                                <a href='Transfers.aspx?ID=<%#Eval("Kid_ID")%>' style="color: #B01C26">نقل</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText=" مكالمات">
                            <ItemTemplate>
                                <a href='Calls.aspx?ID=<%#Eval("Kid_ID")%>' style="color: #B01C26">مكالمة</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText=" مساعدات">
                            <ItemTemplate>
                                <a href='Help.aspx?ID=<%#Eval("Kid_ID")%>' style="color: #B01C26">مساعدات</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="حذف ">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtn_del" CommandArgument='<%# Eval("Kid_ID") %>' CommandName="Delete"
                                    CausesValidation="false" ForeColor="#B01C26" runat="server">
                           حذف الطفل</asp:LinkButton>
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

    <script src="../../Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="../../Scripts/chosen.jquery.js" type="text/javascript"></script>
    <script type="text/javascript">        $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
    <br />
       <br />

       <br />
      </asp:Content>

