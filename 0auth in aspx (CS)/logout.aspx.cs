protected void btnLogout_Click(object sender, EventArgs e)
{
    Context.GetOwinContext().Authentication.SignOut("ApplicationCookie");
    Response.Redirect("/login.aspx");
}