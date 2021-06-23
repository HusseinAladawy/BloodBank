<%@ Page Title="إلى إكسل" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="ExportCallsToExcel.aspx.cs" Inherits="ExportCallsToExcel" %>

<%@ Register Assembly="RadCalendar.Net2" Namespace="Telerik.WebControls" TagPrefix="radCln" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">


    <div class="row">
        <div class="col-12">
            <h1 class="style5 text-center">الى إكسل
            </h1>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-md-6 col-12">
            <div class="form-group">
                <label for="" class='font-22'>نوع البيانات :</label>
                <asp:RadioButtonList ID="rbl_Reserved" runat="server" RepeatDirection="Horizontal" CssClass="radio-button">
                    <asp:ListItem Value="1">محجوز</asp:ListItem>
                    <asp:ListItem Selected="True" Value="0">غير محجوز</asp:ListItem>
                    <asp:ListItem Value="">الكل</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
        <div class="col-md-6 col-12">
            <label for="" class='font-22'>حالة المتبرع :</label>
            <asp:RadioButtonList ID="rbl_Active" runat="server" RepeatDirection="Horizontal" CssClass="radio-button">
                <asp:ListItem Selected="True" Value="1">فعال</asp:ListItem>
                <asp:ListItem Value="0">غير فعال</asp:ListItem>
                <asp:ListItem Value="2">الكل</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-12">
            <div class="form-group">
                <label for="" class='font-22'>الاسم :</label>
                <asp:TextBox ID="Txt_Name" CssClass='form-control' runat="server" placeholder="الاسم"></asp:TextBox>

            </div>
        </div>
        <div class="col-md-6 col-12">
            <label for="" class='font-22'>الرقم القومي :</label>
            <asp:TextBox ID="Txt_IDNo" runat="server" CssClass='form-control' placeholder="الرقم القومي"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-12 text-center">
            <label for="">phenotype</label>

        </div>
        <div class="col-md-2 col-12 ">
            <div class="form-group">
                <label for="" class='font-22 text-left'>Kell </label>
                <asp:DropDownList ID="ddl_Kell" CssClass='form-control' runat="server">
                    <asp:ListItem Value="0">اختر</asp:ListItem>
                    <asp:ListItem Value="+">+</asp:ListItem>
                    <asp:ListItem Value="-">-</asp:ListItem>
                    <asp:ListItem Value="M">M</asp:ListItem>
                    <asp:ListItem Value="U" Selected="True">غير معروف</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-md-2 col-12 ">
            <div class="form-group">
                <label for="" class='font-22 text-left'>e </label>
                <asp:DropDownList ID="ddl_e" CssClass='form-control' runat="server">
                    <asp:ListItem Value="0">اختر</asp:ListItem>
                    <asp:ListItem Value="+">+</asp:ListItem>
                    <asp:ListItem Value="-">-</asp:ListItem>
                    <asp:ListItem Value="M">M</asp:ListItem>
                    <asp:ListItem Value="U" Selected="True">غير معروف</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-md-2 col-12 ">
            <div class="form-group">
                <label for="" class='font-22 text-left'>E </label>
                <asp:DropDownList ID="ddl_E_" CssClass='form-control' runat="server">
                    <asp:ListItem Value="0">اختر</asp:ListItem>
                    <asp:ListItem Value="+">+</asp:ListItem>
                    <asp:ListItem Value="-">-</asp:ListItem>
                    <asp:ListItem Value="M">M</asp:ListItem>
                    <asp:ListItem Value="U" Selected="True">غير معروف</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-md-2 col-12 ">
            <div class="form-group">
                <label for="" class='font-22 text-left'>c </label>
                <asp:DropDownList ID="ddl_c" CssClass='form-control' runat="server">
                    <asp:ListItem Value="0">اختر</asp:ListItem>
                    <asp:ListItem Value="+">+</asp:ListItem>
                    <asp:ListItem Value="-">-</asp:ListItem>
                    <asp:ListItem Value="M">M</asp:ListItem>
                    <asp:ListItem Value="U" Selected="True">غير معروف</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-md-1 col-12 ">
            <div class="form-group">
                <label for="" class='font-22 text-left'>C </label>
                <asp:DropDownList ID="ddl_C_" CssClass='form-control' runat="server">
                    <asp:ListItem Value="0">اختر</asp:ListItem>
                    <asp:ListItem Value="+">+</asp:ListItem>
                    <asp:ListItem Value="-">-</asp:ListItem>
                    <asp:ListItem Value="M">M</asp:ListItem>
                    <asp:ListItem Value="U" Selected="True">غير معروف</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-md-1 col-12 ">
            <div class="form-group">
                <label for="" class='font-22 text-left'>RH </label>
                <asp:DropDownList ID="ddl_RH" CssClass='form-control' runat="server">
                    <asp:ListItem Selected="True" Value="0">اختر</asp:ListItem>
                    <asp:ListItem Value="+">+</asp:ListItem>
                    <asp:ListItem Value="-">-</asp:ListItem>
                    <asp:ListItem Value="U">غير معروف</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-md-2 col-12 ">
            <div class="form-group">
                <label for="" class='font-22 text-left'>ABO </label>
                <asp:DropDownList ID="ddl_ABO" CssClass='form-control' runat="server">
                    <asp:ListItem Selected="True" Value="0">اختر</asp:ListItem>
                    <asp:ListItem Value="O">O</asp:ListItem>
                    <asp:ListItem Value="A">A</asp:ListItem>
                    <asp:ListItem Value="B">B</asp:ListItem>
                    <asp:ListItem Value="AB">AB</asp:ListItem>
                    <asp:ListItem Value="U">غير معروف</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-12">
            <div class="form-group">
                <label for="" class='font-22'>سنة الميلاد :</label>
                <asp:DropDownList ID="ddl_BirthYear" Style="height: calc(1.5em + .75rem + 2px);" runat="server"
                    class="form-control chosen-select">
                    <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>
                </asp:DropDownList>

            </div>
        </div>
        <div class="col-md-6 col-12">
            <label for="" class='font-22'>كيف تعرفت علينا :</label>
            <asp:DropDownList ID="ddl_HearedAbout" runat="server" class="form-control chosen-select"
                DataSourceID="LinqDataSource1" DataTextField="HearName" DataValueField="HearID"
                OnDataBound="ddl_HearedAbout_DataBound">
                <asp:ListItem Selected="True" Value="0">اختر</asp:ListItem>
                <asp:ListItem Value="1">دعاية داخل الدار</asp:ListItem>
                <asp:ListItem Value="2">صديق</asp:ListItem>
                <asp:ListItem Value="3">دعاية خارج الدار</asp:ListItem>
                <asp:ListItem Value="4">الجامعة</asp:ListItem>
                <asp:ListItem Value="5">حملة خارجية</asp:ListItem>
                <asp:ListItem Value="6">الطوارئ</asp:ListItem>
                <asp:ListItem Value="7">التواصل الاجتماعى</asp:ListItem>
                <asp:ListItem Value="8">الإعلام</asp:ListItem>
                <asp:ListItem Value="9">مكالمات</asp:ListItem>
                <asp:ListItem Value="11">SMS</asp:ListItem>
                <asp:ListItem Value="12">متطوع فى رسالة</asp:ListItem>
                <asp:ListItem Value="10">غير محدد</asp:ListItem>
            </asp:DropDownList>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="BloodBankDataContext" EntityTypeName=""
                Select="new (HearID, HearName)" TableName="HearAboutUs">
            </asp:LinqDataSource>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-12">
            <div class="form-group">
                <label for="" class='font-22'>V_ID :</label>
                <asp:TextBox ID="Txt_V_ID" runat="server" class="form-control" placeholder="V_ID"></asp:TextBox>

            </div>
        </div>
        <div class="col-md-6 col-12">
            <label for="" class='font-22'>النوع :</label>
            <asp:RadioButtonList ID="rbl_Gender" runat="server" RepeatDirection="Horizontal" CssClass="radio-button">
                <asp:ListItem Value="1">ذكر</asp:ListItem>
                <asp:ListItem Value="0">أنثى</asp:ListItem>
                <asp:ListItem Value="">غير محدد</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-12">
            <div class="form-group">
                <label for="" class='font-22'>موبايل :</label>
                <asp:TextBox ID="txt_Mobile" class="form-control" runat="server" placeholder="موبيل"></asp:TextBox>
            </div>
        </div>
        <div class="col-md-6 col-12">
            <label for="" class='font-22 d-block'>WhatsApp :</label>
            <asp:CheckBox ID="chk_WhatsApp" runat="server" />
            <asp:Image ID="Image12" runat="server" Height="25px" ImageUrl="~/Kafala/Kid/w.png" Width="25px"
                ImageAlign="Top" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-12">
            <div class="form-group">
                <label for="" class='font-22'>الشبكة :</label>
                <asp:DropDownList ID="ddl_MobileNetwork1" runat="server" class="chosen-select form-control">
                    <asp:ListItem Selected="True" Value="3">أختر </asp:ListItem>
                    <asp:ListItem Value="0">فودافون</asp:ListItem>
                    <asp:ListItem Value="1">إتصالات</asp:ListItem>
                    <asp:ListItem Value="2">اورانج</asp:ListItem>
                    <asp:ListItem Value="5">WE</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-md-6 col-12">
            <label for="" class='font-22 d-block'>الإيميل :</label>
            <asp:TextBox ID="Txt_Email1" class="form-control" runat="server" meta:resourcekey="Txt_Email1Resource1">
            </asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-12">
            <div class="form-group">
                <label for="" class='font-22'>هاتف المنزل :</label>
                <asp:TextBox ID="Txt_Phone" class="form-control" runat="server" placeholder="هاتف المنزل"></asp:TextBox>

            </div>
        </div>
        <div class="col-md-6 col-12">
            <label for="" class='font-22 d-block'>مانع دائم :</label>
            <asp:CheckBox ID="chk_InActive" runat="server" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-12 bordered">
            <label for="" class='font-22 d-block' style="display: block;">المكان المفضل للتبرع :</label>
            <div class="form-group">
                <label for="" class='font-22'>نوع المكان :</label>
                <asp:DropDownList ID="ddl_Type" runat="server" DataSourceID="sds_Type" DataTextField="Type"
                    DataValueField="TypeID" class="form-control chosen-select" OnDataBound="ddl_Type_DataBound" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sds_Type" runat="server"
                    ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
                    SelectCommand="SELECT [TypeID], [Type] FROM [FavoriteTypes]"></asp:SqlDataSource>
            </div>
            <div class="form-group">
                <label for="">المكان :</label>
                <asp:DropDownList ID="dll_Place" runat="server" class="form-control chosen-select" ForeColor="Black"
                    DataSourceID="sds_Place" DataTextField="FavPlace" DataValueField="PlaceID" OnDataBound="dll_Place_DataBound">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sds_Place" runat="server"
                    ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
                    SelectCommand="SELECT [PlaceID], [FavPlace], [FavoriteTypeID] FROM [FavoritePlaces] WHERE   ([FavoriteTypeID] = @FavoriteTypeID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl_Type" Name="FavoriteTypeID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="col-md-6 col-12 bordered">
            <label for="" class='font-22 d-block'>محل السكن :</label>
            <div class="form-group">
                <label for="" class='font-22 d-block'>المحافظة :</label>
                <asp:DropDownList ID="ddl_Governerate" runat="server" class="chosen-select form-control"
                    OnDataBound="ddl_Governerate_DataBound" AutoPostBack="True" DataSourceID="sds_Gov"
                    DataTextField="GovernerateName" DataValueField="GovID">
                    <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="sds_Gov" runat="server"
                    ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
                    SelectCommand="SELECT [GovID], [GovernerateName] FROM [Governerates]"></asp:SqlDataSource>
            </div>
            <div class="form-group">
                <label for="">المنطقة :</label>
                <asp:DropDownList ID="ddl_Territory" runat="server" class="form-control chosen-select"
                    DataSourceID="sds_Territory" DataTextField="TerritoryName" DataValueField="TerritoryID"
                    OnDataBound="ddl_Territory_DataBound">
                    <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="sds_Territory" runat="server"
                    ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
                    SelectCommand="SELECT [TerritoryID], [TerritoryName] FROM [Territory] WHERE ([GovernerateID] = @GovernerateID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl_Governerate" Name="GovernerateID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-12">
            <div class="form-group">
                <label for="" class='font-22'>تقييم المتبرع :</label>
                <asp:DropDownList ID="ddl_Evaluation" runat="server" class="form-control chosen-select"
                    meta:resourcekey="ddl_EvaluationResource1">
                    <asp:ListItem Value="0" meta:resourcekey="ListItemResource7">اختر</asp:ListItem>
                    <asp:ListItem Value="1" meta:resourcekey="ListItemResource8">مهتم جدا</asp:ListItem>
                    <asp:ListItem Value="2" meta:resourcekey="ListItemResource9">مهتم</asp:ListItem>
                    <asp:ListItem Value="3" meta:resourcekey="ListItemResource10">مقبول</asp:ListItem>
                    <asp:ListItem Value="4" meta:resourcekey="ListItemResource11">غير مهتم</asp:ListItem>
                    <asp:ListItem Value="5" meta:resourcekey="ListItemResource12">لم يقيم بعد</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-md-6 col-12">
            <label for="" class='font-22'>التبرع بالصفائح :</label>
            <asp:DropDownList ID="ddl_Platelet" runat="server" class="form-control chosen-select">
                <asp:ListItem Selected="True" Value="0">اختر</asp:ListItem>
                <asp:ListItem Value="1" meta:resourcekey="ListItemResource14">متبرع صفائح</asp:ListItem>
                <asp:ListItem Value="2" meta:resourcekey="ListItemResource15">مهتم ولم يحاول</asp:ListItem>
                <asp:ListItem Value="3" meta:resourcekey="ListItemResource16">لم نكلمه بعد</asp:ListItem>
                <asp:ListItem Value="4" meta:resourcekey="ListItemResource17">لا يصلح أو غير مهتم</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-12">
            <div class="form-group">
                <label for="" class='font-22'>نقاط المكالمات :</label>
                <asp:TextBox ID="txt_callpoints" class="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="col-md-6 col-12">
            <label for="" class='font-22'>نقاط التبرع :</label>
            <asp:TextBox ID="txt_Donationpoints" class="form-control" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-12">
            <div class="form-group">
                <label for="" class='font-22'>مستعد للتطوع :</label>
                <asp:RadioButtonList ID="rbl_Ready" runat="server" RepeatDirection="Horizontal" CssClass="radio-button">
                    <asp:ListItem Value="1">نعم</asp:ListItem>
                    <asp:ListItem Value="0">لا</asp:ListItem>
                    <asp:ListItem Value="">غير محدد</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
        <div class="col-md-6 col-12">
            <label for="" class='font-22'>كفالة :</label>
            <asp:DropDownList ID="ddl_Kafala" runat="server" class="form-control chosen-select">
                <asp:ListItem Value="0">اختر</asp:ListItem>
                <asp:ListItem Value="1">فى مجموعة </asp:ListItem>
                <asp:ListItem Value="2">مهتم وغير متوافق </asp:ListItem>
                <asp:ListItem Value="3" Selected="True">لم نكلمه بعد</asp:ListItem>
                <asp:ListItem Value="4">غير مهتم</asp:ListItem>
                <asp:ListItem Value="5">راغب</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-12">
            <div class="form-group">
                <label for="" class='font-22'>من تاريخ :</label>
                <radCln:RadDatePicker ID="dt_From" Style='width: 100%' runat="server" Culture="ar-EG" Font-Size="Medium">
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

            </div>
        </div>
        <div class="col-md-6 col-12">
            <label for="" class='font-22'>الى تاريخ :</label>
            <radCln:RadDatePicker ID="dt_To" Style='width: 100%' runat="server" Culture="ar-EG" Font-Size="Medium">
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
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-12">
            <asp:Label ID="lbl_Report" runat="server" Font-Size="Medium" ForeColor="Black" Visible="False"></asp:Label>
            <label for="" class='font-22'>عدد نتائج البحث</label>
            <asp:DropDownList ID="ddl_RowsNo" runat="server" class="form-control chosen-select" Font-Size="Large">
                <asp:ListItem Selected="True" Value="100">100</asp:ListItem>
                <asp:ListItem Value="500" meta:resourcekey="ListItemResource14">500</asp:ListItem>
                <asp:ListItem Value="1000" meta:resourcekey="ListItemResource15">1000</asp:ListItem>
                <asp:ListItem Value="2000" meta:resourcekey="ListItemResource16">2000</asp:ListItem>
                <asp:ListItem Value="0" meta:resourcekey="ListItemResource17">الكل</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-md-6 col-12">
            <label for="" class='font-22'>&nbsp;</label>
            <div class="form-group text-left">
                <asp:Button ID="btn_CHold" runat="server" OnClick="btn_CHold_Click" Text="الغاء الحجز"
                    CssClass="btn btn-danger myButton w-25 text-center" />

                <asp:Button ID="btn_Save" runat="server" Text="بحث" CssClass="btn btn-danger myButton w-25 text-center"
                    meta:resourcekey="btn_SaveResource1" OnClick="btn_Save_Click" />
                <asp:Button ID="btn_Export" runat="server" OnClick="btn_Export_Click" Text="تصدير"
                    CssClass="btn btn-danger myButton w-25 text-center" />

            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="V_ID" GridLines="Both"
                HeaderStyle-Height="30px" EmptyDataText="There are no data records to display." Width="100%" AllowPaging="True"
                OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="100">

                <HeaderStyle Height="30px"></HeaderStyle>

                <RowStyle Height="25px" Wrap="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                <Columns>
                    <asp:BoundField DataField="V_ID" HeaderText="V_ID" SortExpression="V_ID" />

                    <asp:BoundField DataField="Name" HeaderText="الاسم" SortExpression="Name" />

                    <%--<asp:BoundField DataField="BloodType" HeaderText="الفصيلة" 
                              SortExpression="BloodType" meta:resourcekey="BoundFieldResource4" />--%>
                    <asp:TemplateField HeaderText="الفصيلة">
                        <ItemTemplate>
                            <%# Eval("RH")%><%# Eval("ABO")%>
                        </ItemTemplate>
                    </asp:TemplateField>



                    <asp:TemplateField HeaderText="الموبيل" SortExpression="Mobile">
                        <ItemTemplate>

                            <asp:Image ID="Image11" runat="server" Height="15px" ImageUrl="~/Kafala/Kid/w.png" Width="15px"
                                Visible='<%# Convert.ToBoolean( Eval("Mobile1_W")) %>' ImageAlign="Top" /><%# Eval("Mobile1") %>

                            <br />
                            <asp:Image ID="Image1" runat="server" Height="15px" ImageUrl="~/Kafala/Kid/w.png" Width="15px"
                                Visible='<%# Convert.ToBoolean( Eval("Mobile2_W")) %>' ImageAlign="Top" /><%# Eval("Mobile2") %>
                        </ItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="االشبكة ">
                        <ItemTemplate>
                            <%# ExportCallsToExcel.MobileNetwork(Eval("MobileNetwork1"))%>
                            <br />

                            <%# ExportCallsToExcel.MobileNetwork(Eval("MobileNetwork2"))%>
                        </ItemTemplate>

                    </asp:TemplateField>
                    <asp:BoundField HeaderText="تاريخ آخر تبرع" DataField="DT" DataFormatString="{0:dd/MM/yyyy}"
                        ItemStyle-Wrap="false" />


                    <asp:TemplateField HeaderText="حالة التبرع">
                        <ItemTemplate>
                            <%# ExportCallsToExcel.DonationStatus(Eval("St"))%>
                        </ItemTemplate>

                    </asp:TemplateField>

                    <asp:BoundField HeaderText="تاريخ آخر مكالمة" DataField="CD" DataFormatString="{0:dd/MM/yyyy}"
                        ItemStyle-Wrap="false" />

                    <asp:TemplateField HeaderText=" تعليق آخر مكالمة ">
                        <ItemTemplate>
                            <%#Eval("Cm")%>
                        </ItemTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="النوع">
                        <ItemTemplate>
                            <%# ExportCallsToExcel.Gender(Eval("Gender"))%>
                        </ItemTemplate>

                    </asp:TemplateField>

                    <asp:BoundField DataField="Notes" HeaderText="ظروف المتبرع" SortExpression="Notes" />



                    <asp:TemplateField HeaderText="CallDate">
                        <ItemTemplate>
                        </ItemTemplate>

                    </asp:TemplateField>





                    <asp:BoundField DataField="Comments" HeaderText="Comments" ItemStyle-Wrap="true" SortExpression="Comments">

                        <ItemStyle Wrap="True"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="CallPoints" HeaderText="نقاط المكالمات" SortExpression="CallPoints" />
                    <asp:BoundField DataField="DonationPoints" HeaderText="نقاط التبرع" SortExpression="DonationPoints" />
                </Columns>




            </asp:GridView>
        </div>
    </div>


</asp:Content>
