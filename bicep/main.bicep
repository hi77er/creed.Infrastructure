param location string = resourceGroup().location
param solution string
param apiProject string
param clientProject string
param apiImageName string
param apiImageTag string
param clientImageName string
param clientImageTag string

param primaryRegion string = location
param serverVersion string = '4.2'
param sharedAutoscaleMaxThroughput int = 1000

var devSuffix = 'dev'
var prodSuffix = 'prod'
var devContainerRegistryName = toLower('${solution}${devSuffix}acr')
var prodContainerRegistryName = toLower('${solution}${prodSuffix}acr')
var keyVaultName = '${solution}-kv'
var devCRAdminSecretName = '${devContainerRegistryName}AdminPassword'
var prodCRAdminSecretName = '${prodContainerRegistryName}AdminPassword'

var devDbAccountName = toLower('${solution}-${devSuffix}-mongodb-account')
var devDbName = toLower('${solution}-${devSuffix}-mongodb')
var prodDbAccountName = toLower('${solution}-${prodSuffix}-mongodb-account')
var prodDbName = toLower('${solution}-${prodSuffix}-mongodb')

// PORT
var devAPIPort = 80
// AUTH_FACEBOOK_CLIENT_ID
var devFacebookClientId = '110460608594145'
// AUTH_FACEBOOK_CLIENT_SECRET
var devFacebookClientSecret = 'a5c04e1366fa2683631d3c1f33be3e20'
// AUTH_FACEBOOK_CALLBACK
var devFacebookCallback = '/oauth/facebook/callback'
// AUTH_GITHUB_CLIENT_ID
var devGithubClientId = '16c2660b886b37835f63'
// AUTH_GITHUB_CLIENT_SECRET
var devGithubClientSecret = '9665d39e2a7077df46194f0ed977954365fb4772'
// AUTH_GITHUB_CALLBACK
var devGithubCallback = '/oauth/github/callback'
// AUTH_GOOGLE_CLIENT_ID
var devGoogleClientId = '450487781777-dqqg7ep8rtol5vmb47riauiv8mllrb03.apps.googleusercontent.com'
// AUTH_GOOGLE_CLIENT_SECRET
var devGoogleClientSecret = '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'
// AUTH_GOOGLE_CALLBACK
var devGoogleCallback = '/oauth/google/callback'
// AUTH_ACCESS_COOKIE_KEY
var devAccessCookieKey = 'ajhfao87f68iu71839uiifdi8192fkj83129087ajhfao87f68iu71839uiifdi8192fkj83129087'
// AUTH_ACCESS_TOKEN_SECRET
var devAccessTokenSecret = 'dddsd-dahdhd-kjfjdhrhrerj-uurhr-jeee9'
// AUTH_ACCESS_TOKEN_EXPIRY_SECONDS
var devAccessTokenExpirySeconds = 900 // 15 mins = 60 seconds * 15 minutes
// AUTH_REFRESH_COOKIE_KEY
var devRefreshCookieKey = '523342587f68iu71839uiifdi8192fkj83129087ajhfao87f68iu71839uiifdi858739042'
// AUTH_REFRESH_TOKEN_SECRET
var devRefreshTokenSecret = 'kmn2gkjddshfdjh73273bdjsj84-jdjd7632vg'
// AUTH_REFRESH_TOKEN_EXPIRY_SECONDS
var devRefreshTokenExpirySeconds = 2592000 // 30 days = 60 seconds * 60 minutes * 24 hours * 30 days

// PORT
var prodAPIPort = 80
// AUTH_FACEBOOK_CLIENT_ID
var prodFacebookClientId = '207829888499142'
// AUTH_FACEBOOK_CLIENT_SECRET
var prodFacebookClientSecret = '29bdfa7f0d8ebebfde7b4fbf6440b6e0'
// AUTH_FACEBOOK_CALLBACK
var prodFacebookCallback = '/oauth/facebook/callback'
// AUTH_GITHUB_CLIENT_ID
var prodGithubClientId = '2b08a500a7dfcba93346'
// AUTH_GITHUB_CLIENT_SECRET
var prodGithubClientSecret = 'b0d9aca7fac54632e728d0b576fe4cb50815a3f7'
// AUTH_GITHUB_CALLBACK
var prodGithubCallback = '/oauth/github/callback'
// AUTH_GOOGLE_CLIENT_ID
var prodGoogleClientId = '899455933664-q1r38u10d5icf12g8gim6ueib9g5ksnv.apps.googleusercontent.com'
//  AUTH_GOOGLE_CLIENT_SECRET
var prodGoogleClientSecret = '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'
// AUTH_GOOGLE_CALLBACK
var prodGoogleCallback = '/oauth/google/callback'
// AUTH_ACCESS_COOKIE_KEY
var prodAccessCookieKey = 'fsadasdasfdi8192fkj83129087ajhfao87f68iu71839uiifdi81cxzsdfyy'
// AUTH_ACCESS_TOKEN_SECRET
var prodAccessTokenSecret = '5123sd-dahdhd-kj5213hrhrerj-uurhr-je623'
// AUTH_ACCESS_TOKEN_EXPIRY_SECONDS
var prodAccessTokenExpirySeconds = 900 // 15 mins = 60 seconds * 15 minutesm
// AUTH_REFRESH_COOKIE_KEY
var prodRefreshCookieKey = 'kjghkdalasifdi8192fkj83129087ajhfao87f68iu7183gjaksdassad'
// AUTH_REFRESH_TOKEN_SECRET
var prodRefreshTokenSecret = 'gurayaosjddshfdjh73273bdjsj84-jdjd7gjahskld333'
// AUTH_REFRESH_TOKEN_EXPIRY_SECONDS
var prodRefreshTokenExpirySeconds = 2592000 // 30 days = 60 seconds * 60 minutes * 24 hours * 30 days

// PORT
var devClientAppPort = 80
// REACT_APP_WEB_API_BASE_URL
var devClientAppWebApiBaseUrl = 'Update it when Web Api is already deployed.'
// REACT_APP_AUTH_ACCESS_COOKIE_KEY
var devClientAppAuthAccessCookieKey = 'fsadasdasfdi8192fkj83129087ajhfao87f68iu71839uiifdi81cxzsdfyy'
// REACT_APP_AUTH_REFRESH_COOKIE_KEY
var devClientAppAuthRefreshCookieKey = 'kjghkdalasifdi8192fkj83129087ajhfao87f68iu7183gjaksdassad'
// REACT_APP_FACEBOOK_OAUTH_CLIENT_ID
var devClientAppFacebookClientId = '110460608594145'
// REACT_APP_FACEBOOK_OAUTH_REDIRECT
var devClientAppFacebookCallback = 'https://creed-server-dev-ca.agreeableground-2ce19df1.westeurope.azurecontainerapps.io/oauth/facebook/callback'
// REACT_APP_GITHUB_OAUTH_CLIENT_ID
var devClientAppGithubClientId = '16c2660b886b37835f63'
// REACT_APP_GITHUB_OAUTH_REDIRECT
var devClientAppGithubCallback = 'https://creed-server-dev-ca.agreeableground-2ce19df1.westeurope.azurecontainerapps.io/oauth/github/callback'
// REACT_APP_GOOGLE_OAUTH_CLIENT_ID
var devClientAppGoogleClientId = '450487781777-dqqg7ep8rtol5vmb47riauiv8mllrb03.apps.googleusercontent.com'
// REACT_APP_GOOGLE_OAUTH_REDIRECT
var devClientAppGoogleCallback = 'https://creed-server-dev-ca.agreeableground-2ce19df1.westeurope.azurecontainerapps.io/oauth/google/callback'

// PORT
var prodClientAppPort = 80
// REACT_APP_WEB_API_BASE_URL
var prodClientAppWebApiBaseUrl = 'Update it when Web Api is already deployed.'
// REACT_APP_AUTH_ACCESS_COOKIE_KEY
var prodClientAppAuthAccessCookieKey = 'ghjkljhgfhjkhgfhkjlnkjhgkjblknhg47639016adkjkad1791'
// REACT_APP_AUTH_REFRESH_COOKIE_KEY
var prodClientAppAuthRefreshCookieKey = '64324gfhjkhgfhkjlnkjhgkjblknhg47639016adfsd2356'
// REACT_APP_FACEBOOK_OAUTH_CLIENT_ID
var prodClientAppFacebookClientId = '207829888499142'
// REACT_APP_FACEBOOK_OAUTH_REDIRECT
var prodClientAppFacebookCallback = 'https://creed-server-prod-ca.salmonhill-044fac01.westeurope.azurecontainerapps.io/oauth/facebook/callback'
// REACT_APP_GITHUB_OAUTH_CLIENT_ID
var prodClientAppGithubClientId = '2b08a500a7dfcba93346'
// REACT_APP_GITHUB_OAUTH_REDIRECT
var prodClientAppGithubCallback = 'https://creed-server-prod-ca.salmonhill-044fac01.westeurope.azurecontainerapps.io/oauth/github/callback'
// REACT_APP_GOOGLE_OAUTH_CLIENT_ID
var prodClientAppGoogleClientId = '899455933664-q1r38u10d5icf12g8gim6ueib9g5ksnv.apps.googleusercontent.com'
// REACT_APP_GOOGLE_OAUTH_REDIRECT
var prodClientAppGoogleCallback = 'https://creed-server-prod-ca.salmonhill-044fac01.westeurope.azurecontainerapps.io/oauth/google/callback'

// DEVELOPMENT ENV

resource devContainerRegistry 'Microsoft.ContainerRegistry/registries@2021-06-01-preview' = {
  name: devContainerRegistryName
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: true
    publicNetworkAccess: 'Enabled'
    networkRuleBypassOptions: 'AzureServices'
    zoneRedundancy: 'Disabled'
    anonymousPullEnabled: false
  }
}

resource keyVault 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: keyVaultName
  location: location
  properties: {
    enabledForDeployment: true
    enabledForTemplateDeployment: true
    enableRbacAuthorization: true
    enabledForDiskEncryption: true
    tenantId: tenant().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
  }
}

resource devCRAdminSecret 'Microsoft.KeyVault/vaults/secrets@2022-07-01' = {
  name: devCRAdminSecretName
  parent: keyVault
  properties: {
    value: devContainerRegistry.listCredentials().passwords[0].value
  }
}

resource devLogAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2020-10-01' = {
  name: '${solution}-${devSuffix}-la-workspace'
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
  }
}

resource devDbAccount 'Microsoft.DocumentDB/databaseAccounts@2022-05-15' = {
  name: devDbAccountName
  location: location
  kind: 'MongoDB'
  properties: {
    consistencyPolicy: {
      defaultConsistencyLevel: 'Eventual'
    }
    locations: [
      {
        locationName: primaryRegion
        failoverPriority: 0
        isZoneRedundant: false
      }
    ]
    databaseAccountOfferType: 'Standard'
    enableAutomaticFailover: true
    apiProperties: {
      serverVersion: serverVersion
    }
    capabilities: [
      {
        name: 'DisableRateLimitingResponses'
      }
    ]
  }
}

resource devMongoDB 'Microsoft.DocumentDB/databaseAccounts/mongodbDatabases@2022-05-15' = {
  parent: devDbAccount
  name: devDbName
  properties: {
    resource: {
      id: devDbName
    }
    options: {
      autoscaleSettings: {
        maxThroughput: sharedAutoscaleMaxThroughput
      }
    }
  }
}

resource devContainerAppEnvironment 'Microsoft.App/managedEnvironments@2022-06-01-preview' = {
  name: '${solution}-${devSuffix}-environment'
  location: location
  sku: {
    name: 'Consumption'
  }
  properties: {
    zoneRedundant: false
    appLogsConfiguration: {
      destination: 'log-analytics'
      logAnalyticsConfiguration: {
        customerId: devLogAnalyticsWorkspace.properties.customerId
        sharedKey: devLogAnalyticsWorkspace.listKeys().primarySharedKey
      }
    }
  }
}

module devClientContainerApp 'aca.bicep' = {
  name: 'devClientContainerApp'
  params: {
    solution: solution
    project: clientProject
    env: devSuffix
    location: location
    containerAppEnvironmentId: devContainerAppEnvironment.id
    containerRegistryPassword: devContainerRegistry.listCredentials().passwords[0].value
    containerRegistryName: devContainerRegistryName
    imageName: clientImageName
    imageTag: clientImageTag
    envVariables: [
      // PORT - SHOULD BE ALWAYS FIRST IN THE ARRAY
      { name: 'PORT', value: string(devClientAppPort) }
      { name: 'REACT_APP_WEB_API_BASE_URL', value: devClientAppWebApiBaseUrl }
      { name: 'REACT_APP_AUTH_ACCESS_COOKIE_KEY', value: devClientAppAuthAccessCookieKey }
      { name: 'REACT_APP_AUTH_REFRESH_COOKIE_KEY', value: devClientAppAuthRefreshCookieKey }
      { name: 'REACT_APP_FACEBOOK_OAUTH_CLIENT_ID', value: devClientAppFacebookClientId }
      { name: 'REACT_APP_FACEBOOK_OAUTH_REDIRECT', value: devClientAppFacebookCallback }
      { name: 'REACT_APP_GITHUB_OAUTH_CLIENT_ID', value: devClientAppGithubClientId }
      { name: 'REACT_APP_GITHUB_OAUTH_REDIRECT', value: devClientAppGithubCallback }
      { name: 'REACT_APP_GOOGLE_OAUTH_CLIENT_ID', value: devClientAppGoogleClientId }
      { name: 'REACT_APP_GOOGLE_OAUTH_REDIRECT', value: devClientAppGoogleCallback }
    ]
  }
}

var devMongoDbConnectionString = listConnectionStrings(devDbAccount.id, devDbAccount.apiVersion).connectionStrings[0].connectionString
var devCorsWhitelistedDomains = 'https://${devClientContainerApp.outputs.ContainerAppUrl}'

module devAPIContainerApp 'aca.bicep' = {
  name: 'devAPIContainerApp'
  params: {
    solution: solution
    project: apiProject
    env: devSuffix
    location: location
    containerAppEnvironmentId: devContainerAppEnvironment.id
    containerRegistryPassword: devContainerRegistry.listCredentials().passwords[0].value
    containerRegistryName: devContainerRegistryName
    imageName: apiImageName
    imageTag: apiImageTag
    envVariables: [
      // PORT - SHOULD BE ALWAYS FIRST IN THE ARRAY
      { name: 'PORT', value: string(devAPIPort) }
      { name: 'MONGO_DB_CONNECTION_STRING', value: devMongoDbConnectionString }
      { name: 'AUTH_FACEBOOK_CLIENT_ID', value: devFacebookClientId }
      { name: 'AUTH_FACEBOOK_CLIENT_SECRET', value: devFacebookClientSecret }
      { name: 'AUTH_FACEBOOK_CALLBACK', value: devFacebookCallback }
      { name: 'AUTH_GITHUB_CLIENT_ID', value: devGithubClientId }
      { name: 'AUTH_GITHUB_CLIENT_SECRET', value: devGithubClientSecret }
      { name: 'AUTH_GITHUB_CALLBACK', value: devGithubCallback }
      { name: 'AUTH_GOOGLE_CLIENT_ID', value: devGoogleClientId }
      { name: 'AUTH_GOOGLE_CLIENT_SECRET', value: devGoogleClientSecret }
      { name: 'AUTH_GOOGLE_CALLBACK', value: devGoogleCallback }
      { name: 'AUTH_ACCESS_COOKIE_KEY', value: devAccessCookieKey }
      { name: 'AUTH_ACCESS_TOKEN_SECRET', value: devAccessTokenSecret }
      { name: 'AUTH_ACCESS_TOKEN_EXPIRY_SECONDS', value: string(devAccessTokenExpirySeconds) }
      { name: 'AUTH_REFRESH_COOKIE_KEY', value: devRefreshCookieKey }
      { name: 'AUTH_REFRESH_TOKEN_SECRET', value: devRefreshTokenSecret }
      { name: 'AUTH_REFRESH_TOKEN_EXPIRY_SECONDS', value: string(devRefreshTokenExpirySeconds) }
      { name: 'CORS_WHITELISTED_DOMAINS', value: devCorsWhitelistedDomains }
    ]
  }
}

// PRODUCTION ENV

resource prodContainerRegistry 'Microsoft.ContainerRegistry/registries@2021-06-01-preview' = {
  name: prodContainerRegistryName
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: true
    publicNetworkAccess: 'Enabled'
    networkRuleBypassOptions: 'AzureServices'
    zoneRedundancy: 'Disabled'
    anonymousPullEnabled: false
  }
}

resource prodCRAdminSecret 'Microsoft.KeyVault/vaults/secrets@2022-07-01' = {
  name: prodCRAdminSecretName
  parent: keyVault
  properties: {
    value: prodContainerRegistry.listCredentials().passwords[0].value
  }
}

resource prodLogAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2020-10-01' = {
  name: '${solution}-${prodSuffix}-la-workspace'
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
  }
}

resource prodDbAccount 'Microsoft.DocumentDB/databaseAccounts@2022-05-15' = {
  name: prodDbAccountName
  location: location
  kind: 'MongoDB'
  properties: {
    consistencyPolicy: {
      defaultConsistencyLevel: 'Eventual'
    }
    locations: [
      {
        locationName: primaryRegion
        failoverPriority: 0
        isZoneRedundant: false
      }
    ]
    databaseAccountOfferType: 'Standard'
    enableAutomaticFailover: true
    apiProperties: {
      serverVersion: serverVersion
    }
    capabilities: [
      {
        name: 'DisableRateLimitingResponses'
      }
    ]
  }
}

resource prodMongoDB 'Microsoft.DocumentDB/databaseAccounts/mongodbDatabases@2022-05-15' = {
  parent: prodDbAccount
  name: prodDbName
  properties: {
    resource: {
      id: prodDbName
    }
    options: {
      autoscaleSettings: {
        maxThroughput: sharedAutoscaleMaxThroughput
      }
    }
  }
}

resource prodContainerAppEnvironment 'Microsoft.App/managedEnvironments@2022-06-01-preview' = {
  name: '${solution}-${prodSuffix}-environment'
  location: location
  sku: {
    name: 'Consumption'
  }
  properties: {
    zoneRedundant: false
    appLogsConfiguration: {
      destination: 'log-analytics'
      logAnalyticsConfiguration: {
        customerId: prodLogAnalyticsWorkspace.properties.customerId
        sharedKey: prodLogAnalyticsWorkspace.listKeys().primarySharedKey
      }
    }
  }
}

module prodClientContainerApp 'aca.bicep' = {
  name: 'prodClientContainerApp'
  params: {
    solution: solution
    project: clientProject
    env: prodSuffix
    location: location
    containerAppEnvironmentId: prodContainerAppEnvironment.id
    containerRegistryPassword: prodContainerRegistry.listCredentials().passwords[0].value
    containerRegistryName: prodContainerRegistryName
    imageName: clientImageName
    imageTag: clientImageTag
    envVariables: [
      // PORT - SHOULD BE ALWAYS FIRST IN THE ARRAY
      { name: 'PORT', value: string(prodClientAppPort) }
      { name: 'REACT_APP_WEB_API_BASE_URL', value: prodClientAppWebApiBaseUrl }
      { name: 'REACT_APP_AUTH_ACCESS_COOKIE_KEY', value: prodClientAppAuthAccessCookieKey }
      { name: 'REACT_APP_AUTH_REFRESH_COOKIE_KEY', value: prodClientAppAuthRefreshCookieKey }
      { name: 'REACT_APP_FACEBOOK_OAUTH_CLIENT_ID', value: prodClientAppFacebookClientId }
      { name: 'REACT_APP_FACEBOOK_OAUTH_REDIRECT', value: prodClientAppFacebookCallback }
      { name: 'REACT_APP_GITHUB_OAUTH_CLIENT_ID', value: prodClientAppGithubClientId }
      { name: 'REACT_APP_GITHUB_OAUTH_REDIRECT', value: prodClientAppGithubCallback }
      { name: 'REACT_APP_GOOGLE_OAUTH_CLIENT_ID', value: prodClientAppGoogleClientId }
      { name: 'REACT_APP_GOOGLE_OAUTH_REDIRECT', value: prodClientAppGoogleCallback }
    ]
  }
}

var prodMongoDbConnectionString = listConnectionStrings(prodDbAccount.id, prodDbAccount.apiVersion).connectionStrings[0].connectionString
var prodCorsWhitelistedDomains = 'https://${prodClientContainerApp.outputs.ContainerAppUrl}'

module prodAPIContainerApp 'aca.bicep' = {
  name: 'prodAPIContainerApp'
  params: {
    solution: solution
    project: apiProject
    env: prodSuffix
    location: location
    containerAppEnvironmentId: prodContainerAppEnvironment.id
    containerRegistryPassword: prodContainerRegistry.listCredentials().passwords[0].value
    containerRegistryName: prodContainerRegistryName
    imageName: apiImageName
    imageTag: apiImageTag
    envVariables: [
      // PORT - SHOULD BE ALWAYS FIRST IN THE ARRAY
      { name: 'PORT', value: string(prodAPIPort) }
      { name: 'MONGO_DB_CONNECTION_STRING', value: prodMongoDbConnectionString }
      { name: 'AUTH_FACEBOOK_CLIENT_ID', value: prodFacebookClientId }
      { name: 'AUTH_FACEBOOK_CLIENT_SECRET', value: prodFacebookClientSecret }
      { name: 'AUTH_FACEBOOK_CALLBACK', value: prodFacebookCallback }
      { name: 'AUTH_GITHUB_CLIENT_ID', value: prodGithubClientId }
      { name: 'AUTH_GITHUB_CLIENT_SECRET', value: prodGithubClientSecret }
      { name: 'AUTH_GITHUB_CALLBACK', value: prodGithubCallback }
      { name: 'AUTH_GOOGLE_CLIENT_ID', value: prodGoogleClientId }
      { name: 'AUTH_GOOGLE_CLIENT_SECRET', value: prodGoogleClientSecret }
      { name: 'AUTH_GOOGLE_CALLBACK', value: prodGoogleCallback }
      { name: 'AUTH_ACCESS_COOKIE_KEY', value: prodAccessCookieKey }
      { name: 'AUTH_ACCESS_TOKEN_SECRET', value: prodAccessTokenSecret }
      { name: 'AUTH_ACCESS_TOKEN_EXPIRY_SECONDS', value: string(prodAccessTokenExpirySeconds) }
      { name: 'AUTH_REFRESH_COOKIE_KEY', value: prodRefreshCookieKey }
      { name: 'AUTH_REFRESH_TOKEN_SECRET', value: prodRefreshTokenSecret }
      { name: 'AUTH_REFRESH_TOKEN_EXPIRY_SECONDS', value: string(prodRefreshTokenExpirySeconds) }
      { name: 'CORS_WHITELISTED_DOMAINS', value: prodCorsWhitelistedDomains }
    ]
  }
}

output DevAPIContainerAppUrl string = devAPIContainerApp.outputs.ContainerAppUrl
output ProdAPIContainerAppUrl string = prodAPIContainerApp.outputs.ContainerAppUrl
