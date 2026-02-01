# 문서화

AGENTS.md 및 API 문서를 생성하는 방법입니다.

## 시나리오

프로젝트 문서를 체계적으로 생성합니다.

## 워크플로우

### Step 1: AGENTS.md 생성

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
├── utils/
│   └── AGENTS.md       # 유틸리티 설명
└── api/
    └── AGENTS.md       # API 설명
```

### Step 2: API 문서 생성

```bash
ulw API 엔드포인트들의 OpenAPI 문서를 생성해줘
```

**결과**:
```yaml
# docs/openapi.yaml
openapi: 3.0.0
info:
  title: My API
  version: 1.0.0

paths:
  /api/users:
    get:
      summary: 사용자 목록 조회
      responses:
        '200':
          description: 성공
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/User'
```

### Step 3: README 업데이트

```bash
ulw README.md를 업데이트해줘:
- 프로젝트 소개
- 설치 방법
- 환경 변수 설명
- 사용 예제
- API 문서 링크
```

## AGENTS.md 예시

```markdown
# src/components/

이 디렉토리는 React 컴포넌트를 포함합니다.

## 구조

- `ui/` - 기본 UI 컴포넌트 (Button, Input 등)
- `layout/` - 레이아웃 컴포넌트 (Header, Footer 등)
- `features/` - 기능별 컴포넌트

## 컨벤션

- 컴포넌트는 PascalCase로 명명
- 각 컴포넌트는 자체 폴더에 위치
- 스타일은 CSS Modules 사용

## 주요 컴포넌트

### Button
기본 버튼 컴포넌트. variant, size props 지원.

### Modal
모달 다이얼로그. Portal을 사용하여 렌더링.
```

## 문서화 팁

::: tip 효과적인 문서화
1. **AGENTS.md 활용**: 각 디렉토리에 컨텍스트 제공
2. **코드와 동기화**: 코드 변경 시 문서도 업데이트
3. **예제 포함**: 사용 예제를 반드시 포함
4. **자동화**: 가능한 부분은 자동 생성
:::

## 문서 자동화 명령어

```markdown
---
description: 문서 자동 업데이트
---

<command-instruction>
# 문서 업데이트

## Step 1: 변경된 파일 확인
최근 커밋에서 변경된 파일 확인

## Step 2: 관련 AGENTS.md 업데이트
변경된 파일이 있는 디렉토리의 AGENTS.md 업데이트

## Step 3: API 문서 업데이트
API 변경이 있으면 OpenAPI 스펙 업데이트

## Step 4: README 확인
주요 변경사항이 있으면 README 업데이트
</command-instruction>
```

**사용**:
```bash
/update-docs
```
