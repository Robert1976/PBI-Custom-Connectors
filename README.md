# PBI-Custom-Connectors
Custom connectors for Power BI

# Exact connector 

Exact connector is a custom Power BI connector to connect to Exact Online. To use this connector download the .mez file. 

Create a client id and secret in Exact Online. See this url for instructions: https://support.exactonline.com/community/s/knowledge-base#All-All-DNO-Content-oauth-eol-oauth-dev-step1

Once you have obtained your id and secret, download the client_id and client_secret files and replace the client id and secret with your own values.

Change the extension of the .mez file to zip and drag and drop the client_id and client_secret file in the zip (so that they get copied into the zip file. You might want to check this.). Change the extension of the zip file back to .mez

Place the .mez file in the 'custom connectors' folder of your computer (Power BI desktop should be installed on this computer, you can probably find this folder under 'Documents\Power BI Desktop\Custom Connectors'). The connector should now appear in the datasources list in Power BI.
