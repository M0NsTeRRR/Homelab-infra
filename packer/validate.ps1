$Env:PACKER_CACHE_DIR = "packer_cache"

$distributions = @('debian', 'ubuntu')

foreach ($distribution in $distributions) {
	packer validate `
	  -var "host_ip=192.168.0.1" `
	  -var "distribution=$distribution" `
	  -var "version=10" `
	  -var "vcenter_server=192.168.0.1" `
	  -var "username=administrator@vsphere.local" `
	  -var "password=test" `
	  templates/"$distribution".json
}