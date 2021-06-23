<%@ Page Title="تعديل بيانات متبرع" Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Volunteers_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
  <div class="row">
    <div class="col-12">
      <h1 class="style5 text-center">
        تعديل المتبرع
        (<asp:Label ID="lbl_VID" runat="server" Font-Size="X-Large" ForeColor="Blue"></asp:Label>)&nbsp;
        <asp:Label ID="lbl_Name" runat="server" Font-Size="X-Large" ForeColor="Black"></asp:Label>
      </h1>
    </div>
  </div>
  <br>
  <div class="row">
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22'>تاريخ الإضافة :</label>
        <asp:Label ID="lbl_InsertionDate" cssClass='form-control' runat="server" Font-Size="X-Large" ForeColor="Black"
          style="font-size: medium"></asp:Label>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22'>الاسم :</label>
        <asp:TextBox ID="Txt_Name" cssClass='form-control' runat="server" placeholder="الاسم"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red"
          ControlToValidate="Txt_Name"></asp:RequiredFieldValidator>
      </div>
    </div>
    <div class="col-md-6 col-12">
      <label for="" class='font-22'>الرقم القومي :</label>
      <asp:TextBox ID="Txt_IDNo" cssClass='form-control' runat="server" MaxLength="14"></asp:TextBox>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ControlToValidate="Txt_IDNo"
        Display="Dynamic" ErrorMessage="الرقم القومي يجب أن يكون 14 أرقام" Font-Names="Tahoma" Font-Size="11px"
        ValidationExpression="\d{14}" ForeColor="Red">
      </asp:RegularExpressionValidator>
    </div>
  </div>
  <div class="row">
    <div class="col-12 text-center">
      <label for="">phenotype</label>

    </div>
    <div class="col-md-2 col-12 ">
      <div class="form-group">
        <label for="" class='font-22 text-left'>Kell </label>
        <asp:DropDownList ID="ddl_Kell" cssClass='form-control' runat="server">
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
        <asp:DropDownList ID="ddl_e" cssClass='form-control' runat="server">
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
        <asp:DropDownList ID="ddl_E_" cssClass='form-control' runat="server">
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
        <asp:DropDownList ID="ddl_c" cssClass='form-control' runat="server">
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
        <asp:DropDownList ID="ddl_C_" cssClass='form-control' runat="server">
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
        <asp:DropDownList ID="ddl_RH" cssClass='form-control' runat="server">
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
        <asp:DropDownList ID="ddl_ABO" cssClass='form-control' runat="server">
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
      <label for="" class='font-22'>النوع :</label>
      <asp:RadioButtonList ID="rbl_Gender" runat="server" RepeatDirection="Horizontal" CssClass="floatR">
        <asp:ListItem Value="1">ذكر</asp:ListItem>
        <asp:ListItem Value="0">أنثى</asp:ListItem>
      </asp:RadioButtonList>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red"
        ControlToValidate="rbl_Gender" Display="Dynamic" CssClass="floatR">
      </asp:RequiredFieldValidator>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22'>موبيل 1 :</label>
        <asp:TextBox ID="Txt_Mobile1" runat="server" class="form-control" AutoPostBack="True"
          OnTextChanged="Txt_Mobile1_TextChanged" MaxLength="11"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ForeColor="Red"
          ControlToValidate="Txt_Mobile1" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:Image ID="Image11" runat="server" Height="25px" ImageUrl="~/Kafala/Kid/w.png" Width="25px"
          ImageAlign="Top" />
        <asp:CheckBox ID="chk_Mob1" runat="server" />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="Txt_Mobile1"
          Display="Dynamic" ErrorMessage="رقم الموبيل يجب أن يكون 11 رقم" Font-Names="Tahoma" Font-Size="11px"
          ValidationExpression="\d{11}" ForeColor="Red">
        </asp:RegularExpressionValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Txt_Mobile1"
          ControlToValidate="Txt_Mobile2" ErrorMessage="لايمكن إدخال نفس الرقم مرتين" ForeColor="Red"
          Operator="NotEqual"></asp:CompareValidator>
        &nbsp;&nbsp;
        <asp:Label ID="lbl_Mobile" runat="server" Font-Names="Tahoma" ForeColor="Red" Visible="False" Font-Size="Small">
        </asp:Label>
      </div>
    </div>
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22'>موبيل 2 :</label>
        <asp:TextBox ID="Txt_Mobile2" runat="server" class="form-control" AutoPostBack="True"
          OnTextChanged="Txt_Mobile2_TextChanged" MaxLength="11"></asp:TextBox>
        <asp:Image ID="Image12" runat="server" Height="25px" ImageUrl="~/Kafala/Kid/w.png" Width="25px"
          ImageAlign="Top" />
        <asp:CheckBox ID="chk_Mob2" runat="server" />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="Txt_Mobile2"
          Display="Dynamic" ErrorMessage="رقم الموبيل يجب أن يكون 11 رقم" Font-Names="Tahoma" Font-Size="11px"
          ValidationExpression="\d{11}" ForeColor="Red">
        </asp:RegularExpressionValidator>
      </div>
    </div>

  </div>
  <div class="row">
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22'>الشبكة 1 :</label>
        <asp:DropDownList ID="ddl_MobileNetwork1" runat="server" class="form-control chzn-select">
          <asp:ListItem Selected="True" Value="3">أختر </asp:ListItem>
          <asp:ListItem Value="0">فودافون</asp:ListItem>
          <asp:ListItem Value="1">إتصالات</asp:ListItem>
          <asp:ListItem Value="2">اورانج</asp:ListItem>
          <asp:ListItem Value="5">WE</asp:ListItem>
        </asp:DropDownList>
      </div>
    </div>
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22'>الشبكة 2 :</label>
        <asp:DropDownList ID="ddl_MobileNetwork2" runat="server" class="form-control chzn-select">
          <asp:ListItem Selected="True" Value="3">أختر </asp:ListItem>
          <asp:ListItem Value="0">فودافون</asp:ListItem>
          <asp:ListItem Value="1">إتصالات</asp:ListItem>
          <asp:ListItem Value="2">اورانج</asp:ListItem>
          <asp:ListItem Value="5">WE</asp:ListItem>
        </asp:DropDownList>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22'>الإيميل 1 :</label>
        <asp:TextBox ID="Txt_Email1" cssClass='form-control' runat="server"></asp:TextBox>
      </div>
    </div>
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22'>الإيميل 2 :</label>
        <asp:TextBox ID="Txt_Email2" cssClass='form-control' runat="server"></asp:TextBox>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22'>هاتف المنزل :</label>
        <asp:TextBox ID="Txt_Phone" cssClass='form-control' runat="server"></asp:TextBox>
      </div>
    </div>
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22'> كيف تعرفت علينا :</label>
        <asp:DropDownList ID="ddl_HearedAbout" runat="server" class="form-control chzn-select"
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
        </asp:LinqDataSource>&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ForeColor="Red"
          InitialValue="0" ControlToValidate="ddl_HearedAbout" Display="Dynamic"></asp:RequiredFieldValidator>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22'>محل السكن :</label>
        <asp:DropDownList ID="ddl_Governerate" runat="server" class="chzn-select form-control"
          OnDataBound="ddl_Governerate_DataBound" AutoPostBack="True" DataSourceID="sds_Gov"
          DataTextField="GovernerateName" DataValueField="GovID">
          <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;
        <%-- <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>--%>&nbsp;<asp:SqlDataSource ID="sds_Gov"
          runat="server" ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
          SelectCommand="SELECT [GovID], [GovernerateName] FROM [Governerates]"></asp:SqlDataSource>
      </div>
    </div>
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="">&nbsp;</label>
        <asp:DropDownList ID="ddl_Territory" runat="server" class="chzn-select form-control"
          DataSourceID="sds_Territory" DataTextField="TerritoryName" DataValueField="TerritoryID"
          OnDataBound="ddl_Territory_DataBound">
          <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;
        <%-- <asp:ListItem Value="0" Selected="True">اختر</asp:ListItem>--%>
        <asp:Label ID="lbl_Territory" runat="server" Font-Names="Tahoma" ForeColor="Red" Visible="False"
          Font-Size="Small"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ForeColor="Red"
          InitialValue="0" ControlToValidate="ddl_Territory" Display="Dynamic">
        </asp:RequiredFieldValidator>
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
        <label for="" class='font-22'>التبرع بالصفائح :</label>
        <asp:DropDownList ID="ddl_Platelet" runat="server" class="form-control chzn-select">
          <asp:ListItem Value="0">اختر</asp:ListItem>
          <asp:ListItem Value="1">متبرع صفائح</asp:ListItem>
          <asp:ListItem Value="2">مهتم ولم يحاول</asp:ListItem>
          <asp:ListItem Value="3" Selected="True">لم نكلمه بعد</asp:ListItem>
          <asp:ListItem Value="4">لا يصلح أو غير مهتم</asp:ListItem>
        </asp:DropDownList>
      </div>
    </div>
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22'>الوظيفة :</label>
        <asp:DropDownList ID="ddl_Job" runat="server" class="form-control chzn-select" DataSourceID="sds_Jobs"
          DataTextField="JobName" DataValueField="JobID" OnDataBound="ddl_Job_DataBound">
        </asp:DropDownList>
        <asp:SqlDataSource ID="sds_Jobs" runat="server"
          ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
          SelectCommand="SELECT [JobID], [JobName] FROM [Jobs]"></asp:SqlDataSource>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22'>ظروف المتبرع :</label>
        <asp:TextBox ID="Txt_Notes" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>

        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="Txt_Notes"
          ID="RegularExpressionValidator12" ValidationExpression="^[\s\S]{1,100}$" runat="server"
          ErrorMessage="الحد الأقصى للكتابة 100 حرف" ForeColor="Red"></asp:RegularExpressionValidator>
      </div>
    </div>
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22'>تفاصيل الوظيفة :</label>
        <asp:TextBox ID="Txt_JobDetails" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>

        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="Txt_JobDetails"
          ID="RegularExpressionValidator3" ValidationExpression="^[\s\S]{1,100}$" runat="server"
          ErrorMessage="الحد الأقصى للكتابة 100 حرف" ForeColor="Red"></asp:RegularExpressionValidator>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22'>مانع دائم :</label>
        <asp:CheckBox ID="chk_InActive" runat="server" />

      </div>
    </div>
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22'>مستعد للتطوع :</label>
        <asp:CheckBox ID="chk_ready" runat="server" />
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22'>تقييم المتبرع :</label>
        <asp:DropDownList ID="ddl_Evaluation" runat="server" class="chzn-select form-control">
          <asp:ListItem Value="0">اختر</asp:ListItem>
          <asp:ListItem Value="1">مهتم جدا</asp:ListItem>
          <asp:ListItem Value="2">مهتم</asp:ListItem>
          <asp:ListItem Value="3">مقبول</asp:ListItem>
          <asp:ListItem Value="4">غير مهتم</asp:ListItem>
          <asp:ListItem Value="5">لم يقيم بعد</asp:ListItem>
        </asp:DropDownList>
      </div>
    </div>
    <div class="col-md-6 col-12">
      <div class="form-group">
        <label for="" class='font-22'>كفالة :</label>
        <asp:DropDownList ID="ddl_Kafala" runat="server" class="chzn-select form-control" AutoPostBack="True"
          OnSelectedIndexChanged="ddl_Kafala_SelectedIndexChanged">
          <asp:ListItem Value="0">اختر</asp:ListItem>
          <asp:ListItem Value="1">فى مجموعة </asp:ListItem>
          <asp:ListItem Value="2">مهتم وغير متوافق </asp:ListItem>
          <asp:ListItem Value="3" Selected="True">لم نكلمه بعد</asp:ListItem>
          <asp:ListItem Value="4">غير مهتم</asp:ListItem>
          <asp:ListItem Value="5">راغب</asp:ListItem>
        </asp:DropDownList>
      </div>
    </div>
  </div>
  <div class="row">
    <div class=" col-12">
      <div class="form-group">
        <asp:DropDownList ID="ddl_K_ID" runat="server" class="chzn-select" Visible="false" DataSourceID="sds_k_id"
          DataTextField="Kid_ID" DataValueField="Kid_ID" OnDataBound="ddl_K_ID_DataBound">

        </asp:DropDownList>
        <asp:SqlDataSource ID="sds_k_id" runat="server"
          ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
          SelectCommand="SELECT [Kid_ID] FROM [Kid]"></asp:SqlDataSource>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6 col-12">
    </div>
    <div class="col-md-6 col-12 text-left">
      <div class="form-group text-left">
        <asp:Button ID="btn_Save" runat="server" Text="حفظ" OnClick="btn_Save_Click"
          CssClass="btn btn-danger myButton w-25 text-center" />
             <asp:Button ID="btn_Fav" runat="server" Text=" مكان مفضل " OnClick="btn_Fav_Click"
          CssClass="btn btn-success myButton  text-center" CausesValidation="False" />
             <asp:Button ID="btn_Call" runat="server" Text="مكالمة" OnClick="btn_Call_Click"
          CssClass="btn btn-primary myButton  text-center" CausesValidation="False" />
             <asp:Button ID="btn_Donation" runat="server" Text=" تبرع" OnClick="btn_Donation_Click"
          CssClass="btn btn-warning myButton  text-center" CausesValidation="False" />

      </div>
    </div>
  </div>





  <script src="../Scripts/jquery.min.js" type="text/javascript"></script>
  <script src="../Scripts/chosen.jquery.js" type="text/javascript"></script>
  <script
    type="text/javascript">        $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
</asp:Content>