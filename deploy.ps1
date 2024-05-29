$properties = @{
    Name = "imdsProxy"
    ResourceGroupName = "bpoe"
    TemplateFile = ".\Templates\ImdsProxy.template.json"
    TemplateParameterFile = ".\Parameters\bpoe-test.parameters.json"
}

New-AzResourceGroupDeployment @properties