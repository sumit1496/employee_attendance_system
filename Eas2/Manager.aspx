<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="Eas2.Manager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataSourceID="SqlDataSourceREG" GridLines="Horizontal">
    <Columns>
        <asp:BoundField DataField="EmployeeCode" HeaderText="EmployeeCode" SortExpression="EmployeeCode" />
        <asp:BoundField DataField="Fname" HeaderText="Fname" SortExpression="Fname" />
        <asp:BoundField DataField="Mname" HeaderText="Mname" SortExpression="Mname" />
        <asp:BoundField DataField="LaName" HeaderText="LaName" SortExpression="LaName" />
        <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
        <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
        <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
        <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" SortExpression="DateOfBirth" />
        <asp:BoundField DataField="DateOfJoining" HeaderText="DateOfJoining" SortExpression="DateOfJoining" />
        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
        <asp:BoundField DataField="PAddress" HeaderText="PAddress" SortExpression="PAddress" />
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
        <asp:BoundField DataField="ExpectedPeriod" HeaderText="ExpectedPeriod" SortExpression="ExpectedPeriod" />
        <asp:BoundField DataField="SkillSet" HeaderText="SkillSet" SortExpression="SkillSet" />
    </Columns>
    <FooterStyle BackColor="White" ForeColor="#333333" />
    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="White" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F7F7F7" />
    <SortedAscendingHeaderStyle BackColor="#487575" />
    <SortedDescendingCellStyle BackColor="#E5E5E5" />
    <SortedDescendingHeaderStyle BackColor="#275353" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSourceREG" runat="server" ConnectionString="<%$ ConnectionStrings:REGDataConnectionString %>" SelectCommand="SELECT * FROM [tblEmployee]"></asp:SqlDataSource>
</asp:Content>
