# 스킬 시스템

스킬은 **에이전트에게 전문 지식을 부여**합니다. 스킬을 로드하면 에이전트가 해당 분야의 전문가처럼 행동합니다.

## 🎯 스킬이 필요한 이유

```
일반 에이전트                    스킬 로드 후
┌─────────────────┐           ┌─────────────────┐
│ Git 기본 지식   │           │ 원자적 커밋     │
│ 단순 커밋      │    →      │ 스타일 자동 감지 │
│                 │           │ 논리적 분리     │
└─────────────────┘           └─────────────────┘
```

---

## 📦 내장 스킬

### git-master

**트리거:** `commit`, `rebase`, `squash`

Git 작업을 전문가처럼 처리합니다:
- 파일 3개 이상 → 2개 이상 커밋으로 분리
- 최근 30개 커밋 분석해서 스타일 자동 감지
- 논리적 단위로 원자적 커밋

```bash
변경사항 커밋해줘
→ git-master 스킬 자동 로드
→ 변경 파일 분석
→ 논리적 단위로 분리하여 여러 커밋 생성
```

### playwright

**트리거:** 브라우저 관련 작업

Playwright MCP를 통한 브라우저 자동화:
- 웹 스크래핑
- E2E 테스트
- 스크린샷 캡처

### frontend-ui-ux

**트리거:** UI/UX 관련 작업

디자이너 출신 개발자 페르소나:
- 아름다운 인터페이스 구현
- 접근성 고려
- 사용성 최적화

---

## 📁 커스텀 스킬 만들기

### 스킬 저장 위치

| 위치 | 범위 |
|------|------|
| `.opencode/skills/` | 프로젝트 전용 |
| `~/.config/opencode/skills/` | 모든 프로젝트 |

### 스킬 파일 형식

```markdown
---
name: my-skill
description: "스킬 설명. 트리거: 'keyword1', 'keyword2'."
---

# 스킬 이름

## 언제 사용하나요?
- 상황 1
- 상황 2

## 단계별 지침

### Step 1: 첫 번째
구체적인 지침...

### Step 2: 두 번째
구체적인 지침...

## 주의사항
- 하지 말아야 할 것
```

---

## 📝 커스텀 스킬 예시

### API 문서 생성 스킬

```markdown
---
name: api-docs
description: "API 문서 생성. 트리거: 'API 문서', 'swagger'."
---

# API 문서 생성

## 단계

### 1. 라우터 파일 탐색
src/api/ 또는 app/api/ 에서 라우터 찾기

### 2. 엔드포인트 분석
- HTTP 메서드
- 경로 패턴
- 요청/응답 타입

### 3. OpenAPI 스펙 생성
docs/openapi.yaml 파일 생성
```

### 코드 리뷰 스킬

```markdown
---
name: code-reviewer
description: "코드 리뷰. 트리거: 'review', '리뷰'."
---

# 코드 리뷰

## 체크리스트

### 코드 품질
- 단일 책임 원칙
- 명확한 변수명
- 중복 코드

### 보안
- SQL 인젝션
- XSS
- 민감 정보 노출

### 성능
- N+1 쿼리
- 불필요한 리렌더링

## 출력 형식
✅ 좋은 점 / ⚠️ 개선 필요 / 🚨 반드시 수정
```

### MCP 포함 스킬

```markdown
---
name: database-admin
description: "데이터베이스 관리. 트리거: 'database', 'SQL'."
mcp:
  postgres:
    command: npx
    args: ["@modelcontextprotocol/server-postgres"]
    env:
      DATABASE_URL: "${DATABASE_URL}"
---

# 데이터베이스 관리

이 스킬이 로드되면 PostgreSQL MCP가 자동으로 시작됩니다.

## 안전 규칙
- DROP/TRUNCATE는 반드시 확인 요청
- 트랜잭션 사용 필수
```

---

## 🔧 스킬 사용 방법

### 자동 로드 (키워드 트리거)

```bash
변경사항 커밋해줘
→ "커밋" 키워드 감지 → git-master 자동 로드
```

### 명시적 로드

```bash
skill: code-reviewer 사용해서 이 PR 리뷰해줘
```

---

## ⚙️ 스킬 설정

### 스킬 비활성화

```jsonc
// .opencode/oh-my-opencode.json
{
  "disabled_skills": ["playwright"]
}
```

---

## 💡 스킬 작성 팁

::: tip 좋은 스킬의 특징
- **구체적인 단계**: 모호하지 않은 지침
- **예시 포함**: 실제 사용 예시
- **제약 조건**: 하지 말아야 할 것 명시
:::

::: warning 피해야 할 패턴
- 너무 일반적인 지침 ("좋은 코드를 작성하세요")
- 하나의 스킬에 너무 많은 기능
:::

## 📚 다음 단계

- [슬래시 명령어](/guide/commands) - 워크플로우 자동화
- [MCP 통합](/guide/mcp) - 외부 서비스 연동
