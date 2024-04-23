<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" /> <!-- Include Font Awesome CSS -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #305830;
            margin: 0;
            padding: 0;
            color: #305830;
            display: flex;
            justify-content: center; 
            align-items: center; 
            height: 100vh; 
        }
        #login-container {
            width: 300px;
            background-color: #fff;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
        }
        #login-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 20px;
            position: relative;
            text-align: center; 
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #305830;
        }
        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: calc(100% - 40px); 
            padding: 10px 10px 10px 40px; 
            border: 2px solid #ccc;
            border-radius: 3px;
            outline: none;
            border-color: #305830; 
            transition: border-color 0.3s; 
        }
        .form-group input[type="text"]:focus,
        .form-group input[type="password"]:focus {
            border-color: #305830; 
        }
       
        .form-group label i {
            position: absolute;
            top: 50%;
            left: 10px; 
            transform: translateY(-50%);
        }
   
        .form-group input[type="submit"],
        .form-group button {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            padding: 10px;
            background-color: #305830;
            color: #fff;
            cursor: pointer;
            border-radius: 3px;
            outline: none;
            width: 100%;
            display: inline-block; 
            margin-bottom: 10px; 
        }
        .form-group input[type="submit"]:hover,
        .form-group button:hover {
            background-color: #0056b3;
        }
   
        .form-group #Label1,
        .form-group #HyperLink1 {
            display: block;
            font-size: 20px; 
            margin: 10px auto;
            color: #305830;
            
        }
        
        .form-group #HyperLink1:hover {
            color: #0056b3; 
        }
        
        #GoogleLoginButton {
            background-color: #fff;
            color: #305830;
            border: 2px solid #305830;
        }
        #GoogleLoginButton:hover {
            background-color: #f0f0f0;
        }
        #GoogleLoginButton i {
            margin-right: 10px;
        }
       
        .admin-login {
            display: inline-block;
            padding: 10px 20px;
            background-color: #305830;
            color: #fff;
            border: 2px solid #305830;
            border-radius: 3px;
            text-decoration: none;
            transition: background-color 0.3s;
            margin-bottom: 10px; 
        }

        .admin-login:hover {
            background-color: #284d29;
        }
    </style>

    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="login-container">
            <h2>Login</h2>
            <div class="form-group">
                <label for="usernametxt"><i class="fas fa-user"></i></label>
                <asp:TextBox ID="usernametxt" runat="server" placeholder="Username"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="pwtxt"><i class="fas fa-lock"></i></label> 
                <asp:TextBox ID="pwtxt" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                
                <div class="g-recaptcha" data-sitekey="6Lei1MIpAAAAAHC3x-MbL_l5LgSYVKyrwY3j25yc"></div>
            </div>
            <div class="form-group">
                <asp:Button ID="loginbtn" runat="server" Text="Login" CssClass="loginbtn" OnClick="Button1_Click" />
                <asp:Button ID="clearbtn" runat="server" OnClick="Button1_Click1" Text="Clear" />
                <asp:Button ID="cancelbtn" runat="server" OnClick="Button2_Click" Text="Cancel" />
                <asp:Button ID="Button1" runat="server" Text="Sign in with Google" OnClick="GoogleLoginButton_Click" />
                <asp:HyperLink ID="HyperLinkAdminLogin" runat="server" NavigateUrl="~/adminlogin.aspx" CssClass="admin-login" Text="Admin as Login" />
            </div>
            <div class="form-group">
               <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/resetpassword.aspx" Text="Forgot Password?" Font-Size="12px" ForeColor="#305830"></asp:HyperLink>
                <asp:Label ID="Label1" runat="server" Text="Don't have an account?" Font-Size="12px" ForeColor="#305830"></asp:Label>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/createacc.aspx" Font-Size="12px" ForeColor="#305830">Create one</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
