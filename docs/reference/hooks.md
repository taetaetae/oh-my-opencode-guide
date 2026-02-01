# 훅 목록

Oh-My-OpenCode의 34개 훅 전체 레퍼런스입니다.

## 훅 이벤트

| 이벤트 | 시점 | 차단 가능 |
|--------|------|-----------|
| `UserPromptSubmit` | 사용자 메시지 제출 시 | ✅ |
| `PreToolUse` | 도구 실행 전 | ✅ |
| `PostToolUse` | 도구 실행 후 | ❌ |
| `Stop` | 세션 유휴 상태 | ❌ |
| `onSummarize` | 컴팩션 중 | ❌ |

## 컨텍스트 주입 훅

| 훅 | 이벤트 | 설명 |
|----|--------|------|
| `directory-agents-injector` | PostToolUse | 파일 읽을 때 AGENTS.md 자동 주입 |
| `directory-readme-injector` | PostToolUse | 파일 읽을 때 README.md 자동 주입 |
| `rules-injector` | PostToolUse | `.rules/` 폴더의 조건부 규칙 주입 |
| `compaction-context-injector` | onSummarize | 컴팩션 시 중요 컨텍스트 보존 |

## 생산성 훅

| 훅 | 이벤트 | 설명 |
|----|--------|------|
| `keyword-detector` | UserPromptSubmit | ultrawork/search/analyze 키워드 감지 |
| `think-mode` | UserPromptSubmit | 복잡한 작업 시 확장 사고 모드 활성화 |
| `ralph-loop` | Stop | 자기 참조 개발 루프 관리 |
| `todo-continuation-enforcer` | Stop | TODO 완료까지 작업 강제 |
| `auto-slash-command` | UserPromptSubmit | `/명령어` 패턴 감지 |

## 품질 관리 훅

| 훅 | 이벤트 | 설명 |
|----|--------|------|
| `comment-checker` | PostToolUse | AI 생성 과도한 주석 방지 |
| `thinking-block-validator` | PostToolUse | 사고 블록 유효성 검증 |
| `edit-error-recovery` | PostToolUse | 편집 실패 시 자동 복구 |

## 복구 및 안정성 훅

| 훅 | 이벤트 | 설명 |
|----|--------|------|
| `session-recovery` | event | 세션 크래시 시 자동 복구 |
| `anthropic-context-window-limit-recovery` | event | 컨텍스트 한계 처리 |
| `background-compaction` | event | 토큰 한계 시 자동 컴팩션 |
| `tool-output-truncator` | PostToolUse | 긴 출력 자동 잘라내기 |

## 알림 훅

| 훅 | 이벤트 | 설명 |
|----|--------|------|
| `background-notification` | event | 백그라운드 작업 완료 시 OS 알림 |
| `context-window-monitor` | event | 컨텍스트 사용량 모니터링 |

## 오케스트레이션 훅

| 훅 | 이벤트 | 설명 |
|----|--------|------|
| `atlas` | multiple | 메인 오케스트레이션 훅 |
| `prometheus-md-only` | PreToolUse | Prometheus가 .md 파일만 수정하도록 제한 |

## 훅 비활성화

```jsonc
// .opencode/oh-my-opencode.json
{
  "disabled_hooks": [
    "comment-checker",
    "auto-update-checker",
    "background-notification"
  ]
}
```
