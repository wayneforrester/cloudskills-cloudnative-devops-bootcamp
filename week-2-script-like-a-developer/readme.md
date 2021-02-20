# Week 2 Scripting Like A Developer

The code found in this repository is to help you learn how to script like a Developer.

## WIP
The code found in `week-2-script-like-a-developer` is currently a Work In Progress (WIP) and the readme will be updated when ready

## PowerShell Code
The PowerShell code found in `week-2-script-like-a-developer` is for anyone that wants to create a Resource Group in Azure

## How to Use The PowerShell Code
The `New-ResourceGroup` function is found under the `powershell` directory and can be used as a reusable function. A user has the ability to pass in parameters at runtime to ensure they can re-use the script at any point for any environment.

## Python Code
The Python code found in `week-2-script-like-a-developer` is for anyone that wants to create an S3 bucket in AWS

## How to Use The Python Code
The `s3bucket.py` script is designed to be re-used at any point for any environment. There are no hard-coded values.

## Examples
```Pwsh
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

New-ResourceGroup -rgName 'cloudskills' -location 'eastus2'
```

```Python
import sys
import boto3

try:
    def main():
        create_s3bucket(bucket_name)

except Exception as e:
    print(e)

def create_s3bucket(bucket_name):
    s3_bucket=boto3.client(
        's3',
    )

    bucket = s3_bucket.create_bucket(
        Bucket=bucket_name,
        ACL='private',
    )

    print(bucket)

bucket_name = sys.argv[1]

if __name__ == '__main__':
    main()

python s3bucket.py 'cloudskillss3bucket'
```

## Testing 
Both the PowerShell and Python codes have unit test available to ensure that the desired outcomes, including values and types, are accurate.

The tests can be found in the `powershell` and `python` directories.

## Contributors
1. Wayne Forrester