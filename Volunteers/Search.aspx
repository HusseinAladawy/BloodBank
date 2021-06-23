<%@ Page Title=" البحث" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Search.aspx.cs" Inherits="Volunteers_Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .style1
        {
            height: 20px;
        }
        .style2
        {
            height: 24px;
        }
        .style5
        {
            height: 20px;
            color: #991821;
            font-size: x-large;
        }
        .style6
        {
            text-align: center;
        }
        .style7
        {
            text-align: center;
        }
        .style9
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table dir="rtl" align="right" width="100%">
        <tr>
            <td class="style5" colspan="8" style="text-align: center">
                البحث
            </td>
            <td class="style1" style="text-align: center">
            </td>
            <td class="style1" style="text-align: center">
            </td>
        </tr>
        <tr>
            <td class="style6" colspan="3">
            </td>
            <td class="style6">
            </td>
            <td class="style6" colspan="2">
            </td>
            <td colspan="2" class="style6">
            </td>
            <td class="style6">
            </td>
            <td class="style6">
            </td>
        </tr>
        <tr>
            <td class="style7" width="15%" colspan="3">
                نوع البيانات
            </td>
            <td width="20%">
                <asp:RadioButtonList ID="rbl_Reserved" runat="server">
                    <asp:ListItem Value="1">محجوز</asp:ListItem>
                    <asp:ListItem Selected="True" Value="0">غير محجوز</asp:ListItem>
                    <asp:ListItem Value="">الكل</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td width="100" colspan="2" style="text-align: center">
                حالة المتبرع
            </td>
            <td colspan="2">
                <asp:RadioButtonList ID="rbl_Active" runat="server">
                    <asp:ListItem Selected="True" Value="1">فعال</asp:ListItem>
                    <asp:ListItem Value="0">غير فعال</asp:ListItem>
                    <asp:ListItem Value="2">الكل</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style7" width="15%" colspan="3">
                الاسم
            </td>
            <td width="20%">
                <asp:TextBox ID="Txt_Name" runat="server"></asp:TextBox>
                <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="*" ForeColor="Red" InitialValue="0" 
                    ControlToValidate="Txt_Name"></asp:RequiredFieldValidator>--%>
            </td>
            <td width="100" class="style6" colspan="2">
                الرقم القومي
            </td>
            <td colspan="2">
                <asp:TextBox ID="Txt_IDNo" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style7" colspan="3">
                سنة الميلاد
            </td>
            <td>
                <asp:DropDownList ID="ddl_BirthYear" runat="server" class="chzn-select">
                    <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td width="100" class="style6" colspan="2">
                الفرع
            </td>
            <td colspan="2">
                <asp:DropDownList ID="ddl_branch" runat="server" DataSourceID="sds_Branch" class="chzn-select"
                    DataTextField="BranchName" DataValueField="BranchID" OnDataBound="ddl_branch_DataBound">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sds_Branch" runat="server" ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
                    SelectCommand="SELECT [BranchID], [BranchName] FROM [Branch] where BranchID <> 71"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style7" colspan="3">
                الفصيلة
            </td>
            <td>
                <asp:DropDownList ID="ddl_BloodType" runat="server" class="chzn-select">
                    <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>
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
            <td width="100" class="style6" colspan="2">
                الجنس
            </td>
            <td colspan="2">
                <asp:RadioButtonList ID="rbl_Gender" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">ذكر</asp:ListItem>
                    <asp:ListItem Value="0">أنثى</asp:ListItem>
                    <asp:ListItem>غير محدد</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style7" colspan="3">
                موبيل
            </td>
            <td>
                <asp:TextBox ID="Txt_Mobile1" runat="server"></asp:TextBox>
            </td>
            <td width="100" class="style6" colspan="2">
                V_ID
            </td>
            <td colspan="2">
                <asp:TextBox ID="Txt_V_ID" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style7" width="20%" colspan="3">
                الشبكة
            </td>
            <td>
                <asp:DropDownList ID="ddl_MobileNetwork1" runat="server" class="chzn-select">
                    <asp:ListItem Selected="True" Value="3">أختر </asp:ListItem>
                    <asp:ListItem Value="0">فودافون</asp:ListItem>
                    <asp:ListItem Value="1">إتصالات</asp:ListItem>
                    <asp:ListItem Value="2">موبينيل</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td width="100" class="style6" colspan="2">
                الإيميل
            </td>
            <td colspan="2">
                <asp:TextBox ID="Txt_Email1" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
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
            <td class="style7" width="20%" colspan="3">
                هاتف المنزل
            </td>
            <td>
                <asp:TextBox ID="Txt_Phone" runat="server"></asp:TextBox>
            </td>
            <td width="100" class="style6" colspan="2">
                 مانع دائم
            </td>
            <td>
                <asp:CheckBox ID="chk_InActive" runat="server" />
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
            <td class="style7" rowspan="2" colspan="3">
                المكان المفضل للتبرع
            </td>
            <td width="200px">
                <asp:DropDownList ID="ddl_Type" runat="server" DataSourceID="sds_Type" DataTextField="Type"
                    DataValueField="TypeID" class="chzn-select" OnDataBound="ddl_Type_DataBound"
                    AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sds_Type" runat="server" ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
                    SelectCommand="SELECT [TypeID], [Type] FROM [FavoriteTypes]"></asp:SqlDataSource>
            </td>
            <td class="style6" colspan="2" width="100" rowspan="2">
                محل السكن
            </td>
            <td class="style2">
                <asp:DropDownList ID="ddl_Governerate" runat="server" class="chzn-select" OnDataBound="ddl_Governerate_DataBound"
                    AutoPostBack="True" DataSourceID="sds_Gov" DataTextField="GovernerateName" DataValueField="GovID">
                    <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="sds_Gov" runat="server" ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
                    SelectCommand="SELECT [GovID], [GovernerateName] FROM [Governerates]"></asp:SqlDataSource>
            </td>
            <td class="style2" rowspan="2">
            </td>
            <td class="style2" rowspan="2">
            </td>
        </tr>
        <tr>
            <td width="200px">
                <asp:DropDownList ID="dll_Place" runat="server" class="chzn-select" ForeColor="Black"
                    DataSourceID="sds_Place" DataTextField="FavPlace" DataValueField="PlaceID" OnDataBound="dll_Place_DataBound">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sds_Place" runat="server" ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
                    SelectCommand="SELECT [PlaceID], [FavPlace], [FavoriteTypeID] FROM [FavoritePlaces] WHERE   ([FavoriteTypeID] = @FavoriteTypeID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl_Type" Name="FavoriteTypeID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="style2">
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
        </tr>
        <tr>
            <td class="style7" colspan="3">
                تقييم المتبرع
            </td>
            <td>
                <asp:DropDownList ID="ddl_Evaluation" runat="server" class="chzn-select">
                    <asp:ListItem Value="0">اختر</asp:ListItem>
                    <asp:ListItem Value="1">مهتم جدا</asp:ListItem>
                    <asp:ListItem Value="2">مهتم</asp:ListItem>
                    <asp:ListItem Value="3">مقبول</asp:ListItem>
                    <asp:ListItem Value="4">غير مهتم</asp:ListItem>
                    <asp:ListItem Value="5">لم يقيم بعد</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style6" colspan="2" width="100">
                التبرع بالصفائح
            </td>
            <td colspan="2">
                <asp:DropDownList ID="ddl_Platelet" runat="server" class="chzn-select">
                    <asp:ListItem Selected="True" Value="0">اختر</asp:ListItem>
                    <asp:ListItem Value="1">متبرع صفائح</asp:ListItem>
                    <asp:ListItem Value="2">مهتم ولم يحاول</asp:ListItem>
                    <asp:ListItem Value="3">لم نكلمه بعد</asp:ListItem>
                    <asp:ListItem Value="4">لا يصلح أو غير مهتم</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td colspan="2" width="100">
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
            <td class="style6" nowrap="nowrap">
                &nbsp; من تاريخ
            </td>
            <td class="style6" nowrap="nowrap">
                <asp:DropDownList ID="ddl_FromDay" runat="server" Width="80px" class="chzn-select">
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
            <td nowrap="nowrap" colspan="2" style="text-align: right">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="ddl_FromMonth" runat="server" Width="70px" class="chzn-select">
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
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="ddl_FromYear" runat="server" Width="70px" class="chzn-select">
                    <asp:ListItem Value="0" Selected="True">اختر السنة</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style9" width="150">
                &nbsp;&nbsp;إلى تاريخ&nbsp;
            </td>
            <td colspan="5">
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
                &nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="ddl_ToYear" runat="server" Width="70px" class="chzn-select">
                    <asp:ListItem Value="0" Selected="True">اختر السنة</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td colspan="2">
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
            <td colspan="8" style="text-align: center">
                <asp:Button ID="btn_Save" runat="server" Text="بحث" OnClick="btn_Save_Click" CssClass="myButton"
                    Width="66px" CausesValidation="False" />
            </td>
            <td style="text-align: center">
                &nbsp;
            </td>
            <td style="text-align: center">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="3">
            </td>
            <td>
                &nbsp;
            </td>
            <td colspan="2">
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
            <td colspan="10">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="V_ID"
                    GridLines="None" HeaderStyle-Height="30px" BackColor="#B01C26" HeaderStyle-ForeColor="White"
                    EmptyDataText="There are no data records to display." Width="100%" AllowPaging="True"
                    OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="100">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7CDCD" Height="25px" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <Columns>
                        <asp:BoundField DataField="V_ID" HeaderText="V_ID" SortExpression="V_ID" />
                        <%-- <asp:BoundField DataField="IDNo" HeaderText="الرقم القومي" SortExpression="IDNo" 
                            />--%>
                        <asp:BoundField DataField="Name" HeaderText="الاسم" SortExpression="Name" />
                        <%--<asp:BoundField DataField="BloodType" HeaderText="الفصيلة" 
                            SortExpression="BloodType" meta:resourcekey="BoundFieldResource4" />--%>
                        <asp:TemplateField HeaderText="الفصيلة">
                            <ItemTemplate>
                                <%# Volunteers_Search.BloodType((Eval("BloodType")))%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="الموبيل" SortExpression="Mobile">
                            <ItemTemplate>
                                <%# Eval("Mobile1") %><br />
                                <%# Eval("Mobile2") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="الشبكة">
                            <ItemTemplate>
                                <%# Volunteers_Search.MobileNetwork(Eval("MobileNetwork1")) %>
                                <br />
                                <%# Volunteers_Search.MobileNetwork(Eval("MobileNetwork2"))%>
                            </ItemTemplate>
                        </asp:TemplateField>
                 <%--       <asp:TemplateField HeaderText="آخر تبرع">
                            <ItemTemplate>
                                <%# Volunteers_Search.LastDonationDate(Convert.ToDateTime(Eval("LastDonationDate")))%>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="آخر مكالمة">
                            <ItemTemplate>
                                <%# Volunteers_Search.LastDonationDate(Convert.ToDateTime(Eval("LastCallDate")))%>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <%--     <asp:TemplateField HeaderText="الإيميل">
                            <ItemTemplate>
                                <%# Eval("Email1") %><br /><%# Eval("Email2") %>
                            </ItemTemplate>                           
                        </asp:TemplateField>--%>
                        <%--  <asp:BoundField DataField="Phone" HeaderText="التليفون" SortExpression="Phone" 
                             />
                       <asp:BoundField DataField="TerritoryName" HeaderText="المنطقة" 
                            SortExpression="TerritoryName"  />
                        <asp:BoundField DataField="JobName" HeaderText="الوظيفة" SortExpression="JobName" 
                             />--%>
                        <asp:TemplateField HeaderText="الجنس">
                            <ItemTemplate>
                                <%# Volunteers_Search.Gender(Eval("Gender"))%>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle ForeColor="White" Height="30px" Wrap="False"></HeaderStyle>
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td colspan="2">
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
            <td colspan="3">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td colspan="2">
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
            <td colspan="3">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td colspan="2">
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
    </table>
    <table>
        <tr style="width: 100%">
            <td style="padding-left: 300px">
                &nbsp;
            </td>
        </tr>
    </table>
    <script src="../Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="../Scripts/chosen.jquery.js" type="text/javascript"></script>
    <script type="text/javascript">        $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
</asp:Content>
