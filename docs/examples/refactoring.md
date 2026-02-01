# 리팩토링

LSP와 AST-grep을 활용하여 안전하게 리팩토링하는 방법입니다.

## 시나리오

레거시 인증 코드를 현대적인 패턴으로 리팩토링합니다.

## 워크플로우

### 방법 1: /refactor 명령어

```bash
/refactor src/auth/
```

**실행 과정**:
```
1. 코드 분석
   ├── 현재 구조 파악
   ├── 문제점 식별
   └── 의존성 분석

2. 리팩토링 계획
   ├── 변경 범위 결정
   ├── 단계별 계획 수립
   └── 위험 요소 식별

3. LSP 참조 확인
   ├── 모든 사용처 식별
   ├── 영향 범위 파악
   └── 안전한 변경 확인

4. 단계별 수정
   ├── 각 단계 후 테스트
   ├── 점진적 변경
   └── 롤백 가능 유지

5. 최종 검증
   ├── 전체 테스트 실행
   ├── 빌드 확인
   └── 타입 체크
```

### 방법 2: 상세 지시

```bash
ulw src/auth/ 폴더의 코드를 다음과 같이 리팩토링해줘:
1. 콜백 기반 → async/await
2. 하드코딩된 값 → 환경 변수
3. 중복 코드 제거
4. 타입 안전성 강화
```

## 리팩토링 예시

### Before

```typescript
// src/auth/login.ts (리팩토링 전)
function login(username, password, callback) {
  const API_URL = "https://api.example.com";
  
  fetch(API_URL + "/login", {
    method: "POST",
    body: JSON.stringify({ username, password })
  })
  .then(res => res.json())
  .then(data => {
    if (data.token) {
      localStorage.setItem("token", data.token);
      callback(null, data);
    } else {
      callback(new Error("Login failed"), null);
    }
  })
  .catch(err => callback(err, null));
}
```

### After

```typescript
// src/auth/login.ts (리팩토링 후)
interface LoginResult {
  token: string;
  user: User;
}

async function login(
  credentials: LoginCredentials
): Promise<LoginResult> {
  const response = await fetch(
    `${process.env.API_URL}/login`,
    {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(credentials)
    }
  );

  if (!response.ok) {
    throw new AuthenticationError("Login failed");
  }

  const data = await response.json();
  await tokenStorage.set(data.token);
  
  return data;
}
```

## 리팩토링 체크리스트

- [ ] 기존 테스트 모두 통과
- [ ] LSP로 모든 참조 업데이트
- [ ] 새로운 테스트 추가
- [ ] 타입 안전성 확인
- [ ] 문서 업데이트
- [ ] 코드 리뷰 완료

## 팁

::: tip 안전한 리팩토링
1. **작은 단위로**: 한 번에 하나씩 변경
2. **테스트 먼저**: 변경 전 테스트 확인
3. **LSP 활용**: 참조 추적으로 누락 방지
4. **점진적 배포**: 가능하면 단계적 배포
:::

::: danger 피해야 할 패턴
- ❌ 한 번에 대규모 변경
- ❌ 테스트 없이 리팩토링
- ❌ 동작 변경과 리팩토링 동시 진행
:::
