<%@ Page Title="Disk" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master"CodeFile="Disk.aspx.cs" Inherits="Disk" %>
<%@ MasterType VirtualPath="~/MasterPage.Master" %>
<asp:Content ID="mainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Disks</h1>
    <div class="col-xs-12 table-responsive">
    <asp:GridView ID="grdDisk" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" AllowPaging="True" 
        AllowSorting="True" PageSize="5" 
        DataKeyNames="Disk_ID" width="100%" 
        OnRowUpdated="grdDisk_RowUpdated" 
        OnRowDeleted="grdDisk_RowDeleted" 
        OnPreRender="grdDisk_PreRender">
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
            <asp:TemplateField HeaderText="Disk_ID" InsertVisible="False" SortExpression="Disk_ID">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Disk_ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Disk_Name" SortExpression="Disk_Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txtDiskName" runat="server" Text='<%# Bind("Disk_Name") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtDiskName" Display="Dynamic"
                       cssClass="alert-danger" runat="server" ErrorMessage="Required" ValidationGroup="edit"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Disk_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Relase_Date" SortExpression="Relase_Date">
                <EditItemTemplate>
                    <asp:TextBox ID="txtDate" runat="server" Text='<%# Bind("Relase_Date")%>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="requiredDate" ControlToValidate="txtDate" Display="Dynamic" 
                        cssClass="alert-danger" runat="server" ErrorMessage="Required" ValidationGroup="edit"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Relase_Date", "{0:M-dd-yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LendedStatus" SortExpression="LendedStatus">
                <EditItemTemplate>
                    <asp:TextBox ID="txtStatus" runat="server" MaxLength="3" Text='<%# Bind("LendedStatus") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="requiredStatus" ControlToValidate="txtStatus" Display="Dynamic" MaxLength="3" 
                        cssClass="alert-danger" runat="server" ErrorMessage="Required" ValidationGroup="edit"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("LendedStatus") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ItemStyle-CssClass="text-right" ShowEditButton="True" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
  </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:disk_inventoryConnection %>" 
        SelectCommand="SELECT * FROM [Disk]"
        DeleteCommand="sp_DeleteDisk" 
        DeleteCommandType="StoredProcedure" 
        InsertCommand="sp_InsertDisk"  
        UpdateCommand="sp_UpdateDisk" InsertCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Disk_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Disk_Name" Type="String" />
            <asp:Parameter Name="Relase_Date" />
            <asp:Parameter Name="LendedStatus" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Disk_ID" Type="Int32" />
            <asp:Parameter Name="Disk_Name" Type="String" />
            <asp:Parameter Name="Relase_Date" />
            <asp:Parameter Name="LendedStatus" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <div class="col-xs-9">
        <p><asp:Label ID="lblError" runat="server" 
            EnableViewState="False" 
            CssClass="text-danger"></asp:Label></p>
        <asp:DetailsView ID="DetailsView1" runat="server" 
            AutoGenerateRows="False" 
            DefaultMode="Insert"
            CssClass="table-bordered table-condensed" 
            DataSourceID="SqlDataSource1" DataKeyNames="Disk_ID" OnItemInserted="DetailsView1_ItemInserted">
            <HeaderStyle BackColor="#99ccff" Font-Size="Larger" Font-Bold="True" Font-Italic="True" Font-Underline="True" />
        <HeaderTemplate>
                    <p>Add A New Disk</p>
                </HeaderTemplate>
            <Fields>
                <asp:TemplateField HeaderText="Disk Name" SortExpression="Disk_Name">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtNameInsert" runat="server" Text='<%# Bind("Disk_Name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtNameInsert" runat="server" 
                            ErrorMessage="Name Required" cssClass="alert-danger" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Release Date" SortExpression="Relase_Date">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtDateInsert" runat="server" Text='<%# Bind("Relase_Date") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDateInsert" 
                            ErrorMessage="Date Required" cssClass="alert-danger" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status" SortExpression="LendedStatus">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtStatusInsert" runat="server" MaxLength="3" Text='<%# Bind("LendedStatus") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtStatusInsert" MaxLength="3" 
                            ErrorMessage="Status Required" cssClass="alert-danger" Display="Dynamic" ValidationGroup="insert"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        </div>
</asp:Content>
