# Rules 파일

<div class="highlight-box">
Rules 파일은 <strong>특정 파일 패턴에 자동으로 적용되는 규칙</strong>을 정의합니다.
에이전트가 해당 파일을 다룰 때 규칙이 자동으로 주입됩니다.
</div>

## 📁 Rules 파일 위치

```
.rules/
├── typescript.md      # TypeScript 파일 규칙
├── testing.md         # 테스트 파일 규칙
├── api.md             # API 파일 규칙
└── security.md        # 보안 관련 규칙
```

## ✍️ Rules 파일 작성법

### 기본 구조

```markdown
---
globs: ["패턴1", "패턴2"]
alwaysApply: false
---

# 규칙 제목

규칙 내용...
```

### Frontmatter 옵션

| 옵션 | 타입 | 설명 |
|------|------|------|
| `globs` | string[] | 적용할 파일 패턴 |
| `alwaysApply` | boolean | 항상 적용 여부 (기본: false) |

### Glob 패턴 예시

| 패턴 | 매칭 |
|------|------|
| `**/*.ts` | 모든 TypeScript 파일 |
| `src/**/*.tsx` | src 하위 모든 TSX 파일 |
| `!**/*.test.ts` | 테스트 파일 제외 |
| `src/api/**/*` | src/api 하위 모든 파일 |

## 📝 Rules 파일 예제

### TypeScript 규칙

```markdown
---
globs: ["**/*.ts", "**/*.tsx", "!**/*.test.ts", "!**/*.spec.ts"]
---

# TypeScript 코딩 규칙

## 타입 시스템
- strict 모드 필수
- any 타입 사용 금지
- unknown 사용 권장

## 네이밍 컨벤션
- 인터페이스: PascalCase (I 접두사 금지)
- 타입: PascalCase
- 함수: camelCase
- 상수: UPPER_SNAKE_CASE

## 금지 사항
- @ts-ignore 사용 금지
- @ts-expect-error 사용 금지
- 빈 catch 블록 금지
- console.log 커밋 금지
```

### 테스트 규칙

```markdown
---
globs: ["**/*.test.ts", "**/*.spec.ts", "**/__tests__/**/*"]
---

# 테스트 작성 규칙

## 구조
- describe로 테스트 그룹화
- it으로 개별 테스트 작성
- 각 테스트는 독립적으로 실행 가능해야 함

## BDD 주석
테스트에는 BDD 스타일 주석을 사용합니다:

//#given 초기 상태 설명
//#when 동작 설명  
//#then 예상 결과 설명

## 필수 테스트 케이스
- 정상 케이스 (happy path)
- 엣지 케이스 (경계값)
- 에러 케이스 (예외 상황)

## 금지 사항
- 테스트 간 상태 공유 금지
- 실제 API 호출 금지 (mock 사용)
- 하드코딩된 타임아웃 금지
```

### API 규칙

```markdown
---
globs: ["src/api/**/*.ts", "src/routes/**/*.ts", "app/api/**/*.ts"]
---

# API 개발 규칙

## 응답 형식
모든 API는 통일된 응답 형식을 사용합니다:

interface ApiResponse<T> {
  success: boolean;
  data?: T;
  error?: {
    code: string;
    message: string;
  };
}

## HTTP 상태 코드
- 200: 성공
- 201: 생성 성공
- 400: 잘못된 요청
- 401: 인증 필요
- 403: 권한 없음
- 404: 리소스 없음
- 500: 서버 에러

## 에러 처리
- 모든 에러는 try-catch로 처리
- 에러 로깅 필수
- 사용자에게 민감한 정보 노출 금지

## 검증
- 입력값 검증 필수 (zod 권장)
- SQL 인젝션 방지
- XSS 방지
```

### 보안 규칙

```markdown
---
globs: ["**/*.ts", "**/*.tsx", "**/*.js", "**/*.jsx"]
alwaysApply: true
---

# 보안 규칙

## 민감 정보
- API 키, 비밀번호 등 하드코딩 금지
- 환경 변수 사용 필수
- .env 파일 커밋 금지

## 인증/인가
- JWT 토큰 검증 필수
- 권한 확인 후 작업 수행
- 세션 타임아웃 설정

## 입력 검증
- 모든 사용자 입력 검증
- SQL 인젝션 방지
- XSS 방지
- CSRF 토큰 사용

## 로깅
- 민감 정보 로깅 금지
- 에러 스택 트레이스 사용자에게 노출 금지
```

### React 컴포넌트 규칙

```markdown
---
globs: ["src/components/**/*.tsx", "app/components/**/*.tsx"]
---

# React 컴포넌트 규칙

## 파일 구조
- 컴포넌트당 하나의 파일
- 스타일은 같은 폴더에 .module.css로

## 컴포넌트 작성
- 함수형 컴포넌트 사용
- Props 인터페이스 정의 필수
- 기본값은 defaultProps 대신 기본 매개변수 사용

## 훅 사용
- 커스텀 훅은 use 접두사
- 훅 호출 순서 일관성 유지
- 의존성 배열 정확히 명시

## 성능
- 불필요한 리렌더링 방지
- useMemo, useCallback 적절히 사용
- 큰 리스트는 가상화 사용
```

## 💡 Rules 작성 팁

::: tip 효과적인 규칙
1. **구체적인 지침**: 모호하지 않은 명확한 규칙
2. **예시 포함**: 좋은 예와 나쁜 예 제시
3. **이유 설명**: 왜 이 규칙이 필요한지 설명
4. **적절한 범위**: 너무 넓거나 좁지 않은 glob 패턴
:::

::: danger 피해야 할 패턴
- ❌ 너무 많은 규칙: 에이전트가 혼란스러워함
- ❌ 충돌하는 규칙: 서로 모순되는 지침
- ❌ 너무 일반적인 규칙: "좋은 코드를 작성하세요"
:::

## 📚 다음 단계

- [훅 시스템](/guide/hooks) - 훅과 Rules의 관계
- [설정 가이드](/guide/configuration) - 전체 설정 옵션
