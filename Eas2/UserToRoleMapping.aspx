<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="UserToRoleMapping.aspx.cs" Inherits="Eas2.UserToRoleMapping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<p align="center"> 

     <asp:Label ID="ActionStatus" runat="server" CssClass="Important"></asp:Label> 
</p>--%>
    <h3>Manage Users By Roles</h3>

    <p>
        <b>Select a Role :</b>
        <asp:DropDownList ID="RoleList" runat="server"
            DataTextField="RoleName" DataValueField="RoleId">
        </asp:DropDownList>
    </p>
    <%--<p> 
     <asp:Repeater ID="UsersRoleList" runat="server"> 
          <ItemTemplate> 
               <asp:CheckBox runat="server" ID="RoleCheckBox" AutoPostBack="true" 

                    Text='<%# Container.DataItem %>' /> 
               <br /> 
          </ItemTemplate> 
     </asp:Repeater> 
</p>--%>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EmployeeId" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox runat="server" ID="ck1" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="EmployeeId" HeaderText="EmployeeId" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeId" />
            <asp:BoundField DataField="EmployeeCode" HeaderText="EmployeeCode" SortExpression="EmployeeCode" />
            <asp:BoundField DataField="Fname" HeaderText="Fname" SortExpression="Fname" />
            <asp:BoundField DataField="Mname" HeaderText="Mname" SortExpression="Mname" />
            <asp:BoundField DataField="LaName" HeaderText="LaName" SortExpression="LaName" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" SortExpression="DateOfBirth" />
            <asp:BoundField DataField="DateOfJoining" HeaderText="DateOfJoining" SortExpression="DateOfJoining" />
            <asp:BoundField DataField="ActiveInactive" HeaderText="ActiveInactive" SortExpression="ActiveInactive" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
            <asp:BoundField DataField="SkillSet" HeaderText="SkillSet" SortExpression="SkillSet" />

        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:REGDataConnectionString %>" SelectCommand="SELECT [EmployeeId], [EmployeeCode], [Fname], [Mname], [LaName], [UserName], [CompanyName], [Gender], [DateOfBirth], [DateOfJoining], [ActiveInactive], [Email], [PhoneNumber], [SkillSet] FROM [tblEmployee]"></asp:SqlDataSource>
    <asp:Button ID="btnAssign" runat="server" Text="Assign role" OnClick="btnAssign_Click" />
</asp:Content>

