# MCP 통합

<div class="highlight-box">
MCP (Model Context Protocol)는 AI 에이전트가 <strong>외부 도구와 데이터 소스에 접근</strong>할 수 있게 해주는 프로토콜입니다.
</div>

## 🎯 MCP란?

```
에이전트 = 개발자
MCP 서버 = 개발 도구

개발자 + PostgreSQL 클라이언트 = DB 작업 가능
에이전트 + PostgreSQL MCP = DB 작업 가능
```

## 📦 내장 MCP 서버 (3개)

| 이름 | URL | 용도 |
|------|-----|------|
| `websearch` | mcp.exa.ai | 실시간 웹 검색 |
| `context7` | mcp.context7.com | 라이브러리 공식 문서 조회 |
| `grep_app` | mcp.grep.app | GitHub 코드 검색 |

### 사용 예시

```bash
# 웹 검색
최신 React 19 변경사항 검색해줘
→ websearch MCP로 실시간 검색

# 문서 조회
Prisma의 트랜잭션 API 문서 찾아줘
→ context7 MCP로 공식 문서 조회

# 코드 검색
React Query에서 useMutation 사용 예제 찾아줘
→ grep_app MCP로 GitHub 검색
```

## 🔧 MCP 설정 방법

### 방법 1: 스킬에 MCP 포함

```markdown
---
name: database-skill
description: "데이터베이스 작업 전문가"
mcp:
  postgres:
    command: npx
    args: ["-y", "@modelcontextprotocol/server-postgres"]
    env:
      DATABASE_URL: "${DATABASE_URL}"
---

# 데이터베이스 스킬
이 스킬이 로드되면 PostgreSQL MCP 서버가 자동으로 시작됩니다.
```

### 방법 2: .mcp.json 파일

::: code-group
```jsonc [.mcp.json]
{
  "mcpServers": {
    "postgres": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-postgres"],
      "env": {
        "DATABASE_URL": "${DATABASE_URL}"
      }
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_TOKEN": "${GITHUB_TOKEN}"
      }
    }
  }
}
```
:::

### 방법 3: 글로벌 MCP 설정

```jsonc
// ~/.claude/.mcp.json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/path/to/dir"]
    }
  }
}
```

## 📋 인기 MCP 서버

### 데이터베이스

| 서버 | 패키지 |
|------|--------|
| PostgreSQL | `@modelcontextprotocol/server-postgres` |
| SQLite | `@modelcontextprotocol/server-sqlite` |

### 개발 도구

| 서버 | 패키지 |
|------|--------|
| GitHub | `@modelcontextprotocol/server-github` |
| Git | `@modelcontextprotocol/server-git` |
| Filesystem | `@modelcontextprotocol/server-filesystem` |

### 브라우저/웹

| 서버 | 패키지 |
|------|--------|
| Playwright | `@anthropic-ai/mcp-playwright` |
| Puppeteer | `@anthropic-ai/mcp-puppeteer` |
| Fetch | `@modelcontextprotocol/server-fetch` |

## 📝 MCP 설정 예제

### PostgreSQL 연결

```jsonc
{
  "mcpServers": {
    "postgres": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-postgres"],
      "env": {
        "DATABASE_URL": "postgresql://user:pass@localhost:5432/mydb"
      }
    }
  }
}
```

**사용**:
```bash
users 테이블에서 최근 가입한 10명 조회해줘
→ PostgreSQL MCP로 쿼리 실행
```

### GitHub 연결

```jsonc
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_TOKEN": "${GITHUB_TOKEN}"
      }
    }
  }
}
```

**사용**:
```bash
이 레포지토리에 이슈 생성해줘: "버그 수정 필요"
→ GitHub MCP로 이슈 생성
```

## 🔐 환경 변수 사용

```jsonc
{
  "mcpServers": {
    "postgres": {
      "env": {
        "DATABASE_URL": "${DATABASE_URL}",
        "SSL_MODE": "${DB_SSL_MODE:-require}"
      }
    }
  }
}
```

### 환경 변수 설정

```bash
# .env 파일
DATABASE_URL=postgresql://user:pass@localhost:5432/mydb
GITHUB_TOKEN=ghp_xxxxxxxxxxxx

# 또는 쉘에서 직접 설정
export DATABASE_URL="postgresql://..."
```

## 🚫 MCP 비활성화

```jsonc
// .opencode/oh-my-opencode.json
{
  "disabled_mcps": [
    "websearch",
    "grep_app"
  ]
}
```

## 📊 MCP 연결 확인

```bash
bunx oh-my-opencode doctor
```

**출력 예시**:
```
MCP Connectivity:
  ✅ websearch (mcp.exa.ai) - Connected
  ✅ context7 (mcp.context7.com) - Connected
  ✅ grep_app (mcp.grep.app) - Connected
  ✅ postgres (local) - Connected
  ❌ github (local) - Failed: GITHUB_TOKEN not set
```

## 💡 MCP 활용 팁

::: tip 효과적인 사용
1. **필요한 MCP만 활성화**: 불필요한 MCP는 리소스 낭비
2. **환경 변수 활용**: 민감한 정보는 환경 변수로 관리
3. **스킬과 결합**: 관련 MCP를 스킬에 포함시켜 자동 로드
:::

::: danger 피해야 할 패턴
- ❌ 하드코딩된 자격 증명: API 키를 설정 파일에 직접 입력
- ❌ 과도한 MCP 연결: 너무 많은 MCP는 성능 저하
- ❌ 권한 과다 부여: 필요한 최소 권한만 부여
:::

## 📚 다음 단계

- [워크플로우 예제](/examples/) - 실전 MCP 활용
- [스킬 시스템](/guide/skills) - MCP를 스킬에 포함
