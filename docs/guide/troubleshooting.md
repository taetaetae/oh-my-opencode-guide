# 문제 해결

Oh-My-OpenCode 사용 중 발생할 수 있는 문제와 해결 방법입니다.

## 🔴 설치 및 설정 문제

### "플러그인을 찾을 수 없습니다"

**증상:** OpenCode 실행 시 oh-my-opencode 플러그인이 로드되지 않음

**해결:**
```bash
# 1. 강제 재설치
bunx oh-my-opencode install --force

# 2. 설정 파일 확인
cat ~/.config/opencode/config.json
# "plugins": ["oh-my-opencode"] 가 있어야 함

# 3. 캐시 정리 후 재시도
rm -rf ~/.bun/install/cache
bunx oh-my-opencode install
```

### "API 키가 설정되지 않았습니다"

**증상:** 에이전트 실행 시 인증 오류

**해결:**
```bash
# 환경 변수 확인
echo $ANTHROPIC_API_KEY
echo $OPENAI_API_KEY

# 설정 방법 (zsh)
echo 'export ANTHROPIC_API_KEY="sk-ant-..."' >> ~/.zshrc
echo 'export OPENAI_API_KEY="sk-..."' >> ~/.zshrc
source ~/.zshrc

# 설정 방법 (bash)
echo 'export ANTHROPIC_API_KEY="sk-ant-..."' >> ~/.bashrc
source ~/.bashrc
```

### "설정 파일 오류"

**증상:** JSON 파싱 에러 또는 스키마 검증 실패

**해결:**
```bash
# 1. 설정 파일 검증
bunx oh-my-opencode doctor

# 2. JSON 문법 확인 (JSONC는 주석 허용)
cat .opencode/oh-my-opencode.json

# 3. 스키마 URL 확인
# $schema가 올바른지 확인
```

**올바른 설정 파일 예시:**
```jsonc
{
  "$schema": "https://raw.githubusercontent.com/code-yeongyu/oh-my-opencode/master/assets/oh-my-opencode.schema.json"
  // 주석은 JSONC에서 허용됨
}
```

---

## 🟡 에이전트 관련 문제

### 에이전트가 응답하지 않음

**증상:** 요청 후 오랜 시간 대기

**원인 및 해결:**

| 원인 | 해결 |
|------|------|
| API 서버 과부하 | 잠시 후 재시도 |
| 네트워크 문제 | 인터넷 연결 확인 |
| 토큰 한도 초과 | 새 세션 시작 |
| 복잡한 요청 | 요청을 작게 분할 |

```bash
# 진행 중인 작업 취소
/stop-continuation

# 새 세션으로 시작
# (OpenCode 재시작)
```

### Oracle이 너무 자주 호출됨

**증상:** 비용이 예상보다 높음

**해결:**
```jsonc
// .opencode/oh-my-opencode.json
{
  "agents": {
    "oracle": {
      // Oracle 대신 더 저렴한 모델 사용
      "model": "anthropic/claude-3-5-sonnet"
    }
  }
}
```

**또는 요청 방식 변경:**
```bash
# Oracle 호출 (비쌈)
"이 아키텍처를 분석해줘"

# Explore 호출 (무료)
"이 아키텍처 관련 코드를 찾아줘"
```

### 에이전트가 잘못된 파일을 수정함

**증상:** 의도하지 않은 파일이 변경됨

**예방:**
```bash
# 1. 명확한 경로 지정
"src/components/Button.tsx 파일만 수정해줘"

# 2. 드라이런 먼저
"실제로 수정하지 말고 어떤 파일을 수정할지 보여줘"

# 3. git으로 복구
git checkout -- <파일경로>
git stash  # 또는 전체 복구
```

---

## 🟠 성능 문제

### 응답이 너무 느림

**원인 및 해결:**

```bash
# 1. 컨텍스트가 너무 큼
# → 새 세션 시작 또는 범위 좁히기
"src/auth/ 폴더만 분석해줘"  # 전체 대신 특정 폴더

# 2. 복잡한 요청
# → 단계별로 분할
"1단계: 현재 구조 분석해줘"
# (완료 후)
"2단계: 개선안 제시해줘"

# 3. 병렬 처리 활용
"다음을 동시에 찾아줘: A, B, C"
```

### 메모리 부족

**증상:** OpenCode가 느려지거나 크래시

**해결:**
```bash
# 1. OpenCode 재시작
# 2. 불필요한 탭/창 닫기
# 3. 더 작은 범위로 작업
```

---

## 🔵 기능 관련 문제

### /init-deep이 작동하지 않음

**증상:** AGENTS.md가 생성되지 않음

**해결:**
```bash
# 1. 권한 확인
ls -la .

# 2. 수동 실행
bunx oh-my-opencode init-deep

# 3. 특정 디렉토리만
"/init-deep src/ 폴더만"
```

### MCP 서버 연결 실패

**증상:** MCP 도구 사용 불가

**해결:**
```bash
# 1. MCP 서버 상태 확인
bunx oh-my-opencode doctor

# 2. MCP 설정 확인
cat .opencode/oh-my-opencode.json | grep -A 10 "mcp"

# 3. 서버 재시작
# OpenCode 재시작으로 MCP 서버도 재시작됨
```

### 스킬이 로드되지 않음

**증상:** 커스텀 스킬 사용 불가

**확인사항:**
```jsonc
// .opencode/oh-my-opencode.json
{
  "skills": {
    "my-skill": {
      "description": "설명 필수",  // ← 필수
      "instructions": ["지침"]      // ← 필수
    }
  }
}
```

---

## 🟣 일반적인 오류 메시지

### "Context window limit exceeded"

**원인:** 대화가 너무 길어짐

**해결:**
```bash
# 1. 새 세션 시작
# 2. 요청 범위 좁히기
# 3. 불필요한 컨텍스트 제거
"이전 대화 무시하고, 새로 시작: ..."
```

### "Rate limit exceeded"

**원인:** API 호출 한도 초과

**해결:**
```bash
# 1. 잠시 대기 (보통 1분)
# 2. 요청 빈도 줄이기
# 3. 다른 모델 사용
```

### "Tool execution failed"

**원인:** 도구 실행 중 오류

**해결:**
```bash
# 1. 구체적인 오류 메시지 확인
# 2. 도구 의존성 확인
which ast-grep  # ast-grep 설치 확인
which gh        # GitHub CLI 설치 확인

# 3. 권한 확인
ls -la <대상파일>
```

---

## 🛠️ 디버깅 도구

### Doctor 명령어

```bash
bunx oh-my-opencode doctor
```

**확인 항목:**
- ✅ OpenCode 설치 상태
- ✅ 플러그인 버전
- ✅ 설정 파일 유효성
- ✅ API 키 설정
- ✅ 의존성 (ast-grep, gh)
- ✅ MCP 서버 연결

### 로그 확인

```bash
# OpenCode 로그 위치
~/.local/share/opencode/logs/

# 최근 로그 확인
tail -100 ~/.local/share/opencode/logs/latest.log
```

### 설정 초기화

```bash
# 설정 백업
cp .opencode/oh-my-opencode.json .opencode/oh-my-opencode.json.backup

# 기본 설정으로 초기화
bunx oh-my-opencode install --force
```

---

## 📞 추가 도움

문제가 해결되지 않으면:

1. **GitHub Issues** 확인: [oh-my-opencode Issues](https://github.com/code-yeongyu/oh-my-opencode/issues)
2. **새 Issue 생성**: 오류 메시지와 재현 방법 포함
3. **Discord/커뮤니티**: 다른 사용자에게 질문

---

## 📚 관련 문서

- [설치 가이드](/guide/installation) - 설치 및 설정
- [베스트 프랙티스](/guide/best-practices) - 효과적인 사용법
- [팁과 트릭](/guide/tips-and-tricks) - 고급 기능
