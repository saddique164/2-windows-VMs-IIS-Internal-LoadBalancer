{
$resourceGroupName = 'SantiaDemo'
$resourceGroupLocation = 'Southeast Asia'
$resoruceDeploymentName= "santiavirtualnetwork"
$templatePath = $env:SystemDrive + '\' + 'santia\UsePreviousServices\UsePreviousServices'
$templateName= 'azuredeploy.json'
$templateParameterName= 'azuredeploy.parameters.json'
$templateParameterFile= $templatePath + '\' + $templateParameterName
$template = $templatePath + '\' + $templateName
$password="Pakistan@123"
$securePasssword = $password | ConvertTo-SecureString -AsPlainText -Force
}


# Creating a new Resource Group

{
New-AzureRmResourceGroup `
  -Location $resourceGroupLocation `
  -Name $resourceGroupName `
  -verbose -Force
}

# Creation of Virtual Network

{
$additionalParameters = New-Object -TypeName Hashtable
$additionalParameters['machineAdminPassword'] = $securePasssword
 
 New-AzureRmResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $template `
    -TemplateParameterFile $templateParameterFile `
    -verbose -Force

}