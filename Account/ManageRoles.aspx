<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ManageRoles.aspx.cs" Inherits="ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

  <br />
  <br />
    <table width="100%" dir="rtl" >
   <tr align="center" >
            <td style="text-align: center">  <asp:Label ID="lbl_RoleName" runat="server" 
                 ></asp:Label>
   
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr dir="rtl">
            <td colspan="2">
   
                <asp:CheckBoxList ID="chkl_Users" runat="server" AutoPostBack="True" 
                ontextchanged="chkl_Users_TextChanged" BorderColor="Black" 
                 >
    </asp:CheckBoxList>
            </td>
        </tr>
       
        <tr>
            <td colspan="2">
   
     <asp:DataList ID="dl_Roles" runat="server" DataKeyField="RoleId" 
        DataSourceID="sds_Roles"  Width="500px" EnableTheming="True" 
        oneditcommand="dl_Roles_EditCommand" CellPadding="4" ForeColor="#333333" 
                    ondeletecommand="dl_Roles_DeleteCommand">
        
        <AlternatingItemStyle BackColor="White" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#EFF3FB" />
        
        <ItemTemplate>
     
       
            
       |
      <asp:LinkButton ID="lnkbtn_Delete" CommandName="Delete" 
                CommandArgument='<%#Eval("RoleName")%>' runat="server"  
              >Delete Role</asp:LinkButton>
     
      |
            <asp:LinkButton ID="lnkbtn_Edit" CommandName="Edit" 
                CommandArgument='<%#Eval("RoleName")%>' runat="server" 
              >Edit Uses</asp:LinkButton> |
                
            
       <asp:Label ID="lbl_RoleName" runat="server" Text='<%#Eval("RoleName")%>' Width="200px"></asp:Label>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>
            </td>
        </tr>
       
    </table>

    
    <br />
   
    <asp:SqlDataSource ID="sds_Roles" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>" SelectCommand="SELECT [ApplicationId]
      ,[RoleId]
      ,[RoleName]
      ,[LoweredRoleName]
      ,[Description]
  FROM [aspnet_Roles]"></asp:SqlDataSource>
</asp:Content>

