# 도구 목록

Oh-My-OpenCode에서 사용 가능한 20+ 도구 레퍼런스입니다.

## LSP 도구

IDE 수준의 코드 인텔리전스를 제공합니다.

| 도구 | 설명 |
|------|------|
| `lsp_diagnostics` | 에러/경고 조회 |
| `lsp_goto_definition` | 심볼 정의로 이동 |
| `lsp_find_references` | 모든 참조 찾기 |
| `lsp_symbols` | 파일/워크스페이스 심볼 검색 |
| `lsp_prepare_rename` | 리네임 가능 여부 확인 |
| `lsp_rename` | 심볼 리네임 |

### 사용 예시

```typescript
// 에러 확인
lsp_diagnostics(filePath: "src/index.ts", severity: "error")

// 정의로 이동
lsp_goto_definition(filePath: "src/index.ts", line: 10, character: 5)

// 참조 찾기
lsp_find_references(filePath: "src/index.ts", line: 10, character: 5)
```

## AST-Grep 도구

AST 기반 코드 검색 및 수정을 제공합니다.

| 도구 | 설명 |
|------|------|
| `ast_grep_search` | AST 패턴 검색 (25개 언어) |
| `ast_grep_replace` | AST 패턴 치환 |

### 사용 예시

```typescript
// 패턴 검색
ast_grep_search(
  pattern: "console.log($$$)",
  lang: "typescript",
  paths: ["src/"]
)

// 패턴 치환
ast_grep_replace(
  pattern: "console.log($$$)",
  rewrite: "logger.debug($$$)",
  lang: "typescript"
)
```

## 위임 도구

에이전트 간 작업 위임을 관리합니다.

| 도구 | 설명 |
|------|------|
| `delegate_task` | 카테고리 기반 작업 위임 |
| `task` | 직접 에이전트 호출 |
| `background_output` | 백그라운드 작업 출력 조회 |
| `background_cancel` | 백그라운드 작업 취소 |

### 사용 예시

```typescript
// 카테고리 기반 위임
delegate_task(
  category: "visual-engineering",
  load_skills: ["frontend-ui-ux"],
  prompt: "로그인 페이지 디자인 구현"
)

// 직접 에이전트 호출
task(
  subagent_type: "explore",
  prompt: "인증 관련 코드 찾아줘"
)
```

## 세션 도구

세션 관리 및 검색을 제공합니다.

| 도구 | 설명 |
|------|------|
| `session_list` | 세션 목록 조회 |
| `session_read` | 세션 내용 읽기 |
| `session_search` | 세션 내 검색 |
| `session_info` | 세션 메타데이터 조회 |

## 스킬/MCP 도구

| 도구 | 설명 |
|------|------|
| `skill` | 스킬 로드 |
| `skill_mcp` | 스킬 내장 MCP 호출 |

### 사용 예시

```typescript
// 스킬 로드
skill(name: "git-master")

// MCP 도구 호출
skill_mcp(
  mcp_name: "postgres",
  tool_name: "query",
  arguments: { sql: "SELECT * FROM users" }
)
```

## 기타 도구

| 도구 | 설명 |
|------|------|
| `interactive_bash` | Tmux 기반 인터랙티브 터미널 |
| `look_at` | 미디어 파일 분석 (PDF, 이미지) |

## 에이전트별 도구 제한

| 에이전트 | 차단된 도구 |
|----------|-------------|
| Oracle | write, edit, task, delegate_task |
| Librarian | write, edit, task, delegate_task |
| Explore | write, edit, task, delegate_task |
| Multimodal-Looker | read 외 모두 |
| Sisyphus-Junior | task, delegate_task |
