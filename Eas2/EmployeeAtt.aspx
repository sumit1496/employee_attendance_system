<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="EmployeeAtt.aspx.cs" Inherits="Eas2.User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: right;
            width: 103px;
        }
        .auto-style3 {
            width: 103px;
        }
        .auto-style4 {
            width: 192px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<form id="form2" runat="server">
        <asp:Login ID="Login1" runat="server" OnAuthenticate="ValidateUser"></asp:Login>
    </form>--%>
    <%--<form id="form2" runat="server">--%>
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">Username</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtUsername" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ErrorMessage="Enter the username" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Password</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtPassword" runat="server" Width="180px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter the paasword" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">
                <asp:Button ID="Button1" runat="server"  OnClick="ValidateUser" Text="Login" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">
                <asp:Label ID="Label1" runat="server" ForeColor="Red" Width="218px"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
   <%--</form>--%>

</asp:Content>
