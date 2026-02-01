# 스킬 시스템

<div class="highlight-box">
스킬은 <strong>특정 작업에 대한 상세한 지침서</strong>입니다. 
에이전트가 스킬을 로드하면 해당 분야의 전문가처럼 행동합니다.
</div>

## 🎯 스킬이란?

```
에이전트 = 똑똑한 신입 개발자
스킬 = 회사의 업무 매뉴얼

신입 개발자 + Git 매뉴얼 = Git 전문가처럼 행동
신입 개발자 + 테스트 매뉴얼 = 테스트 전문가처럼 행동
```

## 📦 내장 스킬

| 스킬 | 트리거 키워드 | 기능 |
|------|---------------|------|
| `git-master` | commit, rebase, squash | 원자적 커밋, 스타일 감지, 리베이스 |
| `playwright` | 브라우저 관련 | Playwright MCP 브라우저 자동화 |
| `frontend-ui-ux` | UI/UX 관련 | 디자이너 출신 개발자 페르소나 |
| `dev-browser` | 개발 브라우저 | 지속적 페이지 상태 유지 |

### git-master 예시

```bash
변경사항 커밋해줘
→ git-master 스킬 자동 로드
→ 변경 파일 분석
→ 논리적 단위로 분리하여 여러 커밋 생성
```

**특징**:
- 파일 3개 이상 → 2개 이상 커밋
- 파일 5개 이상 → 3개 이상 커밋
- 최근 30개 커밋 분석하여 스타일 자동 감지

## 📁 스킬 저장 위치

| 우선순위 | 위치 | 범위 |
|----------|------|------|
| 1 | `.opencode/skills/` | 프로젝트 전용 |
| 2 | `.claude/skills/` | Claude Code 호환 |
| 3 | `~/.config/opencode/skills/` | 글로벌 |
| 4 | `~/.claude/skills/` | Claude Code 호환 |

### 파일 구조

```
.opencode/skills/
├── my-skill.md                    # 단일 파일 스킬
├── complex-skill/
│   ├── SKILL.md                   # 메인 스킬 파일 (권장)
│   ├── mcp.json                   # MCP 설정 (선택)
│   └── examples/                  # 예제 파일들 (선택)
```

## ✍️ 스킬 작성법

### 기본 구조

```markdown
---
name: my-skill
description: "스킬 설명. 트리거: 'keyword1', 'keyword2'."
model: anthropic/claude-sonnet-4     # 선택: 모델 오버라이드
agent: sisyphus                       # 선택: 특정 에이전트 전용
allowed-tools: Read Write Edit Bash   # 선택: 허용 도구 제한
mcp:                                  # 선택: MCP 서버 설정
  server-name:
    command: npx
    args: ["@some/mcp-server"]
---

# 스킬 이름

## 개요
이 스킬이 무엇을 하는지 설명

## 사용 시점
- 상황 1
- 상황 2

## 단계별 지침

### Step 1: 첫 번째 단계
상세한 지침...

### Step 2: 두 번째 단계
상세한 지침...

## 주의사항
- 하지 말아야 할 것
- 반드시 해야 할 것
```

## 📝 커스텀 스킬 예제

### 예제 1: API 문서 생성 스킬

```markdown
---
name: api-docs-generator
description: "API 문서 자동 생성. 트리거: 'API 문서', 'swagger', 'openapi'."
---

# API 문서 생성기

## 개요
코드에서 API 엔드포인트를 분석하여 OpenAPI 스펙 문서를 생성합니다.

## 단계별 지침

### Step 1: 라우터 파일 탐색
Express/Fastify 라우터 파일을 찾습니다.

### Step 2: 엔드포인트 분석
각 라우터에서 다음을 추출:
- HTTP 메서드 (GET, POST, PUT, DELETE)
- 경로 패턴
- 요청/응답 타입

### Step 3: OpenAPI 스펙 생성
`docs/openapi.yaml` 파일을 생성합니다.

## 출력 형식
```yaml
openapi: 3.0.0
info:
  title: API 문서
  version: 1.0.0
paths:
  /api/users:
    get:
      summary: 사용자 목록 조회
```
```

### 예제 2: 코드 리뷰 스킬

```markdown
---
name: code-reviewer
description: "코드 리뷰 전문가. 트리거: 'review', '리뷰', 'PR'."
allowed-tools: Read Grep Glob
---

# 코드 리뷰어

## 리뷰 체크리스트

### 1. 코드 품질
- [ ] 함수가 단일 책임을 가지는가?
- [ ] 변수명이 명확한가?
- [ ] 중복 코드가 없는가?

### 2. 보안
- [ ] SQL 인젝션 취약점 없는가?
- [ ] XSS 취약점 없는가?

### 3. 성능
- [ ] N+1 쿼리 문제 없는가?
- [ ] 불필요한 리렌더링 없는가?

## 리뷰 출력 형식

### ✅ 좋은 점
- ...

### ⚠️ 개선 필요
- 파일: `src/xxx.ts`
- 라인: 42
- 문제: ...
- 제안: ...

### 🚨 반드시 수정
- ...
```

### 예제 3: MCP 통합 스킬

```markdown
---
name: database-admin
description: "데이터베이스 관리. 트리거: 'database', 'SQL', 'query'."
mcp:
  postgres:
    command: npx
    args: ["@modelcontextprotocol/server-postgres"]
    env:
      DATABASE_URL: "${DATABASE_URL}"
---

# 데이터베이스 관리

이 스킬이 로드되면 PostgreSQL MCP 서버가 자동으로 시작됩니다.

## 안전 규칙
⚠️ **절대 하지 말 것**:
- DROP TABLE without backup
- 프로덕션에서 직접 ALTER
- 트랜잭션 없는 다중 변경

## 사용 가능한 작업
- 쿼리 실행
- 스키마 검사
- 데이터 조작
```

## 🔧 스킬 사용 방법

### 방법 1: 자동 로드 (키워드 트리거)

```bash
변경사항 커밋해줘
→ "커밋" 키워드 감지
→ git-master 스킬 자동 로드
```

### 방법 2: 명시적 로드

```bash
skill: git-master 사용해서 커밋해줘
```

### 방법 3: delegate_task에서 로드

```typescript
delegate_task(
  category="quick",
  load_skills=["git-master", "code-reviewer"],
  prompt="변경사항 리뷰하고 커밋해줘"
)
```

## ⚙️ 스킬 설정

### 스킬 비활성화

```jsonc
// .opencode/oh-my-opencode.json
{
  "disabled_skills": ["playwright"]
}
```

### 인라인 스킬 정의

```jsonc
{
  "skills": {
    "quick-test": {
      "description": "빠른 테스트 실행",
      "template": "테스트를 실행할 때는 항상 bun test를 사용하세요..."
    }
  }
}
```

## 💡 스킬 작성 팁

::: tip 좋은 스킬의 특징
1. **명확한 단계**: 모호하지 않은 구체적인 지침
2. **예시 포함**: 실제 사용 예시 제공
3. **제약 조건 명시**: 하지 말아야 할 것 명확히
4. **출력 형식 정의**: 예상되는 결과물 형식 제시
:::

::: danger 피해야 할 패턴
- ❌ 너무 일반적인 지침: "좋은 코드를 작성하세요"
- ❌ 컨텍스트 부족: 언제 사용해야 하는지 불명확
- ❌ 과도한 복잡성: 하나의 스킬에 너무 많은 기능
:::

## 📚 다음 단계

- [슬래시 명령어](/guide/commands) - 워크플로우 자동화
- [MCP 통합](/guide/mcp) - MCP 서버 상세 설정
