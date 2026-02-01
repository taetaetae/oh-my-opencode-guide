# 훅 시스템

Oh-My-OpenCode의 훅은 **자동으로 처리되는 것들**입니다. 파일을 읽을 때, 키워드를 입력할 때, 에러가 발생할 때 등 다양한 시점에 자동으로 동작합니다.

## 🪝 훅이 하는 일

### 1. 자동 컨텍스트 주입

파일을 읽으면 관련 정보가 자동으로 주입됩니다:

```
src/components/Button.tsx 읽기
         │
         ▼
┌─────────────────────────────────┐
│ directory-agents-injector 훅   │
│ src/components/AGENTS.md 찾기  │
│ 내용 자동 주입                  │
└─────────────────────────────────┘
         │
         ▼
에이전트가 컴포넌트 컨텍스트 이해
```

**주입되는 파일들:**
- `AGENTS.md` - 디렉토리 설명
- `README.md` - 프로젝트/모듈 설명
- `.rules/*.md` - 코딩 규칙 (해당 파일 패턴에 맞을 때)

### 2. 키워드 감지

특정 키워드를 입력하면 자동으로 모드가 전환됩니다:

| 입력 | 자동 동작 |
|------|-----------|
| `ulw ...` 또는 `ultrawork ...` | Ultrawork 모드 활성화 |
| `analyze ...` | 분석 모드 활성화 |
| `search ...` | 검색 모드 활성화 |
| `/명령어` | 슬래시 명령어 실행 |

### 3. 자동 복구

문제가 발생하면 자동으로 복구를 시도합니다:

| 상황 | 자동 동작 |
|------|-----------|
| 편집 실패 | 다른 방법으로 재시도 |
| 컨텍스트 한계 도달 | 자동 컴팩션 |
| 세션 크래시 | 자동 복구 |

### 4. 알림

백그라운드 작업이 완료되면 OS 알림을 보냅니다.

---

## 📋 주요 훅 목록

### 컨텍스트 주입

| 훅 | 하는 일 |
|----|---------|
| `directory-agents-injector` | AGENTS.md 자동 주입 |
| `directory-readme-injector` | README.md 자동 주입 |
| `rules-injector` | .rules/ 규칙 자동 적용 |

### 키워드 감지

| 훅 | 하는 일 |
|----|---------|
| `keyword-detector` | ulw/analyze/search 감지 |
| `auto-slash-command` | /명령어 패턴 감지 |
| `think-mode` | 복잡한 작업 시 확장 사고 모드 |

### 자동 복구

| 훅 | 하는 일 |
|----|---------|
| `edit-error-recovery` | 편집 실패 시 복구 |
| `session-recovery` | 세션 크래시 복구 |
| `background-compaction` | 컨텍스트 한계 시 자동 컴팩션 |

### 품질 관리

| 훅 | 하는 일 |
|----|---------|
| `comment-checker` | AI가 과도한 주석 생성 방지 |
| `todo-continuation-enforcer` | TODO 완료까지 작업 강제 |

---

## 📝 AGENTS.md 활용하기

`/init-deep` 명령어로 프로젝트 전체에 AGENTS.md를 생성할 수 있습니다:

```bash
/init-deep
```

**결과:**
```
src/
├── AGENTS.md           # src 디렉토리 설명
├── components/
│   └── AGENTS.md       # 컴포넌트 설명
├── hooks/
│   └── AGENTS.md       # 훅 설명
└── utils/
    └── AGENTS.md       # 유틸리티 설명
```

**AGENTS.md 예시:**
```markdown
# src/components/

React 컴포넌트 디렉토리입니다.

## 구조
- `ui/` - 기본 UI 컴포넌트
- `layout/` - 레이아웃 컴포넌트
- `features/` - 기능별 컴포넌트

## 컨벤션
- 컴포넌트는 PascalCase
- 스타일은 CSS Modules 사용
```

---

## ⚙️ 훅 비활성화

특정 훅이 필요 없다면 비활성화할 수 있습니다:

```jsonc
// .opencode/oh-my-opencode.json
{
  "disabled_hooks": [
    "comment-checker",      // 주석 검사 끄기
    "background-notification"  // 알림 끄기
  ]
}
```

---

## 💡 훅 활용 팁

::: tip AGENTS.md를 적극 활용하세요
각 디렉토리에 AGENTS.md를 작성해두면, 에이전트가 해당 코드의 맥락을 자동으로 이해합니다. 특히 복잡한 비즈니스 로직이나 특수한 컨벤션이 있는 경우 효과적입니다.
:::

::: tip 훅은 대부분 그대로 두세요
기본 훅들은 최적화되어 있습니다. 특별한 이유가 없다면 비활성화하지 않는 것이 좋습니다.
:::

## 📚 다음 단계

- [Rules 파일](/guide/rules) - 프로젝트별 코딩 규칙 정의
- [설정 가이드](/guide/configuration) - 전체 설정 옵션
