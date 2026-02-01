# Rules 파일

`.rules/` 폴더에 코딩 규칙을 정의하면, 해당 파일을 다룰 때 **자동으로 적용**됩니다.

## 🎯 Rules가 필요한 이유

매번 "TypeScript에서는 any 쓰지 마" 라고 말할 필요 없이, 한 번 정의해두면 자동으로 적용됩니다.

```
.rules/typescript.md 정의
         │
         ▼
src/utils.ts 작업 시
         │
         ▼
규칙 자동 주입 → 에이전트가 규칙 준수
```

---

## 📁 Rules 파일 구조

```
.rules/
├── typescript.md    # TypeScript 파일 규칙
├── testing.md       # 테스트 파일 규칙
├── api.md           # API 파일 규칙
└── security.md      # 보안 규칙 (항상 적용)
```

---

## ✍️ Rules 파일 작성법

### 기본 형식

```markdown
---
globs: ["**/*.ts", "**/*.tsx"]
---

# 규칙 제목

규칙 내용...
```

### Frontmatter 옵션

| 옵션 | 설명 |
|------|------|
| `globs` | 적용할 파일 패턴 |
| `alwaysApply` | true면 모든 파일에 적용 |

### Glob 패턴 예시

| 패턴 | 의미 |
|------|------|
| `**/*.ts` | 모든 TypeScript 파일 |
| `src/**/*.tsx` | src 하위 TSX 파일 |
| `!**/*.test.ts` | 테스트 파일 제외 |

---

## 📝 실전 예시

### TypeScript 규칙

```markdown
---
globs: ["**/*.ts", "**/*.tsx", "!**/*.test.ts"]
---

# TypeScript 규칙

## 타입
- `any` 사용 금지, `unknown` 사용
- 인터페이스 우선 (type보다)

## 네이밍
- 컴포넌트: PascalCase
- 함수/변수: camelCase
- 상수: UPPER_SNAKE_CASE

## 금지
- @ts-ignore 사용 금지
- 빈 catch 블록 금지
```

### 테스트 규칙

```markdown
---
globs: ["**/*.test.ts", "**/*.spec.ts"]
---

# 테스트 규칙

## 구조
- describe로 그룹화
- it으로 개별 테스트

## 필수 케이스
- 정상 케이스 (happy path)
- 엣지 케이스
- 에러 케이스

## 금지
- 테스트 간 상태 공유
- 실제 API 호출 (mock 사용)
```

### API 규칙

```markdown
---
globs: ["src/api/**/*.ts", "app/api/**/*.ts"]
---

# API 규칙

## 응답 형식
모든 API는 통일된 형식 사용:
{ success: boolean, data?: T, error?: { code, message } }

## HTTP 상태 코드
- 200: 성공
- 400: 잘못된 요청
- 401: 인증 필요
- 404: 리소스 없음
- 500: 서버 에러

## 필수
- 입력값 검증 (zod 권장)
- 에러 로깅
```

### 보안 규칙 (항상 적용)

```markdown
---
globs: ["**/*"]
alwaysApply: true
---

# 보안 규칙

## 금지
- API 키 하드코딩 (환경 변수 사용)
- 민감 정보 로깅
- SQL 직접 조합 (파라미터 바인딩 사용)
```

---

## 💡 Rules 활용 팁

::: tip 팀 컨벤션을 Rules로 정의하세요
팀에서 사용하는 코딩 컨벤션을 `.rules/`에 정의해두면, 모든 팀원이 AI를 사용할 때 동일한 규칙이 적용됩니다.
:::

::: tip 너무 많은 규칙은 피하세요
규칙이 너무 많으면 에이전트가 혼란스러워할 수 있습니다. 핵심적인 규칙만 정의하세요.
:::

::: warning 충돌하는 규칙 주의
서로 모순되는 규칙이 있으면 예상치 못한 결과가 나올 수 있습니다.
:::

## 📚 다음 단계

- [훅 시스템](/guide/hooks) - Rules가 어떻게 주입되는지
- [설정 가이드](/guide/configuration) - 전체 설정 옵션
