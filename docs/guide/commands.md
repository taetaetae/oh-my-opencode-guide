# 슬래시 명령어

<div class="highlight-box">
슬래시 명령어는 <strong>자주 사용하는 워크플로우를 단축키처럼</strong> 사용할 수 있게 해줍니다.
</div>

## 🎯 슬래시 명령어란?

```bash
/refactor src/utils.ts
→ 미리 정의된 리팩토링 워크플로우 실행
→ LSP 검증, AST-grep 활용, TDD 확인
```

## 📦 내장 명령어

| 명령어 | 설명 |
|--------|------|
| `/init-deep` | 프로젝트 전체에 AGENTS.md 생성 |
| `/ralph-loop` | 완료될 때까지 자동 반복 |
| `/ulw-loop` | Ultrawork + Ralph Loop |
| `/cancel-ralph` | Ralph Loop 취소 |
| `/refactor` | LSP/AST-grep 기반 리팩토링 |
| `/start-work` | Prometheus 계획 실행 |

### /init-deep

프로젝트 전체에 계층적 AGENTS.md 파일을 생성합니다.

```bash
/init-deep
```

**결과**:
```
src/
├── AGENTS.md           # src 디렉토리 개요
├── components/
│   └── AGENTS.md       # 컴포넌트 설명
├── hooks/
│   └── AGENTS.md       # 훅 설명
└── utils/
    └── AGENTS.md       # 유틸리티 설명
```

### /ralph-loop

작업이 완료될 때까지 자동으로 계속 진행합니다.

```bash
/ralph-loop 인증 시스템 구현
→ 계획 수립 → 구현 → 테스트 → 문제 발견 시 자동 수정 → 완료까지 반복
```

### /refactor

LSP와 AST-grep을 활용한 안전한 리팩토링을 수행합니다.

```bash
/refactor src/legacy-code.ts
→ 코드 분석 → 리팩토링 계획 → LSP 참조 확인 → 변경 → 테스트 검증
```

## 📁 명령어 저장 위치

| 우선순위 | 위치 | 범위 |
|----------|------|------|
| 1 | `.opencode/command/` | 프로젝트 전용 |
| 2 | `.claude/command/` | Claude Code 호환 |
| 3 | `~/.config/opencode/command/` | 글로벌 |
| 4 | `~/.claude/command/` | Claude Code 호환 |

## ✍️ 커스텀 명령어 작성법

### 기본 구조

```markdown
---
description: 명령어 설명 (목록에 표시됨)
argument-hint: <필수인자> [선택인자]
---

<command-instruction>
에이전트가 따를 상세한 지침

## Step 1: 첫 번째 단계
구체적인 지침...

## Step 2: 두 번째 단계
구체적인 지침...
</command-instruction>

<current-context>
<dynamic-data>
!`동적 데이터를 가져오는 쉘 명령어`
</dynamic-data>
</current-context>
```

### 동적 컨텍스트

`` !`명령어` `` 구문으로 쉘 명령어 결과를 주입할 수 있습니다:

```markdown
<current-context>
<git-status>
!`git status --porcelain`
</git-status>

<current-branch>
!`git branch --show-current`
</current-branch>
</current-context>
```

## 📝 커스텀 명령어 예제

### 예제 1: 배포 명령어

::: code-group
```markdown [.opencode/command/deploy.md]
---
description: 프로덕션 배포 실행
argument-hint: [version]
---

<command-instruction>
# 프로덕션 배포

## 사전 확인
1. 현재 브랜치가 main인지 확인
2. 모든 테스트 통과 확인
3. 빌드 성공 확인

## 배포 단계

### Step 1: 버전 업데이트
인자로 버전이 주어지면 해당 버전으로, 아니면 patch 버전 증가

### Step 2: 빌드 및 테스트
bun run build && bun test

### Step 3: 배포
git push origin main --tags
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
:::

**사용**:
```bash
/deploy
/deploy minor
/deploy 2.0.0
```

### 예제 2: PR 생성 명령어

::: code-group
```markdown [.opencode/command/pr.md]
---
description: GitHub PR 생성
argument-hint: <target-branch>
---

<command-instruction>
# PR 생성

## Step 1: 변경 사항 분석
현재 브랜치와 타겟 브랜치의 차이점 분석

## Step 2: PR 제목 생성
커밋 메시지들을 분석하여 적절한 PR 제목 생성

## Step 3: PR 본문 작성
- 변경 사항 요약
- 주요 변경 파일
- 테스트 방법

## Step 4: PR 생성
gh pr create --base <target-branch>
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
:::

**사용**:
```bash
/pr main
/pr develop
```

### 예제 3: 테스트 커버리지 명령어

::: code-group
```markdown [.opencode/command/coverage.md]
---
description: 테스트 커버리지 분석 및 개선
argument-hint: [threshold]
---

<command-instruction>
# 테스트 커버리지 분석

## Step 1: 현재 커버리지 측정
bun test --coverage

## Step 2: 커버리지 분석
- 전체 커버리지 확인
- 커버리지가 낮은 파일 식별
- 테스트되지 않은 함수/브랜치 찾기

## Step 3: 개선 계획
threshold(기본 80%)에 미달하는 파일에 대해 테스트 추가

## 출력
- 커버리지 요약 테이블
- 개선이 필요한 파일 목록
</command-instruction>
```
:::

**사용**:
```bash
/coverage
/coverage 90
```

## 💡 명령어 작성 팁

::: tip 좋은 명령어의 특징
1. **명확한 단계**: 순서대로 실행할 수 있는 구체적 지침
2. **동적 컨텍스트**: 현재 상태를 파악할 수 있는 정보 제공
3. **에러 처리**: 실패 시 대응 방법 명시
4. **검증 단계**: 결과 확인 방법 포함
:::

## 📋 명령어 목록 확인

```bash
/help
```

또는 `/`를 입력하면 자동완성으로 명령어 목록이 표시됩니다.

## 📚 다음 단계

- [훅 시스템](/guide/hooks) - 자동화 규칙 설정
- [워크플로우 예제](/examples/) - 실전 명령어 활용
