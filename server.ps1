# High-Performance Multi-Device Static HTTP Server for ShotQu PWA
param([int]$Port = 8080)

$root = $PSScriptRoot
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://*:$Port/")

$mimeTypes = @{
    ".html" = "text/html; charset=utf-8"
    ".htm"  = "text/html; charset=utf-8"
    ".js"   = "application/javascript; charset=utf-8"
    ".json" = "application/json; charset=utf-8"
    ".svg"  = "image/svg+xml"
    ".css"  = "text/css; charset=utf-8"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".ico"  = "image/x-icon"
}

try {
    $listener.Start()
    Write-Host "==============================================================" -ForegroundColor Green
    Write-Host "  ShotQu PWA Server Aktif di Port $Port" -ForegroundColor Green
    Write-Host "==============================================================" -ForegroundColor Green
    Write-Host "Desktop / Laptop : http://localhost:$Port" -ForegroundColor Yellow
    Write-Host "Login Admin      : http://localhost:$Port/login" -ForegroundColor Magenta
    
    $ips = Get-NetIPAddress -AddressFamily IPv4 -ErrorAction SilentlyContinue | Where-Object { 
        $_.InterfaceAlias -notmatch 'Loopback' -and $_.IPAddress -notmatch '^169\.' 
    }
    foreach ($ip in $ips) {
        Write-Host "Tablet / HP      : http://$($ip.IPAddress):$Port  (via $($ip.InterfaceAlias))" -ForegroundColor Cyan
        Write-Host "Login Admin Tab  : http://$($ip.IPAddress):$Port/login" -ForegroundColor Magenta
    }
    Write-Host "==============================================================" -ForegroundColor Green
} catch {
    Write-Error "Gagal menjalankan listener: $_"
    exit 1
}

while ($listener.IsListening) {
    try {
        $context = $listener.GetContext()
        $req = $context.Request
        $res = $context.Response
        $res.Headers.Add("Access-Control-Allow-Origin", "*")

        $urlPath = $req.Url.LocalPath.TrimStart('/')
        if ([string]::IsNullOrWhiteSpace($urlPath) -or $urlPath -eq "/") {
            $urlPath = "index.html"
        } elseif ($urlPath -eq "login" -or $urlPath -eq "login/") {
            $urlPath = "login.html"
        } elseif ($urlPath -eq "admin" -or $urlPath -eq "admin/") {
            $urlPath = "login.html"
        }

        $filePath = [System.IO.Path]::Combine($root, $urlPath)
        if (-not [System.IO.File]::Exists($filePath) -and [System.IO.File]::Exists("$filePath.html")) {
            $filePath = "$filePath.html"
        }

        if ([System.IO.File]::Exists($filePath)) {
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
            $mime = if ($mimeTypes.ContainsKey($ext)) { $mimeTypes[$ext] } else { "application/octet-stream" }
            $res.ContentType = $mime
            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            $res.ContentLength64 = $bytes.Length
            $res.StatusCode = 200
            $res.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $res.StatusCode = 404
            $errBytes = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found")
            $res.ContentLength64 = $errBytes.Length
            $res.OutputStream.Write($errBytes, 0, $errBytes.Length)
        }
        $res.Close()
    } catch {
        # ignore disconnects
    }
}
