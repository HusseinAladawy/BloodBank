<%@ Page Title="" Language="C#" MasterPageFile="~/Kafala/MasterPage.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Kafala_Kid_Add" %>


<%@ Register assembly="RadCalendar.Net2" namespace="Telerik.WebControls" tagprefix="radCln" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style5 {
            text-align: center;
        }
        .auto-style1 {
            text-align: center;
            font-size: large;
        }
        .auto-style2 {
            width: 83px;
        }
        .auto-style3 {
            text-align: center;
            width: 83px;
        }
        .auto-style4 {
            text-align: right;
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table dir="rtl" align="right">
        <tr>
            <td>&nbsp;
            </td>
            <td colspan="6" style="font-family: tahoma; font-size: x-large; color: #991821; font-weight: 100; text-align: center;">إضافة طفل جديد
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
            <td colspan="2">&nbsp;
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                    ForeColor="Red" ControlToValidate="Txt_Name"></asp:RequiredFieldValidator>
            </td>
            <td class="style4">&nbsp;
            </td>
            <td class="style5">الرقم القومي
            </td>
            <td colspan="3">
                <asp:TextBox ID="Txt_IDNo" runat="server" MaxLength="14"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server"
                    ControlToValidate="Txt_IDNo" Display="Dynamic" ErrorMessage="الرقم القومي يجب أن يكون 14 رقم"
                    Font-Names="Tahoma" Font-Size="11px" ValidationExpression="\d{14}" ForeColor="Red"></asp:RegularExpressionValidator>
                &nbsp;
            </td>
            <td>&nbsp;
            </td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
            <td class="auto-style3">تاريخ الميلاد</td>
            <td>
                


                <radCln:RadDatePicker ID="dt_BirthDate" runat="server" Culture="ar-EG" Font-Size="Medium" >
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


                <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="dt_BirthDate" ErrorMessage="*" ForeColor="Red" MaximumValue="01/01/2070" MinimumValue="01/01/1981" SetFocusOnError="True" Type="Date"></asp:RangeValidator>


            </td>
            <td class="style4">&nbsp;
            </td>
            <td class="style5">النوع
            </td>
            <td colspan="2">
             
                <asp:RadioButtonList ID="rbl_Gender" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">ذكر</asp:ListItem>
                    <asp:ListItem Value="0">أنثى</asp:ListItem>
                </asp:RadioButtonList>   
            </td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"
                ForeColor="Red" ControlToValidate="rbl_Gender" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            <td>&nbsp;
            </td>
            <td>&nbsp;
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style1" colspan="7">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style4" colspan="7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Phenotype&nbsp; </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="style5" colspan="8">
                <table width="50%">
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
                <asp:DropDownList ID="ddl_Kell" runat="server"  Width="80px">
                    <asp:ListItem Value="+">+</asp:ListItem>
                    <asp:ListItem Value="-">-</asp:ListItem>                 
                    <asp:ListItem Value="M">M</asp:ListItem>
                    <asp:ListItem Value="U" Selected="True">غير معروف</asp:ListItem>
                </asp:DropDownList>
                            </td>
                         <td>
                <asp:DropDownList ID="ddl_e" runat="server" Width="80px">
                    <asp:ListItem Value="+">+</asp:ListItem>
                    <asp:ListItem Value="-">-</asp:ListItem>                 
                    <asp:ListItem Value="M">M</asp:ListItem>
                    <asp:ListItem Value="U" Selected="True">غير معروف</asp:ListItem>
                </asp:DropDownList>
                
                             </td>
                         <td>
                <asp:DropDownList ID="ddl_E_" runat="server" Width="80px">
                    <asp:ListItem Value="+">+</asp:ListItem>
                    <asp:ListItem Value="-">-</asp:ListItem>                 
                    <asp:ListItem Value="M">M</asp:ListItem>
                    <asp:ListItem Value="U" Selected="True">غير معروف</asp:ListItem>
                </asp:DropDownList>
                             </td>
                         <td>
                <asp:DropDownList ID="ddl_c" runat="server"  Width="80px">
                    <asp:ListItem Value="+">+</asp:ListItem>
                    <asp:ListItem Value="-">-</asp:ListItem>                 
                    <asp:ListItem Value="M">M</asp:ListItem>
                    <asp:ListItem Value="U" Selected="True">غير معروف</asp:ListItem>
                </asp:DropDownList>
                             </td>
                         <td>
                <asp:DropDownList ID="ddl_C_" runat="server"  Width="80px">
                    <asp:ListItem Value="+">+</asp:ListItem>
                    <asp:ListItem Value="-">-</asp:ListItem>                 
                    <asp:ListItem Value="M">M</asp:ListItem>
                    <asp:ListItem Value="U" Selected="True">غير معروف</asp:ListItem>
                </asp:DropDownList>
                         </td>
                         <td>
                <asp:DropDownList ID="ddl_RH" runat="server"  Width="80px">
                    <asp:ListItem Value="+">+</asp:ListItem>
                    <asp:ListItem Value="-">-</asp:ListItem>
                    <asp:ListItem Value="U" Selected="True">غير معروف</asp:ListItem>
                </asp:DropDownList>
                         </td>
                         <td>
                <asp:DropDownList ID="ddl_ABO" runat="server"  Width="80px">
                    
                    
                    
                    <asp:ListItem Value="O">O</asp:ListItem>
                    <asp:ListItem Value="A">A</asp:ListItem>
                    <asp:ListItem Value="B">B</asp:ListItem>
                    <asp:ListItem Value="AB">AB</asp:ListItem>                            
                    <asp:ListItem Value="U" Selected="True">غير معروف</asp:ListItem>
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
                <asp:Label ID="lbl_Mobile" runat="server" Font-Names="Tahoma"
                    ForeColor="Red" Visible="False"
                    Font-Size="Small"></asp:Label>
                </td>
            <td class="style4">&nbsp;</td>
            <td class="style5">&nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
            <td class="auto-style3">موبيل الطفل&nbsp; 1</td>
            <td>
                <asp:TextBox ID="Txt_Kid_Mobile1" runat="server" 
                    MaxLength="11"></asp:TextBox>
                <asp:Image ID="Image11" runat="server" Height="25px" ImageUrl="~/Kafala/Kid/w.png" Width="25px" ImageAlign="Top" />
                <asp:CheckBox ID="chk_KidMob1" runat="server" />
            </td>
            <td class="style4">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="Txt_Kid_Mobile1"
                    Display="Dynamic" ErrorMessage="رقم الموبيل يجب أن يكون 11 رقم" Font-Names="Tahoma"
                    Font-Size="11px" ValidationExpression="\d{11}" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            <td class="style5">الحالة</td>
            <td>
             
                <asp:RadioButtonList ID="rbl_Status" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">مستفيد</asp:ListItem>
                    <asp:ListItem Value="0">منتظر</asp:ListItem>
                    <asp:ListItem Value="3">معطل</asp:ListItem>
                </asp:RadioButtonList>   </td>
            <td>
             
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*"
                ForeColor="Red" ControlToValidate="rbl_Status" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            <td></td>
            <td colspan="2" rowspan="3">&nbsp;
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style3">موبيل الطفل 2</td>
            <td>
                <asp:TextBox ID="Txt_Kid_Mobile2" runat="server"  
                    MaxLength="11"></asp:TextBox>
                <asp:Image ID="Image10" runat="server" Height="25px" ImageUrl="~/Kafala/Kid/w.png" Width="25px" ImageAlign="Top" />
                <asp:CheckBox ID="chk_KidMob2" runat="server" />
            </td>
            <td class="style4">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server" ControlToValidate="Txt_Kid_Mobile2"
                    Display="Dynamic" ErrorMessage="رقم الموبيل يجب أن يكون 11 رقم" Font-Names="Tahoma"
                    Font-Size="11px" ValidationExpression="\d{11}" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            <td class="style5">سبب التعطيل</td>
            <td colspan="2">
                <asp:TextBox ID="Txt_DeactivationReason" runat="server"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
            <td class="auto-style3">موبيل الأب
                1</td>
            <td>
                <asp:TextBox ID="Txt_Father1_Mobile" runat="server"  
                    MaxLength="11"></asp:TextBox>
                <asp:Image ID="Image9" runat="server" Height="25px" ImageUrl="~/Kafala/Kid/w.png" Width="25px" ImageAlign="Top" />
                <asp:CheckBox ID="chk_FatherMob1" runat="server" />
            </td>
            <td class="style4">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                    ControlToValidate="Txt_Father1_Mobile" Display="Dynamic" ErrorMessage="رقم الموبيل يجب أن يكون 11 رقم"
                    Font-Names="Tahoma" Font-Size="11px" ValidationExpression="\d{11}" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            <td class="style5">وظيفة الأب</td>
            <td colspan="2">
                <asp:DropDownList ID="ddl_FatherJob" runat="server" class="chzn-select" DataSourceID="sds_Jobs"
                    DataTextField="JobName" DataValueField="JobID" OnDataBound="ddl_FatherJob_DataBound">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sds_Jobs" runat="server" ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
                    SelectCommand="SELECT [JobID], [JobName] FROM [Jobs]"></asp:SqlDataSource>
               
            </td>
        </tr>
        <tr>
            <td></td>
            <td class="auto-style3">موبايل الأب&nbsp; 2</td>
            <td>
                <asp:TextBox ID="Txt_Father2_Mobile" runat="server"></asp:TextBox>
                <asp:Image ID="Image4" runat="server" Height="25px" ImageUrl="~/Kafala/Kid/w.png" Width="25px" ImageAlign="Top" />
                <asp:CheckBox ID="chk_FatherMob2" runat="server" />
            </td>
            <td class="style4">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" ControlToValidate="Txt_Father2_Mobile"
                    Display="Dynamic" ErrorMessage="رقم الموبيل يجب أن يكون 11 رقم" Font-Names="Tahoma"
                    Font-Size="11px" ValidationExpression="\d{11}" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            <td style="text-align: center">وظيفة الأم</td>
            <td colspan="2">
                <asp:DropDownList ID="ddl_MotherJob" runat="server" class="chzn-select" DataSourceID="sds_Jobs"
                    DataTextField="JobName" DataValueField="JobID" OnDataBound="ddl_MotherJob_DataBound">
                </asp:DropDownList>
               
            </td>
            <td>&nbsp;
            </td>
            <td>&nbsp;
            </td>
        </tr>
        <%-- <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>--%>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style3">موبايل الأم 1</td>
            <td>
                <asp:TextBox ID="Txt_Mother1_Mobile" runat="server"  
                    MaxLength="11"></asp:TextBox>
                <asp:Image ID="Image7" runat="server" Height="25px" ImageUrl="~/Kafala/Kid/w.png" Width="25px" ImageAlign="Top" />
                <asp:CheckBox ID="chk_MotherMob1" runat="server" />
            </td>
            <td class="style4">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server" ControlToValidate="Txt_Mother1_Mobile"
                    Display="Dynamic" ErrorMessage="رقم الموبيل يجب أن يكون 11 رقم" Font-Names="Tahoma"
                    Font-Size="11px" ValidationExpression="\d{11}" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            <td rowspan="2" style="text-align: center">محل السكن
            </td>
            <td colspan="2">
                
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
            <td class="auto-style3">موبايل الأم 2</td>
            <td>
                <asp:TextBox ID="Txt_Mother2_Mobile" runat="server"></asp:TextBox>
                <asp:Image ID="Image8" runat="server" Height="25px" ImageUrl="~/Kafala/Kid/w.png" Width="25px" ImageAlign="Top" />
                <asp:CheckBox ID="chk_MotherMob2" runat="server" />
            </td>
            <td class="style4">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server" ControlToValidate="Txt_Mother2_Mobile"
                    Display="Dynamic" ErrorMessage="رقم الموبيل يجب أن يكون 11 رقم" Font-Names="Tahoma"
                    Font-Size="11px" ValidationExpression="\d{11}" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            <td colspan="2">
                <asp:DropDownList ID="ddl_Territory" runat="server" class="chzn-select" DataSourceID="sds_Territory"
                    DataTextField="TerritoryName" DataValueField="TerritoryID" OnDataBound="ddl_Territory_DataBound">
                    <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="lbl_Territory" runat="server" Font-Names="Tahoma"
                    ForeColor="Red" Visible="False"
                    Font-Size="Small"></asp:Label>
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
            <td>&nbsp;
            </td>
            <td class="auto-style3">هاتف المنزل
            </td>
            <td>
                <asp:TextBox ID="Txt_Phone" runat="server"></asp:TextBox>
            </td>
            <td class="style4"></td>
            <td class="style5">تفصيل محل السكن</td>
            <td colspan="2">
                <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                    ForeColor="Red" InitialValue="0" ControlToValidate="ddl_Governerate" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                <asp:TextBox ID="Txt_AdressDetails" runat="server" TextMode="MultiLine" Width="224px"></asp:TextBox>
            </td>
            <td>&nbsp;
            </td>
            <td>&nbsp;
            </td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
            <td class="auto-style3">المرض</td>
            <td>
                <asp:DropDownList ID="ddl_Disease" runat="server" class="chzn-select" DataSourceID="sds_Disease" DataTextField="DiseaseName" DataValueField="DiseaseID" OnDataBound="ddl_Disease_DataBound">
                </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*"
                    ForeColor="Red" InitialValue="0" ControlToValidate="ddl_Disease" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="sds_Disease" runat="server" ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>" SelectCommand="SELECT [DiseaseID], [DiseaseName] FROM [Disease]"></asp:SqlDataSource>
            </td>
            <td class="style4">&nbsp;
            </td>
            <td class="style5">المستشفى</td>
            <td colspan="2">
                &nbsp;<asp:DropDownList ID="ddl_Hospital" runat="server" class="chzn-select" DataSourceID="sds_Hospital" DataTextField="HospitalName" DataValueField="Hospital_ID" OnDataBound="ddl_Hospital_DataBound">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*"
                    ForeColor="Red" InitialValue="0" ControlToValidate="ddl_Hospital" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="sds_Hospital" runat="server" ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>" SelectCommand="SELECT [Hospital_ID], [HospitalName] FROM [Hospital]"></asp:SqlDataSource>
            </td>
            <td>&nbsp;
            </td>
            <td>&nbsp;
            </td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
            <td class="auto-style3">تفاصيل المرض</td>
            <td>
                <asp:TextBox ID="Txt_DiseaseDetails" runat="server" TextMode="MultiLine" Width="224px"></asp:TextBox>
            </td>
            <td class="style4">&nbsp;
            </td>
            <td class="style5">التأمين</td>
            <td colspan="2">
             
                <asp:RadioButtonList ID="rbl_Insurance" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="True">نعم</asp:ListItem>
                    <asp:ListItem Value="False">لا</asp:ListItem>
                </asp:RadioButtonList>   
            </td>
            <td width="70px">&nbsp;
            </td>
            <td>&nbsp;
            </td>
        </tr>
        <%-- <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>--%>
        <%-- <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>--%><%-- <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>--%><%-- <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>--%><%-- <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>--%>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style3">ملاحظات</td>
            <td>
                <asp:TextBox ID="Txt_Notes" runat="server" TextMode="MultiLine" Width="224px"></asp:TextBox>
            </td>
            <td class="style4">&nbsp;</td>
            <td class="style5">رقم قرار التأمين</td>
            <td colspan="2">
                <asp:TextBox ID="Txt_InsuranceNo" runat="server"></asp:TextBox>
            </td>
            <td width="70px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style3">معدل نقل الدم</td>
            <td>
                <asp:TextBox ID="Txt_TransferDays" runat="server">14</asp:TextBox>
            &nbsp;بالأيام</td>
            <td class="style4">&nbsp;</td>
            <td class="style5">&nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td width="70px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td class="style4">&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
            <td colspan="2">&nbsp;&nbsp;&nbsp;
            </td>
            <td class="style4">&nbsp;
                <asp:Button ID="btn_Save" runat="server" Text="حفظ" OnClick="btn_Save_Click" CssClass="myButton"
                    Width="66px" />
            </td>
            <td>&nbsp;
            </td>
            <td colspan="2">&nbsp;
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
            </td>
            <td class="style4">&nbsp;
            </td>
            <td>&nbsp;
            </td>
            <td colspan="2">&nbsp;
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
            </td>
            <td class="style4">&nbsp;
            </td>
            <td>&nbsp;
            </td>
            <td colspan="2">&nbsp;
            </td>
            <td>&nbsp;
            </td>
            <td>&nbsp;
            </td>
        </tr>
    </table>
    <script src="../../Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="../../Scripts/chosen.jquery.js" type="text/javascript"></script>
    <script type="text/javascript">        $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
</asp:Content>

