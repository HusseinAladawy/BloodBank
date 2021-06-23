<%@ Page Title="إلى إكسل" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="ExportCallsToExcel.aspx.cs" Inherits="ExportCallsToExcel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1 {
            height: 20px;
        }

        .style2 {
            height: 24px;
        }

        .style5 {
            height: 20px;
            color: #991821;
            font-size: x-large;
        }

        .style6 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table dir="rtl" align="right" width="100%">
        <tr>
            <td class="style5" colspan="6" style="text-align: center" >
                إلى إكسل</td>
            <td class="style1" style="text-align: center" >
                </td>
            <td class="style1" style="text-align: center" >
                </td>
        </tr>
        <tr>
            <td colspan="2" >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td colspan="2" >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
        </tr>
 <tr>
            <td class="style6" colspan="2" >
                </td>
            <td class="style6" >
                </td>
            <td class="style6" >
                </td>
            <td colspan="2" class="style6" >
                </td>
            <td class="style6" >
                </td>
            <td class="style6" >
                </td>
        </tr>
        <tr>
            <td class="style6" width="15%" colspan="2" >
                نوع البيانات </td>
            <td width="20%" >
               
                  
              
                <asp:RadioButtonList ID="rbl_Reserved" runat="server">
                    <asp:ListItem Value="1" >محجوز</asp:ListItem>
                    <asp:ListItem Selected="True" Value="0">غير محجوز</asp:ListItem>
                    <asp:ListItem Value="">الكل</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td width="200px" class="style6" >
                حالة المتبرع</td>
            <td colspan="2" >
               
                  
              
                <asp:RadioButtonList ID="rbl_Active" runat="server">
                    <asp:ListItem Selected="True" Value="1">فعال</asp:ListItem>
                    <asp:ListItem Value="0">غير فعال</asp:ListItem>
                    <asp:ListItem Value="2">الكل</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" width="15%" colspan="2" >
                الاسم </td>
            <td width="20%" >
                <asp:TextBox ID="Txt_Name" runat="server" meta:resourcekey="Txt_NameResource1" 
                  ></asp:TextBox>
                <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="*" ForeColor="Red" InitialValue="0" 
                    ControlToValidate="Txt_Name"></asp:RequiredFieldValidator>--%>
            </td>
            <td width="200px" class="style6" >
                الرقم القومي</td>
            <td colspan="2" >
                <asp:TextBox ID="Txt_IDNo" runat="server" 
                    ></asp:TextBox>
            </td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" colspan="2">
                سنة الميلاد</td>
            <td >
                <asp:DropDownList ID="ddl_BirthYear" runat="server" class="chzn-select"
                   >
                <asp:ListItem  value="0" Selected="True" >اختر</asp:ListItem >
                </asp:DropDownList>
               
            </td>
            <td width="200px" class="style6" >
                الفرع </td>
            <td colspan="2" >
                <asp:DropDownList ID="ddl_branch" runat="server" DataSourceID="sds_Branch" class="chzn-select"
                    DataTextField="BranchName" DataValueField="BranchID" 
                    ondatabound="ddl_branch_DataBound">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sds_Branch" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>" 
                    SelectCommand="SELECT [BranchID], [BranchName] FROM [Branch]">
                </asp:SqlDataSource>
            </td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" colspan="2">
                الفصيلة</td>
            <td >
             
                    <asp:DropDownList ID="ddl_BloodType" runat="server" meta:resourcekey="ddl_BloodTypeResource1" class="chzn-select"
                      >
                  <asp:ListItem  value="0" Selected="True">اختر</asp:ListItem >
                          <asp:ListItem Value="1">O+</asp:ListItem>
                    <asp:ListItem Value="2">A+</asp:ListItem>
                    <asp:ListItem Value="3">B+</asp:ListItem>
                    <asp:ListItem Value="4">AB+</asp:ListItem>
                    <asp:ListItem Value="5">O-</asp:ListItem>
                    <asp:ListItem Value="6">A-</asp:ListItem>
                    <asp:ListItem Value="7">B-</asp:ListItem>
                    <asp:ListItem Value="8">AB-</asp:ListItem>
                         <asp:ListItem Value="9">غير معروف</asp:ListItem>


                </asp:DropDownList>
               
                  
            </td>
            <td width="200px" class="style6" >
                الجنس</td>
            <td colspan="2" >
                <asp:RadioButtonList ID="rbl_Gender" runat="server" 
                    RepeatDirection="Horizontal" >
                  <asp:ListItem Value="1" >ذكر</asp:ListItem>
                    <asp:ListItem Value="0" >أنثى</asp:ListItem>
                    <asp:ListItem>غير محدد</asp:ListItem>
                </asp:RadioButtonList>
               
                  
            </td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
        </tr>
        
        <tr>
            <td class="style6" colspan="2" >
                موبيل </td>
            <td  >
                <asp:TextBox ID="Txt_Mobile1" runat="server"  
                    ></asp:TextBox>
            </td>
            <td width="200px" class="style6"  >
                 V_ID</td>
            <td colspan="2"  >
                <asp:TextBox ID="Txt_V_ID" runat="server" 
                    ></asp:TextBox>
                </td>
            <td  >
                &nbsp;</td>
            <td  >
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" width="20%" colspan="2" >
                الشبكة</td>
            <td  >
                <asp:DropDownList ID="ddl_MobileNetwork1" runat="server" class="chzn-select"
                    >
                    <asp:ListItem Selected="True" Value="3" >أختر </asp:ListItem>
                    <asp:ListItem Value="0" meta:resourcekey="ListItemResource19">فودافون</asp:ListItem>
                    <asp:ListItem Value="1" meta:resourcekey="ListItemResource20">إتصالات</asp:ListItem>
                    <asp:ListItem Value="2" meta:resourcekey="ListItemResource21">موبينيل</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td width="200px" class="style6"  >
                الإيميل </td>
            <td colspan="2"  >
                <asp:TextBox ID="Txt_Email1" runat="server" meta:resourcekey="Txt_Email1Resource1" 
                  ></asp:TextBox>
                </td>
            <td  >
                &nbsp;</td>
            <td  >
                &nbsp;</td>
        </tr>
        <%--  <tr>
            <td >
                &nbsp;</td>
            <td >
                تاريخ آخر تبرع </td>
            <td>
                  <ww:jQueryDatePicker ID="dt_lastDonation" runat="server" Width="130px"></ww:jQueryDatePicker>
            </td>
            <td >
                المكان المفضل للتبرع</td>
            <td >
                <asp:DropDownList ID="ddl_favDonPlace" runat="server">
                </asp:DropDownList>
            </td>
        </tr>--%>
        <tr>
            <td class="style6" width="20%" colspan="2" >
                هاتف المنزل</td>
            <td  >
                <asp:TextBox ID="Txt_Phone" runat="server" meta:resourcekey="Txt_PhoneResource1" 
                    ></asp:TextBox>
            </td>
            <td width="200px" class="style6"  >
                 مانع دائم
            </td>
            <td  >
               
                  
              
                <asp:CheckBox ID="chk_InActive" runat="server" />
            </td>
            <td  >
               
                  
              
                &nbsp;</td>
            <td  >
                &nbsp;</td>
            <td  >
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" rowspan="2" colspan="2">
                المكان المفضل للتبرع</td>
            <td width="200px" >
              
           
                            <asp:DropDownList ID="ddl_Type" runat="server" DataSourceID="sds_Type" 
                                DataTextField="Type" DataValueField="TypeID" class="chzn-select"
                                ondatabound="ddl_Type_DataBound" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sds_Type" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>" 
                                SelectCommand="SELECT [TypeID], [Type] FROM [FavoriteTypes]">
                            </asp:SqlDataSource>
                        </td>
            <td class="style6" rowspan="2" >
             
                    محل السكن</td>
            <td class="style2" >
             
                    <asp:DropDownList ID="ddl_Governerate" runat="server" class="chzn-select"
                        ondatabound="ddl_Governerate_DataBound" AutoPostBack="True" 
                        DataSourceID="sds_Gov" DataTextField="GovernerateName" DataValueField="GovID" 
                      >
                  <asp:ListItem  value="0" Selected="True">اختر</asp:ListItem >
                   


                </asp:DropDownList>
                    <asp:SqlDataSource ID="sds_Gov" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>" 
                        SelectCommand="SELECT [GovID], [GovernerateName] FROM [Governerates]">
                    </asp:SqlDataSource>
                </td>
            <td class="style2" rowspan="2" >
             
                </td>
            <td class="style2" rowspan="2" >
             
                </td>
        </tr>
        <tr>
            <td width="200px"  >
                 <asp:DropDownList ID="dll_Place" runat="server" class="chzn-select"
                                     ForeColor="Black" 
                                    DataSourceID="sds_Place" DataTextField="FavPlace" 
                                    DataValueField="PlaceID" ondatabound="dll_Place_DataBound">
                                </asp:DropDownList>


                            <asp:SqlDataSource ID="sds_Place" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>" 
                                
                                
                                SelectCommand="SELECT [PlaceID], [FavPlace], [FavoriteTypeID] FROM [FavoritePlaces] WHERE   ([FavoriteTypeID] = @FavoriteTypeID)"
                                >
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddl_Type" Name="FavoriteTypeID" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
            <td class="style2" >
             
                    <asp:DropDownList ID="ddl_Territory" runat="server" class="chzn-select"
                        DataSourceID="sds_Territory" DataTextField="TerritoryName" 
                        DataValueField="TerritoryID" ondatabound="ddl_Territory_DataBound" 
                      >
                  <asp:ListItem  value="0" Selected="True">اختر</asp:ListItem >
                   


                </asp:DropDownList>
                    <asp:SqlDataSource ID="sds_Territory" runat="server"  
                        ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>" 
                        SelectCommand="SELECT [TerritoryID], [TerritoryName] FROM [Territory] WHERE ([GovernerateID] = @GovernerateID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddl_Governerate" Name="GovernerateID" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
        </tr>
        <tr>
            <td class="style6" colspan="2" >
                تقييم المتبرع</td>
            <td >
                <asp:DropDownList ID="ddl_Evaluation" runat="server" class="chzn-select" 
                    meta:resourcekey="ddl_EvaluationResource1">
                    <asp:ListItem Value="0" meta:resourcekey="ListItemResource7">اختر</asp:ListItem>
                    <asp:ListItem Value="1" meta:resourcekey="ListItemResource8">مهتم جدا</asp:ListItem>
                    <asp:ListItem Value="2" meta:resourcekey="ListItemResource9">مهتم</asp:ListItem>
                    <asp:ListItem Value="3" meta:resourcekey="ListItemResource10">مقبول</asp:ListItem>
                    <asp:ListItem Value="4" meta:resourcekey="ListItemResource11">غير مهتم</asp:ListItem>
                    <asp:ListItem Value="5" meta:resourcekey="ListItemResource12">لم يقيم بعد</asp:ListItem>
                </asp:DropDownList>
                </td>
            <td class="style6" >
                التبرع بالصفائح</td>
            <td colspan="2" >
                <asp:DropDownList ID="ddl_Platelet" runat="server" class="chzn-select"
                    >
                    <asp:ListItem Selected="True" Value="0" >اختر</asp:ListItem>
                    <asp:ListItem Value="1" meta:resourcekey="ListItemResource14">متبرع صفائح</asp:ListItem>
                    <asp:ListItem Value="2" meta:resourcekey="ListItemResource15">مهتم ولم يحاول</asp:ListItem>
                    <asp:ListItem Value="3" meta:resourcekey="ListItemResource16">لم نكلمه بعد</asp:ListItem>
                    <asp:ListItem Value="4" meta:resourcekey="ListItemResource17">لا يصلح أو غير مهتم</asp:ListItem>
                </asp:DropDownList>
                </td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" colspan="2" >
                &nbsp;</td>
            <td >
               
                  
              
                &nbsp;</td>
            <td class="style6" >
                &nbsp;</td>
            <td colspan="2" >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
        </tr>

      <tr>
            <td class="style6" nowrap="nowrap">
                &nbsp;
                من تاريخ</td>
            <td>
                <asp:DropDownList ID="ddl_FromDay" runat="server" Width="80px" 
                    class="chzn-select">
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
            </td>
            <td >
                <asp:DropDownList ID="ddl_FromMonth" runat="server" Width="70px" 
                    class="chzn-select">
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
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               
                <asp:DropDownList ID="ddl_FromYear" runat="server" Width="70px" 
                    class="chzn-select">
                    <asp:ListItem Value="0" Selected="True">اختر السنة</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="text-align: left" >
                إلى تاريخ</td>
            <td colspan="4" >
                <asp:DropDownList ID="ddl_ToDay" runat="server" Width="80px" class="chzn-select">
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
                <asp:DropDownList ID="ddl_ToMonth" runat="server" Width="70px" class="chzn-select">
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
               
                &nbsp;&nbsp;&nbsp;&nbsp;
               
                <asp:DropDownList ID="ddl_ToYear" runat="server" Width="70px" class="chzn-select">
                    <asp:ListItem Value="0" Selected="True">اختر السنة</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td width="70px">
               
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" 
               </td>
            <td >
                &nbsp;</td>
            <td class="style6" >
                &nbsp;</td>
            <td colspan="2" >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="6" style="text-align: right" >
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btn_CHold" runat="server" Text="الغاء الحجز" onclick="btn_CHold_Click" 
                    CssClass="myButton" Width="66px" meta:resourcekey="btn_SaveResource1" 
                    Visible="False" />
            </td>
            <td style="text-align: center" >
                &nbsp;</td>
            <td style="text-align: center" >
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="6" style="text-align: center" >
    <asp:Button ID="btn_Save" runat="server" Text="بحث" onclick="btn_Save_Click" 
                    CssClass="myButton" Width="66px" meta:resourcekey="btn_SaveResource1" />
            </td>
            <td style="text-align: center" >
                &nbsp;</td>
            <td style="text-align: center" >
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="6" style="text-align: center" >
    <asp:Button ID="btn_Export" runat="server" Text="تصدير " onclick="btn_Export_Click" 
                    CssClass="myButton" Width="66px" meta:resourcekey="btn_SaveResource1" 
                    Visible="False" />
            </td>
            <td style="text-align: center" >
                &nbsp;</td>
            <td style="text-align: center" >
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" >
               </td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td colspan="2" >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="8" >
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="V_ID" GridLines="Horizontal"
                    HeaderStyle-Height="30px"                           
                
                    EmptyDataText="There are no data records to display." Width="100%" 
                      
                  >
                     
                     <RowStyle  Height="25px" Wrap="False" 
                         HorizontalAlign="Center" VerticalAlign="Middle" />
                    <Columns>
                     <asp:BoundField DataField="V_ID" HeaderText="V_ID" SortExpression="V_ID" 
                            />

                        <asp:BoundField DataField="Name" HeaderText="الاسم" SortExpression="Name" 
                             />
                            
                        <%--<asp:BoundField DataField="BloodType" HeaderText="الفصيلة" 
                            SortExpression="BloodType" meta:resourcekey="BoundFieldResource4" />--%>
                            <asp:TemplateField HeaderText="الفصيلة" 
                            >
                            <ItemTemplate>
                            <%# ExportCallsToExcel.BloodType((Eval("BloodType")))%>
                           
                              
                            </ItemTemplate>
                           
                        </asp:TemplateField>
                     
                        <asp:TemplateField HeaderText="الموبيل" SortExpression="Mobile" 
                            >
                            <ItemTemplate>
                                <%# Eval("Mobile1") %><br /><%# Eval("Mobile2") %>
                            </ItemTemplate>
                            
                        </asp:TemplateField>
                            <asp:TemplateField HeaderText="الشبكة" 
                            >
                            <ItemTemplate>
                            <%# ExportCallsToExcel.MobileNetwork(Eval("MobileNetwork1"))%>
                                <br />
                             
                            <%# ExportCallsToExcel.MobileNetwork(Eval("MobileNetwork2"))%>
                              
                            </ItemTemplate>
                          
                        </asp:TemplateField>
                            <asp:TemplateField HeaderText="آخر تبرع" 
                            >
                            <ItemTemplate>
                            <%# ExportCallsToExcel.LastDonationDate(Convert.ToDateTime(Eval("DT")))%>
                           
                              
                            </ItemTemplate>
                           
                        </asp:TemplateField>
                        
                         <asp:TemplateField HeaderText="حالة التبرع" 
                            >
                            <ItemTemplate>
                            <%# ExportCallsToExcel.DonationStatus(Eval("St"))%>
                           
                              
                            </ItemTemplate>
                           
                        </asp:TemplateField>


                            <asp:TemplateField HeaderText="آخر مكالمة" 
                            >
                            <ItemTemplate>
                            <%# ExportCallsToExcel.LastDonationDate(Convert.ToDateTime(Eval("CD")))%>
                           
                              
                            </ItemTemplate>
                           
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText=" تعليق آخر مكالمة " 
                            >
                            <ItemTemplate>
                            <%#Eval("Cm")%>
                           
                              
                            </ItemTemplate>
                           
                        </asp:TemplateField>
                  <asp:TemplateField HeaderText="الجنس" 
                            >
                            <ItemTemplate>
                            <%# ExportCallsToExcel.Gender(Eval("Gender"))%>
                           
                              
                            </ItemTemplate>
                           
                        </asp:TemplateField>
                          
                        <asp:BoundField DataField="Notes" HeaderText="ظروف المتبرع" 
                            SortExpression="Notes"  />
                     <asp:BoundField DataField="Comments" HeaderText="Comments" 
                            SortExpression="Comments"  />
                     
                        
                    </Columns>

               

                  
                </asp:GridView>
            
                </td>
        </tr>
        <tr>
            <td colspan="8" style="text-align: center" >
                <asp:Repeater ID="rptPager" runat="server">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkPage" runat="server" 
                            CommandArgument='<%#Eval("Value") %>' Enabled='<%#Eval("Enabled") %>' 
                            Font-Bold="true" ForeColor="#267CB2" OnClick="Page_Changed" 
                            Text='<%#Eval("Text") %>' />
                    </ItemTemplate>
                </asp:Repeater>
            </td>
        </tr>
        <tr>
            <td colspan="2" >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td colspan="2" >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td colspan="2" >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
        </tr>
        </table>
               <table>
        <tr style="width: 100%">
            <td style="padding-left: 300px">
                &nbsp;</td>
        </tr>
    </table>
         <script src="../Scripts/jquery.min.js" type="text/javascript"></script>
		<script src="../Scripts/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript">		    $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
</asp:Content>

