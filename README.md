# Oh-My-OpenCode 가이드

OpenCode를 위한 멀티 에이전트 오케스트레이션 플러그인 - 한국어 사용자 가이드

## 🌐 온라인 문서

[https://YOUR_USERNAME.github.io/oh-my-opencode-guide](https://YOUR_USERNAME.github.io/oh-my-opencode-guide)

## 🚀 로컬 개발

```bash
# 의존성 설치
bun install

# 개발 서버 실행
bun run docs:dev

# 빌드
bun run docs:build

# 빌드 미리보기
bun run docs:preview
```

## 📁 프로젝트 구조

```
oh-my-opencode-guide/
├── docs/
│   ├── .vitepress/        # VitePress 설정
│   ├── guide/             # 가이드 문서
│   ├── examples/          # 워크플로우 예제
│   ├── reference/         # API 레퍼런스
│   └── index.md           # 홈페이지
├── VERSION.json           # 버전 추적
├── CLAUDE.md              # AI 업데이트 지침
└── package.json
```

## 📋 문서 목차

### 가이드
- 소개
- 설치
- 빠른 시작
- 에이전트 시스템
- 스킬 시스템
- 슬래시 명령어
- 훅 시스템
- 설정 가이드
- MCP 통합
- Rules 파일

### 예제
- 새 프로젝트 시작
- 기능 개발
- 버그 수정
- 리팩토링
- 코드 리뷰
- 문서화

### 레퍼런스
- 에이전트 목록
- 훅 목록
- 도구 목록
- 설정 스키마

## 🔄 버전 업데이트

이 문서는 Oh-My-OpenCode v3.2.1을 기준으로 작성되었습니다.

새 버전 업데이트 시 [CLAUDE.md](./CLAUDE.md)의 지침을 따라 문서를 업데이트합니다.

## 📝 라이선스

MIT
