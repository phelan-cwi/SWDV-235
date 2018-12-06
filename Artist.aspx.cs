using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Artist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
/* Added a bunch of errors for when update tries to overwrite something that's in use by diskhasborrower or diskhasartist */
    protected void grdArtist_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = DatabaseErrorMessage(e.Exception.Message);
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = ConcurrencyErrorMessage();
        }
    }

    protected void grdArtist_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
    
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = ConcurrencyErrorMessage();
            }

     
    }

    protected void grdArtist_PreRender(object sender, EventArgs e)
    {

    }
    //Error message created
    private string DatabaseErrorMessage(string errorMsg)
    {
        return $"<b>A database error has occurred:</b> Unable to change. Data exisits in another table.";
    }
    private string ConcurrencyErrorMessage()
    {
        return "Another user may have updated that category. Please try again";
    }

    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = DatabaseErrorMessage(e.Exception.Message);
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblError.Text = ConcurrencyErrorMessage();
        }
    }
}