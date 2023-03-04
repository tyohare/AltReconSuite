param([string]$IPRange)

if ($IPRange -eq $null) {
    Write-Output "Please provide a network range as a parameter"
    exit 1
}

Write-Output "Pinging all IP addresses in $IPRange..."

$IPRange | ForEach-Object {
    $status = Test-Connection -ComputerName $_ -Quiet
    if ($status) {
        Write-Output "$_ is alive"
    }
}
