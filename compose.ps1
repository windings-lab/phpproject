# compose.ps1

# Exit if any command fails
$ErrorActionPreference = "Stop"

# Load variables from myvars.env
Get-Content .env.prod | ForEach-Object {
    if ($_ -match '^\s*([^#][^=]*)=(.*)$') {
        $key = $matches[1].Trim()
        $value = $matches[2].Trim()
        [System.Environment]::SetEnvironmentVariable($key, $value)
    }
}

# Run docker compose
docker compose -f docker-compose.yaml up -d