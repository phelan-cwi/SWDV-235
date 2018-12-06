<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    { 
         ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs
        // Get the error details
    HttpException lastErrorWrapper = 
        Server.GetLastError() as HttpException;

    Exception lastError = lastErrorWrapper;
    if (lastErrorWrapper.InnerException != null)
        lastError = lastErrorWrapper.InnerException;

    string lastErrorTypeName = lastError.GetType().ToString();
    string lastErrorMessage = lastError.Message;
    string lastErrorStackTrace = lastError.StackTrace;
    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

</script>
