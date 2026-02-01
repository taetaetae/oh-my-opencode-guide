# 설정 가이드

## 📁 설정 파일 위치

| 우선순위 | 위치 | 범위 |
|----------|------|------|
| 1 | `.opencode/oh-my-opencode.json` | 프로젝트 전용 |
| 2 | `~/.config/opencode/oh-my-opencode.json` | 글로벌 |

### JSONC 지원

설정 파일은 JSONC (JSON with Comments)를 지원합니다:

```jsonc
{
  // 라인 주석 가능
  "key": "value",
  
  /* 블록 주석도 가능 */
  "another": "value",
  
  // 마지막 쉼표 허용
  "last": "value",
}
```

## 📋 전체 설정 스키마

```jsonc
{
  "$schema": "https://raw.githubusercontent.com/code-yeongyu/oh-my-opencode/master/assets/oh-my-opencode.schema.json",
  
  // 에이전트 설정
  "agents": {
    "에이전트명": {
      "model": "provider/model-name",
      "temperature": 0.1
    }
  },
  
  // 카테고리 설정
  "categories": {
    "카테고리명": {
      "model": "provider/model-name",
      "description": "카테고리 설명"
    }
  },
  
  // 백그라운드 작업 설정
  "background_task": {
    "defaultConcurrency": 5,
    "providerConcurrency": {
      "anthropic": 3,
      "openai": 5
    }
  },
  
  // 비활성화 설정
  "disabled_hooks": [],
  "disabled_agents": [],
  "disabled_skills": [],
  "disabled_mcps": [],
  
  // Git Master 설정
  "git_master": {
    "watermark": true,
    "co_author": "AI <ai@example.com>"
  }
}
```

## 🤖 에이전트 설정

### 모델 오버라이드

```jsonc
{
  "agents": {
    "oracle": {
      "model": "openai/gpt-5.2",
      "temperature": 0.1
    },
    "explore": {
      "model": "anthropic/claude-haiku-4-5"
    }
  }
}
```

### 사용 가능한 에이전트

| 에이전트 | 기본 모델 |
|----------|-----------|
| `sisyphus` | claude-opus-4-5 |
| `oracle` | gpt-5.2 |
| `librarian` | glm-4.7 |
| `explore` | claude-haiku-4-5 |
| `prometheus` | claude-opus-4-5 |
| `sisyphus-junior` | claude-sonnet-4-5 |

## 📂 카테고리 설정

카테고리는 `delegate_task`에서 사용되는 작업 분류입니다:

```jsonc
{
  "categories": {
    "visual-engineering": {
      "model": "google/gemini-3-pro",
      "description": "프론트엔드, UI/UX, 시각적 작업"
    },
    "quick": {
      "model": "anthropic/claude-haiku-4-5",
      "description": "간단하고 빠른 작업"
    },
    "data-science": {
      "model": "anthropic/claude-opus-4-5",
      "description": "데이터 분석, ML, 통계"
    }
  }
}
```

## ⚡ 백그라운드 작업 설정

```jsonc
{
  "background_task": {
    "defaultConcurrency": 5,
    "providerConcurrency": {
      "anthropic": 3,
      "openai": 5,
      "google": 4
    }
  }
}
```

| 상황 | 권장 설정 |
|------|-----------|
| API 제한이 엄격한 경우 | 낮은 동시성 (2-3) |
| 빠른 작업이 필요한 경우 | 높은 동시성 (5-10) |
| 비용 절감이 필요한 경우 | 낮은 동시성 |

## 🚫 비활성화 설정

```jsonc
{
  "disabled_hooks": ["comment-checker"],
  "disabled_agents": ["multimodal-looker"],
  "disabled_skills": ["playwright"],
  "disabled_mcps": ["websearch"]
}
```

## 🔀 Git Master 설정

```jsonc
{
  "git_master": {
    "watermark": true,
    "co_author": "AI Assistant <ai@example.com>"
  }
}
```

**워터마크 예시**:
```
feat: 사용자 인증 기능 추가

🤖 Generated with Oh-My-OpenCode
Co-authored-by: AI Assistant <ai@example.com>
```

## 📝 설정 예제

### 최소 설정

```jsonc
{
  "$schema": "https://raw.githubusercontent.com/code-yeongyu/oh-my-opencode/master/assets/oh-my-opencode.schema.json"
}
```

### 비용 최적화 설정

```jsonc
{
  "$schema": "https://raw.githubusercontent.com/code-yeongyu/oh-my-opencode/master/assets/oh-my-opencode.schema.json",
  
  "agents": {
    "oracle": { "model": "anthropic/claude-sonnet-4" },
    "prometheus": { "model": "anthropic/claude-sonnet-4" }
  },
  
  "background_task": {
    "defaultConcurrency": 3
  },
  
  "disabled_agents": ["multimodal-looker"]
}
```

### 팀 프로젝트 설정

```jsonc
{
  "$schema": "https://raw.githubusercontent.com/code-yeongyu/oh-my-opencode/master/assets/oh-my-opencode.schema.json",
  
  "git_master": {
    "watermark": true,
    "co_author": "Team AI <team-ai@company.com>"
  },
  
  "categories": {
    "frontend": {
      "model": "anthropic/claude-sonnet-4",
      "description": "프론트엔드 작업"
    },
    "backend": {
      "model": "anthropic/claude-sonnet-4",
      "description": "백엔드 작업"
    }
  }
}
```

## ✅ 설정 검증

```bash
bunx oh-my-opencode doctor
```

이 명령어는:
- JSONC 문법 검사
- Zod 스키마 검증
- 모델 해석 가능 여부 확인
- 참조된 훅/에이전트 존재 여부 확인

## 📚 다음 단계

- [MCP 통합](/guide/mcp) - MCP 서버 연동
- [워크플로우 예제](/examples/) - 실전 활용
