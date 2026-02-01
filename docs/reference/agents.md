# 에이전트 목록

Oh-My-OpenCode의 11개 에이전트 전체 레퍼런스입니다.

## Primary Agents

UI에서 선택한 모델을 사용합니다.

### Sisyphus

| 항목 | 값 |
|------|-----|
| **역할** | 메인 오케스트레이터 |
| **모델** | claude-opus-4-5 |
| **Thinking** | 32,000 토큰 |
| **비용** | 💰💰💰 |
| **제한** | 없음 |

### Atlas

| 항목 | 값 |
|------|-----|
| **역할** | 마스터 오케스트레이터, TODO 관리 |
| **모델** | claude-sonnet-4-5 |
| **비용** | 💰💰💰 |
| **제한** | 없음 |

### Prometheus

| 항목 | 값 |
|------|-----|
| **역할** | 전략 기획자 (인터뷰 → 계획) |
| **모델** | claude-opus-4-5 |
| **진입** | Tab 키 |
| **비용** | 💰💰💰 |
| **제한** | .md 파일만 수정 |

## Subagents

자체 모델 폴백 체인을 사용합니다.

### Hephaestus

| 항목 | 값 |
|------|-----|
| **역할** | 자율 심층 작업자 |
| **모델** | gpt-5.2-codex |
| **비용** | 💰💰💰 |
| **제한** | 없음 |

### Oracle

| 항목 | 값 |
|------|-----|
| **역할** | 전략 자문가, 아키텍처, 디버깅 |
| **모델** | gpt-5.2 |
| **비용** | 💰💰💰 |
| **제한** | **읽기 전용** (write, edit, task, delegate_task 차단) |

### Librarian

| 항목 | 값 |
|------|-----|
| **역할** | 문서 조회, GitHub 검색, 멀티 레포 분석 |
| **모델** | glm-4.7 |
| **MCP** | context7, grep_app |
| **비용** | 💰 |
| **제한** | write, edit, task, delegate_task 차단 |

### Explore

| 항목 | 값 |
|------|-----|
| **역할** | 코드베이스 탐색, 패턴 검색 |
| **모델** | claude-haiku-4-5 |
| **비용** | 무료 |
| **제한** | write, edit, task, delegate_task 차단 |

### Multimodal-Looker

| 항목 | 값 |
|------|-----|
| **역할** | PDF, 이미지, 다이어그램 분석 |
| **모델** | gemini-3-flash |
| **비용** | 💰 |
| **제한** | read만 허용 |

### Metis

| 항목 | 값 |
|------|-----|
| **역할** | 사전 계획 갭 탐지 |
| **모델** | claude-opus-4-5 |
| **비용** | 💰💰💰 |
| **제한** | 없음 |

### Momus

| 항목 | 값 |
|------|-----|
| **역할** | 계획 검토자 (엄격한 검증) |
| **모델** | gpt-5.2 |
| **비용** | 💰💰💰 |
| **제한** | 없음 |

### Sisyphus-Junior

| 항목 | 값 |
|------|-----|
| **역할** | 카테고리 기반 작업 실행자 |
| **모델** | claude-sonnet-4-5 |
| **비용** | 💰💰 |
| **제한** | task, delegate_task 차단 (위임 불가) |

## 에이전트 커스터마이징

```jsonc
// .opencode/oh-my-opencode.json
{
  "agents": {
    "oracle": {
      "model": "openai/gpt-5.2",
      "temperature": 0.1
    },
    "explore": {
      "model": "anthropic/claude-haiku-4-5"
    }
  },
  "disabled_agents": ["multimodal-looker"]
}
```
