using System;
using System.Web.UI;
using MySql.Data.MySqlClient;
using BCrypt.Net;
using Microsoft.Owin.Security;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void GoogleLoginButton_Click(object sender, EventArgs e)
        {
            Context.GetOwinContext().Authentication.Challenge(new AuthenticationProperties
            {
                RedirectUri = "/GoogleCallback.aspx"
            }, "Google");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = "server=localhost;database=WEC;uid=root;pwd=";
            string username = MaskUsername(usernametxt.Text);
            string password = pwtxt.Text;
            string recaptchaResponse = Request.Form["g-recaptcha-response"];
            string redirectUrl = "/"; // URL to redirect after login
            Context.GetOwinContext().Authentication.Challenge(
                new Microsoft.Owin.Security.AuthenticationProperties { RedirectUri = redirectUrl },
                "Google");
            if (IsValidRecaptcha(recaptchaResponse))
            {
                if (IsValidLogin(connectionString, username, password))
                {
                    string successScript = "alert('Login successful!');";
                    ClientScript.RegisterStartupScript(this.GetType(), "loginSuccess", successScript, true);

                    ClearTextBoxes();
                    Response.Redirect("home.aspx");
                }
                else
                {
                    string errorScript = "alert('Invalid username or password!');";
                    ClientScript.RegisterStartupScript(this.GetType(), "loginError", errorScript, true);

                    ClearTextBoxes();
                }
            }
            else
            {
                string errorScript = "alert('Please complete the verification!');";
                ClientScript.RegisterStartupScript(this.GetType(), "captchaError", errorScript, true);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Ensure the user is authenticated on page load
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("/login.aspx");
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
