using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Checkout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // Code that uses the data entered by the user
            // Define data objects
            SqlConnection conn;
            SqlCommand Lended;
            SqlCommand CheckedOut;

            // Read the connection string from Web.config
            string connectionString =
                ConfigurationManager.ConnectionStrings[
                "disk_inventoryConnection"].ConnectionString;
            // Initialize connection
            conn = new SqlConnection(connectionString);
            // Create command 
            Lended = new SqlCommand("UPDATE Disk Set LendedStatus = 'Out' WHERE Disk_Name = @ddlDisk", conn);
            Lended.Parameters.Add("@ddlDisk", System.Data.SqlDbType.VarChar, 20);
            Lended.Parameters["@ddlDisk"].Value = ddlDisk.SelectedValue;

            CheckedOut = new SqlCommand("Insert INTO CheckedOut(Disk_Name, Borrower_Name, Borrower_Date) VALUES(@ddlDisk, @ddlBorrower, @txtCheckout)", conn);
            CheckedOut.Parameters.Add("@ddlDisk", System.Data.SqlDbType.VarChar, 20);
            CheckedOut.Parameters["@ddlDisk"].Value = Convert.ToString(ddlDisk.Text);
            CheckedOut.Parameters.Add("@ddlBorrower", System.Data.SqlDbType.VarChar, 50);
            CheckedOut.Parameters["@ddlBorrower"].Value = Convert.ToString(ddlBorrower.Text);
            CheckedOut.Parameters.Add("@txtCheckout", System.Data.SqlDbType.Date);
            CheckedOut.Parameters["@txtCheckout"].Value = txtCheckout.Text;
            // Enclose database code in Try-Catch-Finally
            try
            {
                // Open the connection
                conn.Open();
                // Execute the command
                Lended.ExecuteNonQuery();
                CheckedOut.ExecuteNonQuery();
                // Reload page if the query executed successfully
                Response.Redirect("Current.aspx");
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Update Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }

            finally
            {
                // Close the connection
                conn.Close();
            }
        }
    }  
}