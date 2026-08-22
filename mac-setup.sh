#!/bin/bash
# 프로젠 웹사이트 프로젝트 - 맥 설치 스크립트
set -e
echo ""
echo "======================================"
echo "  프로젠 설치 시작 (맥)"
echo "======================================"

# 1. Homebrew (없으면 설치)
if ! command -v brew >/dev/null 2>&1; then
  echo "▶ Homebrew 설치 중... (비밀번호를 물어보면 맥 로그인 암호를 입력하세요)"
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
# Homebrew 경로 등록 (애플실리콘/인텔)
[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
[ -x /usr/local/bin/brew ] && eval "$(/usr/local/bin/brew shellenv)"

# 2. 필수 도구
echo "▶ git, node, gh, codex 설치 중..."
brew install git node gh codex

echo ""
echo "✅ 명령어 도구 설치 완료!"
echo ""
echo "▶ 마지막: Orca 앱을 받으세요 (다운로드 페이지가 열립니다)"
open "https://www.onorca.dev/download" 2>/dev/null || true
echo "   → 'Apple Silicon DMG'(M칩) 또는 Intel 버전을 받아서"
echo "     Orca 아이콘을 Applications 폴더로 드래그하세요."
echo ""
echo "======================================"
echo "  다음 순서 (Orca 안에서)"
echo "  1) ChatGPT 로그인 → 반드시 'PROGEN' 워크스페이스 선택"
echo "  2) GitHub 로그인"
echo "  3) 우리 팀 저장소 열기(clone)"
echo "======================================"
