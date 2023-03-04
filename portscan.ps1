param([string]$IP)

if ($IP -eq $null) {
    Write-Output "Please provide an IP address as a parameter"
    exit 1
}

Write-Output "Scanning all ports on $IP for open ports..."

1..65535 | ForEach-Object {
    $status = New-Object System.Net.Sockets.TcpClient
    try {
        $status.Connect($IP, $_)
        Write-Output "$_ is open"
    } catch {
        # Port is closed or filtered
    } finally {
        $status.Close()
    }
}
