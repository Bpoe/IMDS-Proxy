function ConvertTo-Base64
{
    param(
        [Parameter(Mandatory=$true, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string]$InputObject
    )

    $bytes = [System.Text.Encoding]::UTF8.GetBytes($InputObject)
    $base64 = [System.Convert]::ToBase64String($bytes)
    return $base64
}

$nginxConfBase64 = Get-Content -Path .\nginx.conf -Raw | ConvertTo-Base64
$scriptBase64 = Get-Content -Path .\script.sh -Raw | ConvertTo-Base64

foreach($file in Get-ChildItem -Path .\Parameters -Filter *.json)
{
    # Read the JSON file
    $parametersJson = Get-Content -Path $file.FullName -Raw | ConvertFrom-Json -Depth 10

    # Set the values
    $parametersJson.parameters.userData.value = $nginxConfBase64
    $parametersJson.parameters.script.value = $scriptBase64

    # Write the JSON file
    $parametersJson | ConvertTo-Json -Depth 10 | Set-Content -Path $file.FullName
}
