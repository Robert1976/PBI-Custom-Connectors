section qoders.powerbi.connector.exact;

client_id = Text.FromBinary(Extension.Contents("client_id")); 
client_secret = Text.FromBinary(Extension.Contents("client_secret")); 
redirect_uri = "https://oauth.powerbi.com/views/oauthredirect.html";
token_uri = "https://start.exactonline.nl/api/oauth2/token";
authorize_uri = "https://start.exactonline.nl/api/oauth2/auth";

windowWidth = 720;
windowHeight = 1024;

DefaultRequestHeaders = [
    #"Accept" = "application/json;odata.metadata=minimal"                       
];

[DataSource.Kind="Qoders Community connector for Exact", Publish="qoders.powerbi.connector.exact.Publish"]
shared qoders.powerbi.connector.exact.Feed = (optional url as text) =>
    let
        url = if (url=null) then "https://start.exactonline.nl/api/v1/current/Me" else url,
        source = Web.Contents(url, [ Headers = DefaultRequestHeaders ]),
        json = Json.Document(source)
    in
        json;

// Data Source Kind description
#"Qoders Community connector for Exact" = [
TestConnection = (dataSourcePath) => { "qoders.powerbi.connector.exact.Feed" },
Authentication = [
    OAuth = [
          StartLogin = StartLogin,
          FinishLogin = FinishLogin,
          Refresh=Refresh
        ]
    ],
    Label = Extension.LoadString("Connect to Exact")
];

StartLogin = (resourceUrl, state, display) =>
    let
        authorizeUrl = authorize_uri & "?" & Uri.BuildQueryString([
            client_id = client_id,  
            redirect_uri = redirect_uri,
            state = state,
            response_type = "code"
        ])
    in
        [
            LoginUri = authorizeUrl,
            CallbackUri = redirect_uri,
            WindowHeight = windowHeight,
            WindowWidth = windowWidth,
            Context = null
        ];

FinishLogin = (context, callbackUri, state) =>
    let
        parts = Uri.Parts(callbackUri)[Query],
        result = if (Record.HasFields(parts, {"error", "error_description"})) then 
                    error Error.Record(parts[error], parts[error_description], parts)
                 else
                    TokenMethod("authorization_code", "code", parts[code])
    in
        result;

Refresh = (resourceUrl, refresh_token) => TokenMethod("refresh_token", "refresh_token", refresh_token);

TokenMethod = (grantType, tokenField, code) =>
    let
        queryString = [
            client_id = client_id,
            client_secret = client_secret,
            grant_type = grantType,
            redirect_uri = redirect_uri
        ],
        queryWithCode = Record.AddField(queryString, tokenField, code),

        tokenResponse = Web.Contents(token_uri, [
            Content = Text.ToBinary(Uri.BuildQueryString(queryWithCode)),
            Headers = [
                #"Content-type" = "application/x-www-form-urlencoded",
                #"Accept" = "application/json"
            ],
            ManualStatusHandling = {400} 
        ]),
        body = Json.Document(tokenResponse),
        result = if (Record.HasFields(body, {"error", "error_description"})) then 
                    error Error.Record(body[error], body[error_description], body)
                 else
                    body
    in
        result;

// Data Source UI publishing description
qoders.powerbi.connector.exact.Publish = [
    Beta = false,
    Category = "Other",
    ButtonText = { Extension.LoadString("ButtonTitle"), Extension.LoadString("ButtonHelp") },
    LearnMoreUrl = "https://powerbi.microsoft.com/",
    SourceImage = qoders.powerbi.connector.exact.Icons,
    SourceTypeImage = qoders.powerbi.connector.exact.Icons
];

qoders.powerbi.connector.exact.Icons = [
    Icon16 = { Extension.Contents("Qoders16.png"), Extension.Contents("Qoders20.png"), Extension.Contents("Qoders24.png"), Extension.Contents("Qoders32.png") },
    Icon32 = { Extension.Contents("Qoders32.png"), Extension.Contents("Qoders40.png"), Extension.Contents("Qoders48.png"), Extension.Contents("Qoders64.png") }
];
