#!/bin/bash
# 프로젠 웹사이트 프로젝트 - 맥 설치 스크립트
# (하나가 실패해도 멈추지 않고 끝까지 진행 후 한글 결과 요약을 보여줍니다)
echo ""
echo "======================================"
echo "  프로젠 설치 시작 (맥)"
echo "  중간에 비밀번호를 물으면 컴퓨터 로그인 암호를 입력하세요."
echo "======================================"

# 1. Homebrew (없으면 설치)
if ! command -v brew >/dev/null 2>&1; then
  echo "▶ Homebrew 설치 중... (몇 분 걸릴 수 있어요)"
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || true
fi
[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
[ -x /usr/local/bin/brew ] && eval "$(/usr/local/bin/brew shellenv)"

# 2. 필수 도구 (하나씩 설치 — 하나 실패해도 나머지는 계속)
echo "▶ git 설치 중...";   brew install git   || true
echo "▶ Node.js 설치 중..."; brew install node  || true
echo "▶ GitHub CLI 설치 중..."; brew install gh || true
echo "▶ Codex 설치 중...";  brew install codex || true

# 3. Orca 다운로드 페이지 열기
echo "▶ Orca 다운로드 페이지를 엽니다..."
open "https://www.onorca.dev/download" 2>/dev/null || true

# 4. 결과 요약 (한글)
FAIL=0
line () {
  if command -v "$1" >/dev/null 2>&1; then
    printf "  %-10s : ✅ 설치 완료\n" "$2"
  else
    printf "  %-10s : ❌ 설치 안 됨\n" "$2"; FAIL=1
  fi
}
echo ""
echo "======================================"
echo "  설치 결과"
echo "======================================"
line git   "git"
line node  "Node.js"
line gh     "GitHub CLI"
line codex "Codex"
echo "  Orca       : ⬇️  열린 페이지에서 직접 받아 설치하세요"
echo "======================================"
if [ "$FAIL" = "1" ]; then
  echo ""
  echo "⚠️  ❌ 표시된 것이 있어요."
  echo "   이 화면을 그대로 캡처해서 운영진에게 보내주세요. 함께 해결합니다."
else
  echo ""
  echo "🎉 명령어 도구가 모두 설치됐어요!"
fi
echo ""
echo "▶ 다음 순서 (Orca 앱을 설치한 뒤, Orca 안에서)"
echo "   1) ChatGPT 로그인 → 반드시 'PROGEN' 워크스페이스 선택"
echo "   2) GitHub 로그인"
echo "   3) 우리 팀 저장소 열기(clone) → 코딩 시작"
echo ""
