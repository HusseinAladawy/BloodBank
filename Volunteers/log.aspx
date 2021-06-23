<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="log.aspx.cs" Inherits="Account_log" %>

<%@ Register assembly="RadCalendar.Net2" namespace="Telerik.WebControls" tagprefix="radCln" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
     
        #style1
        {
            text-align: left;
        }
     
  
         
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

<table width="100%" dir="rtl" >
<tr>
<td class="chzn-rtl">المستخدم</td>
<td class="style1">
    <asp:DropDownList ID="ddl_User" runat="server" DataSourceID="SDS_Users"  class="form-control chosen-select" Width="200px"
        DataTextField="UserName" DataValueField="UserId" 
        ondatabound="ddl_User_DataBound">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SDS_Users" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>" 
        SelectCommand="SELECT [UserId], [UserName] FROM [vw_aspnet_Users]">
    </asp:SqlDataSource>
    </td>
<td>&nbsp;</td>
</tr>
<tr>
<td class="chzn-rtl">الفعل </td>
<td class="style1">
    <asp:DropDownList ID="ddl_Action" runat="server" DataSourceID="SDS_Actions"  class="form-control chosen-select" Width="200px"
        DataTextField="Action" DataValueField="Action" 
        ondatabound="ddl_Action_DataBound">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SDS_Actions" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>" 
        SelectCommand=" SELECT distinct [Action] FROM [Log]"></asp:SqlDataSource>
    </td>
<td>&nbsp;</td>
</tr>
    <tr>
<td class="chzn-rtl">صفحة الفعل</td>
<td class="style1">
    <asp:DropDownList ID="ddl_IN" runat="server" DataSourceID="SDS_IN"  class="form-control chosen-select"  Width="200px"
        DataTextField="ActionIN" DataValueField="ActionIN" 
        ondatabound="ddl_IN_DataBound">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SDS_IN" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>" 
        SelectCommand="SELECT distinct [ActionIN] FROM [Log]"></asp:SqlDataSource>
    </td>
<td>&nbsp;</td>
</tr>
<tr>
<td class="chzn-rtl">VID</td>
<td class="style1">
                <asp:TextBox ID="Txt_V_ID" runat="server"   class="form-control"  Width="200px"
                    ></asp:TextBox>
                </td>
<td>&nbsp;</td>
</tr>

<tr>
<td class="chzn-rtl">من</td>
<td class="style1">
            
           

                <radCln:RadDatePicker ID="dt_From" runat="server" Culture="ar-EG" Font-Size="Medium"  Width="200px" >
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


            </td>
<td>&nbsp;</td>
</tr>
<tr>
<td class="chzn-rtl">إلى</td>
<td class="style1">
            
           

                <radCln:RadDatePicker ID="dt_To" runat="server" Culture="ar-EG" Font-Size="Medium"  Width="200px">
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


            </td>
<td>&nbsp;</td>
</tr>
<tr>
<td class="style1">&nbsp;</td>
<td>
    <asp:Button ID="btn_Save" runat="server" Text="بحث" onclick="btn_Save_Click" 
                    CssClass="myButton" Width="66px" 
        meta:resourcekey="btn_SaveResource1" />
            </td>
<td>&nbsp;</td>
</tr>
<tr>
<td  colspan="3" style="text-align: right">
                <asp:Label ID="lbl_Report" runat="server" Font-Size="Medium" 
                    ForeColor="Black" Visible="False"></asp:Label>
            </td>
</tr>
<tr>
<td colspan="3">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LogID"
        AllowPaging="True" PageSize="100" HeaderStyle-Height="30px"   onrowdatabound="GridView1_RowDataBound"
        OnRowDeleting="GridView1_RowDeleting"
        BackColor="#B01C26" HeaderStyle-ForeColor="White" EmptyDataText="There are no data records to display."
        Width="100%" onpageindexchanging="GridView1_PageIndexChanging">
          <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
           <RowStyle BackColor="#F7CDCD" Height="25px" HorizontalAlign="Center" />
        <Columns>
            
            <asp:BoundField DataField="LogID" HeaderText="LogID" ReadOnly="True" SortExpression="LogID" />
            <asp:BoundField DataField="Action" HeaderText="الفعل" SortExpression="Action" />
             <asp:BoundField DataField="ActionIN" HeaderText="صفحة الفعل" SortExpression="ActionIN" />
            <asp:BoundField DataField="UserName" HeaderText="اسم المستخدم" SortExpression="UserName" />
           
            <asp:TemplateField HeaderText="تاريخ الفعل">
            <ItemTemplate>
             <%# Convert.ToDateTime(Eval("ActionDate")).AddHours(10).ToString("dd/MM/yyyy    hh:mm  tt")%>
            </ItemTemplate>
            </asp:TemplateField>
           
            <asp:BoundField DataField="VID" HeaderText="VID" SortExpression="VID" />
        </Columns>
      <HeaderStyle ForeColor="White" Height="30px" Wrap="true"></HeaderStyle>
                    <PagerStyle BackColor="#991821" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    </td>
</tr>
 
 <script src="../Scripts/jquery.min.js" type="text/javascript"></script>
		<script src="../Scripts/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript">		    $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
</table>
 

  <%# Convert.ToDateTime(Eval("ActionDate")).AddHours(10).ToString("dd/MM/yyyy    hh:mm  tt")%>
</asp:Content>
