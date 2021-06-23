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
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table dir="rtl" align="right" width="100%">
        <tr>
            <td class="style5" colspan="5" style="text-align: center">
                البحث
            </td>
            <td class="style1" style="text-align: center">
            </td>
            <td class="style1" style="text-align: center">
            </td>
        </tr>
        <tr>
            <td class="style6">
            </td>
            <td class="style6">
            </td>
            <td class="style6">
            </td>
            <td colspan="2" class="style6">
            </td>
            <td class="style6">
            </td>
            <td class="style6">
            </td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td width="100" class="style6">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style7">
                الفصيلة
            </td>
            <td>
                <asp:DropDownList ID="ddl_BloodType" runat="server" class="chosen-select">
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
            <td width="100" class="style6">
                الجنس
            </td>
            <td colspan="2">
                <asp:RadioButtonList ID="rbl_Gender" runat="server" RepeatDirection="Horizontal" CssClass="radio-button">
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
            <td class="style7" width="20%">
                الشبكة
            </td>
            <td>
                <asp:DropDownList ID="ddl_MobileNetwork1" runat="server" class="chosen-select">
                    <asp:ListItem Selected="True" Value="3">أختر </asp:ListItem>
                    <asp:ListItem Value="0">فودافون</asp:ListItem>
                    <asp:ListItem Value="1">إتصالات</asp:ListItem>
                    <asp:ListItem Value="2">موبينيل</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td width="100" class="style6">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
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
            <td class="style7" rowspan="2">
                المكان المفضل للتبرع
            </td>
            <td width="200px">
                <asp:DropDownList ID="ddl_Type" runat="server" DataSourceID="sds_Type" DataTextField="Type"
                    DataValueField="TypeID" class="chosen-select" OnDataBound="ddl_Type_DataBound"
                    AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sds_Type" runat="server" ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
                    SelectCommand="SELECT [TypeID], [Type] FROM [FavoriteTypes] "></asp:SqlDataSource>
            </td>
            <td class="style6" width="100" rowspan="2">
                محل السكن
            </td>
            <td class="style2">
                <asp:DropDownList ID="ddl_Governerate" runat="server" class="chosen-select" OnDataBound="ddl_Governerate_DataBound"
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
                <asp:DropDownList ID="dll_Place" runat="server" class="chosen-select" ForeColor="Black"
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
                <asp:DropDownList ID="ddl_Territory" runat="server" class="chosen-select" DataSourceID="sds_Territory"
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
            <td class="style7">
                تقييم المتبرع
            </td>
            <td>
                <asp:DropDownList ID="ddl_Evaluation" runat="server" class="chosen-select">
                    <asp:ListItem Value="0">اختر</asp:ListItem>
                    <asp:ListItem Value="1">مهتم جدا</asp:ListItem>
                    <asp:ListItem Value="2">مهتم</asp:ListItem>
                    <asp:ListItem Value="3">مقبول</asp:ListItem>
                    <asp:ListItem Value="4">غير مهتم</asp:ListItem>
                    <asp:ListItem Value="5">لم يقيم بعد</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style6" width="100">
                التبرع بالصفائح
            </td>
            <td colspan="2">
                <asp:DropDownList ID="ddl_Platelet" runat="server" class="chosen-select">
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
            <td style="text-align: center">
               
                نقاط المكالمات</td>
            <td>
               
                <asp:TextBox ID="txt_callpoints" runat="server"></asp:TextBox>
            </td>
            <td width="100" style="text-align: center">
                نقاط التبرع</td>
            <td colspan="2">
               
                <asp:TextBox ID="txt_Donationpoints" runat="server"></asp:TextBox>
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
            <td>
                &nbsp;
            </td>
            <td>
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
            <td colspan="5" style="text-align: center">
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
            <td>
            </td>
            <td>
                &nbsp;
            </td>
            <td>
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
            <td colspan="7">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="V_ID"
                    GridLines="Vertical" HeaderStyle-Height="30px" BackColor="#B01C26" HeaderStyle-ForeColor="White"
                    EmptyDataText="There are no data records to display." Width="100%" AllowPaging="True"
                    OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="100">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#F7CDCD" Height="25px" HorizontalAlign="Center" VerticalAlign="Middle" />
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
                            <%# em_search_aspx.BloodType((Eval("BloodType")))%>
                           
                              
                            </ItemTemplate>
                           
                        </asp:TemplateField>
                     
                        <asp:TemplateField HeaderText="الموبيل" SortExpression="Mobile" 
                            >
                            <ItemTemplate>
                                <%# Eval("Mobile1") %><br /><%# Eval("Mobile2") %>
                            </ItemTemplate>
                            
                        </asp:TemplateField>
                         
                           <asp:TemplateField HeaderText="تاريخ آخر تبرع" 
                            >
                            <ItemTemplate>
                            <%# em_search_aspx.LastDonationDate(Convert.ToDateTime(Eval("DT")))%>
                           
                              
                            </ItemTemplate>
                           
                        </asp:TemplateField>
                        
                         <asp:TemplateField HeaderText="حالة التبرع" 
                            >
                            <ItemTemplate>
                            <%# em_search_aspx.DonationStatus(Eval("St"))%>
                           
                              
                            </ItemTemplate>
                           
                        </asp:TemplateField>


                            <asp:TemplateField HeaderText="تاريخ آخر مكالمة" 
                            >
                            <ItemTemplate>
                            <%# em_search_aspx.LastDonationDate(Convert.ToDateTime(Eval("CD")))%>
                           
                              
                            </ItemTemplate>
                           
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText=" تعليق آخر مكالمة " 
                            >
                            <ItemTemplate>
                            <%#Eval("Cm")%>
                           
                              
                            </ItemTemplate>
                           
                        </asp:TemplateField> 

               
                          
                        <asp:BoundField DataField="Notes" HeaderText="ظروف المتبرع" 
                            SortExpression="Notes"  />



                        <asp:TemplateField HeaderText=" مكالمات">
                            <ItemTemplate>
                                <a href='Calls.aspx?ID=<%#Eval("V_ID")%>' style="color: #B01C26">مكالمة</a>
                            </ItemTemplate>
                        </asp:TemplateField>


                           <asp:BoundField DataField="CallPoints" HeaderText="نقاط المكالمات" SortExpression="CallPoints" />
                        <asp:BoundField DataField="DonationPoints" HeaderText="نقاط التبرع" SortExpression="DonationPoints" />


                   
                     
                        
                    </Columns>
                    <HeaderStyle ForeColor="White" Height="30px" Wrap="False"></HeaderStyle>
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
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
            <td>
                &nbsp;
            </td>
            <td>
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
            <td>
                &nbsp;
            </td>
            <td>
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
    
</asp:Content>
