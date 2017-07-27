<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Company.aspx.cs" Inherits="Eas2.Company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="0" <%--cellpadding="0" cellspacing="0"--%>>
        <tr>
            <th colspan="3">Company
            </th>
        </tr>
        <tr>
            <td>Name
            </td>
            <td>
                <asp:TextBox ID="txtname" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ErrorMessage="Enter a name" ForeColor="Red" ControlToValidate="txtname"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td>Address
            </td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" />
            </td>
            <td>
                <asp:RequiredFieldValidator ErrorMessage="Enter the address" ForeColor="Red" ControlToValidate="txtAddress"
                    runat="server" />
            </td>
        </tr>

        <tr>
            <td>Contact
            </td>
            <td>
                <asp:TextBox ID="txtContact" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ErrorMessage="Enter the contact" ForeColor="Red"
                    ControlToValidate="txtContact" runat="server" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button Text="Submit" runat="server" OnClick="RegisterCompany" />
            </td>
            <td></td>
        </tr>
    </table>
</asp:Content>
