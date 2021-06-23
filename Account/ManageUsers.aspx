<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<br />
<br />
    <table width="100%">
        <tr>
            <td style="text-align: left" class="style1">
   
                <asp:Label ID="lbl_UserName" runat="server" Font-Size="Large" ForeColor="#991821"></asp:Label>
                <br />
    <asp:CheckBoxList ID="chkl_Roles" runat="server" AutoPostBack="True" 
                ontextchanged="chkl_Roles_TextChanged">
    </asp:CheckBoxList>
                <asp:DataList ID="dl_Users" runat="server" DataKeyField="UserId" 
        DataSourceID="sds_Users" EnableTheming="True" 
        oneditcommand="dl_Users_EditCommand" CellPadding="4" ForeColor="#333333" 
                    ondeletecommand="dl_Users_DeleteCommand">
        
        <AlternatingItemStyle BackColor="White" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#F7CDCD" />
        
        <ItemTemplate>
     
       
            <asp:Label ID="lbl_UserName" runat="server" Text='<%#Eval("UserName")%>' Width="200px"></asp:Label> 
       
      
     
      |
            <asp:LinkButton ID="lnkbtn_Edit" CommandName="Edit"  ForeColor="#B01C26"
                CommandArgument='<%#Eval("UserName")%>' runat="server" 
              >Edit Roles</asp:LinkButton> |
                
            <asp:LinkButton ID="lnkbtn_Delete" CommandName="Delete"  ForeColor="#B01C26"
                CommandArgument='<%#Eval("UserName")%>' runat="server"  
              >Delete User</asp:LinkButton>|
      
        </ItemTemplate>
        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>
                </td>
        </tr>
        </table>

    
    <br />
   
    <asp:SqlDataSource ID="sds_Users" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>" SelectCommand="SELECT [ApplicationId]
      ,[UserId]
      ,[UserName]
      ,[LoweredUserName]
      ,[MobileAlias]
      ,[IsAnonymous]
      ,[LastActivityDate]
  FROM [aspnet_Users]"></asp:SqlDataSource>
</asp:Content>

