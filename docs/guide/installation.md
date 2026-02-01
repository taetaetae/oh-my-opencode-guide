# 설치

## 📋 사전 요구사항

### 필수

| 요구사항 | 설명 |
|----------|------|
| **Bun** | 패키지 매니저 (npm/yarn 대신 사용) |
| **OpenCode** | 설치 및 설정 완료 |
| **API 키** | Anthropic, OpenAI 등 |

### 권장

| 요구사항 | 설명 |
|----------|------|
| **ast-grep** | AST 기반 코드 검색/수정 |
| **gh** | GitHub CLI (GitHub 연동) |

## 🔧 설치 방법

### 방법 1: 대화형 설치 (권장)

```bash
bunx oh-my-opencode install
```

이 명령어는:
1. 설정 파일 위치 선택 (프로젝트/글로벌)
2. 기본 설정 생성
3. 필요한 의존성 확인

### 방법 2: 수동 설치

**Step 1**: OpenCode 설정 파일에 플러그인 추가

```json
// ~/.config/opencode/config.json
{
  "plugins": ["oh-my-opencode"]
}
```

**Step 2**: 설정 파일 생성

::: code-group
```bash [프로젝트별 설정]
mkdir -p .opencode
touch .opencode/oh-my-opencode.json
```

```bash [글로벌 설정]
touch ~/.config/opencode/oh-my-opencode.json
```
:::

**Step 3**: 기본 설정 추가

```jsonc
// .opencode/oh-my-opencode.json
{
  "$schema": "https://raw.githubusercontent.com/code-yeongyu/oh-my-opencode/master/assets/oh-my-opencode.schema.json"
}
```

## ✅ 설치 확인

```bash
bunx oh-my-opencode doctor
```

### Doctor 검사 항목 (14개)

| 카테고리 | 검사 항목 |
|----------|-----------|
| **설치** | OpenCode 설치, 플러그인 버전 |
| **설정** | JSONC 문법, Zod 검증, 모델 해석 |
| **인증** | Anthropic, OpenAI, Google API |
| **의존성** | ast-grep, comment-checker, gh-cli |
| **도구** | LSP, MCP 연결 |

### 성공 출력 예시

```
Oh-My-OpenCode Doctor
=====================

Installation:
  ✅ OpenCode installed (v1.2.3)
  ✅ Plugin version (v3.2.1)

Configuration:
  ✅ Config file valid
  ✅ Schema validation passed

Authentication:
  ✅ Anthropic API key set
  ✅ OpenAI API key set
  ⚠️ Google API key not set (optional)

Dependencies:
  ✅ ast-grep installed
  ✅ gh CLI installed

Tools:
  ✅ LSP connection OK
  ✅ MCP servers connected (3/3)
```

## 🔧 선택적 의존성 설치

### ast-grep

AST 기반 코드 검색 및 수정 도구입니다.

::: code-group
```bash [macOS]
brew install ast-grep
```

```bash [npm]
npm install -g @ast-grep/cli
```

```bash [cargo]
cargo install ast-grep
```
:::

### GitHub CLI

GitHub 연동 기능에 필요합니다.

::: code-group
```bash [macOS]
brew install gh
gh auth login
```

```bash [Linux]
# Debian/Ubuntu
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh
```
:::

## 🆘 문제 해결

### "플러그인을 찾을 수 없습니다"

```bash
bunx oh-my-opencode install --force
```

### "API 키가 설정되지 않았습니다"

```bash
# 환경 변수 확인
echo $ANTHROPIC_API_KEY
echo $OPENAI_API_KEY

# 설정 방법
export ANTHROPIC_API_KEY="sk-ant-..."
export OPENAI_API_KEY="sk-..."
```

### "설정 파일 오류"

```bash
# 설정 파일 검증
bunx oh-my-opencode doctor

# 스키마 확인
cat .opencode/oh-my-opencode.json
```

## 📚 다음 단계

설치가 완료되었다면:

- [빠른 시작](/guide/quickstart) - 첫 번째 작업 실행
- [에이전트 시스템](/guide/agents) - 에이전트 이해하기
