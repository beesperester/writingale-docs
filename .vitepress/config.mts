import { defineConfig } from 'vitepress'

export default defineConfig({
  title: 'Writingale',
  description: 'Write books in plain markdown, linked and tracked.',
  lang: 'en-US',
  cleanUrls: true,
  lastUpdated: true,
  srcExclude: ['CLAUDE.md', 'FEATURES.md', 'capture/**'],

  head: [
    ['link', { rel: 'icon', type: 'image/svg+xml', href: '/favicon.svg' }],
    ['link', { rel: 'alternate icon', href: '/favicon.ico' }]
  ],

  themeConfig: {
    logo: '/logo.svg',

    nav: [
      { text: 'Guide', link: '/guide/what-is-writingale', activeMatch: '/guide/' },
      { text: 'Reference', link: '/reference/file-format', activeMatch: '/reference/' }
    ],

    sidebar: {
      '/guide/': [
        {
          text: 'Getting Started',
          items: [
            { text: 'What is Writingale?', link: '/guide/what-is-writingale' },
            { text: 'Installation', link: '/guide/installation' },
            { text: 'Quick Start', link: '/guide/quick-start' }
          ]
        },
        {
          text: 'Concepts',
          items: [
            { text: 'Books & Entities', link: '/guide/concepts' },
            { text: 'Entity Types & Traits', link: '/guide/entity-types' }
          ]
        },
        {
          text: 'Writing',
          items: [
            { text: 'The Editor', link: '/guide/editor' },
            { text: 'Manuscript Structure', link: '/guide/manuscript' },
            { text: 'The Inspector', link: '/guide/inspector' },
            { text: 'Annotations', link: '/guide/annotations' },
            { text: 'Search & Filtering', link: '/guide/search' }
          ]
        },
        {
          text: 'Understanding Your Story',
          items: [
            { text: 'Graph View', link: '/guide/graph' },
            { text: 'Timeline View', link: '/guide/timeline' },
            { text: 'Journeys', link: '/guide/journeys' }
          ]
        },
        {
          text: 'Finishing',
          items: [
            { text: 'Goals & Statistics', link: '/guide/goals' },
            { text: 'Exporting', link: '/guide/export' }
          ]
        }
      ],
      '/reference/': [
        {
          text: 'Reference',
          items: [
            { text: 'File Format', link: '/reference/file-format' },
            { text: 'Keyboard Shortcuts', link: '/reference/shortcuts' },
            { text: 'FAQ', link: '/reference/faq' }
          ]
        }
      ]
    },

    search: {
      provider: 'local'
    },

    footer: {
      message: 'Writingale — write books in plain markdown, linked and tracked. <a href="/privacy">Privacy</a>'
    },

    outline: { level: [2, 3] }
  }
})
