function Add-Cert {
	param (
		[Parameter(Mandatory = $true)]
		$SiteName
	)
	$cert = New-SelfSignedCertificate -Type SSLServerAuthentication -DnsName "$SiteName" -CertStoreLocation 'cert:\LocalMachine\My' -KeyExportPolicy Exportable -KeyAlgorithm RSA -KeyLength 4096 
	$store = new-object System.Security.Cryptography.X509Certificates.X509Store(
		[System.Security.Cryptography.X509Certificates.StoreName]::Root,
		"localmachine")
	$store.Open("ReadWrite")
	$store.Add($cert)
	$store.Close()
}