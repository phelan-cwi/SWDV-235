<%@ Page Title="Currently Out" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master"CodeFile="Current.aspx.cs" Inherits="Cart" %>
<%@ MasterType VirtualPath="~/MasterPage.Master" %>
<asp:Content ID="mainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <h1 class="text-center">Welcome</h1>
    <div>
    <h3>Here's the who, what, and when</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%">
            <RowStyle BackColor="WhiteSmoke" Font-Italic="True" /> 
        <EmptyDataRowStyle BackColor="Red" /> 
        <PagerStyle BackColor="Control" Font-Italic="True" Font-Underline="True" />                
        <SelectedRowStyle BackColor="#33ccff" Font-Bold="True" Font-Italic="True" /> 
        <EditRowStyle BackColor="WhiteSmoke" /> 
        <AlternatingRowStyle BackColor="#99ccff" BorderColor="Black" BorderStyle="Dashed" BorderWidth="1px" /> 
        <FooterStyle BackColor="Black" /> 
        <HeaderStyle BackColor="Black" Font-Size="Larger" Font-Bold="True" Font-Italic="True" Font-Underline="True" />
            <Columns>
                <asp:BoundField DataField="Disk_Name" HeaderText="Disk_Name" SortExpression="Disk_Name" />
                <asp:BoundField DataField="Borrower_Name" HeaderText="Borrower_Name" SortExpression="Borrower_Name" />
                <asp:BoundField DataField="Borrower_Date" HeaderText="Borrower_Date" SortExpression="Borrower_Date" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryConnection %>" SelectCommand="SELECT Disk_Name, Borrower_Name, Borrower_Date FROM dbo.CheckedOut"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
