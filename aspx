<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: linear-gradient(45deg, #305830, #4cff00);
            margin: 0;
            padding: 0;
            color: #305830;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        #login-container {
            width: 320px;
            background-color: #fff;
            border-radius: 30px;
            border-top-right-radius: 0;
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

        .form-group button {
            margin: 5px; 
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #305830;
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
        }
        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 10px 10px 10px 40px;
            border: 2px solid #ccc;
            border-radius: 20px;
            outline: none;
            border-color: #305830;
            transition: border-color 0.3s, transform 0.3s;
            box-sizing: border-box;
        }
        .form-group input[type="text"]:hover,
        .form-group input[type="password"]:hover {
            transform: scale(1.05);
        }
        .form-group input[type="text"]:focus,
        .form-group input[type="password"]:focus {
            border-color: #305830;
            transform: scale(1.1);
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
            width: calc(33.33% - 5px);
            transition: background-color 0.3s, transform 0.3s;
        }
        .form-group input[type="submit"]:hover,
        .form-group button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
        .form-group input[type="submit"]:active,
        .form-group button:active {
            transform: scale(0.95);
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
        .GoogleButton {
            display: block;
            text-align: center;
            width: 100%;
            margin: 10px auto 0;
            margin-top: -10px;
        }
        .GoogleButton button {
            background-color: transparent;
            color: #305830;
            border: none;
            padding: 0;
            cursor: pointer;
            border-radius: 3px;
            transition: background-color 0.3s, transform 0.3s;
            margin-top: -10px;
        }
        .GoogleButton button:hover {
            background-color: #f0f0f0;
            transform: scale(1.05);
        }
        .GoogleButton button:active {
            transform: scale(0.95);
        }
        .GoogleButton i {
            margin-right: 10px;
        }
        .admin-login {
            display: inline-block;
            padding: 10px 20px;
            background-image: linear-gradient(#000080, #4800ff, #0096FF, #00c0ff);
            border-radius: 10px;
            border: 1px solid #4800ff;
            transition: background-color 0.3s, transform 0.3s;
            color: white;
            text-decoration: none;
        }
        .admin-login:hover {
            transform: scale(1.05);
        }
        .admin-login:active {
            transform: scale(0.95);
        }
        .password-container {
            position: relative;
        }
        .password-container .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
        }
        .input-error {
            border-color: red !important;
        }

        .error-message {
            display: none;
            color: red;
            text-align: center;
            margin-top: 5px;
        }


    </style>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="login-container">
            <h2>Login</h2>

         <asp:Label ID="ErrorMessageLabel" runat="server" CssClass="error-message" Visible="false"></asp:Label>


            <div class="form-group">
                <label for="usernametxt"><i class="fas fa-user"></i></label>
                <asp:TextBox ID="usernametxt" runat="server" placeholder="Username"></asp:TextBox>
            </div>
            <div class="form-group password-container">
                <label for="pwtxt"><i class="fas fa-lock"></i></label>
                <asp:TextBox ID="pwtxt" runat="server" TextMode="Password" placeholder="Password" CssClass="password-textbox"></asp:TextBox>
                <i id="togglePasswordIcon" class="fas fa-eye toggle-password" onclick="togglePassword()"></i>
            </div>
            <div class="form-group">
                <div class="g-recaptcha" data-sitekey="6Lei1MIpAAAAAHC3x-MbL_l5LgSYVKyrwY3j25yc"></div>
            </div>
            <div class="form-group">
                <asp:Button ID="loginbtn" runat="server" Text="Login" CssClass="loginbtn" OnClick="Button1_Click" />
                <asp:Button ID="clearbtn" runat="server" OnClick="Button1_Click1" Text="Clear" />
                <asp:Button ID="cancelbtn" runat="server" OnClick="Button2_Click" Text="Cancel" />
                <asp:HyperLink ID="HyperLinkAdminLogin" runat="server" NavigateUrl="adminlogin.aspx" CssClass="admin-login" Text="Login as Admin" />
            </div>
            <div class="GoogleButton">
                <asp:Button ID="Button2" runat="server" Text="Sign in with Google" OnClick="GoogleLoginButton_Click" />
            </div>
            <div class="form-group">
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/resetpassword.aspx" Text="Forgot Password?" Font-Size="12px" ForeColor="#FF0000"></asp:HyperLink>
                <asp:Label ID="Label1" runat="server" Text="Don't have an account?" Font-Size="12px" ForeColor="#305830"></asp:Label>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/createacc.aspx" Font-Size="12px" ForeColor="#0000FF">Create one</asp:HyperLink>
            </div>
        </div>
    </form>
    <script>
        function togglePassword() {
            var pwField = document.getElementById('<%= pwtxt.ClientID %>');
            var pwToggle = document.getElementById('togglePasswordIcon');
            if (pwField.type === "password") {
                pwField.type = "text";
                pwToggle.classList.remove('fa-eye');
                pwToggle.classList.add('fa-eye-slash');
            } else {
                pwField.type = "password";
                pwToggle.classList.remove('fa-eye-slash');
                pwToggle.classList.add('fa-eye');
            }
        }
    </script>
</body>
</html>
