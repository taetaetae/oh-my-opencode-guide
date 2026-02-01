#!/bin/bash
# oh-my-opencode 버전 업데이트 시 문서 업데이트를 위한 정보 수집 스크립트
# 사용법: ./scripts/update-docs.sh

set -e

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}  Oh-My-OpenCode 문서 업데이트 도우미${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# 현재 문서화된 버전 확인
CURRENT_VERSION=$(cat VERSION.json | grep '"documentedVersion"' | sed 's/.*: "\(.*\)".*/\1/')
CURRENT_COMMIT=$(cat VERSION.json | grep '"lastCommit"' | sed 's/.*: "\(.*\)".*/\1/')

echo -e "${GREEN}📋 현재 문서화된 버전:${NC} v${CURRENT_VERSION}"
echo -e "${GREEN}📋 마지막 커밋:${NC} ${CURRENT_COMMIT}"
echo ""

# 임시 디렉토리에 oh-my-opencode 클론
TEMP_DIR="/tmp/oh-my-opencode-check-$(date +%s)"
echo -e "${YELLOW}⏳ oh-my-opencode 저장소 클론 중...${NC}"
git clone --depth 200 --quiet https://github.com/code-yeongyu/oh-my-opencode "$TEMP_DIR" 2>/dev/null

cd "$TEMP_DIR"

# 최신 버전 확인
LATEST_VERSION=$(cat package.json | grep '"version"' | head -1 | sed 's/.*: "\(.*\)".*/\1/')
LATEST_COMMIT=$(git rev-parse --short HEAD)

echo -e "${GREEN}🆕 최신 버전:${NC} v${LATEST_VERSION}"
echo -e "${GREEN}🆕 최신 커밋:${NC} ${LATEST_COMMIT}"
echo ""

# 버전 비교
if [ "$CURRENT_VERSION" = "$LATEST_VERSION" ]; then
    echo -e "${GREEN}✅ 문서가 최신 버전입니다!${NC}"
    rm -rf "$TEMP_DIR"
    exit 0
fi

echo -e "${YELLOW}⚠️  새 버전이 있습니다: v${CURRENT_VERSION} → v${LATEST_VERSION}${NC}"
echo ""

# 변경사항 요약
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}  📝 변경사항 요약${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# 태그가 있으면 태그 기준, 없으면 커밋 기준
if git tag | grep -q "v${CURRENT_VERSION}"; then
    COMPARE_BASE="v${CURRENT_VERSION}"
else
    COMPARE_BASE="${CURRENT_COMMIT}"
fi

echo -e "${GREEN}📊 커밋 로그:${NC}"
git log --oneline "${COMPARE_BASE}..HEAD" 2>/dev/null | head -30 || echo "  (커밋 로그를 가져올 수 없습니다)"
echo ""

echo -e "${GREEN}📁 변경된 파일 통계:${NC}"
git diff --stat "${COMPARE_BASE}..HEAD" 2>/dev/null | tail -20 || echo "  (변경 통계를 가져올 수 없습니다)"
echo ""

# 영역별 변경사항 확인
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}  🔍 영역별 변경사항${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

check_changes() {
    local path=$1
    local name=$2
    local docs=$3
    
    local count=$(git diff --name-only "${COMPARE_BASE}..HEAD" -- "$path" 2>/dev/null | wc -l | tr -d ' ')
    if [ "$count" -gt 0 ]; then
        echo -e "${RED}⚠️  ${name}:${NC} ${count}개 파일 변경됨 → ${docs}"
        git diff --name-only "${COMPARE_BASE}..HEAD" -- "$path" 2>/dev/null | head -5 | sed 's/^/    /'
        echo ""
    else
        echo -e "${GREEN}✅ ${name}:${NC} 변경 없음"
    fi
}

check_changes "src/agents/" "에이전트" "docs/guide/agents.md, docs/reference/agents.md"
check_changes "src/features/builtin-skills/" "스킬" "docs/guide/skills.md"
check_changes "src/hooks/" "훅" "docs/guide/hooks.md, docs/reference/hooks.md"
check_changes "src/features/builtin-commands/" "명령어" "docs/guide/commands.md"
check_changes "src/mcp/" "MCP" "docs/guide/mcp.md"
check_changes "src/config/" "설정" "docs/guide/configuration.md, docs/reference/config-schema.md"
check_changes "src/tools/" "도구" "docs/reference/tools.md"

echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}  📋 AI에게 전달할 정보${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "다음 정보를 AI에게 전달하세요:"
echo ""
echo "---"
echo "현재 버전: v${CURRENT_VERSION}"
echo "새 버전: v${LATEST_VERSION}"
echo "새 커밋: ${LATEST_COMMIT}"
echo ""
echo "GitHub Releases에서 상세 변경사항 확인:"
echo "https://github.com/code-yeongyu/oh-my-opencode/releases"
echo "---"
echo ""

# 정리
rm -rf "$TEMP_DIR"

echo -e "${GREEN}✅ 분석 완료!${NC}"
echo -e "${YELLOW}💡 AI에게 \"버전업 되었으니 문서 업데이트 해줘\"라고 요청하세요.${NC}"
