$rg = 'ybk-arm'
$rgd = 'ybk-vm' 
$TIME = Get-Date -UFormat "%Y-%m-%d-%H_%M"
$location = "northeurope"
$adminUser = "adminUser"
$plainPass = "adminUser!1"
$securePass = ConvertTo-SecureString $plainPass -AsPlainText -Force
New-AzResourceGroup `
-Name $rg `
-Location $location `
-Force

New-AzResourceGroupDeployment `
-Name "$($rgd)-$($TIME)" `
-ResourceGroupName $rg `
-TemplateFile 'LinuxServerTemplate.json' `
-adminUsername $adminUser `
-adminPasswordOrKey $securePass
