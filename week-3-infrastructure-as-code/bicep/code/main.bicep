param name string = 'cscloudnativewf1234'
param location string = 'eastus'

var storageSku = 'Standard_LRS'

resource storeageaccount 'Microsoft.Storage/storageAccounts@2020-08-01-preview' = {
  name: name
  location: location
  kind: 'Storage'
  sku:{
    name: storageSku
  }
  properties: {
    allowBlobPublicAccess: false
  }
}

output id string = storeageaccount.id
