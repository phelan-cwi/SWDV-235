<%@ Page Title="Checkout" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master"CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>
<%@ MasterType VirtualPath="~/MasterPage.Master" %>
<asp:Content ID="mainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <h1 class="text-center">Welcome</h1>
        <p><asp:Label ID="lblError" runat="server" 
            EnableViewState="False" 
            CssClass="text-danger"></asp:Label></p>
    <div>
    <h3 class="text-center">What do you wish to checkout?!</h3>
    <div class="col-xs-12 table-responsive" style="left: 311px; top: -5px; width: 79%">
        <asp:Label ID="Label5" runat="server" Text="Disk"></asp:Label>
        <asp:DropDownList ID="ddlDisk" runat="server" DataSourceID="SqlDataSource1" DataTextField="Disk_Name" DataValueField="Disk_Name">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryConnection %>" SelectCommand="SELECT Disk_Name
FROM dbo.[Disk] INNER JOIN dbo.diskHasBorrower ON dbo.[Disk].Disk_ID = dbo.diskHasBorrower.Disk_ID WHERE (dbo.[Disk].LendedStatus = 'In')"></asp:SqlDataSource>
        <br />
        <asp:Label ID="lblWho" runat="server" Text="Borrower"></asp:Label>
        <asp:DropDownList ID="ddlBorrower" runat="server" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="Name">
        </asp:DropDownList>
        <asp:Label ID="Label4" runat="server" Text="(If you don't see yourself, please add in borrower page)"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryConnection %>" SelectCommand="SELECT CONCAT(Borrower_FName, Borrower_LName) as Name FROM dbo.Borrower"></asp:SqlDataSource>
        <br />
        <asp:Label ID="lblDate" runat="server" Text="Date"></asp:Label>
        <asp:TextBox ID="txtCheckout" runat="server" TextMode="Date"></asp:TextBox>
        <br />
        <asp:Button ID="btnCheckOut" runat="server" Text="Check out" cssClass="btn btn-default" OnClick="btnCheckOut_Click"/>
        </div>
    </div>
</div>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="headPlaceHolder">
    </asp:Content>

