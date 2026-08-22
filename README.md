# 프로젠 웹사이트 프로젝트 — 설치 안내

각 팀 **운전자(코딩 담당)**는 아래를 따라 한 번만 설치하면 됩니다.

## 맥(Mac)
**터미널**을 열고 아래 한 줄을 붙여넣고 Enter:
```
curl -fsSL https://raw.githubusercontent.com/progen-ai-kr/setup/main/mac-setup.sh | bash
```

## 윈도우(Windows)
**PowerShell**을 열고 아래 한 줄을 붙여넣고 Enter:
```
irm https://raw.githubusercontent.com/progen-ai-kr/setup/main/win-setup.ps1 | iex
```

---

## 설치되는 것
- git, Node.js, GitHub CLI, Codex (명령어 도구)
- 마지막에 **Orca 다운로드 페이지**가 열립니다 → Orca 앱을 받아 설치하세요.

## 설치 후 — 로그인 2개 (같은 터미널에서)
설치가 끝난 **바로 그 터미널 창**에서 순서대로 입력하세요. (⚠️ Orca 안의 터미널 말고 **맥 기본 터미널 / 윈도우 PowerShell**에서)

**1) Codex 로그인**
```
codex login
```
→ 브라우저가 열리면 로그인 → **"워크스페이스 선택"에서 반드시 PROGEN 선택** → 계속

**2) GitHub 로그인**
```
gh auth login
```
→ GitHub.com → HTTPS → Yes → **Login with a web browser** → 뜨는 코드 복사 → 브라우저에서 **본인 GitHub 계정**으로 로그인 → 코드 입력 → **Authorize**

## 마지막 — Orca에서 작업
1. **Orca 열기**
2. **Projects → + → "URL에서 복제"** 로 우리 팀 저장소 주소 붙여넣기 (또는 이미 받았으면 "폴더 찾아보기")
3. 작업 만들 때 **에이전트 = Codex** 선택
4. Codex에게 우리말로 지시 → 완성되면 push → 자동 배포

> 설치 중 "비밀번호"를 물어보면 본인 컴퓨터 로그인 암호를 입력하세요.
> 막히면 운영진에게 화면을 캡처해서 문의하세요.
