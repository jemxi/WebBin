<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createacc.aspx.cs" Inherits="createacc.createacc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Account</title>
    <style>
        /* Centering entire form */
        body {
            background-color: #305830;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            color: #305830;
        }

        /* Centering elements */
        .center {
            text-align: center;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

        /* Custom button style */
        .custom-button {
            background-color: #ffffff;
            color: #305830;
            border: 2px solid #305830;
            border-radius: 5px;
            padding: 10px 20px;
            margin: 10px;
            outline: #CCD5C0;
        }

        .custom-button:hover {
            background-color: #305830;
            color: #ffffff;
        }

        /* Dropdown style */
        .dropdown {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="center">
            <h2>Create Account</h2>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" /><br /><br />
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" /><br /><br />
            <select id="role" name="role" class="dropdown">
                <option value="user">User</option>
                <option value="admin">Admin</option>
            </select><br /><br />
            <input type="submit" value="Submit" class="custom-button" />
            <input type="button" value="Clear" onclick="clearForm()" class="custom-button" />
            <input type="button" value="Cancel" onclick="cancel()" class="custom-button" />
        </div>
    </form>

    <script>
        // Function to clear form fields
        function clearForm() {
            document.getElementById("username").value = "";
            document.getElementById("password").value = "";
        }

        // Function to handle cancel button click
        function cancel() {
            // Redirect to home page or any other page as needed
            window.location.href = "/";
        }
    </script>
</body>
</html>
