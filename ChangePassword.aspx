<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="ChangePassword.aspx.cs" Inherits="Account_ChangePassword" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
  <div style="text-align:center">
    <h2>
      تغيير كلمة المرور</h2>
    <p>
      كلمة المرور لابد ألا تقل عن ثلاثة رموز/أرقام/أحرف </p>
    <div align="center">
      <asp:ChangePassword ID="ChangeUserPassword" runat="server" CancelDestinationPageUrl="~/" EnableViewState="false"
        SuccessPageUrl="ChangePasswordSuccess.aspx">
        <ChangePasswordTemplate>
          <span class="failureNotification">
            <asp:Literal ID="FailureText" runat="server"></asp:Literal>
          </span>
          <asp:ValidationSummary ID="ChangeUserPasswordValidationSummary" runat="server" CssClass="failureNotification"
            ValidationGroup="ChangeUserPasswordValidationGroup" />
          <div class="accountInfo">
            <fieldset class="changePassword">
              <legend>معلومات الحساب</legend>
              <p>
                <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword" Width="115px">
                  كلمة المرور الحالية</asp:Label>
                <asp:TextBox ID="CurrentPassword" runat="server" CssClass="passwordEntry" TextMode="Password">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server"
                  ControlToValidate="CurrentPassword" CssClass="failureNotification" ErrorMessage="كلمة المرور مطلوبة."
                  ToolTip="Old Password is required." ValidationGroup="ChangeUserPasswordValidationGroup">*
                </asp:RequiredFieldValidator>
              </p>
              <p>
                <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword" Width="133px">كلمة
                  المرور الجديدة</asp:Label>
                <asp:TextBox ID="NewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword"
                  CssClass="failureNotification" ErrorMessage="New Password is required."
                  ToolTip="كلمة المرور الجديدة مطلوبة." ValidationGroup="ChangeUserPasswordValidationGroup">*
                </asp:RequiredFieldValidator>
              </p>
              <p>
                <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword"
                  Width="158px">تأكيد كلمة المرور</asp:Label>
                <asp:TextBox ID="ConfirmNewPassword" runat="server" CssClass="passwordEntry" TextMode="Password">
                </asp:TextBox>
                <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server"
                  ControlToValidate="ConfirmNewPassword" CssClass="failureNotification" Display="Dynamic"
                  ErrorMessage="Confirm New Password is required." ToolTip="Confirm New Password is required."
                  ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword"
                  ControlToValidate="ConfirmNewPassword" CssClass="failureNotification" Display="Dynamic"
                  ErrorMessage="تأكيد كلمة المرور يجب ان يطابق كلمة المرور."
                  ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:CompareValidator>
              </p>
            </fieldset>
            <p class="submitButton">
              <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="إلغاء" />
              &nbsp;
              <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword" Text="تغيير"
                ValidationGroup="ChangeUserPasswordValidationGroup" />
            </p>
          </div>
        </ChangePasswordTemplate>
      </asp:ChangePassword>
    </div>
  </div>
</asp:Content>