function New-ResourceGroup {

    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [string]$rgName,

        [Parameter(Mandatory)]
        [string]$location
    )

    $params = @{
        'Name' = $rgName
        'Location' = $location
    }

    if ($PSCmdlet.ShouldProcess('Location')) {
        New-AzResourceGroup @params
    }

}

function Remove-ResourceGroup {

    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [string]$rgName
        )

        if ($PSCmdlet.ShouldProcess('Location')) {
            Remove-AzResourceGroup -Name $rgName
        }
}