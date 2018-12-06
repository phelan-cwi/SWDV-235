<%@ Page Title="Borrower" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master"CodeFile="Borrower.aspx.cs" Inherits="Borrower" %>
<%@ MasterType VirtualPath="~/MasterPage.Master" %>
<asp:Content ID="mainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <h1>Borrowers</h1>
<div class="col-xs-12 table-responsive">
    <asp:GridView ID="grdBorrower" runat="server" AllowSorting="True" AutoGenerateColumns="False"
        DataSourceID="SqlDataSource1" AllowPaging="True" width="100%"
        PageSize="5" 
        OnRowUpdated="grdBorrower_RowUpdated" 
        OnRowDeleted="grdBorrower_RowDeleted" 
        OnPreRender="grdBorrower_PreRender"
        DataKeyNames="Borrower_ID">
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
                <asp:BoundField DataField="Borrower_ID" HeaderText="Borrower ID" InsertVisible="False" ReadOnly="True" SortExpression="Borrower_ID" />
                <asp:TemplateField HeaderText="First Name" SortExpression="Borrower_Fname">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFName" runat="server" Text='<%# Bind("Borrower_Fname") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                            runat="server" ErrorMessage="Required" 
                            ControlToValidate="txtFName" CssClass="alert-danger"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Borrower_Fname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Name" SortExpression="Borrower_Lname">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtLName" runat="server" Text='<%# Bind("Borrower_Lname") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
                            runat="server" ErrorMessage="Required"
                            ControlToValidate="txtLName" CssClass="alert-danger"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Borrower_Lname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="Borrower_Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Borrower_Email") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" 
                            runat="server" ErrorMessage="Required"
                            ControlToValidate="txtEmail" CssClass="alert-danger"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Borrower_Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ItemStyle-CssClass="text-right" ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
    </asp:GridView>
        </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:disk_inventoryConnection %>" 
        SelectCommand="SELECT * FROM [Borrower]" 
        DeleteCommand="sp_DeleteBorrower" 
        InsertCommand="sp_InsertBorrower" 
        UpdateCommand="sp_UpdateBorrower" 
        DeleteCommandType="StoredProcedure" 
        InsertCommandType="StoredProcedure" 
        UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Borrower_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Borrower_Fname" Type="String" />
            <asp:Parameter Name="Borrower_Lname" Type="String" />
            <asp:Parameter Name="Borrower_Email" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Borrower_ID" Type="Int32" />
            <asp:Parameter Name="Borrower_Fname" Type="String" />
            <asp:Parameter Name="Borrower_Lname" Type="String" />
            <asp:Parameter Name="Borrower_Email" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <div class="col-xs-9">
        <p><asp:Label ID="lblError" runat="server" EnableViewState="false" 
                        CssClass="text-danger"></asp:Label></p>
    <asp:DetailsView ID="DetailsView1" runat="server"
        DataSourceID="SqlDataSource1"
        DefaultMode="Insert"
        CssClass="table-bordered table-condensed" 
        AutoGenerateRows="False"
        OnItemInserted="DetailsView1_ItemInserted">
        <HeaderStyle BackColor="#99ccff" Font-Size="Larger" Font-Bold="True" Font-Italic="True" Font-Underline="True" />
        <HeaderTemplate>
                    <p>Add A New Borrower</p>
                </HeaderTemplate>
        <Fields>
            <asp:TemplateField HeaderText="First Name" SortExpression="Borrower_Fname"> 
                <InsertItemTemplate>
                    <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("Borrower_Fname") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Text="*" 
                        ErrorMessage="Required" Display="Dynamic" CssClass="alert-danger"
                        ControlToValidate="txtFirstName" ValidationGroup="new">
                    </asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Name" SortExpression="Borrower_Lname">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("Borrower_Lname") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Text="*" 
                        ErrorMessage="Required" Display="Dynamic" CssClass="alert-danger"
                        ControlToValidate="txtLastName" ValidationGroup="new">
                    </asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="Borrower_Email">
                <InsertItemTemplate>
                    <asp:TextBox ID="txtBEmail" runat="server" Text='<%# Bind("Borrower_Email") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" Text="*" 
                        ErrorMessage="Required" Display="Dynamic" CssClass="alert-danger"
                        ControlToValidate="txtBEmail" ValidationGroup="new">
                        </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ErrorMessage="Invalid Email Format" cssClass="alert-danger" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtBEmail" 
                        Display="Dynamic" ValidationGroup="new">
                        </asp:RegularExpressionValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                    HeaderText="Please correct the following errors:" 
                    ValidationGroup="new" CssClass="text-danger" />
        </div>
    <%--put everything in a list and styled in CSS under form-row class to make it line up. No enitrely sure why email doesn't line up 100%
        added quick validation to check for no blank fields. Email has additional validation to make sure valid email is entered. 
        Error messages are displayed in bottom for name, but not email. Personal preference.--%>
    <%--<ul class="wrapper">
     <li class="form-row">   <asp:Label ID="lblFName" runat="server" Text="First Name: "></asp:Label> </li>
      <li class="form-row">  <asp:TextBox ID="txtFName" runat="server"></asp:TextBox> </li>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" text="*" cssClass="alert-danger" ValidationGroup="addValidation" Display="Dynamic" ControlToValidate="txtFName"></asp:RequiredFieldValidator>
        
        
       <li class="form-row"><asp:Label ID="lblLName" runat="server" Text="Last Name: "></asp:Label></li>
       <li class="form-row"> <asp:TextBox ID="txtLName" runat="server" ></asp:TextBox></li>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" text="*" cssClass="alert-danger" ValidationGroup="addValidation" Display="Dynamic" ControlToValidate="txtLName"></asp:RequiredFieldValidator>
         
       
       <li class="form-row"><asp:Label ID="lblEmail" runat="server" Text="Email: "></asp:Label></li>
       <li class="form-row"> <asp:TextBox ID="txtEmail" runat="server" ></asp:TextBox></li>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" text="*" cssClass="alert-danger" ValidationGroup="addValidation" Display="Dynamic" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" cssClass="alert-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" text="Must be valid email." ControlToValidate="txtEmail" Display="Dynamic"></asp:RegularExpressionValidator>
        
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="* means that the field is required" ValidationGroup="addValidation" CssClass="text-danger" />
        <li><asp:Button cssClass="btn btn-default" ID="btnSubmit" runat="server" Text="Add" OnClick="btnSubmit_Click" style="margin-left: 6px" Width="89px" /></li>
        </ul>--%>
</asp:Content>
