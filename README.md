# IMDS Proxy

This is a proof of concept for an Azure Instance Metadata Service Proxy. There are some Azure services (i.e. Cloud Services) that do not support Managed Identities. This makes using the recommended AAD authentication difficult since you would need to manage the creation of service principals and the creation and rotation of their associated certificates.

One potential solution is to deploy a resource that does support Managed Identities (i.e. Virtual Machine Scale Sets) and allow other services to access the IMDS of that resource. This is accomplished in this proof of concept by deploying a Mariner Linux based VMSS that is running NGINX as a proxy, forwarding calls to the VM's IMDS. The VMSS is deployed behind a private/internal Load Balancer and has a Network Security Group applied that restricts inbound traffic to only the traffic in the Vnet in which it is deployed.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FBpoe%2FIMDS-Proxy%2Frefs%2Fheads%2Fmain%2Ftemplates%2FImdsProxy.template.json)