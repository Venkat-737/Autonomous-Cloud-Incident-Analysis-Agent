Write-Host "Starting Autonomous Agent Services..." -ForegroundColor Green

# 1. Start Kubernetes MCP Server (Port 9000)
Write-Host "Launching K8s MCP Server..."
Start-Process powershell -ArgumentList "-NoExit", "-Command", "& '.\venv\Scripts\activate'; python mcp-servers/kubernetes-mcp/main.py"

# 2. Start AWS MCP Server (Port 9001)
Write-Host "Launching AWS MCP Server..."
Start-Process powershell -ArgumentList "-NoExit", "-Command", "& '.\venv\Scripts\activate'; python mcp-servers/aws-mcp/main.py"

# 3. Start GitHub MCP Server (Port 9002)
Write-Host "Launching GitHub MCP Server..."
Start-Process powershell -ArgumentList "-NoExit", "-Command", "& '.\venv\Scripts\activate'; python mcp-servers/github-mcp/main.py"

# 4. Start Backend (Port 7000)
Write-Host "Launching Backend API..."
Start-Process powershell -ArgumentList "-NoExit", "-Command", "& '.\venv\Scripts\activate'; uvicorn backend.main:app --reload --port 7000"

Write-Host "All backend services initiated." -ForegroundColor Green
Write-Host "Please ensure you have a terminal running 'npm run dev' for the frontend." -ForegroundColor Yellow
