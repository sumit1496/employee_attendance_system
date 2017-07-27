<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="Eas2.Attendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 194px;
            text-align: left;
        }
        .auto-style4 {
            width: 222px;
        }
        .auto-style5 {
            text-align: right;
            width: 340px;
        }
        .auto-style6 {
            width: 340px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table class="auto-style1">
        <tr>
            <td class="auto-style3">Welcome in the system:</td>
            <td class="auto-style4">
                <asp:Label ID="lblAttendance"  runat="server" Text="Label"></asp:Label>
            </td>
            <td class="auto-style6">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">Date:</td>
            <td class="auto-style4">
                <asp:Label ID="lblDate"  runat="server" Text="Label"></asp:Label>
            </td>
            <td class="auto-style6">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">Login Time:</td>
            <td class="auto-style4">
                <asp:Label ID="lblLogin"  runat="server"></asp:Label>
            </td>
            <td class="auto-style5">Logout Time:</td>
            <td>
                <asp:Label ID="lblLogout"  runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Remarks:</td>
            <td class="auto-style4">
                <asp:TextBox ID="TextBoxRemarks" runat="server"  TextMode="MultiLine"></asp:TextBox>
                
            </td>
            <td class="auto-style6">
                <asp:Label ID="lblremarks" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:Button ID="Button2" runat="server" Text="Approval Request" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">
                <asp:Button ID="btnLogin" runat="server" ValidationGroup="submit" Text="Login(Daily Attendance)" OnClick="btnLogin_Click" />
                <%--<asp:TextBox ID="txtLogin" runat="server"></asp:TextBox>--%>
            </td>
           <%-- <td class="auto-style6">
                <asp:Button ID="btnLogout" runat="server" Text="Logout(Daily Attendance)" OnClick="btnLogout_Click" />
            </td>--%>
            <td class="auto-style6">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
