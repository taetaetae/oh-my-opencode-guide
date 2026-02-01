# 설정 스키마

Oh-My-OpenCode 설정 파일의 전체 스키마 레퍼런스입니다.

## 설정 파일 위치

| 우선순위 | 위치 |
|----------|------|
| 1 | `.opencode/oh-my-opencode.json` |
| 2 | `~/.config/opencode/oh-my-opencode.json` |

## 전체 스키마

```jsonc
{
  // JSON 스키마 (자동완성 지원)
  "$schema": "https://raw.githubusercontent.com/code-yeongyu/oh-my-opencode/master/assets/oh-my-opencode.schema.json",

  // 에이전트 설정
  "agents": {
    "[agent-name]": {
      "model": "string",      // provider/model-name
      "temperature": "number" // 0.0 - 1.0
    }
  },

  // 카테고리 설정
  "categories": {
    "[category-name]": {
      "model": "string",
      "description": "string",
      "temperature": "number"
    }
  },

  // 백그라운드 작업 설정
  "background_task": {
    "defaultConcurrency": "number",
    "providerConcurrency": {
      "anthropic": "number",
      "openai": "number",
      "google": "number"
    }
  },

  // 비활성화 설정
  "disabled_hooks": ["string"],
  "disabled_agents": ["string"],
  "disabled_skills": ["string"],
  "disabled_mcps": ["string"],

  // Git Master 설정
  "git_master": {
    "watermark": "boolean",
    "co_author": "string"
  },

  // Tmux 설정
  "tmux": {
    "enabled": "boolean",
    "layout": "string"
  },

  // 실험적 기능
  "experimental": {
    "[feature-name]": "boolean"
  }
}
```

## agents

에이전트별 모델 및 설정을 오버라이드합니다.

```jsonc
{
  "agents": {
    "oracle": {
      "model": "openai/gpt-5.2",
      "temperature": 0.1
    }
  }
}
```

### 사용 가능한 에이전트

`sisyphus`, `hephaestus`, `atlas`, `oracle`, `prometheus`, `metis`, `momus`, `librarian`, `explore`, `multimodal-looker`, `sisyphus-junior`

## categories

delegate_task에서 사용할 카테고리를 정의합니다.

```jsonc
{
  "categories": {
    "visual-engineering": {
      "model": "google/gemini-3-pro",
      "description": "프론트엔드, UI/UX 작업"
    },
    "quick": {
      "model": "anthropic/claude-haiku-4-5",
      "description": "간단하고 빠른 작업"
    }
  }
}
```

## background_task

백그라운드 작업의 동시성을 제어합니다.

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

## disabled_*

특정 기능을 비활성화합니다.

```jsonc
{
  "disabled_hooks": ["comment-checker"],
  "disabled_agents": ["multimodal-looker"],
  "disabled_skills": ["playwright"],
  "disabled_mcps": ["websearch"]
}
```

## git_master

Git Master 스킬의 동작을 설정합니다.

```jsonc
{
  "git_master": {
    "watermark": true,
    "co_author": "AI Assistant <ai@example.com>"
  }
}
```

## tmux

Tmux 통합을 설정합니다.

```jsonc
{
  "tmux": {
    "enabled": true,
    "layout": "main-vertical"
  }
}
```

## 설정 검증

```bash
bunx oh-my-opencode doctor
```
