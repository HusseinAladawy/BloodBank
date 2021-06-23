<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>نشاط إنقاذ حياة</title>
    <link href="Images/Icon.ico" type="image/x-icon" rel="shortcut icon" />
    <link rel="stylesheet" href="Styles/bootstrap.min.css" />
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Tajawal&display=swap" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-4 text-center">
                    <img src="Images/Logo.png" style="width: 50%;" />
                </div>
                <div class="col-md-4">
                    <h1 class="login-head1">نشــاط إنقــاذ حيــاة</h1>
                </div>
                <div class="col-md-2"></div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <asp:Login ID="LoginUser" runat="server" EnableViewState="false" DestinationPageUrl="~/default.aspx" CssClass="login-form">
                        <LayoutTemplate>
                            <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                            <%--<asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification"
                        ValidationGroup="LoginUserValidationGroup" />--%>
                            <div class="form-group d-block">
                                <label>اسم المستخدم:</label>
                                <asp:TextBox ID="UserName" runat="server" CssClass="form-control w-98 d-inline"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group d-block">
                                <label>كلمة المرور:</label>
                                <asp:TextBox ID="Password" runat="server" CssClass="form-control w-98 d-inline" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group text-center">
                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="دخول" CssClass="btn btn-primary w-50" ValidationGroup="LoginUserValidationGroup" />
                            </div>

                        </LayoutTemplate>
                    </asp:Login>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>

        <footer>
            <div class="container">
                <div class="row flex-row-reverse">
                    <div class="col-12 text-center">
                        نشــاط إنقــاذ حيــاة | Developed by Hussein Abdel Gawad
                    </div>
                </div>
            </div>
        </footer>

    </form>
</body>
</html>
