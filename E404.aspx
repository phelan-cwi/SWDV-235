<%@ Page Language="C#" Title="Error" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master" CodeFile="E404.aspx.cs" Inherits="E404" %>
<%@ MasterType VirtualPath="~/MasterPage.Master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-danger">An HTTP error has occurred</h1>
    <div class="alert alert-danger">
        <p>The file you requested could not be found.</p>
        <p><b>Please contact customer support.</b></p>
    </div>
</asp:Content>