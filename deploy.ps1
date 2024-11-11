$properties = @{
    Name = "imdsProxy"
    ResourceGroupName = "rg-imdsproxy-westus2-01"
    TemplateFile = ".\Templates\ImdsProxy.template.json"
    TemplateParameterFile = ".\Parameters\bpoe-test.parameters.json"
}

New-AzResourceGroupDeployment @properties