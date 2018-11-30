<%@ Page Title="Borrower" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master"CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ MasterType VirtualPath="~/MasterPage.Master" %>
<asp:Content ID="mainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--put everything in a list and styled in CSS under form-row class to make it line up. No enitrely sure why email doesn't line up 100%
        added quick validation to check for no blank fields. Email has additional validation to make sure valid email is entered. 
        Error messages are displayed in bottom for name, but not email. Personal preference.--%>
    <ul class="wrapper">
     <li class="form-row">   <asp:Label ID="lblFName" runat="server" Text="First Name: "></asp:Label> 
        <asp:TextBox ID="txtFName" runat="server" Width="244px"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" text="*" cssClass="alert-danger"  Display="Dynamic" ControlToValidate="txtFName"></asp:RequiredFieldValidator>
        </li>
        
       <li class="form-row"><asp:Label ID="lblLName" runat="server" Text="Last Name: "></asp:Label>
        <asp:TextBox ID="txtLName" runat="server" Width="244px"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" text="*" cssClass="alert-danger" Display="Dynamic" ControlToValidate="txtLName"></asp:RequiredFieldValidator>
        </li> 
       
       <li class="form-row"><asp:Label ID="lblEmail" runat="server" Text="Email: "></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server" Width="244px"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" text="*" cssClass="alert-danger" Display="Dynamic" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" text="Must be valid email." ControlToValidate="txtEmail" Display="Dynamic"></asp:RegularExpressionValidator>
        </li>
        <li class="form-row">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="* means that the field is required" CssClass="text-danger" />
        </li>
        <li class=""><asp:Button cssClass="btn btn-default" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /></li>
        </ul>
</asp:Content>
