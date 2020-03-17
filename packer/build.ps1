$Env:PACKER_CACHE_DIR = "packer_cache"

$vcenter_server = '192.168.40.10'
$username = 'administrator@vsphere.local'

$host_ip = Read-Host -Prompt 'host_ip'
$distribution = Read-Host -Prompt 'distribution'
$version = Read-Host -Prompt 'version'
$password = Read-Host -Prompt 'password' -AsSecureString
$password = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))

packer build `
  -var "host_ip=$host_ip" `
  -var "distribution=$distribution" `
  -var "version=$version" `
  -var "vcenter_server=$vcenter_server" `
  -var "username=$username" `
  -var "password=$password" `
  -timestamp-ui `
  templates/"$distribution".json