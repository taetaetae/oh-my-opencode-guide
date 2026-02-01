# 슬래시 명령어

슬래시 명령어는 **반복 작업을 자동화**합니다. `/명령어`를 입력하면 미리 정의된 워크플로우가 실행됩니다.

## 🎯 슬래시 명령어가 필요한 이유

```
매번 설명하기                    슬래시 명령어
┌─────────────────────┐        ┌─────────────────┐
│ "리팩토링 해줘.     │        │                 │
│  LSP로 참조 확인하고│   →    │  /refactor      │
│  테스트도 돌리고    │        │                 │
│  ..."              │        └─────────────────┘
└─────────────────────┘
```

---

## 📦 내장 명령어

| 명령어 | 하는 일 |
|--------|---------|
| `/init-deep` | 프로젝트 전체에 AGENTS.md 생성 |
| `/refactor` | LSP/AST-grep 기반 안전한 리팩토링 |
| `/ralph-loop` | 완료될 때까지 자동 반복 |
| `/start-work` | Prometheus 계획 실행 |

### /init-deep

프로젝트 구조를 분석하고 각 디렉토리에 AGENTS.md를 생성합니다:

```bash
/init-deep
```

**결과:**
```
src/
├── AGENTS.md
├── components/
│   └── AGENTS.md
├── hooks/
│   └── AGENTS.md
└── utils/
    └── AGENTS.md
```

### /refactor

LSP와 AST-grep을 활용한 안전한 리팩토링:

```bash
/refactor src/utils.ts
```

**실행 과정:**
1. 코드 분석
2. LSP로 모든 참조 확인
3. 단계별 수정
4. 테스트로 검증

### /ralph-loop

작업이 완료될 때까지 자동으로 계속 진행:

```bash
/ralph-loop 인증 시스템 구현
```

---

## 📁 커스텀 명령어 만들기

### 명령어 저장 위치

| 위치 | 범위 |
|------|------|
| `.opencode/command/` | 프로젝트 전용 |
| `~/.config/opencode/command/` | 모든 프로젝트 |

### 명령어 파일 형식

```markdown
---
description: 명령어 설명
argument-hint: <필수> [선택]
---

<command-instruction>
에이전트가 따를 지침

## Step 1: 첫 번째
...

## Step 2: 두 번째
...
</command-instruction>

<current-context>
<dynamic-data>
!`쉘 명령어로 동적 데이터 가져오기`
</dynamic-data>
</current-context>
```

---

## 📝 커스텀 명령어 예시

### /deploy - 배포 명령어

```markdown
---
description: 프로덕션 배포
argument-hint: [version]
---

<command-instruction>
# 배포

## 사전 확인
1. main 브랜치인지 확인
2. 테스트 통과 확인
3. 빌드 성공 확인

## 배포 단계
1. 버전 업데이트 (인자 또는 patch)
2. 빌드 및 테스트
3. 태그 생성 및 푸시
</command-instruction>

<current-context>
<current-branch>
!`git branch --show-current`
</current-branch>
<current-version>
!`node -p "require('./package.json').version"`
</current-version>
</current-context>
```

**사용:**
```bash
/deploy        # patch 버전 증가
/deploy minor  # minor 버전 증가
/deploy 2.0.0  # 특정 버전으로
```

### /pr - PR 생성 명령어

```markdown
---
description: GitHub PR 생성
argument-hint: <target-branch>
---

<command-instruction>
# PR 생성

## Step 1: 변경 사항 분석
현재 브랜치와 타겟 브랜치 비교

## Step 2: PR 제목/본문 생성
커밋 메시지 분석하여 작성

## Step 3: PR 생성
gh pr create 실행
</command-instruction>

<current-context>
<recent-commits>
!`git log --oneline -10`
</recent-commits>
<changed-files>
!`git diff --name-only origin/main`
</changed-files>
</current-context>
```

**사용:**
```bash
/pr main
/pr develop
```

### /coverage - 테스트 커버리지

```markdown
---
description: 테스트 커버리지 분석
argument-hint: [threshold]
---

<command-instruction>
# 커버리지 분석

## Step 1: 커버리지 측정
bun test --coverage

## Step 2: 분석
- 전체 커버리지 확인
- 낮은 파일 식별
- 누락된 테스트 찾기

## Step 3: 개선
threshold(기본 80%) 미달 파일에 테스트 추가
</command-instruction>
```

**사용:**
```bash
/coverage      # 80% 기준
/coverage 90   # 90% 기준
```

---

## 🔧 동적 컨텍스트

`` !`명령어` `` 구문으로 쉘 명령어 결과를 주입할 수 있습니다:

```markdown
<current-context>
<git-status>
!`git status --porcelain`
</git-status>

<package-version>
!`npm view . version 2>/dev/null || echo "not published"`
</package-version>
</current-context>
```

---

## 💡 명령어 작성 팁

::: tip 좋은 명령어의 특징
- **명확한 단계**: 순서대로 실행 가능
- **동적 컨텍스트**: 현재 상태 정보 제공
- **검증 단계**: 결과 확인 방법 포함
:::

::: tip 자주 하는 작업을 명령어로 만드세요
배포, PR 생성, 테스트 실행 등 반복되는 작업을 명령어로 만들면 시간을 절약할 수 있습니다.
:::

## 📚 다음 단계

- [훅 시스템](/guide/hooks) - 자동으로 처리되는 것들
- [워크플로우 예제](/examples/) - 실전 사용 시나리오
