<%@ Page Title="Artist" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master"CodeFile="Artist.aspx.cs" Inherits="Artist" %>
<%@ MasterType VirtualPath="~/MasterPage.Master" %>
<asp:Content ID="mainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Artists</h1>

    <div class="col-xs-12 table-responsive">
    <asp:gridview ID="grdArtist" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
        DataKeyNames="Artist_ID" 
        DataSourceID="SqlDataSource1" PageSize="5" 
        Width="100%" OnRowUpdated="grdArtist_RowUpdated" OnRowDeleted="grdArtist_RowDeleted" OnPreRender="grdArtist_PreRender">
        <RowStyle BackColor="WhiteSmoke" Font-Italic="True" /> 
        <EmptyDataRowStyle BackColor="Red" /> 
        <PagerStyle BackColor="Control" Font-Italic="True" Font-Underline="True" />                
        <SelectedRowStyle BackColor="#33ccff" Font-Bold="True" Font-Italic="True" /> 
        <EditRowStyle BackColor="WhiteSmoke" /> 
        <AlternatingRowStyle BackColor="#99ccff" BorderColor="Black" BorderStyle="Dashed" BorderWidth="1px" /> 
        <FooterStyle BackColor="Black" /> 
        <HeaderStyle BackColor="Black" Font-Size="Larger" Font-Bold="True" Font-Italic="True" Font-Underline="True" />
        <Columns> <%-- The above formats the grid into a more pleasing look. Choose to do asp style editing instead of
                        css for no real reason.--%>
            <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="Artist_ID">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Artist_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Artist Name" SortExpression="Arist_Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txtArtistName" runat="server" Text='<%# Bind("Arist_Name") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtArtistName" cssClass="alert-danger" Display="Dynamic" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Arist_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField  ItemStyle-CssClass="text-right" ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:gridview>
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:disk_inventoryConnection %>" 
        DeleteCommand="sp_DeleteArtist" DeleteCommandType="StoredProcedure" 
        InsertCommand="sp_InsertArtist" InsertCommandType="StoredProcedure"
        SelectCommand="SELECT * FROM Artist" 
        UpdateCommand="sp_UpdateArtist" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Artist_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Arist_Name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Artist_ID" Type="Int32" />
            <asp:Parameter Name="Arist_Name" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <p><asp:Label ID="lblError" runat="server" EnableViewState="false" 
                        CssClass="text-danger"></asp:Label></p>

    <div class="col-xs-9">

        <asp:DetailsView ID="DetailsView1" runat="server" 
            AutoGenerateRows="False" 
            DefaultMode="Insert"
            CssClass="table-bordered table-condensed" 
            DataSourceID="SqlDataSource1" OnItemInserted="DetailsView1_ItemInserted" DataKeyNames="Arist_ID">
            <HeaderStyle BackColor="#99ccff" Font-Size="Larger" Font-Bold="True" Font-Italic="True" Font-Underline="True" />
        <HeaderTemplate>
                    <p>Add A New Artist</p>
                </HeaderTemplate>
        <Fields>
            <asp:BoundField DataField="Artist_ID" HeaderText="Artist_ID" InsertVisible="False" ReadOnly="True" SortExpression="Artist_ID" />
            <asp:TemplateField HeaderText="Artist Name" SortExpression="Arist_Name">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtANameInsert" runat="server" Text='<%# Bind("Arist_Name") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="nameInsertValidate" runat="server" ControlToValidate="txtANameInsert" CssClass="alert-danger" Display="Dynamic"
                        ErrorMessage="Name Required" ValidationGroup="insert"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
        <asp:ValidationSummary runat="server" ValidationGroup="insert" HeaderText="Please enter required information"></asp:ValidationSummary>
        </div>
</asp:Content>
