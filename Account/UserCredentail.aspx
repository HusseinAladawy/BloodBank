<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UserCredentail.aspx.cs" Inherits="Account_UserCredentail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


    <table width="100%"  >
<%--<tr>
<td class="chzn-rtl">users</td>
<td class="style1">
    <asp:DropDownList ID="ddl_User" runat="server" DataSourceID="SDS_Users" class="chzn-select" 
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
<td class="style1">&nbsp;</td>
<td>
    <asp:Button ID="btn_Save" runat="server" Text="Search" onclick="btn_Save_Click" 
                    CssClass="myButton" Width="66px" 
        meta:resourcekey="btn_SaveResource1" />
            </td>
<td>&nbsp;</td>
</tr>--%>
<tr>
<td  colspan="3" style="text-align: right">
    &nbsp;</td>
</tr>
<tr>
<td colspan="3">


   <%-- <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LogID"
        AllowPaging="True" PageSize="100" HeaderStyle-Height="30px"   onrowdatabound="GridView1_RowDataBound"
        OnRowDeleting="GridView1_RowDeleting"
        BackColor="#B01C26" HeaderStyle-ForeColor="White" EmptyDataText="There are no data records to display."
        Width="100%" onpageindexchanging="GridView1_PageIndexChanging">
          <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
           <RowStyle BackColor="#F7CDCD" Height="25px" HorizontalAlign="Center" />
        <Columns>
              <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtn_del" CommandArgument='<%# Eval("LogID") %>' CommandName="Delete"
                                    CausesValidation="false" ForeColor="#B01C26" runat="server">
                             Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
            <asp:BoundField DataField="LogID" HeaderText="LogID" ReadOnly="True" SortExpression="LogID" />
            <asp:BoundField DataField="Action" HeaderText="Action" SortExpression="Action" />
             <asp:BoundField DataField="ActionIN" HeaderText="ActionIN" SortExpression="ActionIN" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
           
            <asp:TemplateField HeaderText="ActionDate">
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
    </asp:GridView>--%>
    <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server"   ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>" SelectCommand="SELECT        dbo.aspnet_Users.UserName, dbo.aspnet_Membership.Password, dbo.aspnet_Membership.Email, dbo.aspnet_Membership.IsApproved, dbo.aspnet_Membership.IsLockedOut, 
                         dbo.aspnet_Membership.FailedPasswordAttemptCount
FROM            dbo.aspnet_Users INNER JOIN
                         dbo.aspnet_Membership ON dbo.aspnet_Users.UserId = dbo.aspnet_Membership.UserId
        order by UserName
        "></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="100" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
          BackColor="#B01C26" HeaderStyle-ForeColor="White" EmptyDataText="There are no data records to display."
        Width="100%" Font-Bold="True">
           <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
           <RowStyle BackColor="#F7CDCD" Height="25px" HorizontalAlign="Center" />
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="FailedPasswordAttemptCount" HeaderText="FailedPasswordAttemptCount" SortExpression="FailedPasswordAttemptCount" />
            <asp:CheckBoxField DataField="IsApproved" HeaderText="IsApproved" SortExpression="IsApproved" />
            <asp:CheckBoxField DataField="IsLockedOut" HeaderText="IsLockedOut" SortExpression="IsLockedOut" />
        </Columns>
          <HeaderStyle ForeColor="White" Height="30px" Wrap="true"></HeaderStyle>
                    <PagerStyle BackColor="#991821" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <AlternatingRowStyle BackColor="White" />
    </asp:GridView>--%>
     <asp:GridView ID="GridView1" runat="server" Font-Bold="true" AutoGenerateColumns="False" DataKeyNames="UserId" HeaderStyle-HorizontalAlign="Center" RowStyle-HorizontalAlign="Left" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowPaging="True" PageSize="100" BackColor="#B01C26" HeaderStyle-ForeColor="White" 
        Width="100%" CellPadding="5" >
          <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
           <RowStyle BackColor="#F7CDCD" Height="25px" HorizontalAlign="Center" />
       
            <Columns>
                
             
                <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" SortExpression="UserName" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
               
                <asp:BoundField DataField="Email" HeaderText="Email"  SortExpression="Email"  ReadOnly="True"/>
             
                <asp:CheckBoxField DataField="IsApproved" HeaderText="IsApproved" SortExpression="IsApproved" />
                <asp:CheckBoxField DataField="IsLockedOut" HeaderText="IsLockedOut" SortExpression="IsLockedOut" />
                <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" ReadOnly="True" DataFormatString="{0:dd/MM/yyyy}"/>
                <asp:BoundField DataField="LastLoginDate" HeaderText="LastLoginDate" SortExpression="LastLoginDate" ReadOnly="True" DataFormatString="{0:dd/MM/yyyy}"/>
                <asp:BoundField DataField="LastPasswordChangedDate" HeaderText="LastPasswordChangedDate" SortExpression="LastPasswordChangedDate" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="LastLockoutDate" HeaderText="LastLockoutDate" SortExpression="LastLockoutDate" ReadOnly="True" DataFormatString="{0:dd/MM/yyyy}"/>
                <asp:BoundField DataField="FailedPasswordAttemptCount" HeaderText="FailedPasswordAttemptCount" SortExpression="FailedPasswordAttemptCount" ReadOnly="True"/>
             
                <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment" />
                <asp:CommandField CancelText="الغاء" EditText="تعديل" CausesValidation="false" HeaderText="تعديل" 
                                        ShowEditButton="True" UpdateText="حفظ">
                                        <ControlStyle Font-Underline="True" ForeColor="#B01C26" />
                                    </asp:CommandField>
              </Columns>
      <HeaderStyle ForeColor="White" Height="30px" Wrap="true"></HeaderStyle>
                    <PagerStyle BackColor="#991821" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="White" />
       
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
            DeleteCommand="DELETE FROM [aspnet_Membership] WHERE [UserId] = @UserId" 
            
           
            SelectCommand="
            SELECT dbo.aspnet_Users.UserName, dbo.aspnet_Membership.[UserId], [Password],[LoweredEmail] as Email,  [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAnswerAttemptCount], [Comment] FROM [aspnet_Membership]
            INNER JOIN            dbo.aspnet_Users 
                          ON dbo.aspnet_Users.UserId = dbo.aspnet_Membership.UserId
						  order by UserName  "
            UpdateCommand="UPDATE [aspnet_Membership] SET  [Password] = @Password, [IsApproved] = @IsApproved, [IsLockedOut] = @IsLockedOut,  [Comment] = @Comment WHERE [UserId] = @UserId
            ">
           
       
            <UpdateParameters>
               
                <asp:Parameter Name="Password" Type="String" />
        
                <asp:Parameter Name="IsApproved" Type="Boolean" />
                <asp:Parameter Name="IsLockedOut" Type="Boolean" />
            
            
                <asp:Parameter Name="Comment" Type="String" />
                <asp:Parameter Name="UserId" Type="Object" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </td>
</tr>


 

        

        <script src="../Scripts/jquery.min.js" type="text/javascript"></script>
		<script src="../Scripts/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript">		    $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
</table>
 

</asp:Content>

