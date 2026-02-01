---
layout: home

hero:
  name: Oh-My-OpenCode
  text: AI 개발팀을 손안에
  tagline: 하나의 AI가 아닌, 11개의 전문 에이전트가 협력하는 멀티 에이전트 시스템
  image:
    src: /hero-image.svg
    alt: Oh-My-OpenCode
  actions:
    - theme: brand
      text: 시작하기 →
      link: /guide/
    - theme: alt
      text: GitHub
      link: https://github.com/code-yeongyu/oh-my-opencode

features:
  - icon: 🎯
    title: 두 가지 작업 모드
    details: ulw 키워드로 빠르게, 또는 Tab → Prometheus 인터뷰로 정밀하게. 상황에 맞는 작업 방식을 선택하세요.
    link: /guide/quickstart
    linkText: 작업 모드 알아보기

  - icon: 🤖
    title: 전문 에이전트 팀
    details: Oracle은 아키텍처 상담, Librarian은 문서 조사, Explore는 코드 탐색. 각자의 전문성으로 협력합니다.
    link: /guide/agents
    linkText: 에이전트 알아보기

  - icon: 🪝
    title: 자동 컨텍스트 주입
    details: 파일을 읽으면 AGENTS.md가 자동 주입되고, 키워드를 감지해 모드가 전환됩니다. 훅이 알아서 처리합니다.
    link: /guide/hooks
    linkText: 훅 알아보기

  - icon: 📝
    title: 프로젝트별 규칙
    details: .rules/ 폴더에 코딩 규칙을 정의하면, 해당 파일을 다룰 때 자동으로 적용됩니다.
    link: /guide/rules
    linkText: Rules 알아보기

  - icon: ⚡
    title: 커스텀 워크플로우
    details: /deploy, /refactor 같은 슬래시 명령어로 반복 작업을 자동화하세요. 직접 만들 수도 있습니다.
    link: /guide/commands
    linkText: 명령어 알아보기

  - icon: 🔌
    title: MCP로 능력 확장
    details: 웹 검색, 데이터베이스, GitHub API 등 외부 서비스를 연결해 에이전트의 능력을 확장하세요.
    link: /guide/mcp
    linkText: MCP 알아보기
---

<style>
:root {
  --vp-home-hero-name-color: transparent;
  --vp-home-hero-name-background: linear-gradient(135deg, #6366f1 0%, #a855f7 50%, #ec4899 100%);
}
</style>

## 💡 Oh-My-OpenCode가 특별한 이유

### 🎭 하나의 AI vs 전문가 팀

일반적인 AI 어시스턴트는 하나의 AI가 모든 것을 처리합니다. Oh-My-OpenCode는 다릅니다:

```
일반 AI                      Oh-My-OpenCode
┌──────────┐                ┌─────────────────────────────┐
│          │                │ Sisyphus: 작업 분배         │
│  하나의  │                │ Oracle: 아키텍처 상담       │
│   AI     │       →        │ Librarian: 문서/라이브러리  │
│          │                │ Explore: 코드베이스 탐색    │
│          │                │ ... 11개 전문 에이전트      │
└──────────┘                └─────────────────────────────┘
```

### ⚡ 두 가지 작업 모드

**Ultrawork 모드** - 빠른 작업
```bash
ulw 로그인 기능 추가해줘
# → 자동으로 탐색 → 계획 → 구현 → 검증
```

**Prometheus 모드** - 정밀한 작업
```
Tab 키 → 인터뷰 → 계획 생성 → /start-work
# → 요구사항을 명확히 하고 체계적으로 진행
```

### 🪝 알아서 처리되는 것들

- 파일 읽을 때 **AGENTS.md 자동 주입**
- `ulw` 키워드 감지 시 **Ultrawork 모드 전환**
- 컨텍스트 한계 도달 시 **자동 컴팩션**
- 백그라운드 작업 완료 시 **OS 알림**

## 🚀 30초 만에 시작하기

```bash
# 설치
bunx oh-my-opencode install

# 바로 사용
ulw README에 설치 가이드 추가해줘
```
