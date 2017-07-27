<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="Eas2.Employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            text-align: right;
            width: 210px;
        }

        .auto-style6 {
            width: 192px;
        }

        .auto-style7 {
            text-align: right;
            width: 210px;
            height: 26px;
        }

        .auto-style8 {
            width: 192px;
            height: 26px;
        }

        .auto-style9 {
            height: 26px;
            text-align: left;
            width: 531px;
        }

        .auto-style10 {
            text-align: left;
            width: 531px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">Employee Code</td>
            <td aria-setsize="180px" class="auto-style6">
                <asp:TextBox ID="TextBoxEC" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td class="auto-style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="TextBoxEC" ErrorMessage="Please Enter The Employee Code" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Employee First Name</td>
            <td aria-setsize="180px" class="auto-style6">
                <asp:TextBox ID="TextBoxEF" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td class="auto-style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxEF" ErrorMessage="Enter the first name" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Employee Middle Name</td>
            <td aria-setsize="180px" class="auto-style8">
                <asp:TextBox ID="TextBoxEM" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td class="auto-style9"></td>
        </tr>
        <tr>
            <td class="auto-style2">Employee Last Name</td>
            <td aria-setsize="180px" class="auto-style6">
                <asp:TextBox ID="TextBoxEL" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td class="auto-style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxEL" ErrorMessage="Enter the last name" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">User Name</td>
            <td aria-setsize="180px" class="auto-style6">
                <asp:TextBox ID="TextBoxUN" runat="server" Width="180px" OnTextChanged="TextBoxUN_TextChanged"></asp:TextBox>
            </td>
            <td class="auto-style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBoxUN" ErrorMessage="Enter the user name" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <%--<tr>
            <td>
                <asp:textbox runat="server" id="txtpasswordwithNoUpperCharacter">
                    <asp:regularexpressionvalidator display="Dynamic" id="RegularExpressionValidator2" errormessage="Password must be 8-10 characters long with at least one numeric,</br> one alphabet and one special character." forecolor="Red" validationexpression="(?=^.{8,10}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+}{":;'?/>.<,])(?!.*\s).*$" controltovalidate="txtpasswordwithNoUpperCharacter" runat="server">
                    </asp:regularexpressionvalidator></asp:textbox>
            </td>
        </tr>--%>        <%--<tr>
            <td class="auto-style7">Password</td>
            <td aria-setsize="180px" class="auto-style8">
                <asp:TextBox ID="TextBoxpassword" runat="server" Width="180px" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style9">
                <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxpassword" ErrorMessage="Password must be 8-10 characters long with at least one numeric,</br> one alphabet and one special character." ForeColor="Red" ValidationExpression="(?=^.{8,10}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+}{":;'?/>.<,])(?!.*\s).*$"></asp:RegularexpressionValidator>
            </td>
        </tr>--%>
        <tr>
            <td class="auto-style2">Password</td>
            <td aria-setsize="180px" class="auto-style6">
                <asp:TextBox ID="TextBoxpassword" runat="server" Width="180px" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style10">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxpassword" ErrorMessage="Password must be 8-10 characters long with at least one numeric,&lt;/br&gt; one alphabet and one special character" ForeColor="red" ValidationExpression="(?=^.{8,10}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&amp;*()_+}{&quot;:;'?/&gt;.&lt;,])(?!.*\s).*$"></asp:RegularExpressionValidator>
            </td>
        </tr>
         <tr>
            <td class="auto-style2">Confirm Password</td>
            <td aria-setsize="180px" class="auto-style6">
                <asp:TextBox ID="TextBoxRPass" runat="server" Width="180px" TextMode="Password"></asp:TextBox>
            </td>
            <td class="auto-style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="TextBoxRPass" ErrorMessage="Again enter the password" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBoxpassword" ErrorMessage="Both password must be the same" ForeColor="Red" ControlToValidate="TextBoxRPass"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Company Name</td>
            <td aria-setsize="180px" class="auto-style8">
                <asp:DropDownList ID="DropDownListCN" DataTextField="Name" DataValueField="CompanyId" runat="server" Width="180px">
                    <asp:ListItem>Select Company</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownListCN" ErrorMessage="Choose the country name" ForeColor="Red" InitialValue="Select Company"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Gender</td>
            <td aria-setsize="180px" class="auto-style6">
                <asp:DropDownList ID="DropDownListG" runat="server" Width="180px">
                    <asp:ListItem>Select Gender</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DropDownListG" ErrorMessage="Select the gender " ForeColor="Red" InitialValue="Select Gender"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td class="auto-style2">Date of Birth</td>
            <td aria-setsize="180px" class="auto-style6">
                <asp:TextBox ID="TextBoxCal" runat="server" TextMode="Date" Width="180px"></asp:TextBox>
            </td>
            <td class="auto-style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="TextBoxCal" ErrorMessage="Select the date of birth" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Date of Joining</td>
            <td aria-setsize="180px" class="auto-style6">
                <asp:TextBox ID="TextBoxJoin" runat="server" TextMode="Date" Width="180px"></asp:TextBox>
            </td>
            <td class="auto-style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="TextBoxJoin" ErrorMessage="Select the date of joining" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Local Address</td>
            <td aria-setsize="180px" class="auto-style6">
                <asp:TextBox ID="TextBoxAdd" runat="server" Height="60px" TextMode="MultiLine" Width="180px"></asp:TextBox>
            </td>
            <td class="auto-style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="TextBoxAdd" ErrorMessage="Enter the local address" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Select if Local address is same as permanent address<asp:CheckBox ID="chkSameasLocal" runat="server" AutoPostBack="true" OnCheckedChanged="chkSameasLocal_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Permanent Address</td>
            <td aria-setsize="180px" class="auto-style6">
                <asp:TextBox ID="TextBoxPAdd" runat="server" Height="60px" TextMode="MultiLine" Width="180px"></asp:TextBox>
            </td>
            <td class="auto-style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="TextBoxPAdd" ErrorMessage="Enter the permanent address" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td class="auto-style7">Email Address</td>
            <td aria-setsize="180px" class="auto-style8">
                <asp:TextBox ID="TextBoxEMAIL" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td class="auto-style9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBoxEMAIL" ErrorMessage="Enter the email address" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEMAIL" ErrorMessage="Enter a valid Email Id" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Phone Number</td>
            <td aria-setsize="180px" class="auto-style6">
                <asp:TextBox ID="TextBoxPHN" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td class="auto-style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="TextBoxPHN" ErrorMessage="Enter the phone number" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Expected Period Of Employment</td>
            <td aria-setsize="180px" class="auto-style6">
                <asp:TextBox ID="TextBoxPERIOD" runat="server" Width="180px"></asp:TextBox>
                (in months)</td>
            <td class="auto-style10">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="TextBoxPERIOD" ErrorMessage="Enter the expected period of employment" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Skill Set</td>
            <td aria-setsize="180px" class="auto-style8">
                <asp:DropDownList ID="DropDownListSKILL" runat="server" Width="180px">
                    <asp:ListItem>Select Skill</asp:ListItem>
                    <asp:ListItem>C/C++</asp:ListItem>
                    <asp:ListItem>C#</asp:ListItem>
                    <asp:ListItem>Python</asp:ListItem>
                    <asp:ListItem>Java</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" BorderStyle="None" ControlToValidate="DropDownListSKILL" ErrorMessage="Select the skill" ForeColor="Red" InitialValue="Select Skill"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Active/Inactive</td>
            <td aria-setsize="180px" class="auto-style8">
                <asp:CheckBox ID="Chkbox"  runat="server" />
            </td>
            <td class="auto-style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td aria-setsize="180px" class="auto-style8">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save" />
                <asp:Button ID="Button2" runat="server" Text="Reset" OnClientClick="this.form.reset();return false;" OnClick="Button2_Click" />
            </td>
            <td class="auto-style9">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
