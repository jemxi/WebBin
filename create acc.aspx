using System;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.UI;
using MySql.Data.MySqlClient;
using BCrypt.Net;

namespace WebApplication1
{
    public partial class createacc : Page
    {
        // Define your MySQL connection string
        string connectionString = "server=localhost;database=WEC;uid=root;pwd=";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Event handler for submit button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = usernametxt.Text;
            string phoneNumber = phoneno.Text; // Get phone number from the input field
            string password = pwtxt.Text;
            string address = addresstxt.Text; // Get address from the input field

            // Mask sensitive information before further processing
            string maskedUsername = MaskSensitiveInfo(username);
            string maskedPhoneNumber = MaskSensitiveInfo(phoneNumber);
            string maskedAddress = MaskSensitiveInfo(address);

            // Check if reCAPTCHA is successfully verified
            if (!IsCaptchaVerified())
            {
                // Display error message if reCAPTCHA verification fails
                successLabel.Text = "Please verify reCAPTCHA!";
                successLabel.ForeColor = System.Drawing.Color.Red;
                successLabel.Visible = true;
                return;
            }

            // Check password strength
            suggestStrongPassword();

            // If password does not meet expectations, return without inserting data
            if (passwordRequirementLabel.Visible)
            {
                return;
            }

            InsertUser(maskedUsername, maskedPhoneNumber, maskedAddress, password);

            ClearTextBoxes();
        }

        // Function to check if reCAPTCHA is successfully verified
        private bool IsCaptchaVerified()
        {
            string captchaResponse = Request.Form["g-recaptcha-response"];
            if (string.IsNullOrEmpty(captchaResponse))
            {
                return false;
            }

            // Validate reCAPTCHA response using Google's API
            string secretKey = "6Lei1MIpAAAAAJLNM6n4IcEhhPT3bQoEF0yp7bLe"; // Your reCAPTCHA secret key
            string apiUrl = $"https://www.google.com/recaptcha/api/siteverify?secret={secretKey}&response={captchaResponse}";
            using (var wc = new System.Net.WebClient())
            {
                var json = wc.DownloadString(apiUrl);
                dynamic result = Newtonsoft.Json.JsonConvert.DeserializeObject(json);
                return result.success;
            }
        }

        // This method inserts the username, password, phone number, and address into your database
        private void InsertUser(string username, string phoneNumber, string address, string password)
        {
            // Check if username already exists
            if (UsernameExists(username))
            {
                // Show error message if username already exists
                successLabel.Text = "Account already exists!";
                successLabel.ForeColor = System.Drawing.Color.Red;
                successLabel.Visible = true;
                return; // Exit method
            }

            // Hash the password before storing it
            string hashedPassword = HashPassword(password);

            // SQL query to insert username, hashed password, phone number, and address into your login table
            string query = "INSERT INTO login (username, password, phoneno, address) VALUES (@username, @password, @phoneno, @address)";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@username", username);
                    command.Parameters.AddWithValue("@phoneno", phoneNumber);
                    command.Parameters.AddWithValue("@address", address);
                    command.Parameters.AddWithValue("@password", hashedPassword);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }

            // Show success message
            successLabel.Text = "You Finally Created your account!";
            successLabel.ForeColor = System.Drawing.Color.Green;
            successLabel.Visible = true;

            // Redirect user to the next form after a short delay (if needed)
            Response.AddHeader("REFRESH", "2;URL=WebForm1.aspx"); // Redirect after 2 seconds, change "WebForm1.aspx" to the actual URL of the next form
        }

        // Hash the password using BCrypt
        private string HashPassword(string password)
        {
            return BCrypt.Net.BCrypt.HashPassword(password);
        }

        // This method checks if the username already exists in the database
        private bool UsernameExists(string username)
        {
            string query = "SELECT COUNT(*) FROM login WHERE username = @username";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@username", username);

                    connection.Open();
                    int count = Convert.ToInt32(command.ExecuteScalar());

                    return count > 0;
                }
            }
        }

        // Event handler for clear button click
        protected void Button1_Click1(object sender, EventArgs e)
        {
            ClearTextBoxes();
        }

        // Clear all textboxes
        private void ClearTextBoxes()
        {
            usernametxt.Text = "";
            pwtxt.Text = "";
            phoneno.Text = "";
            addresstxt.Text = "";
        }

        // Function to suggest a strong password
        private void suggestStrongPassword()
        {
            // Check if the password contains at least one uppercase letter, one lowercase letter, one number, and one special character
            string password = pwtxt.Text;
            var uppercaseRegex = new Regex("[A-Z]");
            var lowercaseRegex = new Regex("[a-z]");
            var numberRegex = new Regex("[0-9]");
            var specialCharacterRegex = new Regex("[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?]+");

            var isValid = true;
            if (!uppercaseRegex.IsMatch(password) || !lowercaseRegex.IsMatch(password) || !numberRegex.IsMatch(password) || !specialCharacterRegex.IsMatch(password))
            {
                isValid = false;
            }

            if (!isValid)
            {
                // Display password requirement label
                passwordRequirementLabel.Text = "Password must include at least one uppercase letter, one lowercase letter, one number, and one special character!";
                passwordRequirementLabel.Visible = true;
            }
            else
            {
                // Hide password requirement label
                passwordRequirementLabel.Visible = false;
            }
        }

        // Event handler for cancel button click
        protected void Button2_Click(object sender, EventArgs e)
        {
            string script = "window.close();";
            ClientScript.RegisterStartupScript(this.GetType(), "closeWindow", script, true);
        }

        // Function to mask sensitive information
        private string MaskSensitiveInfo(string input)
        {
            if (string.IsNullOrEmpty(input))
                return "";

            int length = input.Length;
            string maskedString = new string('*', length);
            return maskedString;
        }
    }
}
