<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Role.aspx.cs" Inherits="Eas2.Role" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <th colspan="3">Role
            </th>
        </tr>
        <tr>
            <td>Role Name
            </td>
            <td>
                <asp:TextBox ID="txtrolename" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ErrorMessage="Enter a role name" ForeColor="Red" ControlToValidate="txtrolename"
                    runat="server" />
            </td>
        </tr>
        

        <tr>
            <td>Created by
            </td>
            <td>
                <asp:TextBox ID="txtcreatedby" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ErrorMessage="Enter the name of the creator" ForeColor="Red"
                    ControlToValidate="txtcreatedby" runat="server" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button Text="Submit" runat="server" OnClick="RoleCreated" />
            </td>
            <td></td>
        </tr>
    </table>
</asp:Content>
