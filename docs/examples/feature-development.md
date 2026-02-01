# 기능 개발

Ultrawork 모드를 활용하여 빠르게 기능을 개발하는 방법입니다.

## 시나리오

사용자 프로필 페이지에 아바타 업로드 기능을 추가합니다.

## 워크플로우 A: Ultrawork (빠른 개발)

### 명령어

```bash
ulw 사용자 프로필에 아바타 업로드 기능 추가해줘.
S3에 저장하고, 이미지 리사이징도 해줘.
```

### 자동 실행 과정

```
1. 자동 탐색
   ├── 기존 프로필 컴포넌트 분석
   ├── 현재 파일 업로드 구현 확인
   └── S3 설정 확인

2. 자동 계획
   ├── 필요한 패키지 식별
   ├── 컴포넌트 구조 설계
   └── API 엔드포인트 설계

3. 자동 구현
   ├── AvatarUpload 컴포넌트 생성
   ├── S3 업로드 유틸리티 생성
   ├── 이미지 리사이징 로직 추가
   └── API 라우트 생성

4. 자동 검증
   ├── TypeScript 타입 체크
   ├── 빌드 확인
   └── 기본 테스트 실행
```

## 워크플로우 B: Prometheus (정밀한 개발)

### Step 1: 인터뷰

```
[Tab 키]

Prometheus: 어떤 기능을 추가하시나요?
You: 아바타 업로드 기능이요

Prometheus: 파일 저장소는 어디를 사용하나요?
You: AWS S3요

Prometheus: 이미지 처리 요구사항이 있나요?
You: 200x200으로 리사이징, WebP 변환

Prometheus: 기존 프로필 컴포넌트는 어디에 있나요?
You: src/components/Profile/
```

### Step 2: 실행

```bash
/start-work
```

## 결과물

```
src/
├── components/Profile/
│   ├── AvatarUpload.tsx      # 새로 생성
│   └── Profile.tsx           # 수정됨
├── lib/
│   ├── s3.ts                 # 새로 생성
│   └── image-processing.ts   # 새로 생성
├── api/
│   └── upload-avatar/
│       └── route.ts          # 새로 생성
└── tests/
    └── avatar-upload.test.ts # 새로 생성
```

## 언제 어떤 모드를 사용할까?

| 상황 | 권장 모드 |
|------|-----------|
| 명확한 요구사항 | Ultrawork |
| 복잡한 요구사항 | Prometheus |
| 빠른 프로토타입 | Ultrawork |
| 프로덕션 기능 | Prometheus |

::: tip 팁
불확실할 때는 Prometheus로 시작하세요. 인터뷰 과정에서 요구사항이 명확해집니다.
:::
