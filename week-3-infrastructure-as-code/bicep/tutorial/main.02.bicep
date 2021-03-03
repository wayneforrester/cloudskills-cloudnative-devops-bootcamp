param location string = 'eastus'
param name string = 'stgforrestec001' // must be globally unique

var storageSku = 'Standard_LRS' // declare veriable and assign value

resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: name
  location: location
  kind: 'Storage'   
  sku: {
    name: storageSku // reference variable
  }
}

output storageID string = stg.id // output resourceId of storage account