using System;
using System.Web.UI;
using MySql.Data.MySqlClient;
using BCrypt.Net;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = "server=localhost;database=WEC;uid=root;pwd=";
            string username = MaskUsername(usernametxt.Text);
            string password = pwtxt.Text;
            string recaptchaResponse = Request.Form["g-recaptcha-response"];

            if (IsValidRecaptcha(recaptchaResponse))
            {
                if (IsValidLogin(connectionString, username, password))
                {
                    string successScript = "alert('Login successful!');";
                    ClientScript.RegisterStartupScript(this.GetType(), "loginSuccess", successScript, true);

                    ClearTextBoxes();
                    Response.Redirect("dashboard.aspx");
                }
                else
                {
                    // Display the error message near the Password textbox
                    ErrorMessageLabel.Text = "Invalid password. Please try again.";
                    ErrorMessageLabel.Visible = true;

                    // Mark the password textbox with an error class
                    pwtxt.CssClass += " input-error";
                }

            }
            else
            {
                ShowErrorMessage("Please complete the verification!");
            }
        }


        private bool IsValidLogin(string connectionString, string username, string password)
        {
            string hashedPasswordFromDB = GetHashedPassword(connectionString, username);

            if (hashedPasswordFromDB == null)
            {
                return false;
            }

            // Compare the stored hashed password with the entered password using bcrypt
            return BCrypt.Net.BCrypt.Verify(password, hashedPasswordFromDB);
        }

        private string GetHashedPassword(string connectionString, string username)
        {
            string query = "SELECT password FROM login WHERE username = @username";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@username", username);

                    connection.Open();
                    object result = command.ExecuteScalar();

                    return result != null ? result.ToString() : null;
                }
            }
        }

        private string MaskUsername(string username)
        {
            if (string.IsNullOrEmpty(username)) return username;

            int maskLength = Math.Min(3, username.Length - 1);
            return new string('*', username.Length - maskLength) + username.Substring(username.Length - maskLength);
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            ClearTextBoxes();
        }

        private void ClearTextBoxes()
        {
            usernametxt.Text = "";
            pwtxt.Text = "";
            pwtxt.CssClass = pwtxt.CssClass.Replace(" input-error", "");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string script = "window.close();";
            ClientScript.RegisterStartupScript(this.GetType(), "closeWindow", script, true);
        }

        private bool IsValidRecaptcha(string recaptchaResponse)
        {
            string secretKey = "6Lei1MIpAAAAAJLNM6n4IcEhhPT3bQoEF0yp7bLe";
            string apiUrl = $"https://www.google.com/recaptcha/api/siteverify?secret={secretKey}&response={recaptchaResponse}";

            using (var client = new System.Net.WebClient())
            {
                var response = client.DownloadString(apiUrl);
                dynamic jsonData = Newtonsoft.Json.JsonConvert.DeserializeObject(response);
                return jsonData.success == "true";
            }
        }

        private string GetGoogleAuthenticationUrl()
        {
            string clientId = "702979049352-2frh4i6gvphgr4o2cagddc56tdreomch.apps.googleusercontent.com";
            string redirectUri = "https://localhost:44329/home";
            string scope = "email profile openid";

            string url = $"https://accounts.google.com/o/oauth2/auth?" +
                         $"client_id={clientId}&" +
                         $"redirect_uri={redirectUri}&" +
                         $"scope={scope}&" +
                         $"response_type=code";

            return url;
        }

        protected void GoogleLoginButton_Click(object sender, EventArgs e)
        {
            Response.Redirect(GetGoogleAuthenticationUrl());
        }

        private void ShowErrorMessage(string message)
        {
            string errorScript = $"alert('{message}');";
            ClientScript.RegisterStartupScript(this.GetType(), "loginError", errorScript, true);
        }

        private void MarkTextBoxesWithError()
        {
            pwtxt.CssClass += " input-error";
        }
    }
}
