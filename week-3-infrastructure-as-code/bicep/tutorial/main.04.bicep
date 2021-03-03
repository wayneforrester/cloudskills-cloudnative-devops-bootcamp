param location string = resourceGroup().location
param namePrefix string = 'stg'

param globalRedundancy bool = true // defaults to true but can be overridden

// var storageSku = 'Standard_LRS' // declare veriable and assign value
var storageAccountName = '${namePrefix}${uniqueString(resourceGroup().id)}' // example of using string interpolation

resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: storageAccountName // uses varibale defined above created via a function that uses string interpolation
  location: location
  kind: 'Storage'   
  sku: {
    name: globalRedundancy ? 'Standard_GRS' : 'Standard_LRS' // if true --> GRS, else --> LRS
  }
}

resource blob 'Microsoft.Storage/storageAccounts/blobServices@2018-07-01' = {
  name: '${stg.name}/default/logs' // dependsOn will be added when the template is compiled
}

output storageID string = stg.id // output resourceId of storage account
output computedStorageName string = stg.name
output blobEndpoint string = stg.properties.primaryEndpoints.blob // replacement for reference (...).*
