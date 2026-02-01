# CLAUDE.md - Oh-My-OpenCode 가이드 업데이트 지침

> 이 문서는 AI 에이전트가 oh-my-opencode 버전 업데이트 시 가이드 문서를 자동으로 업데이트하기 위한 지침입니다.

---

## 📋 프로젝트 개요

이 프로젝트는 [oh-my-opencode](https://github.com/code-yeongyu/oh-my-opencode) 플러그인의 **한국어 사용자 가이드 문서 사이트**입니다.

- **문서 프레임워크**: VitePress
- **배포**: GitHub Pages
- **언어**: 한국어
- **대상 독자**: oh-my-opencode를 처음 사용하는 개발자

---

## 🔄 버전 업데이트 워크플로우

### 1. 버전 확인

현재 문서화된 버전은 `VERSION.json`에 기록되어 있습니다:

```bash
cat VERSION.json
```

### 2. 새 버전 변경사항 확인

oh-my-opencode 저장소에서 변경사항을 확인합니다:

```bash
# 저장소 클론 (최신)
git clone --depth 100 https://github.com/code-yeongyu/oh-my-opencode /tmp/oh-my-opencode

# 현재 문서화된 버전 이후의 변경사항 확인
cd /tmp/oh-my-opencode
git log --oneline v{VERSION.json의 버전}..HEAD

# 변경된 파일 확인
git diff v{VERSION.json의 버전}..HEAD --stat

# CHANGELOG 확인 (있는 경우)
cat CHANGELOG.md
```

### 3. 변경사항 분석

다음 영역의 변경사항을 중점적으로 확인:

| 영역 | 확인할 파일/폴더 | 관련 문서 |
|------|-----------------|-----------|
| 에이전트 | `src/agents/` | `docs/guide/agents.md` |
| 스킬 | `src/features/builtin-skills/` | `docs/guide/skills.md` |
| 훅 | `src/hooks/` | `docs/guide/hooks.md` |
| 명령어 | `src/features/slash-command/` | `docs/guide/commands.md` |
| MCP | `src/mcp/` | `docs/guide/mcp.md` |
| 설정 | `src/config/schema.ts` | `docs/guide/configuration.md` |
| 도구 | `src/tools/` | `docs/reference/tools.md` |

### 4. 문서 업데이트

변경사항에 따라 해당 문서를 업데이트합니다:

```
docs/
├── guide/           # 가이드 문서 (주요 업데이트 대상)
├── reference/       # 레퍼런스 문서
├── examples/        # 예제
└── public/          # 정적 파일
```

### 5. VERSION.json 업데이트

문서 업데이트 완료 후 버전 정보를 갱신합니다:

```json
{
  "documentedVersion": "새버전",
  "lastUpdated": "YYYY-MM-DD",
  "changelog": [
    "변경사항 1",
    "변경사항 2"
  ]
}
```

---

## 📝 문서 작성 규칙

### 스타일 가이드

1. **언어**: 한국어 (기술 용어는 영어 병기 가능)
2. **어조**: 친근하고 설명적인 톤 ("~합니다", "~해요")
3. **구조**: 
   - 각 섹션은 이모지로 시작
   - 코드 예제는 반드시 포함
   - 비유를 활용한 설명

### 마크다운 컨벤션

```markdown
# H1은 페이지 제목에만 사용

## H2는 주요 섹션

### H3는 하위 섹션

::: tip 팁
유용한 정보
:::

::: warning 주의
주의사항
:::

::: danger 위험
반드시 피해야 할 것
:::

::: details 더 보기
접을 수 있는 상세 내용
:::
```

### 코드 블록

```markdown
```typescript
// 파일 경로 표시
// src/example.ts
const example = "code";
```
```

---

## 🏗️ 프로젝트 구조

```
oh-my-opencode-guide/
├── docs/
│   ├── .vitepress/
│   │   ├── config.ts      # VitePress 설정
│   │   └── theme/         # 커스텀 테마
│   ├── guide/             # 가이드 문서
│   │   ├── index.md       # 시작하기
│   │   ├── agents.md      # 에이전트 시스템
│   │   ├── skills.md      # 스킬 시스템
│   │   ├── commands.md    # 슬래시 명령어
│   │   ├── hooks.md       # 훅 시스템
│   │   ├── configuration.md # 설정
│   │   └── mcp.md         # MCP 통합
│   ├── examples/          # 워크플로우 예제
│   ├── reference/         # API 레퍼런스
│   ├── public/            # 정적 파일
│   └── index.md           # 홈페이지
├── VERSION.json           # 버전 추적
├── CLAUDE.md              # 이 파일
├── package.json
└── .github/
    └── workflows/
        └── deploy.yml     # GitHub Pages 배포
```

---

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

---

## ✅ 업데이트 체크리스트

새 버전 업데이트 시 확인할 항목:

- [ ] VERSION.json의 현재 버전 확인
- [ ] oh-my-opencode 저장소에서 변경사항 확인
- [ ] 새로운 에이전트 추가 여부
- [ ] 새로운 스킬 추가 여부
- [ ] 새로운 훅 추가 여부
- [ ] 새로운 명령어 추가 여부
- [ ] 설정 스키마 변경 여부
- [ ] MCP 관련 변경 여부
- [ ] 기존 기능의 동작 변경 여부
- [ ] 관련 문서 업데이트
- [ ] VERSION.json 갱신
- [ ] 로컬에서 빌드 테스트
- [ ] 커밋 및 푸시 (자동 배포)

---

## 🔗 참고 링크

- [oh-my-opencode GitHub](https://github.com/code-yeongyu/oh-my-opencode)
- [VitePress 문서](https://vitepress.dev/)
- [GitHub Pages 문서](https://docs.github.com/en/pages)
