# 프로젠 웹사이트 프로젝트 - 윈도우 설치 스크립트
# (하나가 실패해도 멈추지 않고 끝까지 진행 후 한글 결과 요약을 보여줍니다)
$ErrorActionPreference = "Continue"
Write-Host ""
Write-Host "======================================"
Write-Host "  프로젠 설치 시작 (윈도우)"
Write-Host "======================================"

# 1. 필수 도구 (winget) — 하나 실패해도 계속
Write-Host "▶ git 설치 중..."
try { winget install --id Git.Git -e --accept-source-agreements --accept-package-agreements } catch {}
Write-Host "▶ Node.js 설치 중..."
try { winget install --id OpenJS.NodeJS.LTS -e --accept-source-agreements --accept-package-agreements } catch {}
Write-Host "▶ GitHub CLI 설치 중..."
try { winget install --id GitHub.cli -e --accept-source-agreements --accept-package-agreements } catch {}

# 2. PATH 새로고침 (방금 설치한 node/npm 인식)
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# 3. Codex CLI (npm)
Write-Host "▶ Codex CLI 설치 중..."
try { npm install -g @openai/codex } catch {}

# 4. Orca 다운로드 페이지 열기
Write-Host "▶ Orca 다운로드 페이지를 엽니다..."
Start-Process "https://www.onorca.dev/download"

# 5. 결과 요약 (한글)
function Check($cmd, $label) {
  if (Get-Command $cmd -ErrorAction SilentlyContinue) {
    Write-Host ("  {0,-10} : OK 설치 완료" -f $label)
    return $true
  } else {
    Write-Host ("  {0,-10} : X  설치 안 됨" -f $label)
    return $false
  }
}
Write-Host ""
Write-Host "======================================"
Write-Host "  설치 결과"
Write-Host "======================================"
$ok = $true
if (-not (Check "git"   "git"))     { $ok = $false }
if (-not (Check "node"  "Node.js")) { $ok = $false }
if (-not (Check "gh"    "GitHub CLI")) { $ok = $false }
if (-not (Check "codex" "Codex"))   { $ok = $false }
Write-Host "  Orca       : (다운) 열린 페이지에서 직접 받아 설치하세요"
Write-Host "======================================"
if (-not $ok) {
  Write-Host ""
  Write-Host "[주의] X 표시된 것이 있어요."
  Write-Host "이 화면을 그대로 캡처해서 운영진에게 보내주세요. 함께 해결합니다."
} else {
  Write-Host ""
  Write-Host "[완료] 명령어 도구가 모두 설치됐어요!"
}
Write-Host ""
Write-Host "▶ 다음 순서 (Orca 앱을 설치한 뒤, Orca 안에서)"
Write-Host "   1) ChatGPT 로그인 -> 반드시 'PROGEN' 워크스페이스 선택"
Write-Host "   2) GitHub 로그인"
Write-Host "   3) 우리 팀 저장소 열기(clone) -> 코딩 시작"
Write-Host ""
