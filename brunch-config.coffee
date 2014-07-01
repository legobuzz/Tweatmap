exports.config =

  conventions:
    # wrap bower_components into commonjs
    vendor: /paper[\\/]/

	 paths:
    watched: [
      'app'
    ]

  files:
    javascripts:
      joinTo:
        'js/app.js':    /^app/
        'js/vendor.js': /^(bower_components|vendor)/

    stylesheets:
      joinTo: 'app.css'
    templates:
      joinTo:
        'js/templates.js': /^.+\.jade$/

  plugins:
    jade:
      options:
        pretty: yes
    static_jade:
      extension: '.html.jade'
      asset:     'public'
    afterBrunch: [
      'find public/ -type f -name "*.coffee" -delete'
      'coffee --compile --output public app/assets/'
      ]

  modules:
    nameCleaner: (path) ->
      # make index files available as e.g. require('effects')
      # instead of require('effects/index')
      path = path.replace /\/index\.(js|coffee|jade)$/, ''

      # make app files available as e.g. require('templates/...')
      # instead of require('app/templates/...')
      path = path.replace /^app\//, ''

      # make bower components available as e.g. require('underscore')
      # instead of require('bower_componens/underscore/underscore')
      path = path.replace /^bower_components\/(.*\/)?/, ''

      path