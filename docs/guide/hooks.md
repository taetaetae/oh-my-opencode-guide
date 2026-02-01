# 훅 시스템

<div class="highlight-box">
훅은 <strong>특정 이벤트가 발생할 때 자동으로 실행되는 규칙</strong>입니다.
파일을 읽을 때, 도구를 실행할 때, 세션이 시작될 때 등 다양한 시점에 자동으로 동작을 추가할 수 있습니다.
</div>

## 🎯 훅이란?

```
훅 = Git Hooks와 유사

Git Hooks:
- pre-commit → 커밋 전에 린트 실행
- post-merge → 머지 후 의존성 설치

Oh-My-OpenCode 훅:
- PreToolUse → 도구 실행 전에 컨텍스트 주입
- PostToolUse → 도구 실행 후 결과 가공
```

## 📊 훅 이벤트 종류

| 이벤트 | 시점 | 차단 가능 | 용도 |
|--------|------|-----------|------|
| `UserPromptSubmit` | 사용자 메시지 제출 시 | ✅ | 키워드 감지, 모드 전환 |
| `PreToolUse` | 도구 실행 전 | ✅ | 입력 검증, 컨텍스트 주입 |
| `PostToolUse` | 도구 실행 후 | ❌ | 출력 가공, 에러 복구 |
| `Stop` | 세션 유휴 상태 | ❌ | 정리 작업, 알림 |
| `onSummarize` | 컴팩션 중 | ❌ | 상태 보존 |

## 📦 내장 훅 (34개)

### 🔍 컨텍스트 주입 훅

| 훅 | 기능 |
|----|------|
| `directory-agents-injector` | 파일 읽을 때 AGENTS.md 자동 주입 |
| `directory-readme-injector` | 파일 읽을 때 README.md 자동 주입 |
| `rules-injector` | `.rules/` 폴더의 조건부 규칙 주입 |
| `compaction-context-injector` | 컴팩션 시 중요 컨텍스트 보존 |

### ⚡ 생산성 훅

| 훅 | 기능 |
|----|------|
| `keyword-detector` | ultrawork/search/analyze 키워드 감지 |
| `think-mode` | 복잡한 작업 시 확장 사고 모드 활성화 |
| `ralph-loop` | 자기 참조 개발 루프 관리 |
| `todo-continuation-enforcer` | TODO 완료까지 작업 강제 |
| `auto-slash-command` | `/명령어` 패턴 감지 |

### 🛡️ 품질 관리 훅

| 훅 | 기능 |
|----|------|
| `comment-checker` | AI 생성 과도한 주석 방지 |
| `thinking-block-validator` | 사고 블록 유효성 검증 |
| `edit-error-recovery` | 편집 실패 시 자동 복구 |

### 🔄 복구 및 안정성 훅

| 훅 | 기능 |
|----|------|
| `session-recovery` | 세션 크래시 시 자동 복구 |
| `anthropic-context-window-limit-recovery` | 컨텍스트 한계 처리 |
| `background-compaction` | 토큰 한계 시 자동 컴팩션 |
| `tool-output-truncator` | 긴 출력 자동 잘라내기 |

### 🔔 알림 훅

| 훅 | 기능 |
|----|------|
| `background-notification` | 백그라운드 작업 완료 시 OS 알림 |
| `context-window-monitor` | 컨텍스트 사용량 모니터링 |

## ⚙️ 훅 설정

### 훅 비활성화

```jsonc
// .opencode/oh-my-opencode.json
{
  "disabled_hooks": [
    "comment-checker",
    "auto-update-checker"
  ]
}
```

## 📝 Rules 파일 작성

`.rules/` 폴더에 조건부 규칙을 정의할 수 있습니다.

### 기본 구조

```markdown
---
globs: ["패턴1", "패턴2"]
alwaysApply: false
---

# 규칙 내용
이 규칙은 globs 패턴에 매칭되는 파일을 다룰 때 적용됩니다.
```

### 예제: TypeScript 규칙

::: code-group
```markdown [.rules/typescript.md]
---
globs: ["**/*.ts", "**/*.tsx", "!**/*.test.ts"]
---

# TypeScript 코딩 규칙

## 필수 사항
- strict 모드 사용
- any 타입 사용 금지
- 인터페이스 우선 (type보다)

## 네이밍 규칙
- 컴포넌트: PascalCase
- 함수: camelCase
- 상수: UPPER_SNAKE_CASE

## 금지 사항
- @ts-ignore 사용 금지
- @ts-expect-error 사용 금지
- 빈 catch 블록 금지
```
:::

### 예제: 테스트 규칙

::: code-group
```markdown [.rules/testing.md]
---
globs: ["**/*.test.ts", "**/*.spec.ts"]
---

# 테스트 작성 규칙

## 구조
- describe로 테스트 그룹화
- it으로 개별 테스트 작성
- BDD 스타일 주석 사용

## BDD 주석 형식
//#given 초기 상태 설명
//#when 동작 설명
//#then 예상 결과 설명

## 필수 테스트
- 정상 케이스
- 엣지 케이스
- 에러 케이스
```
:::

### 예제: API 규칙

::: code-group
```markdown [.rules/api.md]
---
globs: ["src/api/**/*.ts", "src/routes/**/*.ts"]
---

# API 개발 규칙

## 응답 형식
모든 API는 다음 형식을 따릅니다:
{
  success: boolean;
  data?: T;
  error?: { code: string; message: string; };
}

## 에러 처리
- 모든 에러는 try-catch로 처리
- 적절한 HTTP 상태 코드 반환
- 에러 로깅 필수
```
:::

## 📊 훅 동작 순서

```
사용자 입력
    │
    ▼
┌─────────────────────┐
│ UserPromptSubmit    │ ← 키워드 감지, 모드 전환
└─────────────────────┘
    │
    ▼
┌─────────────────────┐
│ PreToolUse          │ ← 컨텍스트 주입, 입력 검증
└─────────────────────┘
    │
    ▼
┌─────────────────────┐
│ [도구 실행]          │
└─────────────────────┘
    │
    ▼
┌─────────────────────┐
│ PostToolUse         │ ← 출력 가공, 에러 복구
└─────────────────────┘
    │
    ▼
┌─────────────────────┐
│ Stop (유휴 시)       │ ← 정리 작업, 알림
└─────────────────────┘
```

## 💡 훅 활용 팁

::: tip 효과적인 사용
1. **규칙 파일 활용**: 프로젝트별 코딩 규칙을 `.rules/`에 정의
2. **AGENTS.md 작성**: 각 디렉토리에 컨텍스트 문서 작성
3. **불필요한 훅 비활성화**: 프로젝트에 맞지 않는 훅은 비활성화
:::

::: danger 피해야 할 패턴
- ❌ 과도한 규칙: 너무 많은 규칙은 에이전트를 혼란스럽게 함
- ❌ 충돌하는 규칙: 서로 모순되는 규칙 정의
- ❌ 모든 훅 비활성화: 핵심 기능이 동작하지 않을 수 있음
:::

## 📚 다음 단계

- [설정 가이드](/guide/configuration) - 모든 설정 옵션 상세
- [MCP 통합](/guide/mcp) - MCP 서버 연동
