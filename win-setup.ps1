# 프로젠 웹사이트 프로젝트 - 윈도우 설치 스크립트
Write-Host ""
Write-Host "======================================"
Write-Host "  프로젠 설치 시작 (윈도우)"
Write-Host "======================================"

# 1. 필수 도구 (winget)
Write-Host "▶ git 설치 중..."
winget install --id Git.Git -e --accept-source-agreements --accept-package-agreements
Write-Host "▶ Node.js 설치 중..."
winget install --id OpenJS.NodeJS.LTS -e --accept-source-agreements --accept-package-agreements
Write-Host "▶ GitHub CLI 설치 중..."
winget install --id GitHub.cli -e --accept-source-agreements --accept-package-agreements

# 2. PATH 새로고침 (방금 설치한 node/npm 인식)
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# 3. Codex CLI (npm)
Write-Host "▶ Codex CLI 설치 중..."
npm install -g @openai/codex

Write-Host ""
Write-Host "✅ 명령어 도구 설치 완료!"
Write-Host ""
Write-Host "▶ 마지막: Orca 앱을 받으세요 (다운로드 페이지가 열립니다)"
Start-Process "https://www.onorca.dev/download"
Write-Host "   → 'Windows 10/11 x64' 설치파일을 받아서 설치하세요."
Write-Host ""
Write-Host "======================================"
Write-Host "  다음 순서 (Orca 안에서)"
Write-Host "  1) ChatGPT 로그인 -> 반드시 'PROGEN' 워크스페이스 선택"
Write-Host "  2) GitHub 로그인"
Write-Host "  3) 우리 팀 저장소 열기(clone)"
Write-Host "======================================"
