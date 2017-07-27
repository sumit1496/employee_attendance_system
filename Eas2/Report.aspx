<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="Eas2.Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 212px;
        }
        .auto-style4 {
            width: 104px;
        }
        .auto-style5 {
            width: 224px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">Employee Id:</td>
            <td class="auto-style5">
                <asp:Label ID="lblid" runat="server"></asp:Label>
            </td>
            <td class="auto-style4">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">Start Date:</td>
            <td class="auto-style5">
                <asp:TextBox ID="TextBoxstart" runat="server" TextMode="DateTime"></asp:TextBox>
            </td>
            <td class="auto-style4">End Date:</td>
            <td>
                <asp:TextBox ID="TextBoxend" runat="server" TextMode="DateTime"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style5">
                <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" />
            </td>
            <td class="auto-style4">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table class="auto-style1">
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="False">
                    <Columns>
            <asp:BoundField DataField="EmployeeId" 
                HeaderText="EmployeeId" 
                InsertVisible="False" ReadOnly="True" 
                SortExpression="EmployeeId" />
            <asp:BoundField DataField="LoginDate" 
                HeaderText="LoginDate" 
                SortExpression="LoginDate" 
                DataFormatString="{0:MM/dd/yyyy}" />
            <asp:BoundField DataField="Logintime" 
                HeaderText="Logintime" 
                SortExpression="Logintime" 
                DataFormatString="{0:hh:mm:ss tt}" />
            <asp:BoundField DataField="Logoutime" 
                HeaderText="Logoutime" 
                SortExpression="Logoutime" 
                DataFormatString="{0:hh:mm:ss tt}" />
            <asp:BoundField DataField="Remarks" 
                HeaderText="Remarks" 
                SortExpression="Remarks" />
        </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                    
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
