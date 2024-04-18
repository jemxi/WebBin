<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reports.aspx.cs" Inherits="jirro.reports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        /* Body styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            color: #305830;
        }

        /* Container styles */
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Heading styles */
        header {
            background-color: #305830;
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        header h1 {
            margin: 0;
            font-size: 24px;
        }

        /* Navigation styles */
        nav {
            background-color: #305830;
            color: #fff;
            padding: 10px;
            text-align: center;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            padding: 10px;
            margin: 0 5px;
            font-size: 18px;
        }

        nav a:hover {
            background-color: #284d29;
        }

        /* Form container styles */
        .form-container {
            width: 60%;
            background-color: fff;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
            margin-top: 100px; /* Adjust margin top to accommodate header */
        }

        /* Style for labels */
        .form-container label {
            color: #305830;
            display: block; /* Make labels block elements */
            margin-bottom: 5px; /* Add some spacing between labels */
             height: 150px;
        }

        /* Style for textboxes */
        .form-container input[type="text"], 
        .form-container input[type="password"], 
        .form-container textarea,
        .form-container select {
            width: calc(100% - 20px); /* Adjust width to account for padding */
            padding: 10px; /* Add padding */
            border: 2px solid #ccc; /* Add outline border */
            border-radius: 5px; /* Rounded corners */
            margin-bottom: 10px; /* Add some spacing between textboxes */
            outline: none;
            
        }

        /* Style for hyperlinks */
        .form-container a {
            color: #305830;
            margin-right: 10px; /* Add spacing between hyperlinks */
            text-decoration: none;
        }

        .form-container a:last-child {
            margin-right: 0; /* Remove margin from the last hyperlink */
        }
    </style>
</head>
<body>
    <header>
        <h1>WebBin EcoCollect</h1>
        <button id="menuButton">
            <div id="menuIcon">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </button>
    </header>
    <nav>
        <asp:HyperLink ID="linkHome" runat="server" NavigateUrl="~/index.aspx" Text="Home" />
        <asp:HyperLink ID="linkUpdates" runat="server" NavigateUrl="#" Text="Updates" />
        <asp:HyperLink ID="linkSchedule" runat="server" NavigateUrl="~/schedule.aspx" Text="Schedule" />
        <asp:HyperLink ID="linkSubmitReport" runat="server" NavigateUrl="~/submitreport.aspx" Text="Submit Reports" />
        <asp:HyperLink ID="linkAboutUs" runat="server" NavigateUrl="~/aboutus.aspx" Text="About us" />
        <asp:HyperLink ID="linkLogOut" runat="server" NavigateUrl="#" Text="Log Out" />
    </nav>

    <div class="container">
        <form id="form1" runat="server" class="form-container">
            <asp:Label ID="Label1" runat="server" Text="What is your concern?"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>Garbage</asp:ListItem>
                <asp:ListItem>Workers</asp:ListItem>
                <asp:ListItem>Collection</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Others please specify"></asp:Label>
            <asp:TextBox ID="otherstxt" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Explain"></asp:Label>
            <asp:TextBox ID="exptxt" runat="server" TextMode="MultiLine"></asp:TextBox>
        </form>
    </div>
</body>
</html>
