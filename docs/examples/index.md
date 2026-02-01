# 워크플로우 예제

실전에서 Oh-My-OpenCode를 활용하는 다양한 시나리오를 소개합니다.

## 📋 예제 목록

<div class="card-grid">

::: info 🆕 새 프로젝트 시작
Prometheus로 새 프로젝트 계획 수립

[보기 →](/examples/new-project)
:::

::: info ⚡ 기능 개발
Ultrawork로 빠른 기능 구현

[보기 →](/examples/feature-development)
:::

::: info 🐛 버그 수정
분석 모드로 버그 추적 및 수정

[보기 →](/examples/bug-fixing)
:::

::: info 🔄 리팩토링
LSP/AST-grep 기반 안전한 리팩토링

[보기 →](/examples/refactoring)
:::

::: info 👀 코드 리뷰
체계적인 코드 리뷰 수행

[보기 →](/examples/code-review)
:::

::: info 📝 문서화
AGENTS.md 및 API 문서 생성

[보기 →](/examples/documentation)
:::

</div>

## 🎯 워크플로우 선택 가이드

| 상황 | 권장 워크플로우 | 키워드/명령어 |
|------|----------------|---------------|
| 간단한 기능 추가 | Ultrawork | `ulw` |
| 복잡한 기능 개발 | Prometheus | Tab 키 |
| 버그 수정 | 분석 모드 + Oracle | `analyze` |
| 리팩토링 | 리팩토링 명령어 | `/refactor` |
| 코드 리뷰 | 커스텀 스킬 | `review` |
| 문서화 | init-deep | `/init-deep` |

## 💡 생산성 팁

### 병렬 작업 활용

```bash
ulw 다음 작업들을 병렬로 처리해줘:
1. 사용자 API 테스트 작성
2. 상품 API 테스트 작성
3. 주문 API 테스트 작성

→ 3개의 Sisyphus-Junior가 병렬로 작업
```

### 반복 작업 자동화

```bash
# 커스텀 명령어 생성 후
/daily-check

→ 테스트 실행
→ 린트 검사
→ 보안 취약점 스캔
```

### 컨텍스트 유지

```bash
# 작업 중간에 컨텍스트 저장
현재까지의 작업 내용을 PROGRESS.md에 저장해줘

# 다음 세션에서 계속
PROGRESS.md 읽고 이어서 작업해줘
```
