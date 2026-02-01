# 소개

<div class="highlight-box">
  <strong>Oh-My-OpenCode</strong>는 OpenCode를 위한 "oh-my-zsh" 같은 플러그인입니다. 
  AI 코딩 어시스턴트를 <strong>11개의 전문 에이전트가 협력하는 멀티 에이전트 시스템</strong>으로 변환합니다.
</div>

## 🎯 Oh-My-OpenCode란?

일반적인 AI 코딩 어시스턴트는 하나의 AI가 모든 작업을 처리합니다. 하지만 실제 개발팀에서는 백엔드 개발자, 프론트엔드 개발자, 아키텍트, QA 엔지니어가 각자의 전문성을 발휘하며 협력합니다.

**Oh-My-OpenCode**는 이 개념을 AI에 적용합니다:

```
일반 AI 어시스턴트          Oh-My-OpenCode
┌─────────────┐           ┌─────────────────────────┐
│             │           │  Sisyphus (오케스트레이터) │
│   하나의    │           │  Oracle (아키텍트)        │
│    AI      │    →      │  Librarian (연구원)       │
│             │           │  Explore (탐색가)         │
│             │           │  ... 11개 전문 에이전트    │
└─────────────┘           └─────────────────────────┘
```

## ✨ 주요 특징

### 🤖 전문 에이전트 팀

| 에이전트 | 역할 | 비유 |
|----------|------|------|
| **Sisyphus** | 메인 오케스트레이터 | 팀장 |
| **Oracle** | 아키텍처/디버깅 상담 | 시니어 아키텍트 |
| **Librarian** | 문서/라이브러리 조사 | 연구원 |
| **Explore** | 코드베이스 탐색 | 탐색가 |
| **Prometheus** | 전략 기획 | 프로젝트 매니저 |

### ⚡ 두 가지 작업 모드

::: code-group
```bash [Ultrawork 모드]
# 빠른 작업 - 키워드 하나로 시작
ulw 사용자 인증 기능 추가해줘
```

```bash [Prometheus 모드]
# 정밀한 작업 - 인터뷰 기반 계획
# Tab 키 → 인터뷰 → /start-work
```
:::

### 🎯 스킬 시스템

에이전트에게 전문 지식을 부여합니다:

```markdown
# .opencode/skills/my-skill/SKILL.md
---
name: api-expert
description: "API 개발 전문가"
---

# API 개발 지침
RESTful 원칙을 따르고...
```

### 🪝 34개 훅

자동화 규칙으로 워크플로우를 최적화합니다:

- 파일 읽을 때 AGENTS.md 자동 주입
- 키워드 감지 시 모드 전환
- 에러 발생 시 자동 복구

## 🚀 빠른 시작

### 1. 설치

```bash
bunx oh-my-opencode install
```

### 2. 설치 확인

```bash
bunx oh-my-opencode doctor
```

### 3. 사용

```bash
# Ultrawork 모드
ulw README에 설치 가이드 추가해줘

# 또는 Prometheus 모드
# Tab 키 누르기 → 인터뷰 → /start-work
```

## 📚 다음 단계

<div class="card-grid">

::: info 🔧 설치 가이드
상세한 설치 방법과 환경 설정

[설치하기 →](/guide/installation)
:::

::: info 🎮 빠른 시작
첫 번째 작업 실행하기

[시작하기 →](/guide/quickstart)
:::

::: info 🤖 에이전트 시스템
11개 에이전트 상세 설명

[알아보기 →](/guide/agents)
:::

</div>

## 💡 이런 분들께 추천합니다

- ✅ AI 코딩 어시스턴트를 더 효과적으로 사용하고 싶은 분
- ✅ 복잡한 개발 작업을 자동화하고 싶은 분
- ✅ 프로젝트별 맞춤 워크플로우가 필요한 분
- ✅ 팀 전체의 AI 사용 패턴을 표준화하고 싶은 분
