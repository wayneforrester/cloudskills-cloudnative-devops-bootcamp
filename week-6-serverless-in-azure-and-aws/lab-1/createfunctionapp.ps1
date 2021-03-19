function New-FunctionApp {

    param (
        [Parameter(Mandatory)]
        [string]$RGName,

        [Parameter(Mandatory)]
        [string]$name,

        [Parameter(Mandatory)]
        [string]$storageAccountName
    )

    # Create storage account
    az storage account create --name $storageAccountName `
        --resource-group $RGName

    # Create function app plan
    $plan = az functionapp plan create -g $RGName `
        -n $($name + 'plan') `
        --min-instances 1 `
        --max-burst 5 `
        --sku EP1

    $plan

    # Create function app
    az functionapp create -g $RGName `
        -n $name `
        -p $($name + 'plan') `
        --runtime powershell `
        -s $storageAccountName `
        --functions-version 2

}