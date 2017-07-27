<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Eas2.Home" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:REGDataConnectionString %>" SelectCommand="select EmployeeId from tblAttendanceDetails group by EmployeeId"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:REGDataConnectionString %>" SelectCommand="select month(LoginDate) as monthDate from tblAttendanceDetails group by month(LoginDate)"></asp:SqlDataSource>     
        Select Month:     
        <%--<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="EmployeeId" DataValueField="EmployeeId" ></asp:DropDownList>--%>
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="monthDate" DataValueField="monthDate" ></asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="Get Chart" OnClick="Button1_Click" />
<hr />
<cc1:BarChart ID="BarChart1" runat="server" ChartHeight="300" ChartWidth = "450"
    ChartType="Column" ChartTitleColor="#0E426C"
    CategoryAxisLineColor="#D08AD9" ValueAxisLineColor="#D08AD9" BaseLineColor="#A156AB" ValueAxisLines="6">
</cc1:BarChart>
   
    </div>
    
</asp:Content>
