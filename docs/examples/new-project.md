# 새 프로젝트 시작

Prometheus를 활용하여 새 프로젝트를 체계적으로 시작하는 방법입니다.

## 시나리오

Next.js 14로 블로그 플랫폼을 만들고 싶습니다.

## 워크플로우

### Step 1: Prometheus 진입

Tab 키를 눌러 Prometheus 모드로 진입합니다.

### Step 2: 인터뷰 진행

```
Prometheus: 어떤 프로젝트를 시작하시나요?
You: Next.js 14로 블로그 플랫폼을 만들고 싶어요

Prometheus: 어떤 기능이 필요한가요?
You: 글 작성/수정/삭제, 카테고리, 태그, 검색 기능이요

Prometheus: 인증은 어떻게 처리할까요?
You: NextAuth.js로 소셜 로그인 (Google, GitHub)

Prometheus: 데이터베이스는요?
You: PostgreSQL + Prisma

Prometheus: 배포 환경은요?
You: Vercel

Prometheus: 추가로 필요한 기능이 있나요?
You: 마크다운 에디터, 이미지 업로드, SEO 최적화
```

### Step 3: 계획 검토

Prometheus가 생성한 계획을 검토합니다:

```markdown
# 블로그 플랫폼 개발 계획

## Phase 1: 프로젝트 설정
- [ ] Next.js 14 프로젝트 생성
- [ ] TypeScript 설정
- [ ] Prisma 설정 및 스키마 정의
- [ ] NextAuth.js 설정

## Phase 2: 핵심 기능
- [ ] 글 CRUD API
- [ ] 카테고리/태그 시스템
- [ ] 마크다운 에디터 통합
- [ ] 이미지 업로드 (S3)

## Phase 3: 부가 기능
- [ ] 검색 기능
- [ ] SEO 최적화
- [ ] 반응형 디자인

## Phase 4: 배포
- [ ] Vercel 배포 설정
- [ ] 환경 변수 설정
- [ ] 도메인 연결
```

### Step 4: 계획 실행

```bash
/start-work
```

## 결과물

```
my-blog/
├── prisma/
│   └── schema.prisma       # DB 스키마
├── src/
│   ├── app/
│   │   ├── api/            # API 라우트
│   │   ├── posts/          # 글 페이지
│   │   └── auth/           # 인증 페이지
│   ├── components/         # UI 컴포넌트
│   ├── lib/                # 유틸리티
│   └── types/              # 타입 정의
├── .env.example
├── package.json
└── README.md
```

## 팁

::: tip Prometheus 활용 팁
- 요구사항을 최대한 구체적으로 답변하세요
- 불확실한 부분은 Prometheus에게 추천을 요청하세요
- 계획 검토 시 누락된 부분이 있으면 추가 요청하세요
:::
