<%@ Page Title="من إكسل" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ImportExcel.aspx.cs" Inherits="ImportExcel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">




<asp:FileUpload ID="FileUpload1" runat="server" />

<asp:Button ID="btnUpload" runat="server" Text="Upload"

            OnClick="btnUpload_Click" />

                <asp:Label ID="lbl_Exception" runat="server" Font-Names="Tahoma" 
        ForeColor="Red" Visible="False"
                    Font-Size="Medium"></asp:Label>

<br />

<%--<asp:Label ID="Label1" runat="server" Text="Has Header ?" />

<asp:RadioButtonList ID="rbHDR" runat="server">

    <asp:ListItem Text = "Yes" Value = "Yes" Selected = "True" >

    </asp:ListItem>

    <asp:ListItem Text = "No" Value = "No"></asp:ListItem>

</asp:RadioButtonList>--%>

<asp:GridView ID="GridView1" runat="server"

OnPageIndexChanging = "PageIndexChanging" AllowPaging = "true" >

</asp:GridView>



</asp:Content>

