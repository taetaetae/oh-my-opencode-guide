# 소개

## Oh-My-OpenCode란?

**Oh-My-OpenCode**는 OpenCode를 위한 플러그인입니다. "oh-my-zsh"가 zsh를 강화하듯이, Oh-My-OpenCode는 AI 코딩 어시스턴트를 **11개의 전문 에이전트가 협력하는 시스템**으로 변환합니다.

## 🎯 핵심 특징

### 1. 전문 에이전트 팀

하나의 AI가 모든 것을 처리하는 대신, 각 분야의 전문가가 협력합니다:

| 에이전트 | 전문 분야 | 언제 사용되나요? |
|----------|-----------|------------------|
| **Sisyphus** | 작업 총괄 | 기본 에이전트, 작업을 분배하고 종합 |
| **Oracle** | 아키텍처/디버깅 | 복잡한 설계 결정이나 어려운 버그 |
| **Librarian** | 문서/라이브러리 | 외부 라이브러리 사용법, 공식 문서 |
| **Explore** | 코드 탐색 | "이 기능 어디에 있어?" 같은 질문 |
| **Prometheus** | 계획 수립 | 복잡한 작업의 체계적인 계획 |

### 2. 두 가지 작업 모드

**상황에 맞는 모드를 선택하세요:**

::: code-group
```bash [Ultrawork - 빠른 작업]
ulw 다크 모드 토글 추가해줘
# 키워드 하나로 자동 실행
# 탐색 → 계획 → 구현 → 검증
```

```bash [Prometheus - 정밀한 작업]
# Tab 키로 진입
Prometheus: 어떤 작업을 도와드릴까요?
You: 결제 시스템을 추가하고 싶어요
Prometheus: 어떤 결제 수단을 지원할까요?
# ... 인터뷰 후 상세 계획 생성
/start-work
```
:::

### 3. 자동 컨텍스트 주입

파일을 읽으면 관련 정보가 자동으로 주입됩니다:

```
src/components/Button.tsx 읽기
    ↓
src/components/AGENTS.md 자동 주입
    ↓
에이전트가 컴포넌트 컨텍스트 이해
```

### 4. 프로젝트별 규칙

`.rules/` 폴더에 규칙을 정의하면 자동 적용됩니다:

```markdown
<!-- .rules/typescript.md -->
---
globs: ["**/*.ts"]
---
# TypeScript 규칙
- strict 모드 필수
- any 타입 금지
```

### 5. 커스텀 워크플로우

반복 작업을 슬래시 명령어로 자동화:

```bash
/refactor src/utils.ts  # LSP 기반 안전한 리팩토링
/deploy minor           # 버전 업데이트 및 배포
```

## 🆚 일반 AI 어시스턴트와의 차이

| 기능 | 일반 AI | Oh-My-OpenCode |
|------|---------|----------------|
| 에이전트 | 1개 | 11개 전문 에이전트 |
| 작업 모드 | 단일 | Ultrawork / Prometheus |
| 컨텍스트 | 수동 제공 | AGENTS.md 자동 주입 |
| 규칙 적용 | 매번 설명 | .rules/ 자동 적용 |
| 워크플로우 | 없음 | 슬래시 명령어 |
| 외부 연동 | 제한적 | MCP로 확장 가능 |

## 🚀 빠른 시작

```bash
# 1. 설치
bunx oh-my-opencode install

# 2. 설치 확인
bunx oh-my-opencode doctor

# 3. 사용
ulw 로그인 기능 추가해줘
```

## 📚 다음 단계

::: tip 권장 학습 순서
1. [설치](/guide/installation) - 환경 설정
2. [빠른 시작](/guide/quickstart) - 두 가지 작업 모드 익히기
3. [에이전트 시스템](/guide/agents) - 각 에이전트의 역할 이해
4. [훅 시스템](/guide/hooks) - 자동화 규칙 활용
:::
