﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Kafala/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Kafala_Help_Type_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            color: #B01C26;
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table dir="rtl" align="right" width="100%">
        <tr>
            <td>
                <table dir="rtl" align="right" width="100%">
                    <tr>
                        <td >
                            &nbsp;
                        </td>
                        <td class="style1" >
                             نوع المساعدة</td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                  
                    <tr>
                        <td >
                            &nbsp;</td>
                        <td >
              
           
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                  
                    <tr>
                        <td width="10%" >
                            أسم المساعدة</td>
                        <td >
              
           
                            &nbsp;<asp:TextBox ID="txt_HelpType" runat="server" Font-Names="Tahoma"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_HelpType" ErrorMessage="*"
                                Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td >
                            &nbsp;</td>
                        <td >
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td >
                            &nbsp;
                        </td>
                        <td >
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btn_Save" runat="server" OnClick="btn_Save_Click" Text="حفظ" BorderStyle="Solid"
                                Font-Bold="True" Font-Names="Tahoma" Height="24px" Width="59px" 
                                CssClass="myButton" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td >
                            &nbsp;</td>
                        <td >
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                
                         
                
                            <asp:SqlDataSource ID="sds_HelpType" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:BloodBankConnectionString %>"
                                 DeleteCommand="DELETE FROM [Help_Type] WHERE [HelpTypeID] = @HelpTypeID
                                " 
                        
                                SelectCommand="SELECT [HelpTypeID], [HelpName] FROM [Help_Type]" 
                                UpdateCommand="UPDATE [Help_Type] SET [HelpName] = @HelpName WHERE [HelpTypeID] = @HelpTypeID">
                                <DeleteParameters>
                                    <asp:Parameter Name="HelpTypeID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="HelpTypeID" Type="Int32" />
                                    <asp:Parameter Name="HelpName" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="HelpName" Type="String" />
                                    <asp:Parameter Name="HelpTypeID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="HelpTypeID" DataSourceID="sds_HelpType" GridLines="None" RowStyle-HorizontalAlign="Center"
                    EmptyDataText="There are no data records to display." ForeColor="#333333" 
                    Width="50%" onrowdatabound="GridView1_RowDataBound">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#F7CDCD" Height="25px" />
                    <Columns>
                        

                      <%--  <asp:BoundField DataField="TypeID" HeaderText="TypeID" ReadOnly="True" 
                            SortExpression="TypeID" />--%>
                        <asp:BoundField DataField="HelpName" HeaderText="نوع المساعدة" SortExpression="HelpName" />
                          <asp:CommandField CancelText="الغاء" EditText="تعديل" CausesValidation="false" HeaderText="تعديل"
                                        ShowEditButton="True" UpdateText="حفظ">
                                        <ControlStyle Font-Underline="True" ForeColor="#B01C26" />
                                    </asp:CommandField>
                                    <asp:TemplateField HeaderText="حذف">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtn_del" CommandArgument='<%# Eval("HelpTypeID") %>' CommandName="Delete" CausesValidation="false"
                                  ForeColor="#B01C26"   runat="server">
                             حذف</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                    </Columns>
                      <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#B01C26" Font-Bold="True" ForeColor="White" 
                                    Height="30px" />
                                <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
