param(
    [int]$Port = 8080
)

$listener = New-Object System.Net.HttpListener
$prefix = "http://localhost:$Port/"

try {
    $listener.Prefixes.Add($prefix)
    $listener.Start()
} catch {
    $Port = 8088
    $prefix = "http://localhost:$Port/"
    $listener = New-Object System.Net.HttpListener
    $listener.Prefixes.Add($prefix)
    $listener.Start()
}

Write-Host "==========================================" -ForegroundColor Green
Write-Host "  로컬 웹 서버가 실행되었습니다!" -ForegroundColor Cyan
Write-Host "  접속 주소: $prefix" -ForegroundColor Yellow
Write-Host "  종료하려면 이 창을 닫거나 Ctrl+C를 누르세요." -ForegroundColor Gray
Write-Host "==========================================" -ForegroundColor Green

Start-Process $prefix

$currentDir = $PSScriptRoot
if (-not $currentDir) { $currentDir = (Get-Location).Path }

$mimeTypes = @{
    ".html" = "text/html; charset=utf-8"
    ".htm"  = "text/html; charset=utf-8"
    ".js"   = "application/javascript"
    ".css"  = "text/css"
    ".glb"  = "model/gltf-binary"
    ".gltf" = "model/gltf+json"
    ".bin"  = "application/octet-stream"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".jpeg" = "image/jpeg"
    ".svg"  = "image/svg+xml"
    ".json" = "application/json"
}

try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $response.Headers.Add("Access-Control-Allow-Origin", "*")

        $rawUrl = $request.RawUrl.Split('?')[0].TrimStart('/')
        if ([string]::IsNullOrEmpty($rawUrl)) { $rawUrl = "index.html" }
        $rawUrl = [System.Uri]::UnescapeDataString($rawUrl)
        $filePath = Join-Path $currentDir $rawUrl

        if (Test-Path $filePath -PathType Leaf) {
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
            $mime = if ($mimeTypes.ContainsKey($ext)) { $mimeTypes[$ext] } else { "application/octet-stream" }
            $response.ContentType = $mime

            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            $response.ContentLength64 = $bytes.Length
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $response.StatusCode = 404
            $errBytes = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found")
            $response.OutputStream.Write($errBytes, 0, $errBytes.Length)
        }
        $response.OutputStream.Close()
    }
} finally {
    $listener.Stop()
}
