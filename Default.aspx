﻿<%@ Page Title="Home" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master"CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ MasterType VirtualPath="~/MasterPage.Master" %>
<asp:Content ID="mainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <h1 class="text-center">Welcome</h1>
        <p><asp:Label ID="lblError" runat="server" 
            EnableViewState="False" 
            CssClass="text-danger"></asp:Label></p>
    <div>
    <h3>Choose a page, behold the information</h3>

        </div>
    </div>
</asp:Content>
