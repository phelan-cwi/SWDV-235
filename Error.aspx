<%@ Page Language="C#"  Title="Error" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master" CodeFile="Error.aspx.cs" Inherits="Error" %>
<%@ MasterType VirtualPath="~/MasterPage.Master" %>
<asp:Content ID="mainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h1 class="text-danger">An error has occurred</h1>
    <div class="alert alert-danger">
        <p><b>Please contact database admin for assistance.</b></p>
    </div>
</asp:Content>