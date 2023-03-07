/** @type {import('tailwindcss').Config} */
const colors = require('tailwindcss/colors')
const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    `${process.env.SIMPLE_FORM_TAILWIND_DIR}/**/*.rb`,
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/views/**/*.{html,html.erb,erb}',
    './app/javascript/components/**/*.js',
  ],
  darkMode: 'class',
  theme: {
    fontFamily: {
      'circular': ["CircularStd-Black", "sans-serif"],
      'inter': ["Inter-Regular", "sans-serif"],
    },
    extend: {
      width : {
        '10p': '10%',
        '5p': '5%',
        '20vpw': '80vw',
        '10vpw': '90vw',
        '70vpw': '70vw',
        'min-w-80' : '80vw',
        '20pv': '20vw',
        '10pv': '10vw',
        '30pv': '30vw',
      },
      margin: {
        '10m': '10%',
        '5m': '5%',
      },
      height :{
        '10p': '10%',
        '5p': '5%',
        '30vph': '70vh',
        '20vph': '80vh',
        '10vph': '85vh',
        'min-h-80' : '80vh',
        '40vp': '40vh',
        '50vp': '50vh',
        '10vp': '10vh',
        '20vp': '20vh',
      }
    },
    colors: {
      transparent: 'transparent',
      current: 'currentColor',
      'garnet': ' #A30015',
      'oxford': '#023e8a',
      'white': '#FFFFFF',
      'silver': '#ADADAD',
      'lw-black': '#171717',
      'black': '#000000',
      'onyx': '#444444',
    },
    borderRadius: {
      '1xl': '0.375rem',
      '2xl': '0.75rem',
      'full': '9999px',
    },
  },
  corePlugins: {
    aspectRatio: false,
  },
  plugins: [
    require('@tailwindcss/typography'),
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/line-clamp'),
  ],
}
