import { defineConfig } from 'vitepress'

export default defineConfig({
  title: 'Oh-My-OpenCode',
  description: 'OpenCode를 위한 멀티 에이전트 오케스트레이션 플러그인 - 한국어 가이드',
  
  lang: 'ko-KR',
  
  head: [
    ['link', { rel: 'icon', type: 'image/svg+xml', href: '/logo.svg' }],
    ['meta', { name: 'theme-color', content: '#6366f1' }],
    ['meta', { property: 'og:type', content: 'website' }],
    ['meta', { property: 'og:locale', content: 'ko_KR' }],
    ['meta', { property: 'og:title', content: 'Oh-My-OpenCode 가이드' }],
    ['meta', { property: 'og:site_name', content: 'Oh-My-OpenCode' }],
    ['meta', { property: 'og:description', content: 'AI 코딩 어시스턴트를 멀티 에이전트 팀으로 변환하는 플러그인' }],
  ],

  themeConfig: {
    logo: '/logo.svg',
    
    nav: [
      { text: '가이드', link: '/guide/', activeMatch: '/guide/' },
      { text: '예제', link: '/examples/', activeMatch: '/examples/' },
      { text: '레퍼런스', link: '/reference/agents', activeMatch: '/reference/' },
      {
        text: 'v3.2.1',
        items: [
          { text: '변경 로그', link: '/changelog' },
          { text: 'GitHub', link: 'https://github.com/code-yeongyu/oh-my-opencode' }
        ]
      }
    ],

    sidebar: {
      '/guide/': [
        {
          text: '시작하기',
          items: [
            { text: '소개', link: '/guide/' },
            { text: '설치', link: '/guide/installation' },
            { text: '빠른 시작', link: '/guide/quickstart' }
          ]
        },
        {
          text: '핵심 개념',
          items: [
            { text: '에이전트 시스템', link: '/guide/agents' },
            { text: '스킬 시스템', link: '/guide/skills' },
            { text: '슬래시 명령어', link: '/guide/commands' },
            { text: '훅 시스템', link: '/guide/hooks' }
          ]
        },
        {
          text: '고급 기능',
          items: [
            { text: '설정 가이드', link: '/guide/configuration' },
            { text: 'MCP 통합', link: '/guide/mcp' },
            { text: 'Rules 파일', link: '/guide/rules' }
          ]
        }
      ],
      '/examples/': [
        {
          text: '워크플로우 예제',
          items: [
            { text: '개요', link: '/examples/' },
            { text: '새 프로젝트 시작', link: '/examples/new-project' },
            { text: '기능 개발', link: '/examples/feature-development' },
            { text: '버그 수정', link: '/examples/bug-fixing' },
            { text: '리팩토링', link: '/examples/refactoring' },
            { text: '코드 리뷰', link: '/examples/code-review' },
            { text: '문서화', link: '/examples/documentation' }
          ]
        }
      ],
      '/reference/': [
        {
          text: '레퍼런스',
          items: [
            { text: '에이전트 목록', link: '/reference/agents' },
            { text: '훅 목록', link: '/reference/hooks' },
            { text: '도구 목록', link: '/reference/tools' },
            { text: '설정 스키마', link: '/reference/config-schema' }
          ]
        }
      ]
    },

    socialLinks: [
      { icon: 'github', link: 'https://github.com/code-yeongyu/oh-my-opencode' }
    ],

    footer: {
      message: 'MIT 라이선스로 배포됨',
      copyright: 'Copyright © 2024-present'
    },

    search: {
      provider: 'local',
      options: {
        translations: {
          button: {
            buttonText: '검색',
            buttonAriaLabel: '검색'
          },
          modal: {
            noResultsText: '검색 결과가 없습니다',
            resetButtonTitle: '검색 초기화',
            footer: {
              selectText: '선택',
              navigateText: '이동',
              closeText: '닫기'
            }
          }
        }
      }
    },

    outline: {
      label: '목차',
      level: [2, 3]
    },

    docFooter: {
      prev: '이전',
      next: '다음'
    },

    lastUpdated: {
      text: '최종 수정',
      formatOptions: {
        dateStyle: 'long'
      }
    },

    editLink: {
      pattern: 'https://github.com/YOUR_USERNAME/oh-my-opencode-guide/edit/main/docs/:path',
      text: '이 페이지 수정하기'
    }
  },

  markdown: {
    theme: {
      light: 'github-light',
      dark: 'github-dark'
    },
    lineNumbers: true
  },

  lastUpdated: true
})
