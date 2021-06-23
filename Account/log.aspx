<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="log.aspx.cs" Inherits="Account_log" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
  <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
     
        #style1
        {
            text-align: left;
        }
     
  
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

<table width="100%"  >
<tr>
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
<td class="chzn-rtl">Actions</td>
<td class="style1">
    <asp:DropDownList ID="ddl_Action" runat="server" DataSourceID="SDS_Actions" class="chzn-select"
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
<td class="chzn-rtl">V_ID</td>
<td class="style1">
                <asp:TextBox ID="Txt_V_ID" runat="server" 
                    ></asp:TextBox>
                </td>
<td>&nbsp;</td>
</tr>
<tr>
<td class="chzn-rtl">Actions IN</td>
<td class="style1">
    <asp:DropDownList ID="ddl_IN" runat="server" DataSourceID="SDS_IN" class="chzn-select"
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
<td class="chzn-rtl">From</td>
<td class="style1">
            
                <asp:DropDownList ID="ddl_FromDay" runat="server" Width="80px" 
                    class="chzn-select">
                    <asp:ListItem Selected="True" Value="0">Day</asp:ListItem>
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
                <asp:DropDownList ID="ddl_FromMonth" runat="server" Width="70px" 
                    class="chzn-select">
                    <asp:ListItem Value="0">Month</asp:ListItem>
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
               
                <asp:DropDownList ID="ddl_FromYear" runat="server" Width="70px" 
                    class="chzn-select">
                    <asp:ListItem Value="0" Selected="True">Year</asp:ListItem>
                </asp:DropDownList>
            
            </td>
<td>&nbsp;</td>
</tr>
<tr>
<td class="chzn-rtl">To</td>
<td class="style1">
            
                <asp:DropDownList ID="ddl_ToDay" runat="server" Width="80px" class="chzn-select">
                    <asp:ListItem Selected="True" Value="0">Day</asp:ListItem>
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
                    <asp:ListItem Value="0">Month</asp:ListItem>
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
               
                <asp:DropDownList ID="ddl_ToYear" runat="server" Width="70px" class="chzn-select">
                    <asp:ListItem Value="0" Selected="True">Year</asp:ListItem>
                </asp:DropDownList>
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
</tr>
<tr>
<td  colspan="3" style="text-align: right">
    <asp:Button ID="btn_Delete" runat="server" Text="Delete" onclick="btn_Delete_Click" 
                    CssClass="myButton" Width="66px" 
        meta:resourcekey="btn_SaveResource1" />
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
    </asp:GridView>
    </td>
</tr>
 
 <script src="../Scripts/jquery.min.js" type="text/javascript"></script>
		<script src="../Scripts/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript">		    $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
</table>
 

  <%# Convert.ToDateTime(Eval("ActionDate")).AddHours(10).ToString("dd/MM/yyyy    hh:mm  tt")%>
</asp:Content>
