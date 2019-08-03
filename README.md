# AspNetWebFormPowerBIEmbed
Power BI (PBI) is embeded into ASP.NET webforms as AppOwnsData model

The report is embedded using the "Service Principal" method and not the "Master User" method

I've created this sample solution in Visual Studio 2017 and the sample report is taken from https://github.com/microsoft/powerbi-desktop-samples/tree/master/2018

For this demo, I've used the "2018SU04 Blog Demo - April.pbix" file

There are two files in which reports are embedded.
1. Default.aspx - which contains report without filter
2. pbiembedded.aspx - which contains report with filter

I've applied a basic filter here in JavaScript. For further filters, please refer this documentation https://github.com/Microsoft/PowerBI-JavaScript/wiki/Filters

The implementation method is similar to Power BI - App Owns Data (MVC) - https://github.com/microsoft/PowerBI-Developer-Samples/tree/master/App%20Owns%20Data

The class files are same as mentioned in the App Owns Data (MVC).

As the Service Principal method is used, please add the values to the following things in the Web.Config method:

1. AppSettings

        -applicationId

        -workspaceId

        -reportId

2. ServicePrincipal

        -applicationSecret

        -tenant
    
Before embedding, please create a Power BI report and publish to Power BI O365 workspace. 

For detailed explanation on how to configure the service principal, please check this video https://www.youtube.com/watch?v=ZhMfpdXLIw0

But I if the video seems to length, please check the description below on how to confgiure it...

Go to Azure portal

1.  Go to Azure Active Directory -> App registrations
2.  Provide name to the application
3.  For supported account type, select "Accounts in any organizational directory". This option is selected because, the application where the PBI is embedded is hosted independently.
4.  Provide a Redirect URI (optional) as localhost url
5.  Click Register and you will get the following details - Application (Client) ID, Directory (Tenant) ID, Object ID
6.  For the application secret, select "Certificates & secrets" -> "New Client Secret". For old Azure portals, these go by the name of "password".
7.  Provide description and the expiry parameter and click add
8.  <b>IMPORTANT</b> - As soon as you click add, you will get the application secret beside the description name. Copy the secret immediately. If you think, you will be able to get the application secret later, it won't be possible. You will have to create a new key.
9.  For allowing user to read Power BI file, you will have to provide permissions to Power BI APIs
10. Navigate to API Permsissions or Required Permissions (old portal)
11. Under API permissions, click "Add a permission"
12. Select "Power BI Service"
13. Under "Delegated permissions" and "Application permissions", for now I've given all permissions, but will update soon on what permissions are required or what are not.
14. Now again under "Azure Active Directory" -> "Groups" and click "New group"
15. Keep the group type as default and give a group name
16. Under owners, mention who will be the owner of the group
17. Under members, mention the app name which was registered earlier
17. Click the "Create" button now to create a group


Go to Power BI portal under O365
1.  Go to settings and then "Admin Portal"
2.  Under admin portal, go to "Tenant settings" and in that "Developer Settings"
3.  Under "Allow service principals to use Power BI APIs", enabled the feature and mention the group name which was created earlier and click apply
4.  Now under admin portal, navigate to workspaces
5.  Select the workspace and click on access
6.  Mention the group name and with admin as the role and click add
7.  Now for the workspace id and report id, open any one report from the workspace
8.  In the url, after 'groups' keyword, copy the guid which will be your workspace id
9.  In the url, after 'reports' keyword, copy the guid which will be your report id


Mention these values in the web.config and the remaining code helps with embedding the report.

Happy Coding...
