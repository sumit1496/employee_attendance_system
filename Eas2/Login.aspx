<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Eas2.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
    
    body
    {
    background:#ccc;
    
    }
    .formclass
    
    {
        padding:20px;
        margin:0px auto;
        background:#fff;
        width:200px;
        
    }
    h2
    {
        text-align:center;
    }
    
    .input
    {
        padding:2px;       
       
        width:100%;
    }
        .auto-style1 {
            padding: 20px;
            margin: 0px auto;
            background: #fff;
            width: 200px;
            height: 200px;
        }
    </style>



</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
    <h2> Login Page</h2>
        <asp:TextBox ID="txtuser" CssClass="input" placeholder="User Name" runat="server"></asp:TextBox><br /><br />
        
        <asp:TextBox ID="txtpass" CssClass="input" placeholder="Password" TextMode="Password"
            runat="server"></asp:TextBox><br /><br />
        <asp:Button ID="btnlogin" CssClass="input" Width="100%"  runat="server" 
            Text="Login" onclick="btnlogin_Click" />
            <br />
            <asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>
