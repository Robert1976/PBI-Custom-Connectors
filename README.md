# PBI-Custom-Connectors
This repository contains custom connectors for Power BI

# Exact connector 

Exact connector is a custom Power BI connector to connect to Exact Online. To use this connector download the .mez file in this respository (you can find this file in the 'Exact' folder). 

To be able to use this connector you need to create an app in Exact Online App Center (https://apps.exactonline.com/):

<img src="https://github.com/Robert1976/PBI-Custom-Connectors/blob/master/Exact/Resources/exact1.PNG" width="350" >

Login and register a new app

<img src="https://github.com/Robert1976/PBI-Custom-Connectors/blob/master/Exact/Resources/exact2.PNG" width="250" >

Fill in the required fields

<img src="https://github.com/Robert1976/PBI-Custom-Connectors/blob/master/Exact/Resources/exact3.PNG" width="300" >

Make sure that the 'Redirect URI' is 'https://oauth.powerbi.com/views/oauthredirect.html' and click 'Register'.

Copy the client id and client secret from your newly created app to a notepad

<img src="https://github.com/Robert1976/PBI-Custom-Connectors/blob/master/Exact/Resources/exact4.PNG" width="350" >

Once you have obtained your client id and client secret, download the client_id and client_secret files from this repository and replace the client id and client secret with your own values (the ones that you obtained above).

Change the extension of the .mez file to zip and drag and drop the client_id and client_secret files into the zip (so that they get copied into the zip file. You might want to check this by opening the zip file and then closing it again). After adding the client_id and client_secret files change the extension of the zip file back to .mez

<img src="https://github.com/Robert1976/PBI-Custom-Connectors/blob/master/Exact/Resources/exact5.png" width="350" >

Now, place the .mez file in the 'custom connectors' folder of your computer (Power BI desktop should be installed on this computer, you can normally find this folder under '(c:)\Users\\{your accountname}\Documents\Power BI Desktop\Custom Connectors'). In case you have OneDrive running, you can find the folder at '(c:)\Users\\{your accountname}\OneDrive\Documenten\Power BI Desktop\Custom Connectors. If the folder does not exist, just create it yourself.

The first time you use the connector you need to login with your Exact account.

Next time you open Power BI the connector should appear in the datasources list. If you receive a warning about Uncertified connectors make sure that in Power BI under settings 'Data extensions' is set to 'Allow any extension'.

<img src="https://github.com/Robert1976/PBI-Custom-Connectors/blob/master/Exact/Resources/exact6.PNG" width="450" >
