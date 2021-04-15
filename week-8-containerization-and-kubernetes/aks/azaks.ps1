[CmdletBinding()]
param (
    $name = 'cloudskillsaks101',
    $rgName = 'cloudskills-aks-101',
    $nodeCount = 1,
    $kubernetesVersion = '1.19.6'
)

#az login

az group create -n $rgName -l 'eastus'

az aks create --generate-ssh-keys `
              --name $name `
              --resource-group $rgName `
              --node-count $nodeCount `
              --kubernetes-version $kubernetesVersion

az aks get-credentials --name $name --resource-group $rgName

# Create AKS deployment
kubectl create -f ./nginx.yml

# To delete these resouces
# delete deployment
kubectl delete -f ./nginx.yml

# delete managed AKS cluseter
Az aks delete --name $name --resource-group $rgName

# delete resource group
az group delete -n $rgName
